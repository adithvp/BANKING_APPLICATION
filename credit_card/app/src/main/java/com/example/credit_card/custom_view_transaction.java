package com.example.credit_card;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class custom_view_transaction extends BaseAdapter {
    String[] time,date,amount,type,description;
    private Context context;

    public custom_view_transaction(Context applicationContext, String[] time, String[] date, String[] amount, String[] type, String[] description) {
        this.context = applicationContext;
        this.time =time;
        this.date = date;
        this.amount = amount;
        this.type = type;
        this.description = description;

    }

    @Override
    public int getCount() {
        return time.length;
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
            gridView=inflator.inflate(R.layout.activity_custom_view_transaction,null);//same class name

        }
        else
        {
            gridView=(View)view;

        }
        TextView tv1=(TextView)gridView.findViewById(R.id.textView26);
        TextView tv2=(TextView)gridView.findViewById(R.id.textView27);
        TextView tv3=(TextView)gridView.findViewById(R.id.textView28);
        TextView tv4=(TextView)gridView.findViewById(R.id.textView29);
        TextView tv5=(TextView)gridView.findViewById(R.id.textView30);




        tv1.setTextColor(Color.RED);//color setting
        tv2.setTextColor(Color.BLACK);
        tv3.setTextColor(Color.BLACK);
        tv4.setTextColor(Color.BLACK);
        tv5.setTextColor(Color.BLACK);


        tv1.setText(time[i]);
//        img.setText(ph[i]);
        tv2.setText(date[i]);
        tv3.setText(amount[i]);
        tv4.setText(type[i]);
        tv5.setText(description[i]);



        return gridView;

    }




}
