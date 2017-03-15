package com.faisal.board.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faisal.board.domain.Message;
import com.faisal.board.service.MessageBoardService;

@Controller
@RequestMapping("/messagePost*")
public class MessagePostController {
	
	@Autowired
	private MessageBoardService messageBoardService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String setupForm(Model model){
		Message message=new Message();
		model.addAttribute("message",message);
		return "messagePost";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String onSubmit(@Valid Message message,BindingResult result){
		if(result.hasErrors()){
			System.out.println(message);
			System.out.println("It has errors");
			return "messagePost";
		}else{
			System.out.println(message);
			messageBoardService.postMessage(message);
			return "redirect:messageList";
		}
	}
	
}
