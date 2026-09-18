package com.kr.pjtone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kr.pjtone.dao.MemberDaoInterface;
import com.kr.pjtone.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MemberController {
	
	@Autowired
	MemberDaoInterface dao;
	
	@PostMapping("MemberDelete")
	public String memberDelete(HttpServletRequest request) {
		String id = request.getParameter("t_id");
		int result = dao.memberDelete(id);
		
		String msg = result == 1 ? "삭제 성공~":"삭제 실패!";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "MemberList");
		
		return "common_alert";
	}
	
	@GetMapping("MemberView")
	public String memberView(HttpServletRequest request) {
		String id = request.getParameter("t_id");
		MemberDto dto = dao.getMemberView(id);
		
		request.setAttribute("dto", dto);
		
		return "member/member_view";
	}
	
	//ID중복검사
	@PostMapping("MemberCheckId")
	public String memberCheckId(HttpServletRequest request) {
		String id = request.getParameter("t_id");
		String result = dao.getCheckId(id);
		if(result == null) result = "시용가능";
		else result = "사용불가";
		
		request.setAttribute("result", result);
		
		return "member/member_checkid";
	}
	
	
	@PostMapping("MemberSave")
	public String memberSave(HttpServletRequest request) {
		String id = request.getParameter("t_id");
		String name = request.getParameter("t_name");
		String area = request.getParameter("t_area");
		
		String age_value = request.getParameter("t_age");
		if(age_value.equals("")) age_value = "0";
		
//		try {
//			age = Integer.parseInt(request.getParameter("t_age"));
//		}catch(Exception e) {
//			
//		}
		int age = Integer.parseInt(age_value);
		
//		MemberDto dto = new MemberDto();
//		dto.setId(id);
//		dto.setName(name);
//		dto.setArea(area);
//		dto.setAge(age);
//		이거 말고 전체 생성자를 만들었음
		
		MemberDto dto = new MemberDto(id, name, area, age);
		int result = 0;
		try {
			result = dao.memberSave(dto);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("memberSave(dto) 오류!");
		}
		
		String msg = result == 1 ? "등록 성공~":"등록 실패!";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "MemberList");
		
		return "common_alert";
	}
	
	@GetMapping("MemberWriteForm")
	public String memberWwiteForm() {
		return "member/member_write";
	}
	
	@GetMapping("MemberList")
	public String memberList(HttpServletRequest request) {
		List<MemberDto> list = dao.getMemberList();
		
		request.setAttribute("list", list);
		
		return "member/member_list";
	}
	
	@PostMapping("MemberList")
	public String memberListPost(HttpServletRequest request) {
		String select = request.getParameter("t_select");
		String search = request.getParameter("t_search");
//		List<MemberDto> list = dao.getMemberList();
		
		Map<String, Object> map = new HashMap<>();
		map.put("selectValue", select);
		map.put("searchValue", search);
		
		List<MemberDto> list = dao.getMemberListMap(map);
		
		request.setAttribute("list", list);
		request.setAttribute("select", select);		
		request.setAttribute("search", search);		
		return "member/member_list";
	}
	
	@RequestMapping("Mem")
	public String mem() {
		return "member/member_list";
	}
	
	@GetMapping("Memget")
	public String memGet() {
		return "member/member_list";
	}
	
	@PostMapping("Mempost")
	public String memPost() {
		return "member/member_list";
	}
}
