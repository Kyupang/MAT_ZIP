package com.mat.zip.registerAndSearch.controller;

import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;
import com.mat.zip.registerAndSearch.service.DataValidationService;
import com.mat.zip.registerAndSearch.service.FileUploadService;
import com.mat.zip.registerAndSearch.service.OCRService;

@RestController
public class RegisterController {
	@Autowired
	FileUploadService fileUploadService;
	@Autowired
	OCRService ocrService;
	@Autowired
	DataValidationService dataValidationService;
	
	
	
	@PostMapping("/registerAndSearch/controller/register")
	public RegistedAddressAndNameVO register(MultipartFile[] uploadFile, HttpSession session) throws FileNotFoundException {
		String savedFilePath=fileUploadService.saveFile(uploadFile);
		System.out.println("1 :" +savedFilePath);
		List<String> ocrResult = ocrService.clovaOCR(savedFilePath);
		System.out.println("2 :" +ocrResult);
		RegistedAddressAndNameVO result =dataValidationService.validateExtractedData(session,ocrResult);
		return result;
	}
}
