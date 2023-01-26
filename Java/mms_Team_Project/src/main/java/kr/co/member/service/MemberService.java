package kr.co.member.service;

import java.util.List;
import java.util.Map;

import kr.co.board.domain.BoardDTO;
import kr.co.common.domain.PageTO;
import kr.co.member.domain.MemberDTO;


public interface MemberService {

	void insert(MemberDTO dto);

	MemberDTO read(String id);

	MemberDTO updateui(String id);

	MemberDTO update(MemberDTO dto);

	int changePw(Map<String, Object> map);

	MemberDTO checkId(Map<String, Object> map);

	MemberDTO login(MemberDTO login);

	MemberDTO updatepwui(String id);

	Integer delete(Map<String, Object> map);

	List<MemberDTO> list();

	PageTO<MemberDTO> list(Map<String, String> map);
	
	void delete_m(String id) throws Exception;



	

}
