package com.example.mybat;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.vision.barcode.Barcode;
import com.notbytes.barcode_reader.BarcodeReaderActivity;

public class OpenLayersActivity extends AppCompatActivity {

    private final int BARCODE_READER_ACTIVITY_REQUEST = 1;
    private final int ADD_QR_CODE_ACTIVITY_REQUEST = 2;
    private final String OPENLAYERS_URL = "http://192.168.1.38:1234/";
    private final String SPRINGSERV_URL = "http://192.168.1.38:8081/api/";

    private String userLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        userLogin = getIntent().getStringExtra("login");

        setContentView(R.layout.activity_main);

        // Initialisation de la web view qui contient le js d'Openlayers
        WebView webView = (WebView) findViewById(R.id.webview);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.getSettings().setAllowFileAccessFromFileURLs(true);
        webView.getSettings().setAllowFileAccess(true);
        webView.getSettings().setAllowUniversalAccessFromFileURLs(true);
        webView.loadUrl(OPENLAYERS_URL);
    }


    public void buttonQRcode(View v) {
        Intent launchIntent = BarcodeReaderActivity.getLaunchIntent(this, true, false);
        startActivityForResult(launchIntent, BARCODE_READER_ACTIVITY_REQUEST);
    }

    public void addQRCode(View v) {
        Intent launchIntent = BarcodeReaderActivity.getLaunchIntent(this, true, false);
        startActivityForResult(launchIntent, ADD_QR_CODE_ACTIVITY_REQUEST);
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode != Activity.RESULT_OK) {
            Toast.makeText(this, "error in  scanning", Toast.LENGTH_SHORT).show();
            return;
        }

        if (requestCode == BARCODE_READER_ACTIVITY_REQUEST && data != null) {
            Barcode barcode = data.getParcelableExtra(BarcodeReaderActivity.KEY_CAPTURED_BARCODE);
            WebView webView = (WebView) findViewById(R.id.webview);
            webView.loadUrl(OPENLAYERS_URL + barcode.rawValue);
            Toast.makeText(this, barcode.rawValue, Toast.LENGTH_SHORT).show();
        }

        if (requestCode == ADD_QR_CODE_ACTIVITY_REQUEST && data != null) {
            Barcode barcode = data.getParcelableExtra(BarcodeReaderActivity.KEY_CAPTURED_BARCODE);
            WebView webView = (WebView) findViewById(R.id.webview);
            String dirBuilder = "addqrc/" + barcode.rawValue;
            webView.loadUrl(OPENLAYERS_URL  + dirBuilder);
            Toast.makeText(this, barcode.rawValue, Toast.LENGTH_SHORT).show();
        }

    }


}

















