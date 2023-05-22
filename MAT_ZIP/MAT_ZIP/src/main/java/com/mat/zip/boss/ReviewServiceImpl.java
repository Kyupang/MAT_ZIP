package com.mat.zip.boss;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private ReviewDAO reviewDAO;

    @Override
    public List<String> TotalReview(String storeId) {
        return reviewDAO.TotalReview(storeId);
    }
    
}
