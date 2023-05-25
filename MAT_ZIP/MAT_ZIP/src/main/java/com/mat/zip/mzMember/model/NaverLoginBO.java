//네아로 인증 URL 생성, 콜백 처리 
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
import com.mat.zip.mzMember.apis.NaverLoginAPI;

public class NaverLoginBO {
	
	//불변의 값, 재할당 불가능하도록 final static으로 선언
	private final static String CLIENT_ID = "3xT2B77_H4W9n_XmfKAc";
	private final static String CLIENT_SECRET = "etyMpD7DfD";
	private final static String CALLBACK_URI = "http://localhost:8898/zip/mz_member/callbackNaver";
	private final static String SESSION_STATE = "oauth_state";
	/** 프로필 조회 API URL */
private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

/** 네이버 아이디로 인증 URL 생성 메서드 
 * 세션 유효성 검사를 위해 난수 생성
 * 세션과 생성한 난수 값을 세션에 저장
 * 네아로 인증 URL 생성 (Scribe에서 제공하는 인증 URL 생성 기능 이용)
 * 인증 URL 생성 시에 유효성 검사를 위한 난수 사용*/
public String getAuthorizationURL(HttpSession session) {
	String state = makeUUID();
	setSession(session, state);
	
	OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(CALLBACK_URI).state(state).build(NaverLoginAPI.instance());
	
		return oauthService.getAuthorizationUrl();
	}

/** 네이버 아이디로 callback 처리, 승인 토큰 획득 메서드 
 * 세션에 저장된 세션 값 얻어서 sessionState에 저장
 * if문을 통해 callback으로 전달받은 세션 검증용 값과 세션에 저장된 값이 동일한지 확인
 * 일치하면 인증 url 생성 후 그 변수에서 승인 토큰 얻어서 리턴 
 * 일치하지 않으면 null 리턴*/
public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception{
	String sessionState = getSession(session);
	System.out.println(getSession(session));
	if (StringUtils.pathEquals(sessionState, state)) {
			
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(CALLBACK_URI).state(state).build(NaverLoginAPI.instance());
		
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		return accessToken;
		}
	return null;
	}

/** 세션 유효성 검사를 위해 난수 생성하는 메서드 */
public String makeUUID() {
		return UUID.randomUUID().toString();
	}

/** 세션에 데이터 저장 메서드 */
private void setSession(HttpSession session, String state) {
	session.setAttribute(SESSION_STATE, state); 
}

/** 저장한 세션 가져오는 메서드 */
	private String getSession(HttpSession session) {	
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	/** 승인 토큰을 이용해 네이버 사용자 프로필 API 호출 
	 * 인증 url 생성 후 프로필 url과 인증 url을 가지고 request 선언
	 * 받은 승인 토큰을 이용해 인증 url에 signRequest 메서드 사용
	 * 리퀘스트에서 받은 걸 response에 선언 후 response를 리턴 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(CALLBACK_URI).build(NaverLoginAPI.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		
		Response response = request.send();
		return response.getBody();
	}

}

