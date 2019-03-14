package br.com.babyshark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.DonateDAO;
import br.com.babyshark.dao.EventDAO;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Event;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private DonateDAO donateDAO;
	
	@Autowired
	private EventDAO eventDAO;
	
	@Transactional
	public List<Event> getThreeNearbyEvents() {
		return eventDAO.getThreeNearbyEvents();
	}

	@Transactional
	public List<Donate> getLastThreeDonates() {
		return donateDAO.getLastThreeDonates();
	}

}
