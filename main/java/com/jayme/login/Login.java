package com.jayme.login;

import java.util.Objects;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class Login {

	@NotBlank(message="Please enter a username")
	private String username;
	
	@NotBlank(message="Please enter a password")
	@Size(min = 5, max=10, message="Password must be between 5 and 10 characters")
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Credentials [username=");
		builder.append(username);
		builder.append(", password=");
		builder.append(password);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		return Objects.hash(username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Login)) {
			return false;
		}
		Login other = (Login) obj;
		return Objects.equals(username, other.username);
	}
	
	
	
	
}
