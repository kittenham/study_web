package xyz.itwill05.di;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class CollectionBean {
	private Set<String> nameSet;
	private List<String> nameList;
	//콜렉션 객체의 제네릭을 인터페이스로 설정하면 콜렉션 객체의 요소에는 
	//인터페이스를 상속하는 자식클래스로 생성된 객체를 요소로 추가할 수 있다.
	//문자열을 저장하는 것이 아니라 controller라는 객체(자세히는 인터페이스를 상속받은 자식클래스의 객체)를 필드에 선언하는것
	private Set<Controller> controllerSet;
	private Set<Controller> controllerList;
	private Map<String, Controller> controllerMap;
	private Properties controllerProperties;
	
	public Map<String, Controller> getControllerMap() {
		return controllerMap;
	}
	public void setControllerMap(Map<String, Controller> controllerMap) {
		this.controllerMap = controllerMap;
	}
	public Properties getControllerProperties() {
		return controllerProperties;
	}
	public void setControllerProperties(Properties controllerProperties) {
		this.controllerProperties = controllerProperties;
	}
	public CollectionBean() {
		// TODO Auto-generated constructor stub
	}
	public Set<String> getNameSet() {
		return nameSet;
	}
	public void setNameSet(Set<String> nameSet) {
		this.nameSet = nameSet;
	}
	public List<String> getNameList() {
		return nameList;
	}
	public void setNameList(List<String> nameList) {
		this.nameList = nameList;
	}
	public Set<Controller> getControllerSet() {
		return controllerSet;
	}
	public void setControllerSet(Set<Controller> controllerSet) {
		this.controllerSet = controllerSet;
	}
	public Set<Controller> getControllerList() {
		return controllerList;
	}
	public void setControllerList(Set<Controller> controllerList) {
		this.controllerList = controllerList;
	}
	
	
}
