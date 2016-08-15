package com.haoxin.hx.criminallntent;

import android.support.v4.app.Fragment;

/**
 * Created by hx on 8/15/16.
 */
public class CrimeListActivity extends SingleFragmentActivity {
    @Override
    protected Fragment createFragment() {
        return new CrimeListFragment();
    }
}
