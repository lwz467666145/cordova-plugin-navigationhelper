package com.chinact.mobile.plugin.navigationhelper;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.Uri;

import org.apache.cordova.BuildHelper;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;

import java.io.File;

public class NavigationHelper extends CordovaPlugin {

    private static Activity cordovaActivity;
    private String baiduPackage = "com.baidu.BaiduMap";
    private String gaodePackage = "com.autonavi.minimap";
    private String tencentPackage = "com.tencent.map";
    private String tencentKey;
    private String applicationId;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        cordovaActivity = cordova.getActivity();
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        applicationId = (String) BuildHelper.getBuildConfigValue(cordova.getActivity(), "APPLICATION_ID");
        applicationId = preferences.getString("applicationId", applicationId);
        tencentKey = "";
        try {
            ApplicationInfo appInfo = cordovaActivity.getPackageManager().getApplicationInfo(cordovaActivity.getPackageName(), PackageManager.GET_META_DATA);
            tencentKey = appInfo.metaData.getString("com.chinact.mobile.plugin.navigationhelper.TENCENT_KEY");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (action.equals("baiduCheck")) {
            baiduCheck(callbackContext);
            return true;
        } else if (action.equals("baiduAddress")) {
            String address = args.getString(0);
            baiduAddress(address, callbackContext);
            return true;
        } else if (action.equals("baiduPosition")) {
            String longitude = args.getString(0);
            String latitude = args.getString(1);
            baiduPosition(longitude, latitude, callbackContext);
            return true;
        } else if (action.equals("gaodeCheck")) {
            gaodeCheck(callbackContext);
            return true;
        } else if (action.equals("gaodeAddress")) {
            String address = args.getString(0);
            gaodeAddress(address, callbackContext);
            return true;
        } else if (action.equals("gaodePosition")) {
            String name = args.getString(0);
            String longitude = args.getString(1);
            String latitude = args.getString(2);
            gaodePosition(name, longitude, latitude, callbackContext);
            return true;
        } else if (action.equals("tencentCheck")) {
            tencentCheck(callbackContext);
            return true;
        } else if (action.equals("tencentAddress")) {
            String address = args.getString(0);
            tencentAddress(address, callbackContext);
            return true;
        } else if (action.equals("tencentPosition")) {
            String longitude = args.getString(0);
            String latitude = args.getString(1);
            tencentPosition(longitude, latitude, callbackContext);
            return true;
        }
        return false;
    }

    private void baiduCheck(CallbackContext callbackContext) {
        boolean flag = checkPackage(baiduPackage);
        callbackContext.success(String.valueOf(flag));
    }

    private void baiduAddress(String address, CallbackContext callbackContext) {
        boolean flag = checkPackage(baiduPackage);
        if (flag) {
            Intent baidu = new Intent();
            baidu.setData(Uri.parse("baidumap://map/geocoder?src=" + applicationId + "&address=" + address));
            cordovaActivity.startActivity(baidu);
        } else
            callbackContext.error("Not Installed");
    }

    private void baiduPosition(String longitude, String latitude, CallbackContext callbackContext) {
        boolean flag = checkPackage(baiduPackage);
        if (flag) {
            Intent baidu = new Intent();
            baidu.setData(Uri.parse("baidumap://map/geocoder?coord_type=gcj02&src=" + applicationId + "&location=" + latitude + "," + longitude));
            cordovaActivity.startActivity(baidu);
        } else
            callbackContext.error("Not Installed");
    }

    private void gaodeCheck(CallbackContext callbackContext) {
        boolean flag = checkPackage(gaodePackage);
        callbackContext.success(String.valueOf(flag));
    }

    private void gaodeAddress(String address, CallbackContext callbackContext) {
        boolean flag = checkPackage(gaodePackage);
        if (flag) {
            Intent gaode = new Intent();
            gaode.setAction(Intent.ACTION_VIEW);
            gaode.addCategory(Intent.CATEGORY_DEFAULT);
            gaode.setData(Uri.parse("androidamap://poi?sourceApplication=" + applicationId + "&keywords=" + address + "&dev=0"));
            cordovaActivity.startActivity(gaode);
        } else
            callbackContext.error("Not Installed");
    }

    private void gaodePosition(String name, String longitude, String latitude, CallbackContext callbackContext) {
        boolean flag = checkPackage(gaodePackage);
        if (flag) {
            Intent gaode = new Intent();
            gaode.setAction(Intent.ACTION_VIEW);
            gaode.addCategory(Intent.CATEGORY_DEFAULT);
            gaode.setData(Uri.parse("androidamap://viewMap?sourceApplication=" + applicationId + "&poiname=" + name + "&lat=" + latitude + "&lon=" + longitude + "&dev=0"));
            cordovaActivity.startActivity(gaode);
        } else
            callbackContext.error("Not Installed");
    }

    private void tencentCheck(CallbackContext callbackContext) {
        boolean flag = checkPackage(tencentPackage);
        callbackContext.success(String.valueOf(flag));
    }

    private void tencentAddress(String address, CallbackContext callbackContext) {
        boolean flag = checkPackage(tencentPackage);
        if (flag) {
            Intent tencent = new Intent();
            tencent.setData(Uri.parse("qqmap://map/search?keyword=" + address));
            cordovaActivity.startActivity(tencent);
        } else
            callbackContext.error("Not Installed");
    }

    private void tencentPosition(String longitude, String latitude, CallbackContext callbackContext) {
        boolean flag = checkPackage(tencentPackage);
        if (flag) {
            Intent tencent = new Intent();
            tencent.setData(Uri.parse("qqmap://map/geocoder?coord=" + latitude + "," + longitude + "&referer=" + tencentKey));
            cordovaActivity.startActivity(tencent);
        } else
            callbackContext.error("Not Installed");
    }

    private boolean checkPackage(String packageName) {
        return new File("/data/data/" + packageName).exists();
    }

}