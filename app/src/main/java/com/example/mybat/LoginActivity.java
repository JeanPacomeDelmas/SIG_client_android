package com.example.mybat;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class LoginActivity extends AppCompatActivity {

    private final String SPRINGSERV_URL = "http://192.168.1.38:8081/api/utilisateur/";
    private String userLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);
    }

    public void buttonSeConnecter(View v) {
        userLogin = ((TextView)findViewById(R.id.login)).getText().toString();
        // Initialisation du login
        new MyTask().execute();

        Intent intent = new Intent(this, OpenLayersActivity.class);
        intent.putExtra("login", userLogin);
        startActivity(intent);
    }

    private class MyTask extends AsyncTask<Void, Void, Void> {

        @Override
        protected Void doInBackground(Void... voids) {

            URL url = null;
            try {
                url = new URL(SPRINGSERV_URL);
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }

            HttpURLConnection con = null;
            try {
                con = (HttpURLConnection)url.openConnection();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                con.setRequestMethod("POST");
            } catch (ProtocolException e) {
                e.printStackTrace();
            }
            con.setRequestProperty("Content-Type", "application/json; utf-8");
            con.setRequestProperty("Accept", "application/json");
            con.setRequestProperty("Access-Control-Allow-Origin", "*");
            con.setRequestProperty("Access-Control-Allow-Headers", "*");
            con.setRequestProperty("mode", "cors");
            con.setDoOutput(true);
            String jsonInputString = "{\"username\": \"" + userLogin + "\"}";
            System.out.println(jsonInputString);

            try {
                try(OutputStream os = con.getOutputStream()) {
                    byte[] input = jsonInputString.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            int code = 0;
            try {
                code = con.getResponseCode();
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println(code);

            try {
                try(BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"))){
                    StringBuilder response = new StringBuilder();
                    String responseLine = null;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    System.out.println(response.toString());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
        }
    }
}
