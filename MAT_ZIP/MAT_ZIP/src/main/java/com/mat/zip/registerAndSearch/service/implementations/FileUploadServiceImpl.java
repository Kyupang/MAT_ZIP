package com.mat.zip.registerAndSearch.service.implementations;



import java.io.FileNotFoundException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mat.zip.registerAndSearch.service.FileUploadService;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;

import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider;
import software.amazon.awssdk.regions.Region;

@Service
public class FileUploadServiceImpl implements FileUploadService {

    private String bucketName = "my-s3-gyu";  
    
    private String folderPath = "img/";  
    
    
    
    @Override
    public String saveFile(MultipartFile[] uploadFile) throws FileNotFoundException {
    	S3Client s3Client = S3Client.builder()
                .region(Region.AP_NORTHEAST_2)  // 사용하는 AWS 리전으로 변경해야 합니다.
                .credentialsProvider(DefaultCredentialsProvider.create())
                .build();
        String savedFilePath = null;
        
        for (MultipartFile multipartFile : uploadFile) {
            String fileName = multipartFile.getOriginalFilename();

            try {
                PutObjectResponse response = s3Client.putObject(PutObjectRequest.builder()
                        .bucket(bucketName)
                        .key(folderPath + fileName)  // 폴더 경로에 "img/"를 추가합니다.
                        .build(), RequestBody.fromInputStream(multipartFile.getInputStream(), multipartFile.getSize()));
                System.out.println("File uploaded successfully. ETag: " + response.eTag());
                savedFilePath = folderPath + fileName; // 파일의 S3 경로를 저장합니다.
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        s3Client.close();
        return savedFilePath;
    }
}


