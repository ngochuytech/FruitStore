package utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtil {
	 @SuppressWarnings({ "deprecation", "unchecked" })
		public static <T> T toModel(Class<T> tClass, HttpServletRequest request) {
	        T object = null;
	        try {
	            object = tClass.getConstructor().newInstance();
	            BeanUtils.populate(object, request.getParameterMap());
	        } catch (InstantiationException | IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
	            e.printStackTrace();
	        }
	        return object;
	    }
}
