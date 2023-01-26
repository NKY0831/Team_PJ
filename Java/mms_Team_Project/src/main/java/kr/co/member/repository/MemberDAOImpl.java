package kr.co.member.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.common.domain.PageTO;
import kr.co.member.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession session;
	private final String NS = "kr.co.member";
	

	@Override
	public void insert(MemberDTO dto) {
		session.insert(NS+".insert", dto);
		
	}


	@Override
	public MemberDTO read(String id) {
		return session.selectOne(NS+".read", id);
	}


	@Override
	public void update(MemberDTO dto) {
		session.update(NS+".update", dto);
		
	}


	@Override
	public int changePw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.update(NS+".changePw", map);
	}


	@Override
	public MemberDTO login(MemberDTO login) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".login", login);
	}


	@Override
	public MemberDTO updatepwui(String id) {
		
		return session.selectOne(NS+".updatepwui", id);
	}


	@Override
	public int delete(Map<String, Object> map) {
		
		return session.delete(NS+".delete", map);
	}


	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".list");
	}


	@Override
	public List<MemberDTO> list(Map<String, String> map, PageTO<MemberDTO> pt) {
		RowBounds rb = new RowBounds(pt.getStartNum(), pt.getPerpage());
		
		return session.selectList(NS+".list2", map, rb);
	}


	@Override
	public int getAmount(Map<String, String> map) {
		Integer amount = session.selectOne(NS+".getAmount", map);
		
		if(amount == null) {
			amount = 0;
		}
				
		return amount;
	}


	@Override
	public void delete_m(String id) throws Exception {
		 session.delete(NS+".delete_m", id);
		
	}


}
