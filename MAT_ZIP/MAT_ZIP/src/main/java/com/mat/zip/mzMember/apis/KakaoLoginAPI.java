//scribe 라이브러리용 api 구현체 추가
package com.mat.zip.mzMember.apis;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoLoginAPI extends DefaultApi20{
	
	protected KakaoLoginAPI() {
	}
	
	//카카오 로그인 인스턴스화 메서드
	private static class IntanceHolder{
		private static final KakaoLoginAPI INSTANCE = new KakaoLoginAPI();
	}
	
	public static KakaoLoginAPI instance() {
		return IntanceHolder.INSTANCE;
	}
	
	//request post 방식으로 인가 토큰 얻음
	@Override
	public String getAccessTokenEndpoint() {
		return "https://kauth.kakao.com/oauth/token"; 
	}
	
	//로그인 실행 시 서버의 기본이 되는 url
	@Override
	public String getAuthorizationBaseUrl() {
		return "https://kauth.kakao.com/oauth/authorize"; 
	}
	
}

