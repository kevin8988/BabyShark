package br.com.babyshark.service;

import java.util.List;

import br.com.babyshark.entity.Donate;

public interface DonateService {

	public List<Donate> getAllDonates();

	public List<Donate> getDonatesByFilter(List<String> categories, String search);

}
