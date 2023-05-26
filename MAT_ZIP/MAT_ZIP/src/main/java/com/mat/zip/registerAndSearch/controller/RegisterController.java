package com.mat.zip.registerAndSearch.controller;

import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;
import com.mat.zip.registerAndSearch.service.DataValidationService;
import com.mat.zip.registerAndSearch.service.FileUploadService;
import com.mat.zip.registerAndSearch.service.OCRService;

@Controller
public class RegisterController {
	@Autowired
	FileUploadService fileUploadService;
	@Autowired
	OCRService ocrService;
	@Autowired
	DataValidationService dataValidationService;
	
	@PostMapping("/registerAndSearch/controller/register")
	@ResponseBody
	public RegistedAddressAndNameVO register(MultipartFile[] uploadFile, HttpSession session) throws FileNotFoundException {
		String savedFilePath=fileUploadService.saveFile(uploadFile);
		List<String> ocrResult = ocrService.clovaOCR(savedFilePath);
		RegistedAddressAndNameVO result =dataValidationService.validateExtractedData(session,ocrResult);
		return result;
	}
}
