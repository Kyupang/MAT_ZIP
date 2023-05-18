package com.mat.zip.registerAndSearch.controller;

import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;
import com.mat.zip.registerAndSearch.service.DataValidationService;
import com.mat.zip.registerAndSearch.service.FileUploadService;
import com.mat.zip.registerAndSearch.service.OCRService;

@Controller
@RequestMapping("/registerAndSearch/controller")
public class RegisterController {
	FileUploadService fileUploadService;
	OCRService ocrService;
	DataValidationService dataValidationService;
	
	
	@PostMapping("/register.mz")
	@ResponseBody
	public RegistedAddressAndNameVO register(MultipartFile[] uploadFile) throws FileNotFoundException {
		String savedFilePath=fileUploadService.saveFile(uploadFile);
		List<String> ocrResult = ocrService.clovaOCR(savedFilePath);
		RegistedAddressAndNameVO result =dataValidationService.validateExtractedData(ocrResult);
		return result;
	}
}
