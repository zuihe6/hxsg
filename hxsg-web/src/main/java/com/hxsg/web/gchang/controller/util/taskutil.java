package com.hxsg.web.gchang.controller.util;


import com.hxsg.web.gchang.controller.GcController;
import org.springframework.stereotype.Service;

/**
 * Created by dlf on 2016/1/20.
 */
@Service
public class taskutil {

    public  void tasktime(){

    if(GcController.times>0){
        GcController.times-=1000;
    }




    }
}
