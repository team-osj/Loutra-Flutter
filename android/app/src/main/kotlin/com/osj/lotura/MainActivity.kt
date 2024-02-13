package com.osj.lotura

import android.nfc.NdefMessage
import android.nfc.NdefRecord
import android.nfc.NfcAdapter
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    private lateinit var nfcAdapter: NfcAdapter
    private var returnData = "untagged"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        nfcAdapter = NfcAdapter.getDefaultAdapter(this)

        if (intent.action == NfcAdapter.ACTION_NDEF_DISCOVERED) {
            val data = intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES)
            val message = data?.get(0) as NdefMessage
            val record = message.records[0] as NdefRecord
            val byteArr = record.payload

            returnData = String(byteArr)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getNFCInfo" -> {
                    result.success(returnData)
                }
            }
        }
    }
}
