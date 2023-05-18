package com.mat.zip.boss;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/boss")
public class ChartController {

    private final ChartService chartService;

    @Autowired
    public ChartController(ChartService chartService) {
        this.chartService = chartService;
    }

    @GetMapping("/chart/{storeId}")
    @ResponseBody
    public Map<String, List<ChartVO>> getChart(@PathVariable String storeId) {
    	//세션에서 받아온 인코딩된 storeId 디코딩처리 
        try {
            storeId = URLDecoder.decode(storeId, StandardCharsets.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
            // 예외 처리
        }
        List<ChartVO> chartData = chartService.DailyTotalAmount(storeId);
        List<ChartVO> chartDataX = chartService.XTotalAmount(storeId);
        Map<String, List<ChartVO>> response = new HashMap<>();
        response.put("thisMonth", chartData);
        response.put("lastMonth", chartDataX);
        
        return response;
    }

}

