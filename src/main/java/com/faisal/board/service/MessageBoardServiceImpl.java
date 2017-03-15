package com.faisal.board.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.faisal.board.domain.Message;

@Service
public class MessageBoardServiceImpl implements MessageBoardService {
	
	private Map<Long,Message> messages=new LinkedHashMap<Long,Message>();

	@Override
	public List<Message> listMessages() {
		return new ArrayList<Message>(messages.values());
	}

	@Override
	public synchronized void postMessage(Message message) {
		System.out.println("Posting messages");
		message.setId(System.currentTimeMillis());
		messages.put(message.getId(),message);
	}

	@Override
	public void deleteMessage(Message message) {
		messages.remove(message.getId());

	}

	@Override
	public Message findMessageById(Long messageId) {
		return messages.get(messageId);
	}

}
