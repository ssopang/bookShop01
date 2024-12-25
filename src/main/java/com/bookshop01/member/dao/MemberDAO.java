package com.bookshop01.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public int SignOutMember(MemberVO memberVO) throws DataAccessException;
	public void insertNewAddress(Map<String, String> addMap) throws DataAccessException;
    public MemberVO selectDefaultAddress(String id) throws DataAccessException;
    public List<Map<String, String>> selectAdditionalAddresses(String id) throws DataAccessException;
}
