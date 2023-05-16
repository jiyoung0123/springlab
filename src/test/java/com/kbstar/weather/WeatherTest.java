package com.kbstar.weather;

import com.kbstar.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;


@Slf4j
@SpringBootTest
class WeatherTest {

    @Test
    void contextLoads() throws Exception {
        JSONObject result = null;
        result = (JSONObject)WeatherUtil.getWeather3("109");

    }





}