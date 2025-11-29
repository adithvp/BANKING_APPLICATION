package com.example.credit_card;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.MenuItem;
import android.view.View;
import android.view.Menu;
import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.navigation.NavigationView;

import androidx.core.view.GravityCompat;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.AppCompatActivity;
import com.example.credit_card.databinding.ActivityUserhomeBinding;

public class userhome extends AppCompatActivity   implements NavigationView.OnNavigationItemSelectedListener {

    private AppBarConfiguration mAppBarConfiguration;
private ActivityUserhomeBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

     binding = ActivityUserhomeBinding.inflate(getLayoutInflater());
     setContentView(binding.getRoot());

        setSupportActionBar(binding.appBarUserhome.toolbar);
        binding.appBarUserhome.fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
        DrawerLayout drawer = binding.drawerLayout;
        NavigationView navigationView = binding.navView;
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        mAppBarConfiguration = new AppBarConfiguration.Builder(
                R.id.nav_home, R.id.nav_gallery, R.id.nav_slideshow)
                .setOpenableLayout(drawer)
                .build();
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_userhome);
        NavigationUI.setupActionBarWithNavController(this, navController, mAppBarConfiguration);
        NavigationUI.setupWithNavController(navigationView, navController);
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.userhome, menu);
        return true;
    }

    @Override
    public boolean onSupportNavigateUp() {
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_userhome);
        return NavigationUI.navigateUp(navController, mAppBarConfiguration)
                || super.onSupportNavigateUp();
    }
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_home) {
            // Handle the camera action
            Intent i =new Intent(getApplicationContext(),viewprofile.class);
            startActivity(i);
        } else if (id == R.id.nav_gallery) {
            Intent i =new Intent(getApplicationContext(),viewaccount.class);
            startActivity(i);
        } else if (id == R.id.nav_slideshow) {
            Intent i =new Intent(getApplicationContext(),viewtransaction.class);
            startActivity(i);

        } else if (id == R.id.nav_block) {
            Intent i =new Intent(getApplicationContext(),viewblockhistory.class);
            startActivity(i);

        } else if (id == R.id.nav_complaint) {
            Intent i = new Intent(getApplicationContext(), viewreplay.class);
            startActivity(i);

        } else if (id == R.id.nav_request) {
            Intent i = new Intent(getApplicationContext(), sendrequest.class);
            startActivity(i);

        }
        else if (id == R.id.nav_atm) {
            Intent i = new Intent(getApplicationContext(), viewatm.class);
            startActivity(i);

        }
        else if (id == R.id.nav_logout) {
            SharedPreferences sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
            SharedPreferences.Editor ed = sh.edit();
            ed.putString("lid", "");
            ed.commit();
            Intent i =new Intent(getApplicationContext(),login.class);
            startActivity(i);

        }

        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
}
