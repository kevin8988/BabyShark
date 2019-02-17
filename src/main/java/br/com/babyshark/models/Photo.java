package br.com.babyshark.models;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Photo {
	
	@Column(nullable = false)
	private String path;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
