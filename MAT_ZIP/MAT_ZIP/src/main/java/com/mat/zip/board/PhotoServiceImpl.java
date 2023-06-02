package com.mat.zip.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhotoServiceImpl implements PhotoService {
	
	@Autowired
	private PhotoDAO photoDao;
	
	
	@Override
	public int insertPhoto(PhotoVO vo) {
		return photoDao.insertPhoto(vo);
	}

	@Override
	public PhotoVO onePhotoId(int photo_id) {
		return photoDao.onePhotoId(photo_id);
	}

	@Override
	public int deletePhoto(int photo_id) {
		return photoDao.deletePhoto(photo_id);
	}

	@Override
	public int updatePhoto(PhotoVO vo) {
		return photoDao.updatePhoto(vo);
	}

	@Override
	public void incrementPhotoViewCount(int photo_id) {
		photoDao.incrementPhotoViewCount(photo_id);
	}

	@Override
	public List<PhotoVO> allPhoto() {
		return photoDao.allPhoto();
	}

	@Override
	public List<PhotoVO> searchPhoto(String searchTerm) {
		return photoDao.searchPhoto(searchTerm);
	}

}
