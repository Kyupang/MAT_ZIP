package com.mat.zip.registerAndSearch.service.implementations;

import java.io.File;
import java.io.FileNotFoundException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mat.zip.registerAndSearch.service.FileUploadService;

@Service
public class FileUploadServiceImpl implements FileUploadService {

	@Override
	public String saveFile(MultipartFile[] uploadFile) throws FileNotFoundException {
		String uploadFolder = "D:\\upload\\"; // 저장할 폴더 경로
		String savedFilePath = null;
		for (MultipartFile multipartFile : uploadFile) {
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			savedFilePath = saveFile.getAbsolutePath();
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("savedFilePath : " + savedFilePath);
	    return savedFilePath;
	}
	
	

}
