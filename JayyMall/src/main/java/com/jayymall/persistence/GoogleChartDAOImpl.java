package com.jayymall.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jayymall.dto.GoogleChartDTO;

@Repository
public class GoogleChartDAOImpl implements GoogleChartDAO {

	private final static String NS = "GoogleChartMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<GoogleChartDTO> cartProduct_price() {
		// TODO Auto-generated method stub
		return session.selectList(NS + ".product_price");
	}

}
