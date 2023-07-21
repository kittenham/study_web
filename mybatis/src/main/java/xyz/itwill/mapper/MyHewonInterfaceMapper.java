package xyz.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import xyz.itwill.dto.MyHewon;

//mybatis 프레임워크는 인터페이스 매퍼 파일만 사용하여 매퍼 등록 가능하다.
//=> 인터페이스의 추상메소드에 매퍼 어노테이션을 사용하여 SQL 명령 등록
public interface MyHewonInterfaceMapper {
	//추상메소드에 등록된 SELECT 명령은 기본적으로 검색행을 자동 매핑하여 객체로 제공
	//=> 자동 매핑 기능을 사용하여 검색행을 객체로 생성하기 위해 검색행의 컬럼명과 객체를 생성할
	//	 클래스의 필드명을 동일하게 작성해야한다.
	//=> 검색행의 컬럼명과 클래스의 필드명이 하나도 같지 않은 경우 객체 대신 NULL을 제공한다.
	//@Results : 검색행을 객체로 생성하여 제공하기 위한 매핑 정보를 제공하는 어노테이션 
	@Results(value = {
			//
			@Result(column = "hewon_id", property = "id" )
	})
	@Select(value="select * from myhewon order by hewon_id")
	List<MyHewon> selectHewonList();
	
	@Select(value = "select  from myhewon where hewon_name=#{name} order by hewon_id")
	
}
