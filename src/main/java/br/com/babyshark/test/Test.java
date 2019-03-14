package br.com.babyshark.test;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.entity.Address;
import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.CategoryName;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.User;

@Repository
public class Test {

	@PersistenceContext
	private EntityManager em;

	@Transactional
	public void popula() {
		User user = new User("kev", "silva", "kevsilva07@gmail.com", "kevin98", "kevin98", "50169525821");
		User user2 = new User("luck", "tes", "luck@gmail.com", "luck98", "luck98", "50169525821");

		em.persist(user);
		em.persist(user2);

		Address address = new Address("São Paulo", "São Paulo", "Brasil");

		em.persist(address);

		Donate donate = new Donate("Short Doll Manga Curta Baby Feminino Azul",
				"Olha que fofo este pijama baby. Muito divertido para que os pequenos possam brincar e dormir", "Novo");

		Donate donate2 = new Donate("Short Doll Manga Curta Baby Masculino Azul",
				"Olha que fofo este pijama baby. Muito divertido para que os pequenos possam brincar e dormir", "Novo");

		em.persist(donate);
		em.persist(donate2);

		Event event = new Event("Tarde das Crianças", "Bazar de graça de roupas para bebês", new Date(), new Date(),
				Calendar.getInstance());

		em.persist(event);

		Category category = new Category(CategoryName.ACESSÓRIOS);
		Category category2 = new Category(CategoryName.MENINAS);
		Category category3 = new Category(CategoryName.MENINOS);
		Category category4 = new Category(CategoryName.OUTROS);
		Category category5 = new Category(CategoryName.UNISSEX);
		
		em.persist(category);
		em.persist(category2);
		em.persist(category3);
		em.persist(category4);
		em.persist(category5);

		user.setAddress(address);
		user2.setAddress(address);

		user.add(donate);
		user2.add(donate2);
		
		donate.add(category4);
		donate.add(category3);
		
		donate2.add(category5);
		donate2.add(category);

		event.setUser(user2);
				
		event.add(user);
	}

}
