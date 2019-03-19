package br.com.babyshark.test;

import java.time.Instant;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.babyshark.entity.Category;
import br.com.babyshark.entity.CategoryName;
import br.com.babyshark.entity.Color;
import br.com.babyshark.entity.ColorName;
import br.com.babyshark.entity.Donate;
import br.com.babyshark.entity.Event;
import br.com.babyshark.entity.EventAddress;
import br.com.babyshark.entity.Gender;
import br.com.babyshark.entity.GenderName;
import br.com.babyshark.entity.User;
import br.com.babyshark.entity.UserAddress;

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

		UserAddress userAddress = new UserAddress("São Paulo", "São Paulo", "Brasil");

		em.persist(userAddress);

		EventAddress eventAddress = new EventAddress("São Paulo", "São Paulo", "Brasil", "106", "Rua Amaro Rodrigues",
				"Horto Florestal", "02377050");

		Donate donate = new Donate("Short Doll Manga Curta Baby Feminino Azul",
				"Olha que fofo este pijama baby. Muito divertido para que os pequenos possam brincar e dormir", "Novo");

		Donate donate2 = new Donate("Short Doll Manga Curta Baby Masculino Azul",
				"Olha que fofo este pijama baby. Muito divertido para que os pequenos possam brincar e dormir", "Novo");

		em.persist(donate);
		em.persist(donate2);

		new Date();
		Event event = new Event("Tarde das Crianças", "Bazar de graça de roupas para bebês", new Date(), new Date(),
				Date.from(Instant.now()));

		em.persist(event);

		Category category = new Category(CategoryName.ACESSÓRIOS);
		Category category2 = new Category(CategoryName.ROUPAS);
		Category category3 = new Category(CategoryName.OUTROS);

		em.persist(category);
		em.persist(category2);
		em.persist(category3);

		Gender gender = new Gender(GenderName.MENINOS);
		Gender gender2 = new Gender(GenderName.MENINAS);
		Gender gender3 = new Gender(GenderName.UNISSEX);

		em.persist(gender);
		em.persist(gender2);
		em.persist(gender3);

		Color color = new Color(ColorName.AMARELO, "#FFFF00	");
		Color color2 = new Color(ColorName.AZUL, "#0000FF");
		Color color3 = new Color(ColorName.BEGE, "#EAEAB4");
		Color color4 = new Color(ColorName.BRANCO, "#FFFFFF");
		Color color5 = new Color(ColorName.CINZA, "#808080");
		Color color6 = new Color(ColorName.MARROM, "#bf8040");
		Color color7 = new Color(ColorName.ROSA, "#FF69B4");
		Color color8 = new Color(ColorName.VERDE, "#008000");
		Color color9 = new Color(ColorName.VERMELHO, "#FF0000");
		Color color10 = new Color(ColorName.PRETO, "#000000");

		em.persist(color);
		em.persist(color2);
		em.persist(color3);
		em.persist(color4);
		em.persist(color5);
		em.persist(color6);
		em.persist(color7);
		em.persist(color8);
		em.persist(color9);
		em.persist(color10);

		user.setUserAddress(userAddress);
		user2.setUserAddress(userAddress);

		user.add(donate);
		user2.add(donate2);

		donate.add(category);
		donate.add(color);
		donate.add(gender);

		donate2.add(category2);
		donate2.add(color2);
		donate2.add(gender2);

		event.setUser(user2);
		event.setEventAddress(eventAddress);
		event.add(user);

	}

}
