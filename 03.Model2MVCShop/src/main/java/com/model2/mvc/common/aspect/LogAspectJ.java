package com.model2.mvc.common.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class LogAspectJ {

	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}
	
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.println("");
		String className = joinPoint.getTarget().getClass().getName();
		int lastPoint = className.lastIndexOf(".")+1;
		className = className.substring(lastPoint);
		//System.out.println("[Around before] Target Object method : "+joinPoint.getTarget().getClass().getName()+"."+joinPoint.getSignature().getName());
		System.out.println("[Around before] "+className+"."+joinPoint.getSignature().getName()+" start");
		
		if(joinPoint.getArgs().length!=0) {
			//System.out.println("[Around before] method argument : "+joinPoint.getArgs()[0]);
			System.out.println("[Around before] "+className+"."+joinPoint.getSignature().getName()+" argument : "+joinPoint.getArgs()[0]);
		}
		
		Object obj = joinPoint.proceed();

		//System.out.println("[Around after] Target Object method 호출 후 return value : "+obj);
		System.out.println("[Around after] "+className+"."+joinPoint.getSignature().getName()+" 결과 : "+obj);
		System.out.println("[Around after] "+className+"."+joinPoint.getSignature().getName()+" end");
		System.out.println("");
		
		return obj;
	}
	
	public Object controllerLog(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.print("\n[Controller Log] ");
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String mappingName = joinPoint.getSignature().getName();
		String method = request.getMethod();
		System.out.println(mappingName+" : "+method+" start\n");
		
		Object obj = joinPoint.proceed();
		
		System.out.print("\n[Controller Log] ");
		
		System.out.println(mappingName+" : "+method+" end\n");

		return obj;
	}

}
