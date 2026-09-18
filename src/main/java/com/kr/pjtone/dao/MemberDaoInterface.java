package com.kr.pjtone.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kr.pjtone.dto.MemberDto;

@Mapper
public interface MemberDaoInterface {
	
	//목록조회
	public List<MemberDto> getMemberList();
	
	//목록조회 map
	public List<MemberDto> getMemberListMap(Map<String, Object> map);
	
	//등록
	public int memberSave(MemberDto dto);
	
	//ID 중복검사
	public String getCheckId(@Param("checkId") String id);
	
	//상세조회
	public MemberDto getMemberView(@Param("viewId") String id);
	
	//삭제
	public int memberDelete(@Param("deleteId") String id);
	
}
