package com.bookshop01.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public int removeMember(MemberVO memberVO) throws Exception;
	public void addAddress(Map<String, String> addMap) throws Exception;
	
	// t_shopping_member_addresses 테이블에 저장된 추가 배송지 값 가져오는 메소드
    public MemberVO getDefaultAddress(String id) throws Exception;
    public List<Map<String, String>> getAdditionalAddresses(String id) throws Exception;
}
