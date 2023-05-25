package com.mat.zip.mainpage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MzlistDAO { 
	
	@Autowired
	SqlSessionTemplate my; 

	
	public MzlistVO one(String landNumAddress) {
		MzlistVO vo = my.selectOne("mzlist.one", landNumAddress);
		System.out.println(vo);
		return vo;
	}
	
	public List<MzlistVO> han(String food){
		List<MzlistVO> hanresult = my.selectList("mzlist.han", food);
		System.out.println(hanresult);
		return hanresult;
	}
	
	public List<MzlistVO> jjung(String food){
		List<MzlistVO> jjungresult = my.selectList("mzlist.jjung", food);
		System.out.println(jjungresult);
		return jjungresult;
	}
	
	public List<MzlistVO> ill(String food){
		List<MzlistVO> illresult = my.selectList("mzlist.ill", food);
		System.out.println(illresult);
		return illresult;
	}
	
	public List<MzlistVO> gyung(String food){
		List<MzlistVO> gyungresult = my.selectList("mzlist.gyung", food);
		System.out.println(gyungresult);
		return gyungresult;
	}
	
	public List<MzlistVO> boon(String food){
		List<MzlistVO> boonresult = my.selectList("mzlist.boon", food);
		System.out.println(boonresult);
		return boonresult;
	}
	
}
