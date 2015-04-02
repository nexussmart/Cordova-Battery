package com.blueshift.cordova.battery;

import org.apache.cordova.CordovaPlugin;

public class BatteryPlugin extends CordovaPlugin {
    private static final String TAG = "BatteryPlugin";
    private static final String ACTION_GET_LEVEL = "getLevel";

    public boolean execute(String action, JSONArray data, CallbackContext callback){
        Boolean result = false;

        if(ACTION_GET_LEVEL.equalsIgnoreCase(action)) {
            int level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
            int scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
            float batteryPct = level / (float)scale;

            Log.i(TAG, "Battery Level Requested " + batteryPct);
            result = true;
            callback.success(status);
        } else {
            callback.error("Not a valid battery action");
        }

        return result;
    }
}