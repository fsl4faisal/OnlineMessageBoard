package com.faisal.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.faisal.board.domain.Message;

@Service
public interface MessageBoardService {
	public List<Message> listMessages();
	public void postMessage(Message message);
	public void deleteMessage(Message message);
	public Message findMessageById(Long messageId);
}
