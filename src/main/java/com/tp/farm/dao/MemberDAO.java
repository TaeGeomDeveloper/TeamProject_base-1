package com.tp.farm.dao;

import com.tp.farm.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;


	//전체 회원 리스트 출력(관리자 페이지)
	public List<MemberVO> selectAllMemeber(){
		List<MemberVO> list = sqlSession.selectList("mapper.member.selectAllMemberList");

		return list;
	}

	//내정보 페이지에 본인 정보 조회
	public MemberVO selectOneMember(String mi_id) {
		MemberVO memberVO = sqlSession.selectOne("mapper.member.selectMemberById", mi_id);

		return memberVO;
	}

	//회원 등록 기능
	public boolean insertOneMember(MemberVO vo) {
		boolean flag = false;
		int affectedCount = sqlSession.insert("mapper.member.insertMember", vo);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	//내정보 페이지에서 정보 수정
	public boolean updateOneMember(MemberVO vo) {
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.member.updateMember", vo);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	//회원 탈퇴
	public boolean deleteOneMember(String mi_id) {
		boolean flag = false;
		int affectedCount = sqlSession.delete("mapper.member.deleteMember", mi_id);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	//로그인 할 때 회원인지 체크
	public MemberVO checkMember(String mi_id, String mi_password) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("mi_id", mi_id);
		map.put("mi_password",mi_password);
		MemberVO member = sqlSession.selectOne("mapper.member.checkMember", map);
		return member;
	}

	//비밀번호 찾기
	public MemberVO findPwd(String mi_id, String mi_email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mi_id", mi_id);
		map.put("mi_email",mi_email);
		MemberVO member = sqlSession.selectOne("mapper.member.findPwd", map);
		return member;
	}

	//아이디 찾기
	public String findId(String mi_name, String mi_phone){
		Map<String, String> map = new HashMap<String, String>();
		map.put("mi_name", mi_name);
		map.put("mi_phone", mi_phone);
		String result = sqlSession.selectOne("mapper.member.findId", map);
		return result;
	}


	//id 중복확인
	public boolean isSameId(String mi_id) {
		boolean flag = false;
		int affectedCount = sqlSession.selectOne("mapper.member.selectId",mi_id);
		if(affectedCount>0){
			flag = true;
		}
		return flag;
	}

    public boolean isSamePhone(String phone) {
		boolean flag = false;
		int affectedCount = sqlSession.selectOne("mapper.member.selectPhone", phone);
		if(affectedCount>0){
			flag = true;
		}
		return flag;
    }

    public boolean changePwd(String mi_password, String mi_id) {
		boolean flag = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("mi_password", mi_password);
		map.put("mi_id", mi_id);
		int affectedCount = sqlSession.update("mapper.member.updateMemberPwd", map);
		if(affectedCount>0){
			flag = true;
		}
		return flag;
    }
}
