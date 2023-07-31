package xyz.itwill07.aop;

import java.util.List;

public interface HewonService {
	//추상 메소드 3개 생성
	void addHewon(Hewon hewon);
	Hewon getHewon(int num);
	List<Hewon> getHewonList();
}
