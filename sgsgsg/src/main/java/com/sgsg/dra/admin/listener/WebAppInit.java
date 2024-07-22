package com.sgsg.dra.admin.listener;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class WebAppInit implements ServletContextListener{
	//프로퍼티로 처리
	private String pathname = "/WEB-INF/userCount.properties";
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 서버가 시작되는 시점에 호출
		
		/*
		  - DefaultServlet
		    : 정적인 리소스(*.css, *.js 등)를 처리하며, /로 매핑되어 있다.
		    : 작성하는 서블릿을 / 로 매핑하면 모든 URL 요청이 서블릿으로 처리 되며
		       *.js나 *.css파일에 대한 처리를 하는 핸들러가 없기 때문에 404 에러가 발생한다.
		  - ServletRegistration getServletRegistration(servletName)
		    : 서블릿의 세부정보를 반환
		  - Set<String> addMapping(String... urlPatterns)
		    : 서블릿에 대해 지정된 URL 패턴을 사용하여 서블릿 매핑을 추가
		 */
		// resource 관련 uri는 default 서블릿으로 위임
		String[] uris = new String[]{"/resources/*", "/resources/**", "/uploads/*", "*.css", "*.js"};
		sce.getServletContext().getServletRegistration("default").addMapping(uris);
		
		//접속자수 불러오기
		pathname = sce.getServletContext().getRealPath(pathname);
		loadCount();
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// 서버가 종료되기 직전에 호출
		saveCount();
	}
	
	protected void loadCount() {
		//저장된 접속자수를 불러옴
		long toDay, yesterDay, total;
		
		Properties p = new Properties();
		FileInputStream fis = null;
		
		try {
			//파일객체로 저장된 프로퍼티의 값들을 갖고옴
			//프로퍼티는 문자열의 값들만 저장해라
			File f = new File(pathname);
			
			//없으면 리턴해라(처음엔 없음)
			if(! f.exists()) {
				return;
			}
			
			fis = new FileInputStream(f);
			p.load(fis);
			
			toDay = Long.parseLong(p.getProperty("toDay"));
			yesterDay = Long.parseLong(p.getProperty("yesterDay"));
			total = Long.parseLong(p.getProperty("total"));
			
			CountManager.init(toDay, yesterDay, total);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (Exception e2) {
				}
			}
		}
	}
	
	//접속자수를 파일의 형태로 저장함
	protected void saveCount() {
		long toDay, yesterDay, total;
		Properties p = new Properties();
		
		try(FileOutputStream fos = new FileOutputStream(pathname)) {
			toDay = CountManager.getToDayCount();
			yesterDay = CountManager.getYesterDayCount();
			total = CountManager.getTotalCount();
			
			p.setProperty("toDay", String.valueOf(toDay));
			p.setProperty("yesterDay", String.valueOf(yesterDay));
			p.setProperty("total", String.valueOf(total));
			
			p.store(fos, "count");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}