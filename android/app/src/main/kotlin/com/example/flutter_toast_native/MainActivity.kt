package com.example.flutter_toast_native

import android.content.Context
import android.widget.Toast
import dev.flutter.pigeon.ToastMessage
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ToastMessage.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            MyToastMessage(applicationContext)
        )
    }

    private class MyToastMessage(applicationContext: Context?) : ToastMessage {
        var context = applicationContext
        override fun toastMessageApi(message: String) {
            Toast.makeText(context, message, Toast.LENGTH_LONG).show()
        }

    }
}
