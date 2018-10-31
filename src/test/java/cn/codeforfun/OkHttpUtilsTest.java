package cn.codeforfun;

import cn.codeforfun.github.Api;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class OkHttpUtilsTest {

    @Test
    public void get() throws IOException {
        String s = OkHttpUtils.get("https://api.github.com/");
        ObjectMapper om = new ObjectMapper();
        Api map = om.readValue(s, Api.class);
        System.out.println(map);
    }
}