package com.example.credit_card;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

public class customviewaccount extends BaseAdapter {

    String[] accno,ifsc,balance;
    private Context context;

    public customviewaccount(Context applicationContext,String[] accno, String[] ifsc, String[] balance) {
        this.context = applicationContext;
        this.accno =accno;
        this.ifsc = ifsc;
        this.balance = balance;

    }

    @Override
    public int getCount() {
        return accno.length;
    }

    @Override
    public Object getItem(int i) {
        return null;
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        LayoutInflater inflator=(LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View gridView;
        if(view==null)
        {
            gridView=new View(context);
            //gridView=inflator.inflate(R.layout.customview, null);
            gridView=inflator.inflate(R.layout.activity_customviewaccount,null);//same class name

        }
        else
        {
            gridView=(View)view;

        }
        TextView tv1=(TextView)gridView.findViewById(R.id.textView33);
        TextView tv2=(TextView)gridView.findViewById(R.id.textView34);
        TextView tv3=(TextView)gridView.findViewById(R.id.textView44);



        tv1.setTextColor(Color.RED);//color setting
        tv2.setTextColor(Color.BLACK);
        tv3.setTextColor(Color.BLACK);


        tv1.setText(accno[i]);
        tv2.setText(ifsc[i]);
        tv3.setText(balance[i]);



        return gridView;

    }




}
