package xyz.itwill05.di;

import java.util.List;

//�л������� ó���ϴ� DAO Ŭ������ �ݵ�� ��ӹ޾ƾ� �Ǵ� �������̽�
//=> ��ü���� ���յ��� ���� ���������� ȿ���� ����
public interface StudentDAO {
	int insertStudnet(Student student);
	int updateStudnet(Student student);
	int deleteStudnet(int num);
	Student selectStudent(int num);
	List<Student> selectStudentList();
}
