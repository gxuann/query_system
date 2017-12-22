package db;

import model.Users;

public class UserManager {
	public int AddUser(Users u) {
		DBAccess dba = new DBAccess();
		int i = dba.ExecuteUpdate(String.format("insert into users values('%s','%s',%s)",u.getUname(),u.getUpass(),u.getRid()));
		dba.Close();
		return i;
	}
}
