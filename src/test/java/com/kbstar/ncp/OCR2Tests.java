package com.kbstar.ncp;

import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Map;

@Slf4j
@SpringBootTest
class OCR2Tests {
    @Value("${uploadimgdir}")
    String imgpath;

    @Test
    void contextLoads() {
        JSONObject jo = null;
        jo = (JSONObject) OCRUtil.getResult(imgpath,"menu.jpg");
        Map map = OCRUtil.getBobData(jo);
        log.info(map.values().toString());
    }

}