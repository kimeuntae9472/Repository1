package com.kg.myapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
//queryForObject 직접 수정해서 null이 나와도 error가 뜨지 않게 하기 (springFrameWork custom하기)
@Component
public class MyJdbcTemplate extends JdbcTemplate{

	public MyJdbcTemplate(DataSource dataSource) {
		super(dataSource);// dataSource를 주입 받기 위해서
	}
	
	//null이 출력되도록
	@Override
	public <T> T queryForObject(String sql, RowMapper<T> rowMapper, Object... args) throws DataAccessException {
		List<T> results =  query(sql,rowMapper,args);
		if(results == null || results.isEmpty()) {
			return null;
		}else if(results.size()>1){
			throw new IncorrectResultSizeDataAccessException(1, results.size());
		}else {
			return results.iterator().next();
		}	
	}
	
	// rowMapper를 쓰지않는 integer.class를 위해 사용됨
	@Override
	public <T> T queryForObject(String sql, Class<T> requiredType, Object... args) throws DataAccessException {
		return this.queryForObject(sql, new RowMapper<T>() { 
			@Override
			public T mapRow(ResultSet rs, int rowNum) throws SQLException {
				T result = (T)rs.getObject(1);
				return result;
			}
		}, args);
	}
	
	

	
	

	
}
