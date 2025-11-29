package com.example.credit_card;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.squareup.picasso.Picasso;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class viewprofile extends AppCompatActivity {
    TextView na,hname,pl,po,pin,district,email,phone,branch;
    ImageView pho;
    SharedPreferences sh;
    String ip, url, lid;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_viewprofile);

        na=findViewById(R.id.textView2);
        hname=findViewById(R.id.textView4);
        pl=findViewById(R.id.textView6);
        po=findViewById(R.id.textView8);
        pin=findViewById(R.id.textView10);
        district=findViewById(R.id.textView12);
        email=findViewById(R.id.textView14);
        phone=findViewById(R.id.textView16);
        branch=findViewById(R.id.textView18);
        pho= (ImageView) findViewById(R.id.imageView2);
        sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        ip = sh.getString("ip", "");
        url = "http://" + ip + ":5000/andprofile";
        lid = sh.getString("lid", "");

        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest postRequest = new StringRequest(Request.Method.POST, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
//                        Toast.makeText(getApplicationContext(), response, Toast.LENGTH_LONG).show();

                        try {
                            JSONObject jsonObj = new JSONObject(response);
                            if (jsonObj.getString("status").equalsIgnoreCase("ok")) {
                                JSONObject jj = jsonObj.getJSONObject("data");

                                na.setText(jj.getString("c_name"));
                                hname.setText(jj.getString("house_name"));
                                pl.setText(jj.getString("place"));
                                po.setText(jj.getString("post"));
                                pin.setText(jj.getString("pin"));
                                district.setText(jj.getString("district"));
                                email.setText(jj.getString("email"));
                                phone.setText(jj.getString("phone"));
                                branch.setText(jj.getString("Branch_name"));




                                String image = jj.getString("photo");
                                SharedPreferences sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
                                String ip = sh.getString("ip", "");
                                String url = "http://" + ip + ":5000" + image;
                                Picasso.with(getApplicationContext()).load(url).transform(new CircleTransform()).into(pho);//circle

                            } else {
                                Toast.makeText(getApplicationContext(), "Not found", Toast.LENGTH_LONG).show();
                            }

                        } catch (Exception e) {
                            Toast.makeText(getApplicationContext(), "Error" + e.getMessage().toString(), Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        // error
                        Toast.makeText(getApplicationContext(), "eeeee" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                }
        ) {

            //                value Passing android to python
            @Override
            protected Map<String, String> getParams() {
                SharedPreferences sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
                Map<String, String> params = new HashMap<String, String>();

                params.put("lid", lid);//passing to python

                return params;
            }
        };
        int MY_SOCKET_TIMEOUT_MS = 100000;

        postRequest.setRetryPolicy(new DefaultRetryPolicy(
                MY_SOCKET_TIMEOUT_MS,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        requestQueue.add(postRequest);


    }




}










