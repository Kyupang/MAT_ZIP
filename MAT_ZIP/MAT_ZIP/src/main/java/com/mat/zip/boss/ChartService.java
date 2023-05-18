package com.mat.zip.boss;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartService {

    private final ChartDAO chartDAO;

    @Autowired
    public ChartService(ChartDAO chartDAO) {
        this.chartDAO = chartDAO;
    }

    public List<ChartVO> DailyTotalAmount(String storeId) {
        return chartDAO.DailyTotalAmount(storeId);
    }
    public List<ChartVO> XTotalAmount(String storeId) {
    	return chartDAO.XTotalAmount(storeId);
    }
}
