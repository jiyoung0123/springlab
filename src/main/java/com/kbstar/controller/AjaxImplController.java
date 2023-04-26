package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

// 일반적인 컨트롤러는 화면jsp파일을 return 해 주니, ajax 요청은 이걸 이용하자
@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;

    }

    @RequestMapping("/checkid")
    public Object checkid(String id){
        int result = 0;
        if(id.equals("qqqq")||id.equals("aaaa")||id.equals("ssss")){
            result=1;
        }
        return result;
    }


    @RequestMapping("/chart05")
    public Object chart05(String year){
        JSONArray ja = new JSONArray();
        for(int i=1; i<=12; i++){
            Random r = new Random();
            int num = r.nextInt(100)+1;
            ja.add(num);
        }
        return ja;
    }


    @RequestMapping("/getdata")
    public Object getdata(){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01", "pwd01", "james1"));
        list.add(new Cust("id02", "pwd02", "james2"));
        list.add(new Cust("id03", "pwd03", "james3"));
        list.add(new Cust("id04", "pwd04", "james4"));
        list.add(new Cust("id05", "pwd05", "james5"));


        // java Object ---> JSON
        //JSON(JavaScript Object Notation)
        //[ {}, {},{},...]
        JSONArray ja = new JSONArray();
        for(Cust obj : list){
           JSONObject jo = new JSONObject();
           Random r = new Random();
           int i = r.nextInt(100)+1;
           jo.put("id",obj.getId());
            jo.put("pwd",obj.getPwd());
            jo.put("name",obj.getName()+i);
           ja.add(jo);
        }
        return ja;
    }


    @RequestMapping("/markers")
    public Object markers(String loc){
        List<Marker> list=new ArrayList<>();
        if(loc.equals("s")){
            list.add(new Marker(100,"담미온","http://www.naver.com", 37.5451437,127.0578284,"a.jpg","s"));
            list.add(new Marker(101,"제주국수","http://www.naver.com", 37.5455175,127.0577641,"b.jpg","s"));
            list.add(new Marker(102,"이층집","http://www.naver.com", 37.5448364,127.0568048,"c.jpg","s"));
        }else if(loc.equals("b")){
            list.add(new Marker(103,"담미온","http://www.naver.com", 35.0938469 ,  129.9536102,"a.jpg","b"));
            list.add(new Marker(104,"제주국수","http://www.naver.com", 35.9938469,   129.0536152,"b.jpg","b"));
            list.add(new Marker(105,"이층집","http://www.naver.com", 35.5938469 ,  129.5536152,"c.jpg","b"));
        }else if(loc.equals("j")){
            list.add(new Marker(106,"담미온","http://www.naver.com", 33.9104135,126.9913534,"a.jpg","j"));
            list.add(new Marker(107,"제주국수","http://www.naver.com", 33.5104135,126.0913534,"b.jpg","j"));
            list.add(new Marker(108,"이층집","http://www.naver.com", 33.0104135,126.5913534,"c.jpg","j"));
        }
        JSONArray ja=new JSONArray();
        for(Marker obj:list){
            JSONObject jo=new JSONObject();
            jo.put("id",obj.getId());
            jo.put("title",obj.getTitle());
            jo.put("target",obj.getTarget());
            jo.put("lat",obj.getLat());
            jo.put("lng",obj.getLng());
            jo.put("img",obj.getImg());
            jo.put("loc",obj.getLoc());
            ja.add(jo);
        }
        return ja;
    }}