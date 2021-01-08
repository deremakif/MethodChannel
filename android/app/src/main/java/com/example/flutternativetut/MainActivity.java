package com.deremakif.methodchannel;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;


class NewModel {
    public int id;
    public String title;

    @Override
    public String toString() {
        return   "{\"id\": "+id+",\"title\": \""+ title+"\"}";
    }
}

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.methodchannel/test";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, Result result) {
                        if (methodCall.method.equals("getModel")) {
                            
                            NewModel model = new NewModel();
                            model.id = 1;
                            model.title = "model is here!";
                                                
                            result.success(model.toString());
                        }

                    }
                }
        );
    }

}



              