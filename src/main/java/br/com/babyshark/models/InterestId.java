package br.com.babyshark.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class InterestId implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "pk_user")
	private Integer userId;
	@Column(name = "pk_donate")
	private Integer donateId;

	public InterestId() {

	}

	public InterestId(Integer id, Integer id2) {
		this.userId = id;
		this.donateId = id2;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((donateId == null) ? 0 : donateId.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		InterestId other = (InterestId) obj;
		if (donateId == null) {
			if (other.donateId != null)
				return false;
		} else if (!donateId.equals(other.donateId))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

}
