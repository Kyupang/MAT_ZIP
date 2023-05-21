package com.mat.zip.registerAndSearch.service.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.zip.registerAndSearch.service.OCRGeneralAPI;
import com.mat.zip.registerAndSearch.service.OCRService;

@Service
public final class OCRServiceImpl implements OCRService{
	@Autowired
	OCRGeneralAPI ocrService;
	
	@Override
	public List<String> clovaOCR(String savedFilePath) {
		List<String> results = null;
		try {
			results = ocrService.OCRAPI(savedFilePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return results;
	}
	
	
}
