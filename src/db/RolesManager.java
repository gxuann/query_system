package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Roles;

public class RolesManager {
	public ArrayList<Roles> getAllRoles() {
		DBAccess dba = new DBAccess();
		ResultSet rs = dba.ExecuteQuery("select * from roles order by rid");
		ArrayList<Roles> temp = new ArrayList<Roles>();
		try {
			while(rs.next()) {
				Roles r = new Roles();
				r.setRid(rs.getInt(1));
				r.setRolename(rs.getString(2));
				temp.add(r);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		dba.Close();
		return temp;
	}
}
