package com.mat.zip.mzMember.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.mat.zip.mzMember.model.MzMemberDAOImpl;
import com.mat.zip.mzMember.model.MzMemberDTO;

@Service
public class MzMemberserviceImpl implements MzMemberService {
	@Autowired
	MzMemberDAOImpl dao;
	
	@Autowired
	private JavaMailSenderImpl mailSender; //자바 내 메일 전송 메서드
	private int authNumber;
	
	/** 회원가입 시, 유효확인 핸들링 */
	/* 정규식에 어긋났을때 함수 실행
	 * 유효성 검사 받을 변수를 map으로 선언
	 * for문을 error 숫자만큼 돌려서 어긋난 경우를
	 * valid_vo변수이름의 형태로 key 이름 설정 
	 * key, 에러 시 나올 메세지를 map에 넣어서
	 * 전체 결과를 리턴
	 *  */
	public static Map<String, String> validateHandling(Errors errors) throws Exception {
		Map<String, String> validatorResult = new HashMap<String, String>();
		
		for (FieldError error : errors.getFieldErrors()) {
			String validKeyName = String.format("valid_%s", error.getField());
			validatorResult.put(validKeyName, error.getDefaultMessage());
		}
		return validatorResult;
	}
	
	/** 연령대 값 설정
	 * 현재 시간과 출생년도를 계산해서 나이를 구한 후 10을 나눠서 연령대 저장
	 * 소셜 로그인에 받아오는 값은 string이라 연령대를 string으로 설정 */
	private String makeAgeGroup(MzMemberDTO dto) {
		LocalDate now = LocalDate.now();
		
		String date = dto.getBirthDate();
		String year = date.substring(0, 4);
		
		int birthYear = Integer.parseInt(year);
		int thisYear = now.getYear();
		int age = (thisYear - birthYear) + 1;
		int aG = (age / 10) % 1234567; //정수 오차 범위 줄이기 위해 나머지 구함
		int lastAG = aG * 10;
		String ageGp = Integer.toString(lastAG);
		
		return ageGp;
	}
	
	/** dto 값에  연령대 set */
	private void setAG(MzMemberDTO dto) {
		String ageGp = makeAgeGroup(dto);
		dto.setAgeGroup(ageGp);
	}
	
	/** 폰 번호 -를 제외하고 저장 */
	private void setPN(MzMemberDTO dto) {
		String num = dto.getPhNum();
		String setNum = num.replace("-", "");
		dto.setPhNum(setNum);
	}
	
	/** 회원가입 실행 
	 * 연령대 추가, 휴대폰 번호 수정 후 회원가입 실행
	 * 들어온 값은 콘솔에서 확인 */
	@Override
	public void signUp(MzMemberDTO dto) throws Exception {
		setAG(dto);
		setPN(dto);
		dao.signUp(dto);
		System.out.println(dto);
	}
	
	/** 랜덤으로 인증번호 만드는 메서드
	 * 6자리의 랜덤 값을 정수에 넣고 인증 번호에 값 저장 */
	public void authRandomNum() {
		Random r = new Random();
		int makeNum = r.nextInt(888888) + 111111;
		System.out.println("mzMemberServiceImpl - 인증번호: " + makeNum);
		authNumber = makeNum;
	}
	
	/** 승인 이메일 폼 작성 메서드 
	 * 인증 번호 만드는 메서드 호출 후 메일을 전송
	 * 메일 전송 후 맞는지 확인차 인증 번호 리턴 */
	public String authEmail(String email) {
		authRandomNum();
		String setFrom = ".com";
		String toMail = email;
		String title = "맛.zip 회원가입 인증 메일입니다.";
		String content = "맛.zip의 홈페이지를 방문해주셔서 감사합니다!" + "<br><br>" +
		"회원님의 인증번호는 " + authNumber + "입니다." + "<br>" + 
		"해당 인증번호를 인증번호 확인란에 기입해 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	/** 이메일 전송 메서드
	 * 메세지 만들어주는 메서드 호출 후
	 * 메일 전송에 맞는 폼 작성 후 그 메세지 전송 */
	@Override
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			//true 넣지 않으면 단순 텍스트로 전송, 넣으면 html로 전송
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println("mzmemberServiceImpl - 메일 전송 중 오류 발생");
		}
	}
	
	/** 로그인 실행 */
	@Override
	public int memberLogin(MzMemberDTO dto) throws Exception {
		return dao.memberLogin(dto);
	}
	
	/** 로그인 시 회원 정보 가져옴 */
	@Override
	public MzMemberDTO getMemberInfo(MzMemberDTO dto) throws Exception {
		return dao.getMemberInfo(dto);
	}
	
}
