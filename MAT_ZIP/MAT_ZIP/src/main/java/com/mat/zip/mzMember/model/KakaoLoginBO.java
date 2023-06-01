//비즈니스 로직 포함
package com.mat.zip.mzMember.model;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.mat.zip.mzMember.apis.KakaoLoginAPI;

public class KakaoLoginBO {
	
	/* 카카오 로그인 정보 
	 * (클라이언트 아이디, 시크릿, 콜백 url, 로그인 요청 고유값, 프로필 조회 url */
	private final static String CLIENT_ID = "9c46bab62bcd4496d8c31f3549ecf319";
	private final static String CLIENT_SECRET = "5ONKJOLqu49lOABq025fKgaCxFu96Phy";
	private final static String CALLBACK_URI = "http://localhost:8898/zip/mz_member/callbackKakao";
	private final static String SESSION_STATE = "kakao_oauth_state";
	private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
	
	/** 카카오 인증 URL 생성 메서드
	 * 세션 검사를 위해 난수 생성 후 세션에 저장
	 * 위의 정보를 가진 url 생성 후 인가 URL을 String으로 리턴 */
	public String getAuthorizationURL(HttpSession session) {
		String state = makeUUID();
		setSession(session, state);
		
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(CALLBACK_URI).state(state).build(KakaoLoginAPI.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	/* 승인 토큰 생성 메서드
	 * if문에 세션값과 state의 경로가 동일한지 파악 후 
	 * 동일하면 url 생성 후 url로 코드의 토큰 생성하여 메모리에 저장
	 * 저장한 값을 리턴
	 * 동일하지 않으면 null값을 리턴해 nullpointer 500 에러 발생 */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
		String sessionState = getKakaoSession(session);
		
		if (StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(CALLBACK_URI).state(state).build(KakaoLoginAPI.instance());
			
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null; 
	}
	
	/* UUID 생성 함수 
	 * 카카오 로그인 시 생성되는 고유 ID */
	public String makeUUID() {
		return UUID.randomUUID().toString();
	}
	
	/* 세션에 데이터 저장하는 메서드 */
	private void setSession(HttpSession session, String state){
		session.setAttribute(SESSION_STATE, state); //여기서 오타 발생 저장하는 메서드에서 state 대신 session 저장함
	}
	
	/* 저장한 세션의 데이터를 가져오는 메서드 */
	private String getKakaoSession(HttpSession session) {
		return String.valueOf(session.getAttribute(SESSION_STATE)); 
	}
	
	/* 유저 정보 가져오는 메서드
	 * 인증 url 생성 후 프로필 url과 인증 url을 가지고 request 선언
	 * 토큰과 request를 가지고 승인 request 생성
	 * response 바디에 데이터 보낸 후 리턴 
	 * 로그인 성공하면 실행되는 함수이기에 bulider에서 상태 함수 제외 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(CALLBACK_URI).build(KakaoLoginAPI.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		
		oauthService.signRequest(oauthToken, request); //이부분 에러 발생
		Response response = request.send();
		
		return response.getBody();
	}
	
}



