package com.example.mybat;

import android.app.Activity;
import android.app.DownloadManager;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;
import android.widget.Toast;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.vision.barcode.Barcode;
import com.notbytes.barcode_reader.BarcodeReaderActivity;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

public class OpenLayersActivity extends AppCompatActivity {

    private final int BARCODE_READER_ACTIVITY_REQUEST = 1;
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

    public void refreshLayer(String barCode) {
        WebView wv = (WebView) findViewById(R.id.webview);
        wv.loadUrl(OPENLAYERS_URL + barCode);
    }

    public void buttonQRcode(View v) {
        Intent launchIntent = BarcodeReaderActivity.getLaunchIntent(this, true, false);
        startActivityForResult(launchIntent, BARCODE_READER_ACTIVITY_REQUEST);
    }

    public void addQRCode(View v) {
        Intent launchIntent = BarcodeReaderActivity.getLaunchIntent(this, true, false);
        int ADD_QR_CODE_ACTIVITY_REQUEST = 2;
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

            refreshLayer(barcode.rawValue);
            Toast.makeText(this, barcode.rawValue, Toast.LENGTH_SHORT).show();
        }
    }


}

















