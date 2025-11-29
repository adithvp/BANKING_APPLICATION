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

public class customblockhistory extends BaseAdapter {

    String[] date, time, card_no;
    private Context context;

    public customblockhistory(Context applicationContext, String[] date, String[] time, String[] card_no) {
        this.context = applicationContext;

        this.date = date;
        this.time = time;
        this.card_no = card_no;
    }

    @Override
    public int getCount() {
        return date.length;
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
            gridView=inflator.inflate(R.layout.activity_customblockhistory,null);//same class name

        }
        else
        {
            gridView=(View)view;
        }

        TextView tv1=(TextView)gridView.findViewById(R.id.textView51);
        TextView tv2=(TextView)gridView.findViewById(R.id.textView46);
        TextView tv3=(TextView)gridView.findViewById(R.id.textView48);



        tv1.setTextColor(Color.RED);//color setting
        tv2.setTextColor(Color.BLACK);
        tv3.setTextColor(Color.BLACK);





        tv1.setText(date[i]);
        tv2.setText(time[i]);
        tv3.setText(card_no[i]);


//        SharedPreferences sh = PreferenceManager.getDefaultSharedPreferences(context);
//        String ip = sh.getString("ip", "");
//        String url = "http://" + ip + ":5000" + img[i];
//        Picasso.with(context).load(url).transform(new CircleTransform()).into(imageView);


        return gridView;

    }
}