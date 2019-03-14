package br.com.babyshark.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Event;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Transactional
	public List<Event> getThreeNearbyEvents() {
		return null;
	}

	@Transactional
	public List<Donate> getLastThreeDonates() {
		return null;
	}

}
