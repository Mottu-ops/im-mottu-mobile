package com.mottu.marvel

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager

class NetworkChangePlugin(private val context: Context) {
    private var isConnected = true
    private var receiverRegistered = false

    private val connectivityManager: ConnectivityManager by lazy {
        context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
    }

    private val connectivityReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            updateConnectionStatus()
        }
    }

    private fun updateConnectionStatus() {
        val activeNetworkInfo = connectivityManager.activeNetworkInfo
        val isConnectedNow = activeNetworkInfo != null && activeNetworkInfo.isConnectedOrConnecting

        if (isConnected != isConnectedNow) {
            isConnected = isConnectedNow
            notifyConnectionChange(isConnected)
        }
    }

    private fun notifyConnectionChange(connected: Boolean) {
        // Envie o status da conexão para o Flutter através do channel
        // Aqui você pode usar o método `invokeMethod` para enviar o estado da conexão para o Flutter
    }

    fun startListening() {
        if (!receiverRegistered) {
            val filter = IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION)
            context.registerReceiver(connectivityReceiver, filter)
            receiverRegistered = true
            updateConnectionStatus()
        }
    }

    fun stopListening() {
        if (receiverRegistered) {
            context.unregisterReceiver(connectivityReceiver)
            receiverRegistered = false
        }
    }
}
