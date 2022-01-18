package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.StudentDAO;
import com.sist.vo.InterviewVO;
import com.sist.vo.StudentVO;

@Controller
@RequestMapping("main/")
public class StudentController {
	@Autowired
	private StudentDAO dao;
	
	//1. StudentList 출력
	@GetMapping("main.do")
	public String studentList(String page, Model model) {
		//1-1. 페이지 설정(start, end값 넣어주기)
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int end=(rowSize*curpage);
		int start=end-rowSize+1;
		map.put("start", start);
		map.put("end", end);
		int totalpage=dao.studentListTotalPage();
		
		//1-2. 학생리스트 출력 
		List<StudentVO> studentlist=dao.studentListData(map);
		
		//1-3. model로 JSP에서 출력할 데이터 전송
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("studentlist", studentlist);
		model.addAttribute("main_jsp", "../main/list.jsp");
		return "main/main";
	}
	
	//2. 특정 학생의 면담 정보 출력
	@GetMapping("detail.do")
	public String interviewDetail(int no, String name, Model model) {
		//1. 면담정보 데이터
//		InterviewVO ivo=dao.ParentIntervewData(name);
		List<InterviewVO> iList=dao.ParentIntervewData(name);
		model.addAttribute("iList", iList);
		model.addAttribute("no", no);
		model.addAttribute("name", name);
		model.addAttribute("main_jsp", "../main/detail.jsp" );
		return "main/main";
	}
	
}