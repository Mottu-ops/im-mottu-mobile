package com.mottu.marvel

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    private val CONNECTIVITY_CHANNEL = "br.com.marvel.mottu/connectivity_status"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        EventChannel(flutterEngine?.dartExecutor?.binaryMessenger, CONNECTIVITY_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var connectivityReceiver: BroadcastReceiver? = null

                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    connectivityReceiver = createConnectivityReceiver(events)
                    registerReceiver(connectivityReceiver, IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION))
                }

                override fun onCancel(arguments: Any?) {
                    unregisterReceiver(connectivityReceiver)
                    connectivityReceiver = null
                }
            }
        )
    }

    private fun createConnectivityReceiver(events: EventChannel.EventSink?): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent?) {
                val status = getConnectivityStatus()
                events?.success(status)
            }
        }
    }

    private fun getConnectivityStatus(): String {
        val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val network = connectivityManager.activeNetwork ?: return "offline"
        val activeNetwork = connectivityManager.getNetworkCapabilities(network) ?: return "offline"

        return when {
            activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> "online"
            activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> "online"
            else -> "offline"
        }
    }
}