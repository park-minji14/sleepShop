package com.sgsg.dra.admin.listener;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//HttpSessionListener: 세션이 생성되거나 소멸될 때 발생하는 세션 이벤트 처리
//WebListener 해당 어노테이션이 없으면 이벤트는 실행되지 않음.
@WebListener
public class CountManager implements HttpSessionListener{
	
	private static int currentCount;
	private static long toDayCount;
	private static long yesterDayCount;
	private static long totalCount;
	
	//하루에 한번씩 특정 시간대에 값을 전달하기위해서 생성자 만듬
	//자정이 되면, toDayCount 가 yesterDayCount 로 전환
	public CountManager() {
		//자정이되면 오늘 인원은 어제인원이 되고, 오늘 인원은 0으로.
		//TimerTask 객체 사용
		TimerTask task = new TimerTask() {
			
			@Override
			public void run() {
				yesterDayCount = toDayCount;
				toDayCount = 0;
				
			}
		};
		//Timer 객체 사용
		Timer timer = new Timer();
		//캘린더 객체로 0시 0분 0초 0으로 설정
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		
		timer.schedule(task, cal.getTime(), 1000*60*60*24);
		
	}
	
	public static void init(long toDay, long yesterDay, long total) {
		toDayCount = toDay;
		yesterDayCount = yesterDay;
		totalCount = total;
	}
	
	//두개의 재정의 할 메서드
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		//세션이 생성될 때
		//서버가 켜지는 시점에 정보를 초기화함
		HttpSession session = se.getSession();
		//서블릿 서버에 대한 모든 환경설정을 가지고 있음 -> ServletContext
		ServletContext context = session.getServletContext();
		
		//동기화 블럭(멀티스레드 환경에서 동시에 작업이 이뤄지면 동시성의 문제가 발생)
		//동시성의 문제를 처리하는 방법중에 하나는 동기화 블럭으로 해결 혹은 동기화 메서드로 처리
		synchronized (se) {
			currentCount++;
			toDayCount++;
			totalCount++;
			
			//서버에 보내줘야해서 저장
			context.setAttribute("currentCount", currentCount);
			context.setAttribute("toDayCount", toDayCount);
			context.setAttribute("totalCount", totalCount);
			context.setAttribute("yesterDayCount", yesterDayCount);
		}
	
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		//세션이 소멸될 때
		//서버가 꺼지는 시점에 정보를 저장해야지 현재 접속자수가 중복되어서 늘어남
		
		HttpSession session = se.getSession();
		ServletContext context = session.getServletContext();
		
		synchronized (se) {
			currentCount--;
			//음수로 가는 경우가 있을 수 있어서 if 로 처리
			if(currentCount < 0) {
				currentCount = 0;
			}
			
			context.setAttribute("currentCount", currentCount);
			context.setAttribute("toDayCount", toDayCount);
			context.setAttribute("totalCount", totalCount);
			context.setAttribute("yesterDayCount", yesterDayCount);
		}
		
	}

	//getter로 값을 호출해야해서 생성
	public static long getToDayCount() {
		return toDayCount;
	}
	public static long getYesterDayCount() {
		return yesterDayCount;
	}
	public static long getTotalCount() {
		return totalCount;
	}
	
	
}