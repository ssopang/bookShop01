package com.bookshop01.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.bookshop01.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember",memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		return result;
	}
	
	@Override
	public int SignOutMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.SignOutMember", memberVO);
		return result;
	}
	
	@Override
	public void insertNewAddress(Map<String, String> addMap) throws DataAccessException {
		sqlSession.insert("mapper.member.insertNewAddress", addMap);
	}
	
    @Override
    public MemberVO selectDefaultAddress(String id) throws DataAccessException {
        return sqlSession.selectOne("mapper.member.selectDefaultAddress", id);
    }

    @Override
    public List<Map<String, String>> selectAdditionalAddresses(String id) throws DataAccessException {
        return sqlSession.selectList("mapper.member.selectAddressList", id);
    }
}
