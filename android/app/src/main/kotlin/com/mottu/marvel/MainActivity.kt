package com.mottu.marvel

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.mottu.marvel/connectivity"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startConnectivityListener") {
                startConnectivityListener()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun startConnectivityListener() {
        val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N) {
            connectivityManager.registerDefaultNetworkCallback(object : ConnectivityManager.NetworkCallback() {
                override fun onAvailable(network: Network) {
                    runOnUiThread { sendConnectivityMessage("online") }
                }

                override fun onLost(network: Network) {
                    runOnUiThread { sendConnectivityMessage("offline") }
                }
            })
        } else {
            val intentFilter = IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION)
            registerReceiver(object : BroadcastReceiver() {
                override fun onReceive(context: Context, intent: Intent) {
                    val activeNetwork = connectivityManager.activeNetworkInfo
                    if (activeNetwork != null && activeNetwork.isConnected) {
                        sendConnectivityMessage("online")
                    } else {
                        sendConnectivityMessage("offline")
                    }
                }
            }, intentFilter)
        }
    }

    private fun sendConnectivityMessage(status: String) {
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger ?: return, CHANNEL).invokeMethod("updateConnectivityStatus", status)
    }
}
