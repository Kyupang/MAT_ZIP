package com.mat.zip.calendar;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

//필요한 패키지와 클래스를 임포트

/**
 * Handles requests for the application home page.
 */
@Controller
//컨트롤러 클래스임을 선언
@Log4j
//어노테이션을 사용하여 로깅을 위한 로거 객체를 생성
public class CalController {

	@Autowired
	CalDAO calDAO;

	private static final Logger logger = LoggerFactory.getLogger(CalController.class);

	// 컨토롤러에서 캔버스 출력 관련 코드, 전체 리스트 출력
	@RequestMapping(value = "calendar/calendar", method = RequestMethod.GET)
	public void calendar(Model model) {

		List<CalVO> Schedule_list = calDAO.schedule_list();
        System.out.println(Schedule_list.size());
        System.out.println(Schedule_list);
//		
		// 배열에 담음
		model.addAttribute("Schedule_list", Schedule_list); // 날짜 데이터 배열

	
	}
	// 여기까지 컨트롤러에서 캔버스 출력 관련 코드

	// 일정추가와 관련된 코드
//
	@RequestMapping(value = "calendar/calendar_add", method = RequestMethod.GET)
	public String schedule_add(CalVO calVO) {
		
		calDAO.add(calVO);
	return "redirect:calendar";
	}
	// 위에까지 일정 추가와 관련된 코드

	// 일정정보 조회 관련 코드
	@RequestMapping(value = "calendar/one", method = RequestMethod.GET)
	public void schedule_show(Model model, int schedule_idx) {
		CalVO  calVO = calDAO.one(schedule_idx);
		model.addAttribute("calVO", calVO);
		
	}
	// 위에까지 일정 조회와 관련된 코드
	// 추가한 일정을 클릭하면 해당 일정의 기본키인 schedule_idx의 정보가 주소창으로 넘어가
	// idx값으로 select 쿼리문을 실행하여 해당 일정의 모든 정보를 가져와 새로운 웹창 출력
	// model.addAttribute를 사용하여 schedule_show를 가지고 schedule_show.jsp로 넘겨줌

	// 일정정보 수정
	@RequestMapping(value = "calendar/update", method = RequestMethod.GET)
	public void schedule_modify(CalVO calVO) {
		calDAO.update(calVO);
		
	}
//
//	// 일정정보 삭제
	@RequestMapping(value = "calendar/delete", method = RequestMethod.GET)
	public void schedule_delete(int schedule_idx) {
		calDAO.delete(schedule_idx);
	}
		
	}
