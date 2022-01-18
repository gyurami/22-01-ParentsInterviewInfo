package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.StudentMapper;
import com.sist.vo.InterviewVO;
import com.sist.vo.StudentVO;

@Repository
public class StudentDAO {
	@Autowired
	private StudentMapper mapper;
	
	//1. 학생정보 리스트 출력
	public List<StudentVO> studentListData(Map map){
		return mapper.studentListData(map);
	}
	public int studentListTotalPage() {
		return mapper.studentListTotalPage();
	}
	
	//2. 특정 학생의 면담내용 출력
	public List<InterviewVO> ParentIntervewData(String name){
		return mapper.ParentIntervewData(name);
	}
	
}
