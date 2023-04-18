package com.kbstar.app;
import com.kbstar.frame.*;
import com.kbstar.tv.*;

public class App {
    public static void main(String args[]){
//        app이라는 class는 LTV도 STV도 다 가능하다. 뭐든 다 가능
        TV tv = new LTV();
        tv.turnOn();
    }
}
