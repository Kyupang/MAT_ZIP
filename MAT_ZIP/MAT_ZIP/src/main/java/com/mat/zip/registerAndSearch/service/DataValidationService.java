package com.mat.zip.registerAndSearch.service;

import java.util.List;

import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;

public interface DataValidationService {
	RegistedAddressAndNameVO validateExtractedData(List<String> extractedData);
}
