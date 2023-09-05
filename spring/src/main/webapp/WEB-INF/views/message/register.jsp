<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/mvc"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:beans="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:task="http://www.springframework.org/schema/task"
	xsi:schemaLocation="http://www.springframework.org/schema/mvc https://www.springframework.org/schema/mvc/spring-mvc.xsd
		http://www.springframework.org/schema/task http://www.springframework.org/schema/task/spring-task.xsd
		http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd
		http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
		http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">

	<!-- DispatcherServlet Context: defines this servlet's request-processing infrastructure -->
	<!-- servlet-context.xml : appServlet 이름의 서블릿(Front Controller)에게 제공될 Spring
	Bean을 등록하기 위한 Spring Bean Configuration File -->
	
	<!-- Enables the Spring MVC @Controller programming model -->
	<!-- annotation-driven : @Controller 어노테이션으로 등록된 Spring Bean에서 @RequestMapping
	어노테이션으로 등록된 요청 처리 메소드를 클라이언트 요청에 의해 자동으로 호출되어 실행될 
	수 있도록 설정하는 엘리먼트  -->
	<!-- => HanlderMapping 객체를 사용하지 않아 클라이언트 요청에 의해 Controller 클래스의
	요청 처리 메소드가 호출되도록 매핑 설정 -->
	<annotation-driven />

	<!-- Handles HTTP GET requests for /resources/** by efficiently serving up static resources in the ${webappRoot}/resources directory -->
	<!-- resources : 클라이언트 요청을 Front Controller가 직접 응답 처리되도록 설정하는 엘리먼트 -->
	<!-- => 클라이언트가 리소스 파일 요청에 대한 응답처리를 위해 사용되는 엘리먼트 -->
	<!-- mapping 속성 : 클라이언트에 의해 요청되는 리소스 파일의 요청 URL 주소의 패턴을 속성값으로 설정 -->
	<!-- => [**] 패턴문자를 속성값으로 사용한 경우 현재 폴더 및 하위 폴더의 리소스 파일 요청 가능 -->
	<!-- location 속성 : 클라이언트 요청에 의해 리소스 파일을 검색하기 위한 폴더를 속성값으로 설정 -->
	<!-- <resources mapping="/resources/**" location="/resources/" /> -->
	<resources mapping="/images/**" location="/resources/images/" />
	<resources mapping="/css/**" location="/resources/css/" />
	<resources mapping="/js/**" location="/resources/js/" />

	<!-- Resolves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory -->
	<!-- InternalResourceViewResolver 클래스를 Spring Bean으로 등록 -->
	<!-- InternalResourceViewResolver 객체 : 클라이언트 요청에 의해 호출되는 요청 처리 메소드의
	반환값(ViewName)을 제공받아 응답 처리할 JSP 문서로 변환하여 반환하는 기능을 제공하는 객체 -->	
	<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<beans:property name="prefix" value="/WEB-INF/views/" />
		<beans:property name="suffix" value=".jsp" />
		<beans:property name="order" value="3"/>
	</beans:bean>
	
	<!-- UrlBasedViewResolver 클래스를 Spring Bean으로 등록 -->
	<!-- UrlBasedViewResolver 객체 : 클라이언트 요청에 의해 호출되는 요청 처리 메소드의 반환값(ViewName)을
	Spring 프레임워크에서 제공하는 ViewResolver 객체가 아닌 외부의 ViewResolver 객체로 응답 처리하기
	위한 기능을 제공하는 객체 -->
	<!-- => 뷰이름으로 응답 처리하기 위한 뷰를 커스터마이징(Customizing) 할 때 사용하는 객체 -->
	<beans:bean class="org.springframework.web.servlet.view.UrlBasedViewResolver">
		<!-- viewClass 필드에 뷰 기능을 제공하기 위한 클래스(TilesView)가 저장되도록 값 주입 -->
		<beans:property name="viewClass" value="org.springframework.web.servlet.view.tiles3.TilesView"/>
		<!-- order 필드에 ViewResolver 객체의 우선순위를 설정하기 위한 정수값 주입 -->
		<!-- => 다수의 ViewResolver 객체가 있는 경우 반드시 우선순위를 설정  -->
		<!-- => 필드에 저장된 정수값이 작을수록 우선순위가 높게 설정 -->
		<beans:property name="order" value="2"/>
	</beans:bean>
	
	<!-- TilesConfigurer 클래스를 Spring Bean으로 등록 -->
	<!-- TilesConfigurer 객체 : TilesView 클래스가 응답 처리하기 위한 정보를 얻기 위한 
	환경설정파일을 제공하기 위한 객체 -->
	<beans:bean class="org.springframework.web.servlet.view.tiles3.TilesConfigurer">
		<!-- definitions 필드에 List 객체를 생성하여 의존성 주입 -->
		<!-- => List 객체의 요소에 TilesView 클래스의 환경설정파일의 경로를 저장하여 제공 -->
		<beans:property name="definitions">
			<beans:list>
				<beans:value>/WEB-INF/spring/appServlet/tiles.xml</beans:value>
			</beans:list>
		</beans:property>
	</beans:bean>

	<!-- BeanNameViewResolver 클래스를 Spring Bean으로 등록 -->
	<!-- BeanNameViewResolver 객체 : 요청 처리 메소드에서 반환되는 문자열(ViewName)과 같은 이름의 
	식별자(beanName)를 가진 객체(Spring Bean)로 실행 메소드를 호출하여 클라이언트에게 응답 처리 -->
	<!-- => JSP 문서를 이용하여 응답 처리하지 않고 메소드의 명령을 실행하여 응답 처리 -->
	<!-- => JSP 문서로 응답 처리하는 ViewResolver 객체보다 반드시 우선순위를 높게 설정 --> 
 	<beans:bean class="org.springframework.web.servlet.view.BeanNameViewResolver">
 		<beans:property name="order" value="1"/>
 	</beans:bean>
 
	<!-- component-scan : 스프링 컨테이너가 클래스에서 사용된 스프링 어노테이션을 검색하여
	처리할 수 있는 패키지를 제공하는 엘리먼트  -->
	<!-- base-package 속성 : 스프링 어노테이션을 사용한 클래스가 선언된 패키지를 속성값으로 설정 -->	
	<!-- <context:component-scan base-package="xyz.itwill.controller" /> -->
	<!-- [xyz.itwill10.controller] 패키지에 요청 처리 클래스(Controller 클래스)를 작성하여 
	@Controller 어노테이션을 사용하여 Spring Bean으로 등록 -->
	<context:component-scan base-package="xyz.itwill10.controller" />
	<!-- [xyz.itwill10.dao] 패키지에 DAO 클래스를 작성하여 @Repository 어노테이션을 사용하여 Spring Bean으로 등록 -->
	<context:component-scan base-package="xyz.itwill10.dao" />
	<!-- [xyz.itwill10.service] 패키지에 Service 클래스를 작성하여 @Service 어노테이션을 사용하여 Spring Bean으로 등록 -->
	<context:component-scan base-package="xyz.itwill10.service" />
	
	<!-- TransactionManager 객체를 사용하여 트렌젝션 처리를 설정하기 위해서는 tx 네임스페이스에
	spring-tx.xsd 파일을 제공받아 엘리먼트를 사용할 수 있도록 설정 -->
	<!-- advice : TransactionManager 객체(Spring Bean)를 Advisor로 설정하기 위한 엘리먼트 -->
	<!-- Advisor : 삽입위치(JoinPoint)가 정해져 있는 횡단관심코드의 메소드가 작성된 Advice
	클래스로 생성된 객체(Spring Bean) -->
	<!-- id 속성 : advice 엘리먼트를 구분하기 위한 식별자를 속성값으로 설정 -->
	<!-- transaction-manager 속성 : TransactionManager 관련 클래스의 Spring Bean에 대한 
	식별자(beanName)을 속성값으로 설정 -->
	<!-- => TransactionManager 객체(Spring Bean)을 이용하여 커밋처리 또는 롤백처리 제공 -->
	<!-- attributes : TransactionManager 객체에 의해 처리될 메소드 목록을 설정하기 위한 엘리먼트 -->
	<!-- method : TransactionManager 객체에 의해 처리될 메소드와 방식을 설정하기 위한 엘리먼트 -->
	<!-- name 속성 : TransactionManager 객체에 의해 처리될 메소드의 이름을 속성값으로 설정 -->
	<!-- => 메소드 이름에 [*] 패턴문자를 사용하여 설정 가능 -->
	<!-- rollback-for 속성 : ROLLBACK 명령이 실행될 예외를 속성값으로 설정 -->
	<!-- read-only 속성 : false(기본) 또는 true(읽기) 중 하나를 속성값으로 설정 -->
	<!-- 
	<tx:advice id="txAdvisor" transaction-manager="transactionManager">
		<tx:attributes>
			<tx:method name="add*" rollback-for="Exception"/>
			<tx:method name="modify*" rollback-for="Exception"/>
			<tx:method name="remove*" rollback-for="Exception"/>
			<tx:method name="get*" read-only="true"/>
		</tx:attributes>
	</tx:advice>
	-->
	
	<!-- SpringAOP 기능을 사용하기 위해서는 aop 네임스페이스에 spring-aop.xsd 파일을 제공받아 
	엘리먼트를 사용할 수 있도록 설정 -->
	<!-- => SpringAOP 기능을 사용하여 타겟메소드 호출시 TransactionManager 객체가 동작될 수 있도록 설정 -->
	<!-- advisor : Advisor(삽입위치가 지장된 Advice 객체)를 제공받아 사용하기 위한 엘리먼트 -->
	<!-- advice-ref 속성 : advice 엘리먼트의 식별자를 속성값으로 설정 -->
	<!--  
	<aop:config>
		<aop:advisor advice-ref="txAdvisor" pointcut="execution(* xyz.itwill10.service..*(..))"/>
	</aop:config>
	-->
	
	<!-- Intercepter 클래스를 Spring Bean으로 등록 -->
	<beans:bean class="xyz.itwill10.util.AdminAuthInterceptor" id="adminAuthInterceptor"/>
	<beans:bean class="xyz.itwill10.util.LoginAuthInterceptor" id="loginAuthInterceptor"/>
	
	<!-- interceptors : interceptor 엘리먼트를 등록하기 위한 엘리먼트 -->
	<interceptors>
		<!-- interceptor : 인터셉터 기능을 제공받기 위한 규칙을 설정하는 엘리먼트 -->
		<interceptor>
			<!-- mapping : 인터셉터가 실행될 페이지의 요청 URL 주소를 설정하는 엘리먼트  -->
			<!-- path 속성 : 요청 처리 메소드가 호출될 페이지의 요청 URL 주소를 속성값으로 설정 -->
			<mapping path="/userinfo/write"/>
			<mapping path="/userinfo/modify"/>
			<mapping path="/userinfo/remove"/>
			<!-- ref : 인터셉터 기능을 제공할 객체(Spring Bean)을 설정하기 위한 엘리먼트 -->
			<!-- bean 속성 : Interceptor 클래스의 Spring Bean의 식별자(beanName)를 속성값으로 설정 -->
			<beans:ref bean="adminAuthInterceptor"/>
		</interceptor>
		
		<interceptor>
			<!--
			<mapping path="/userinfo/list"/>
			<mapping path="/userinfo/view"/>
			<beans:ref bean="loginAuthInterceptor"/>
			--> 
		
			<!-- mapping 엘리먼트의 path 속성값으로 [*] 패턴문자를 사용하여 요청 URL 주소 설정 -->
			<!-- => [*] : 폴더의 모든 페이지를 요청한 경우  -->
			<!-- => [**] : 폴더 및 하위 폴더의 모든 페이지를 요청한 경우  -->
			<!-- <mapping path="/*"/> -->
			<!-- <mapping path="/**"/> -->
			<mapping path="/userinfo/*"/>
			<!-- exclude-mapping : 인터셉터가 실행되지 않는 페이지의 요청 URL 주소를 설정하는 엘리먼트 -->
			<exclude-mapping path="/userinfo/login"/>
			<beans:ref bean="loginAuthInterceptor"/>
		</interceptor>
	</interceptors>
	
	<!-- [multipart/form-data] 처리 기능을 제공하는 클래스를 Spring Bean으로 등록  -->
	<!-- => Spring Bean의 식별자(beanName)를 반드시 [multipartResolver]로 설정 -->
	<beans:bean class="org.springframework.web.multipart.commons.CommonsMultipartResolver" id="multipartResolver">
		<!-- maxUploadSize 필드에 최대 업로드 처리 가능한 파일의 제한 용량(Byte)이 저장되도록 값 주입 -->
		<beans:property name="maxUploadSize" value="20971520"/>
		<!-- defaultEncoding 필드에 전달값에 문자형태(캐릭터셋)가 저장되도록 값 주입 -->
		<beans:property name="defaultEncoding" value="utf-8"/>
	</beans:bean>	
	
	<!-- 메세지 처리 기능을 제공하는 클래스를 Spring Bean으로 등록 -->
	<!-- => Spring Bean의 식별자(beanName)를 반드시 [messageSource]로 설정 -->
	<beans:bean class="org.springframework.context.support.ReloadableResourceBundleMessageSource" id="messageSource">
		<beans:property name="basenames">
			<beans:list>
				<!-- classpath를 이용하여 설정된 Properties 파일을 변경한 경우 반드시 서버를
				재실행해야 변경된 메세지로 적용  -->
				<beans:value>classpath:message/label</beans:value>
				<!-- classpath를 이용하지 않고 설정된 Properties 파일을 변경한 경우 cacheSeconds
				필드에 저장된 시간이 지나면 변경된 메세지로 적용 -->
				<beans:value>/WEB-INF/message/error</beans:value>
			</beans:list>
		</beans:property>
		<!-- cacheSeconds 필드에 Properties 파일을 읽어 메모리에 로딩되기 위한 시간(초)이 저장되도록 값 주입 -->
		<beans:property name="cacheSeconds" value="60"/>
		<!-- defaultEncoding 필드에 Properties 파일의 문자형태(캐릭터셋)을 저장되도록 값 주입 -->
		<beans:property name="defaultEncoding" value="utf-8"/>
	</beans:bean>	
	
	<!-- 세션에 저장된 사용 언어를 이용하여 메세지 기능을 제공하기 위한 클래스를 Spring Bean으로 등록 -->
	<beans:bean class="org.springframework.web.servlet.i18n.SessionLocaleResolver" id="localeResolver">
		<!-- defaultLocale 필드에 기본적으로 사용될 메세지의 사용 언어를 속성값으로 설정 -->
		<beans:property name="defaultLocale" value="ko"/>
	</beans:bean>
	
	<!-- Scheduling 기능을 제공하기 위한 클래스를 Spring Bean으로 등록 -->
	<beans:bean class="xyz.itwill10.util.Scheduler" id="scheduler"/>
	
	<!-- 스케줄링 기능을 구현하기 위해 Spring Bean Configuration File에 task 네임스페이스를
	추가하여 spring-task.xsd 파일의 엘리먼트를 사용할 수 있도록 설정 -->
	<!-- scheduler : 스케줄링 기능을 제공하기 위한 엘리먼트 -->
	<!-- pool-size 속성 : 스케줄링 기능을 제공하기 위한 스레드의 갯수를 속성값으로 설정 -->
	<!-- <task:scheduler id="baseScheduler" pool-size="10"/> -->
	<!-- scheduled-tasks : 스케줄링 기능으로 실행될 객체를 설정하기 위한 엘리먼트 -->
	<!-- scheduled : 스케줄링 기능을 이용하여 실행하기 위한 정보를 제공하는 엘리먼트 -->
	<!-- ref 속성 : 스케줄링 기능으로 실행된 객체(Spring Bean)의 식별자(beanName)를 속성값으로 설정 -->
	<!-- method 속성 : 객체(Spring Bean)로 자동 호출되는 메소드를 속성값으로 설정 -->
	<!-- cron 속성 : 메소드를 호출하기 위한 날짜 및 시간을 속성값으로 설정 -->
	<!-- => 속성값 : 초 분 시 일 월 요일 - 패턴문자 사용 가능 -->
	<!--  
	<task:scheduled-tasks scheduler="baseScheduler">
		<task:scheduled ref="scheduler" method="autoUpdate" cron="1 * * * * *"/>
	</task:scheduled-tasks>
	-->
	
	<!-- annotation-driven : 스케줄링 관련 어노테이션을 사용하기 위해 설정하는 엘리먼트 -->
	<task:annotation-driven/>
	
	<!-- 파일 다운로드 기능을 제공하는 클래스를 Spring Bean으로 등록 -->
	<!-- => Spring Bean의 식별자(beanName)을 반드시 요청 처리 메소드의 반환값과 같도록 작성 -->
	<beans:bean class="xyz.itwill10.util.FileDownload" id="fileDownload"/>	
</beans:beans>









