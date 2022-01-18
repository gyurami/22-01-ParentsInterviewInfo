package com.sist.mapper;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface StudentMapper {
	//1. 학생 리스트 출력
	@Select("SELECT no, grade, sclass, name, num "
			+ "FROM (SELECT no,grade,sclass,name, rownum as num "
			+ "FROM (SELECT no,grade,sclass,name "
			+ "FROM studentInfo ORDER BY grade ASC, sclass ASC, name ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StudentVO> studentListData(Map map);
	//1-2. 총페이지 설정
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM studentInfo")
	public int studentListTotalPage();
	

	//1-1. 학생정보 추가
	@Insert("INSERT INTO studentInfo VALUES(st_no_seq.nextval, #{grade}, #{sclass}, #{name})")
	public List<InterviewVO> studentInsertData(StudentVO vo);
	
	//2-2. 특정 학생의 학생정보 수정
	@Update("UPDATE studentInfo SET grade=#{grade}, sclass=#{sclass}, name=#{name} "
			+ "WHERE no=#{no}")
	public void studentUpdateData(int no);
	
	//2-3. 특정 학생의 학생정보 삭제
	@Select("SELECT COUNT(ino) FROM studentInfo s,interviewInfo i "
			+ "WHERE s.no=i.no AND s.no=#{no}")
	public StudentVO studentInterviewDataCount(int no);
	
	@Delete("DELETE FROM studentInfo "
			+ "WHERE no=#{no}")
	public void studentDeleteData(int no);
		
	
	
	
	
	//2. 특정 학생의 학부모면담 내용 출력
	@Select("SELECT grade,sclass,name,ino,relation,interview "
			+ "FROM studentInfo s, interviewInfo i "
			+ "WHERE s.no=i.no AND s.name=#{name}")
//	public InterviewVO ParentIntervewData(String name);
	public List<InterviewVO> ParentIntervewData(String name);
	
	//2-1. 특정 학생의 학부모면담 내용 추가
	@Insert("INSERT INTO interviewInfo VALUES(int_ino_seq.nextval, #{no}, #{relation}, #{interview})")
	public List<InterviewVO> interviewInsertData(InterviewVO vo);
	
	//2-2. 특정 학생의 학부모면담 내용 수정
	@Update("UPDATE interviewInfo SET relation=#{relation}, interview=#{interview} "
			+ "WHERE ino=#{ino}")
	public void interviewUpdateData(int ino);
	
	//2-3. 특정 학생의 학부모면담 내용 삭제
	@Delete("DELETE FROM interviewInfo "
			+ "WHERE ino=#{ino}")
	public void interviewDeleteData(int ino);
	
}
 