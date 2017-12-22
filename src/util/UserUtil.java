package util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class UserUtil {
	public static String getUserName(HttpServletRequest request) {
		String username  = null;
		Cookie[] c = request.getCookies();
		if(c!= null) {
			for(int  i=0; i<c.length; i++) {
				if(c[i].getName().equals("username")){
					username = c[i].getValue();
				}
			}
		}
		return username;
	}
	public static String getRid(HttpServletRequest request) {
		String rid  = null;
		Cookie[] c = request.getCookies();
		if(c!= null) {
			for(int  i=0; i<c.length; i++) {
				if(c[i].getName().equals("rid")){
					rid = c[i].getValue();
				}
			}
		}
		return rid;
	}
}
