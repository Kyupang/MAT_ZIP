package com.mat.zip.boss;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.net.URLDecoder;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Controller
@RequestMapping("/boss")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/review/{storeId}")
    @ResponseBody
    public List<String> getReview(@PathVariable String storeId) {
        // 세션에서 받아온 인코딩된 storeId 디코딩 처리 
        try {
            storeId = URLDecoder.decode(storeId, StandardCharsets.UTF_8.name());
            
        } catch (UnsupportedEncodingException e) {
            // 예외 처리
            e.printStackTrace();
        }
        System.out.println(storeId);
        List<String> reviewContents = reviewService.TotalReview(storeId);
        return reviewContents;
    }
}

