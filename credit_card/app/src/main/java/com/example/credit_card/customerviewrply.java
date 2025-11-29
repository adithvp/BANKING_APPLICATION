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

public class customerviewrply extends BaseAdapter {
    String[]  com, cdate, reply, rdate;

    private Context context;

    public customerviewrply(Context applicationContext, String[] com, String[] cdate, String[] reply, String[] rdate) {
        this.context = applicationContext;
        this.com =com;
        this.cdate = cdate;
        this.reply = reply;
        this.rdate = rdate;


    }

    @Override
    public int getCount() {
        return com.length;
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
            gridView=inflator.inflate(R.layout.activity_customerviewrply,null);//same class name

        }
        else
        {
            gridView=(View)view;

        }
        TextView tv1=(TextView)gridView.findViewById(R.id.textView36);
        TextView tv2=(TextView)gridView.findViewById(R.id.textView38);
        TextView tv3=(TextView)gridView.findViewById(R.id.textView40);
        TextView tv4=(TextView)gridView.findViewById(R.id.textView42);






        tv1.setTextColor(Color.RED);//color setting
        tv2.setTextColor(Color.BLACK);
        tv3.setTextColor(Color.BLACK);
        tv4.setTextColor(Color.BLACK);


        tv1.setText(com[i]);
//        img.setText(ph[i]);
        tv2.setText(cdate[i]);
        tv3.setText(reply[i]);
        tv4.setText(rdate[i]);




        return gridView;

    }
}





