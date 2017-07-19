package com.testApps.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;


public class usersDAO {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	
	@Override
	public String toString() {
		return "usersDAO [jdbc=" + jdbc + "]";
	}


	public List<User> getUsers() {
		return jdbc.query("select * from  users", new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setDob(rs.getDate("dob"));
				return user;
			}

		});
	}
	
	public boolean createUser(User user)
	{
		MapSqlParameterSource params = new MapSqlParameterSource("firstName", user.getFirstName());
		params.addValue("lastName", user.getLastName());
		params.addValue("dob", user.getDob());
		return jdbc.update("insert into users (firstName,lastName,dob) values(:firstName, :lastName , :dob)", params)==1;
	}

}
