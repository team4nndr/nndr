package edu.kh.nndr.friend.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.friend.model.sevice.FriendService;
@Controller
@RequestMapping("/friend") //기본 주소 +
public class friendController {
   
	@Autowired
	private FriendService service;
	
	
	@RequestMapping("")
   public String friend() {
      return "friend/friend"; 
   }
	
	@RequestMapping("/recom") // + 주소 
   public String friendrecom() {
	   return "friend/friendRecom"; //파일경로
   }
	@RequestMapping("/request") // + 주소 
	public String friendrequest() {
		return "friend/friendRequest"; //파일경로
	}
	@RequestMapping("/all") // + 주소 
	public String friendall() {
		return "friend/friendAll"; //파일경로
	}
	
	
}