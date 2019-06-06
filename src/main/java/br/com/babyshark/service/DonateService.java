package br.com.babyshark.service;

import java.util.List;
import java.util.Set;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Gender;
import br.com.babyshark.entity.Interest;
import br.com.babyshark.entity.InterestId;
import br.com.babyshark.entity.User;

public interface DonateService {

	// Donate

	public void insertOrUpdate(Donate donate);

	public void deleteDonate(User user, Integer id);

	public Donate getDonateDetail(Integer id);

	public Donate getDonateByIdAndUser(User user, Integer id);

	public Donate getDonateById(Integer id);

	public List<Donate> getAllDonatesWithoutAgregation();

	public List<Donate> getAllDonates();

	public List<Donate> getDonatesByFilter(List<Integer> categories, List<Integer> genders, List<Integer> colors,
			List<String> states, String search);

	public List<Donate> getDonatesByUser(User user);

	// Photo

	public List<String> getPathPhotos(Donate donate);

	public void deletePhotoByDonate(Integer id);

	// Interest

	public void insertOrUpdate(Interest interest, User user, Donate donate);

	public void deleteInterest(Integer id);

	public void accept(InterestId interestId, Integer donateId);

	public void decline(InterestId interestId);

	public List<Interest> getMyInterests(User user);

	public List<Interest> getInterestInMyDonates(User user);

	// Category

	public List<Category> getAllCategoriesDonate();

	// Gender

	public List<Gender> getAllGendersDonate();

	// Color

	public List<Color> getAllColorsDonate();

	// UserAddress

	public Set<String> getAllAddressesDonate();

}
