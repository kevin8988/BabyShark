package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;

public interface HomeService {

	// Event

	public List<Event> getThreeNearbyEvents();

	// Donate

	public List<Donate> getLastThreeDonates();

	// User

	public User getUserByEmail(String email);

}
