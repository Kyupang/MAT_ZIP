package com.mat.zip.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mat.zip.faq.service.ChatBotService;

@Controller
public class ChatbotHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatBotService service;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		session.sendMessage(new TextMessage(service.open(session.getId())));
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
		System.out.println(session.getId() + "가 전송한 메세지>> " + message.getPayload());
		session.sendMessage(new TextMessage(service.send(session.getId(), message.getPayload())));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		System.out.println(session.getId() + "가 연결 해제");
	}
	
}
