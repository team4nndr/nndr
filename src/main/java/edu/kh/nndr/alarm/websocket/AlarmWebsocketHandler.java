package edu.kh.nndr.alarm.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import edu.kh.nndr.alarm.model.dto.Alarm;
import edu.kh.nndr.alarm.model.service.AlarmService;
import edu.kh.nndr.member.model.dto.Member;

public class AlarmWebsocketHandler extends TextWebSocketHandler {
    
    @Autowired
    private AlarmService service;
    
    private Set<WebSocketSession> sessions  = Collections.synchronizedSet(new HashSet<WebSocketSession>());

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
    }
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        Alarm alarm = objectMapper.readValue(message.getPayload(), Alarm.class);
        
        // DB에 저장 -> 실패 시 함수 종료 (전달X)
        if(service.insert(alarm) == 0) return ;
        
        // 상대방에게 전달
        for(WebSocketSession s : sessions) {
            int loginMemberNo = ((Member)s.getAttributes().get("loginMember")).getMemberNo();
            
            if(loginMemberNo == alarm.getMemberNo()) {
                s.sendMessage(new TextMessage(new Gson().toJson(alarm)));
            }
        }
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
    
}