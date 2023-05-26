package edu.kh.nndr.alarm.websocket;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
        
        // 친구신청을 제외한 알람발송일 경우에만 DB 삽입
    	if( !alarm.getType().equals("PASS") ) {
    		
    		// 상대방 알람 수신여부 확인
    		Map<String, Object> map = new HashMap<>();
    		map.put("memberNo", alarm.getMemberNo());
    		map.put("column", Alarm.Type.valueOf(alarm.getType()).column()); // DB 컬럼명
    		if( !service.checkAlarmSetting(map) ) return; // 해당 알림 수신거부 상태일 시 함수 종류     
    		
    		// DB에 저장 -> 실패 시 함수 종료 (전달X)
    		if( service.insert(alarm) == 0 ) return ; 
    	}
    	
    	// 알람 번호 추가
    	Alarm no = service.checkAlarmNo();
    	alarm.setAlarmNo(no.getAlarmNo());
    	
        // 상대방에게 전달(1:1)
        for(WebSocketSession s : sessions) {
            int loginMemberNo = ((Member)s.getAttributes().get("loginMember")).getMemberNo();            
            if(loginMemberNo == alarm.getMemberNo()) {
                s.sendMessage(new TextMessage(new Gson().toJson(alarm)));
                ((List<Alarm>)s.getAttributes().get("alarmList")).add(alarm);
                break;
            }
        }
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
    
}