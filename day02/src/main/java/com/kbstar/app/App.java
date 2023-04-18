package com.kbstar.app;
import com.kbstar.frame.*;
import com.kbstar.tv.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
    public static void main(String args[]){
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");

        TV tv = (TV) factory.getBean("ltv");    //이게 look up 임-ltv라는 id를 가진 걸 찾아라
        tv.turnOn();

    }
}
