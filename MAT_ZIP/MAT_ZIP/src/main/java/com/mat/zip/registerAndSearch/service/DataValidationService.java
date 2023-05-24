package com.mat.zip.registerAndSearch.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;

public interface DataValidationService {
	//HttpSession session
	RegistedAddressAndNameVO validateExtractedData(List<String> extractedData);
}
