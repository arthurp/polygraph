package org.singingwizard.polygraphapp;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class MainActivityJava extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_activity);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main_activity, menu);
        return true;
    }
}
