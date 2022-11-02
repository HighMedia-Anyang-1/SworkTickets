package com.ticket.biz.faq.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ticket.biz.faq.FaqVO;


public class FaqRowMapper implements RowMapper<FaqVO>{

	@Override
	public FaqVO mapRow(ResultSet rs, int rowNum) throws SQLException{
	FaqVO faq = new FaqVO();
	faq.setFaq_title(rs.getString("faq_title"));
	faq.setFaq_reg(rs.getInt("faq_reg"));
	faq.setFaq_content(rs.getString("faq_content"));
	faq.setCate_name(rs.getString("cate_name"));
	return faq;
	}
	
	

	
	
}