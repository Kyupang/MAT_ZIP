package com.mat.zip.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mat.zip.board.PostVO;

@Controller
public class PostController {

	@Autowired
	PostDAO dao;
	
	@Autowired
	PostComDAO dao2;
	
	// 자유게시판 게시물 등록 insert
	@RequestMapping("/board/createPost")
	public void insert(
			PostVO vo, 
			HttpServletRequest request, 
			MultipartFile file, 
			Model model) throws Exception {
		String savedName = file.getOriginalFilename();
		String uploadPath
			= request.getSession().getServletContext().getRealPath("resources/img");
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		
		model.addAttribute("savedName", savedName);
		System.out.println("img 넣기 전 >> " + vo);
		vo.setPost_file(savedName);
		System.out.println("img넣은 후 >> " + vo);

		dao.insert(vo);
	}

	// 자유게시판 게시물 수정 update 
	@RequestMapping("/board/updatePost")
	public void update(PostVO vo) {
	    System.out.println("update요청됨.");
	    System.out.println(vo);

	    dao.update(vo);
	}
	
	// 자유게시판 게시물 수정 페이지로 이동
	@RequestMapping(value = "/board/updatePost", method = RequestMethod.GET)
	public void updatepage(int post_id, Model model) {
		System.out.println("update page로 이동 요청.");
		PostVO vo = dao.onePostId(post_id);
		model.addAttribute("vo", vo);
	}
	
	// 자유게시판 게시물 삭제 delete
	@RequestMapping("/board/deletePost")
	public void delete(PostVO vo) {
		System.out.println("delete 요청됨. ");
		System.out.println(vo);
		
		dao.delete(vo);
	}

	// 조건별 검색 : post_id로 검색하기
	@RequestMapping("/board/onePostId")
	public void onePostId(int post_id, Model model) {
		System.out.println("onePostId요청됨.");
		PostVO vo = dao.onePostId(post_id);
		
		List<PostComVO> list = dao2.postComList(post_id);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
	}
	
	// 조회수 증가
    @RequestMapping("/board/increasePostViewCount")
    @ResponseBody
    public void increasePostViewCount(int post_id) {
    	System.out.println("조회수 증가 전");
        dao.incrementPostViewCount(post_id);
        System.out.println("조회수 증가 완료");
    }
	
	// 조건별 검색 : user_id로 검색하기
	@RequestMapping("/board/onePostUserid")
	public void onePostUserid(String user_id, Model model) {
		System.out.println("onePostUserid요청됨.");
		PostVO vo = dao.onePostUserid(user_id);
		model.addAttribute("vo", vo);
	}
	
	// 조건별 검색 : food_cg로 검색하기
	@RequestMapping("/board/onePostFoodcg")
	public void onePostFoodcg(String food_cg, Model model) {
		System.out.println("onePostUserid요청됨.");
		PostVO vo = dao.onePostUserid(food_cg);
		model.addAttribute("vo", vo);
	}
	
	// 자유게시판 전체 게시글 검색 
	@RequestMapping("/board/allPost") // ajax
	public void allPost(Model model) {
		List<PostVO> list = dao.allPost();
		System.out.println(list.size()); // list size 
		model.addAttribute("list", list);
	}

}
