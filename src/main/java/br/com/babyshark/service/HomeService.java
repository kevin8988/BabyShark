package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Event;

public interface HomeService {

	public List<Event> getThreeNearbyEvents();

	public List<Donate> getLastThreeDonates();

}
