package kr.co.member.repository;

import java.util.List;
import java.util.Map;

import kr.co.board.domain.BoardDTO;
import kr.co.common.domain.PageTO;
import kr.co.member.domain.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	MemberDTO read(String id);

	void update(MemberDTO dto);

	int changePw(Map<String, Object> map);

	MemberDTO login(MemberDTO login);

	MemberDTO updatepwui(String id);

	int delete(Map<String, Object> map);

	List<MemberDTO> list();
	
	List<MemberDTO> list(Map<String, String> map, PageTO<MemberDTO> pt);

	int getAmount(Map<String, String> map);
	
	void delete_m(String id) throws Exception;
	

}
