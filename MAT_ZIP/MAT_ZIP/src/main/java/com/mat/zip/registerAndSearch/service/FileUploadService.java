package com.mat.zip.registerAndSearch.service;
import java.io.FileNotFoundException;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
    String saveFile(MultipartFile[] uploadFile) throws FileNotFoundException;
}

