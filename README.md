# Language & Tool
- Language: Java
- DB: Oracle
- Tool: vuerd, Sql Developer, STS(3.4.14)

# [1] DB설계

![DB설계](https://user-images.githubusercontent.com/86100634/150008994-2c782898-e465-4550-aa8b-762faf0c9c2f.jpg)
1. 학생관리, 학부모 면담 데이터 관리가 용이하도록 학생정보테이블, 학부모면담정보테이블로 나누었음
  - 추후 학년, 반, 학생이름, 가족관계(부, 모, 기타)별 면담내용을 조회할 수 있도록 컬럼을 구성하였음
  - 학생정보테이블에서는 학생번호를 식별자 삼아 해당 학생의 학생정보를 관리하고 
    학부모면담정보테이블에서는 학생번호를 외래키로 활용하여 해당 학생의 학부모 면담정보를 관리하도록 함
    ** 외래키 설정 시 학생정보테이블에서 학생번호 삭제 시 학부모 면담 정보도 함께 삭제될 수 있도록 
       delete cascade 적용하였음
2. 학부모면담정보테이블에서 한 학생당 '부', '모' 등 여러 가족의 상담내역이 있을 수 있으므로 면담번호를 PK로 설정하였음

# [2] 구현
1. 학생 리스트 페이지 -> 학생이름 클릭 -> 해당 학생의 학부모면담 내용 페이지로 이동
- DB 정보를 확인 및 출력할 수 있는 화면만 있도록 간단하게 구현하였음
# [3] SQL문
1. CUD SQL문의 경우 하기 상황에서 기능하도록 상상하여 [프로젝트 파일(com.sist.mapper>StudentMapper) 및 sql 파일](https://github.com/gyurami/22-01-ParentsInterviewInfo/tree/main/%5B3%5D%20SQL)에서 확인 가능 
- 학생 리스트 페이지에서 '학생 정보' 추가, 수정, 삭제하는 상황을 가정하여 작성하였음
- 개별 학생의 학부모면담 페이지에서 '학부모면담 내용' 추가, 수정, 삭제 하는 상황을 가정하여 작성하였음
