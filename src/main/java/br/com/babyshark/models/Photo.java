package br.com.babyshark.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Photo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(nullable = false)
	private String path;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
