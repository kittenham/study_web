package xyz.itwill05.lombok;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

//Ŭ���� �ۼ��� �ʿ��� �޼ҵ带 �ڵ����� �������ִ� Lombok ���̺귯���� ����ϴ� ���
//1.Lombok ���̺귯���� ������Ʈ ���� ó�� - ���̺� ��� : pom.xml
//2.��Ŭ����(IDE)�� �����ϰ� �ܼ�(���� ������Ʈ - cmd)�� ������ �������� ������ �� Lombok ���̺귯����
//����� ���� �����(Local Repository - ����� ������ .m2 ����)�� ���̺귯�� ������ �̵�
//3.�ֿܼ��� Jar ���α׷� �����Ͽ� Lombok ���̺귯���� ��Ŭ������ ����� �� �ֵ��� ����
// => Jar ���α׷� ���� ��� : java -jar lombok-1.18.28.jar
// => Ž���⿡�� ���� ������� ���̺귯�� ������ �̵��Ͽ� Jar ������ ����Ŭ���Ͽ� ���� ����
//4.Jar ���α׷��� �����Ͽ� ������ ��ġâ(Installer)���� Lombok ���̺귯���� ����� ��Ŭ������ �����Ͽ� Lombok ��ġ 
// => ��Ŭ������ �ڵ����� ã�� �� ���� ��� ��Ŭ������ ��ġ�� ������ �����Ͽ� Lombok ��ġ
//5.��Ŭ������ �����Ͽ� Ŭ������ �ۼ��� �� Lombok ���̺귯���� �����ϴ� ������̼� ����Ͽ� Ȯ��
// => @Setter, @Getter, @ToString, @Date, @AllArgsConstructor, @RequiredArgsConstructor ��
// => ��Ŭ������ ������� �ʴ� ��� ��Ŭ���� ��ġ ������ �̵��Ͽ� eclipse.ini ���� ���� 
// => eclipse.ini ���Ͽ��� javaagent �Ӽ��� lombok ��θ� �����ο��� ����η� ���� -javaagent:lmbok.jar    

//@NoArgsConstructor : �Ű������� ���� �����ڸ� �ڵ� �����Ͽ� �����ϴ� ������̼�
//@AllArgsConstructor : �Ű������� �ִ� �����ڸ� �ڵ� �����Ͽ� �����ϴ� ������̼�
// => ��� �ʵ忡 �ʱⰪ�� ������ �� �ִ� �Ű������� �ִ� ������ ���� 
//@RequiredArgsConstructor : �Ű������� �ִ� �����ڸ� �ڵ� �����Ͽ� �����ϴ� ������̼�
// => final �����ڸ� ����Ͽ� ����� �ʵ忡 �ʱⰪ�� ������ �� �ִ� �Ű������� �ִ� ������ ���� 
// => @NoArgsConstructor ������̼ǰ� ���� ��� �Ұ���
//@Setter : Ŭ������ ����� ��� �ʵ忡 ���� Setter �޼ҵ带 �ڵ� �����Ͽ� �����ϴ� ������̼�
// => �ʵ忡 @Setter ������̼��� ����ϸ� �ش� �ʵ忡 ���� Setter �޼ҵ常�� �ڵ� �����Ͽ� ����
//@Getter : Ŭ������ ����� ��� �ʵ忡 ���� Getter �޼ҵ带 �ڵ� �����Ͽ� �����ϴ� ������̼�
//=> �ʵ忡 @Getter ������̼��� ����ϸ� �ش� �ʵ忡 ���� Getter �޼ҵ常�� �ڵ� �����Ͽ� ����
//@ToString : Ŭ������ toString() �޼ҵ带 �ڵ� �����Ͽ� �����ϴ� ������̼�
// => Ŭ������ ����� ��� �ʵ尪�� ���ڿ��� ��ȯ�ϴ� ��� ����
//@Data : �⺻ ������, Setter �޼ҵ�, Getter() �޼ҵ�, toString() �޼ҵ�, equals() �޼ҵ�
//, hashCode() �޼ҵ带 �ڵ� �����Ͽ� �����ϴ� ������̼�
//@Builder : Ŭ������ Builder Ŭ������ �ڵ� �����Ͽ� �����ϴ� ������̼�
// => Builder Ŭ���� : ��ü ������ ��ü �ʵ忡 �ʿ��� ���� �����ϱ� ���� �޼ҵ带 �����ϴ� Ŭ���� 
// => ������ ���� ������ ������ �ʵ��� ������ ������� �ʱ�ȭ �۾� ����
// => �Ű������� ����� �����ڿ� @Builder ������̼��� ����ϸ� ������ �Ű������� �ʱ�ȭ ó���ϱ�
//���� �ʵ忡�� ���� ������ �� �ִ� �޼ҵ� ����
//@Slf4j : �α� �̺�Ʈ�� �߻��ϴ� Logger ��ü�� ����� �ʵ�(log)�� �ڵ� �����Ͽ� �����ϴ� ������̼�  

@AllArgsConstructor
@Builder
@Data
public class Member {
	private String id;
	private String name;
	private String email;
}







