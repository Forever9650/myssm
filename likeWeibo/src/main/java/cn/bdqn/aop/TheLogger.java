package cn.bdqn.aop;

import com.sun.istack.internal.logging.Logger;
import org.aspectj.lang.JoinPoint;

import java.util.Arrays;

public class TheLogger {
	private static final Logger logger = Logger.getLogger(TheLogger.class);

	public void before(JoinPoint jp) {
		logger.info("调用了：" + jp.getTarget() + "方法名称：" + jp.getSignature().getName() + "入参："
				+ Arrays.toString(jp.getArgs()));
	}
	
	public void after(JoinPoint jp,Object result) {
		logger.info("调用了：" + jp.getTarget() + "方法名称：" + jp.getSignature().getName() + "返回："
				+ result);
	}

}
