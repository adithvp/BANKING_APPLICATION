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

public class custom_viewatm extends BaseAdapter {

    String[] name, cno, idate, edate, pin, status;

    private Context context;


    public custom_viewatm(Context applicationContext, String[] name, String[] cno, String[] idate, String[] edate, String[] pin, String[] status) {

        this.context = applicationContext;
        this.name =name;
        this.cno = cno;
        this.idate = idate;
        this.edate = edate;
        this.pin = pin;
        this.status = status;
    }

    @Override
    public int getCount() {
        return status.length;
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
            gridView=inflator.inflate(R.layout.activity_custom_viewatm,null);//same class name

        }
        else
        {
            gridView=(View)view;

        }
        TextView tv1=(TextView)gridView.findViewById(R.id.textView52);
        TextView tv2=(TextView)gridView.findViewById(R.id.textView54);
        TextView tv3=(TextView)gridView.findViewById(R.id.textView56);
        TextView tv4=(TextView)gridView.findViewById(R.id.textView58);
        TextView tv5=(TextView)gridView.findViewById(R.id.textView60);
        TextView tv6=(TextView)gridView.findViewById(R.id.textView62);






        tv1.setTextColor(Color.RED);//color setting
        tv2.setTextColor(Color.BLACK);
        tv3.setTextColor(Color.BLACK);
        tv4.setTextColor(Color.BLACK);
        tv5.setTextColor(Color.BLACK);
        tv6.setTextColor(Color.BLACK);



        tv1.setText(name[i]);
        tv2.setText(cno[i]);
        tv3.setText(idate[i]);
        tv4.setText(edate[i]);
        tv5.setText(pin[i]);
        tv6.setText(status[i]);




        return gridView;

    }
}



