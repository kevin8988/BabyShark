package br.com.babyshark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.DonateDAO;
import br.com.babyshark.entity.Donate;

@Service
public class DonateServiceImpl implements DonateService {

	@Autowired
	private DonateDAO donateDAO;

	@Transactional
	public List<Donate> getAllDonates() {
		return donateDAO.getAllDonates();
	}

	public List<Donate> getDonatesByFilter(List<String> categories, String search) {
		return donateDAO.getDonatesByFilter(categories, search);
	}

}
