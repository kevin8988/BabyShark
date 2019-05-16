package br.com.babyshark.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.dao.CategoryDAO;
import br.com.babyshark.dao.ColorDAO;
import br.com.babyshark.dao.DonateDAO;
import br.com.babyshark.dao.GenderDAO;
import br.com.babyshark.dao.InterestDAO;
import br.com.babyshark.dao.PhotoDAO;
import br.com.babyshark.dao.UserAddressDAO;
import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Gender;
import br.com.babyshark.entity.Interest;
import br.com.babyshark.entity.InterestId;
import br.com.babyshark.entity.Photo;
import br.com.babyshark.entity.Status;
import br.com.babyshark.entity.User;
import br.com.babyshark.entity.UserAddress;
import br.com.babyshark.infra.FileSaver;

@Service
public class DonateServiceImpl implements DonateService {

	@Autowired
	private DonateDAO donateDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private InterestDAO interestDAO;

	@Autowired
	private GenderDAO genderDAO;

	@Autowired
	private ColorDAO colorDAO;

	@Autowired
	private UserAddressDAO userAddressDAO;

	@Autowired
	private PhotoDAO photoDAO;

	@Autowired
	private FileSaver fileSaver;

	// Donate

	@Override
	@Transactional
	public void insertOrUpdate(Donate donate) {
		donateDAO.insertOrUpdate(donate);
	}

	@Override
	@Transactional
	public void deleteDonate(User user, Integer id) {
		List<Photo> photosByDonate = photoDAO.getPhotosByDonate(id);
		donateDAO.deleteDonate(user, id);
		fileSaver.delete(photosByDonate);
	}

	@Override
	@Transactional
	public Donate getDonateDetail(Integer id) {
		try {
			return donateDAO.getDonateDetail(id);
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	@Transactional
	public Donate getDonateByIdAndUser(User user, Integer id) {
		return donateDAO.getDonateByIdAndUser(user, id);
	}

	@Override
	@Transactional
	public Donate getDonateById(Integer id) {
		return donateDAO.getDonateById(id);
	}

	@Override
	@Transactional
	public List<Donate> getAllDonatesWithoutAgregation() {
		return donateDAO.getAllDonatesWithoutAgregation();
	}

	@Override
	@Transactional
	public List<Donate> getAllDonates() {
		return donateDAO.getAllDonates();
	}

	@Override
	@Transactional
	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> states, String search) {
		return donateDAO.getDonatesByFilter(categories, genders, colors, states, search);
	}

	@Override
	@Transactional
	public List<Donate> getDonatesByUser(User user) {
		return donateDAO.getDonatesByUser(user);
	}

	// Interest

	@Override
	@Transactional
	public void insertOrUpdate(Interest interest, User user, Donate donate) {
		InterestId id1 = new InterestId(user.getId(), donate.getId());
		interest.setId(id1);
		interest.setStatus(Status.PENDENTE);
		interest.setUser(user);
		interest.setDonate(donate);
		interestDAO.insertOrUpdate(interest);
	}

	@Override
	@Transactional
	public void deleteInterest(Integer id) {
		interestDAO.delete(id);
	}

	@Override
	@Transactional
	public void accept(Interest interest) {
		interest.setStatus(Status.ACEITO);
		interestDAO.insertOrUpdate(interest);
	}

	@Override
	@Transactional
	public void decline(Interest interest) {
		interest.setStatus(Status.RECUSADO);
		interestDAO.insertOrUpdate(interest);
	}

	@Override
	@Transactional
	public List<Interest> getMyInterests(User user) {
		return interestDAO.getMyInterests(user);
	}

	@Override
	@Transactional
	public List<Interest> getInterestInMyDonates(User user) {
		return interestDAO.getInterestInMyDonates(user);
	}

	// Photo

	@Override
	@Transactional
	public void deletePhotoByDonate(Integer id) {
		List<Photo> photosByDonate = photoDAO.getPhotosByDonate(id);
		photoDAO.deletePhotoByDonate(id);
		fileSaver.delete(photosByDonate);
	}

	@Override
	public List<String> getPathPhotos(Donate donate) {
		List<String> path = new ArrayList<String>();
		for (Photo photo : donate.getPhotos()) {
			String newPath = photo.getPath().replace("http://s3.amazonaws.com/imagens-donates/", "");
			path.add(newPath);
		}
		return path;
	}

	// Category

	@Override
	@Transactional
	public List<Category> getAllCategoriesDonate() {
		return categoryDAO.getAllCategoriesDonate();
	}

	// Color

	@Override
	@Transactional
	public List<Color> getAllColorsDonate() {
		return colorDAO.getAllColorsDonate();
	}

	// Gender

	@Override
	@Transactional
	public List<Gender> getAllGendersDonate() {
		return genderDAO.getAllGendersDonate();
	}

	// UserAddress

	@Override
	@Transactional
	public Set<String> getAllAddressesDonate() {
		List<UserAddress> donate = userAddressDAO.getAllAddressDonate();
		Set<String> state = new HashSet<>();
		for (UserAddress address : donate) {
			if (address.getState() != null) {
				state.add(address.getState());
			}
		}
		return state;
	}

}
