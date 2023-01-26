package kr.co.member.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.common.domain.PageTO;
import kr.co.member.domain.MemberDTO;
import kr.co.member.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO mDao;

	@Override
	public void insert(MemberDTO dto) {
		mDao.insert(dto);
		
	}

	@Override
	public MemberDTO read(String id) {
		
		MemberDTO dto = mDao.read(id);
		
		
		return dto;
	}

	@Override
	public MemberDTO updateui(String id) {
		MemberDTO dto = mDao.read(id);
		
		return dto;
	}

	@Override
	public MemberDTO update(MemberDTO dto) {
		// TODO Auto-generated method stub
		mDao.update(dto);
		dto = mDao.read(dto.getId());
		return dto;
	}

	@Override
	public int changePw(Map<String, Object> map) {
		int result = mDao.changePw(map);
		return result;
	}

	@Override
	public MemberDTO checkId(Map<String, Object> map) {
		String id = (String)map.get("id");
		
		MemberDTO dto = mDao.read(id);
		return dto;
	}

	@Override
	public MemberDTO login(MemberDTO login) {
		// TODO Auto-generated method stub
		login = mDao.login(login);
		
		
		return login;
	}

	@Override
	public MemberDTO updatepwui(String id) {
		
		MemberDTO dto = mDao.updatepwui(id);
		
		
		return dto;
	}

	@Override
	public Integer delete(Map<String, Object> map) {
		
		int result = mDao.delete(map);
		
		return result;
	}

	@Override
	public List<MemberDTO> list() {
		List<MemberDTO> list = mDao.list();
		return list;
	}

	@Override
	public PageTO<MemberDTO> list(Map<String, String> map) {
		int curpage = 1;
		String scurpage = map.get("curpage");
		if(scurpage != null) {
			curpage = Integer.parseInt(scurpage);
		}
		
		int amount = mDao.getAmount(map);
		
		PageTO<MemberDTO> pt =
				new PageTO<MemberDTO>(curpage, amount, map.get("criteria"), map.get("keyword"));
		
		List<MemberDTO> list = mDao.list(map, pt);
		
		pt.setList(list);
		
		return pt;
	}

	@Override
	public void delete_m(String id) throws Exception {
		// TODO Auto-generated method stub
		mDao.delete_m(id);
	}



}
