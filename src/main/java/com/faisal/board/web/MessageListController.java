package com.faisal.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faisal.board.domain.Message;
import com.faisal.board.service.MessageBoardService;

@Controller
@RequestMapping({"/messageList*","/"})
public class MessageListController {
	
	@Autowired
	private MessageBoardService messageBoardService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String generateList(Model model){
		List<Message> messages=java.util.Collections.emptyList();
		messages=messageBoardService.listMessages();
		model.addAttribute("messages", messages);
		return "messageList";
	}
}
