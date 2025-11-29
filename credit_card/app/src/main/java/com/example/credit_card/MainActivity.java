package com.example.credit_card;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    EditText ip1;

    Button b;
    SharedPreferences sh;
    String ip,url;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ip1=findViewById(R.id.editTextTextPersonName3);
        b=findViewById(R.id.button2);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        ip1.setText(sh.getString("ip",""));
        b.setOnClickListener(this);



    }

    @Override
    public void onClick(View view) {
        String ipaddress=ip1.getText().toString();
//        Toast.makeText(this, ipaddress+",", Toast.LENGTH_SHORT).show();
        String url1 = "http://" + ipaddress + ":5000/";
        SharedPreferences.Editor ed=sh.edit();

        ed.putString("ip",ipaddress);
        ed.putString("url",url1);
        ed.commit();
        Intent i=new Intent(getApplicationContext(),login.class);
        startActivity(i);
    }

}

