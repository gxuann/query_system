package util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class UserUtil {
	public static String getuname(HttpServletRequest request) {
		String uname  = null;
		Cookie[] c = request.getCookies();
		if(c!= null) {
			for(int  i=0; i<c.length; i++) {
				if(c[i].getName().equals("uname")){
					uname = c[i].getValue();
				}
			}
		}
		return uname;
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
