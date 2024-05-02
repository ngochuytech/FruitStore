package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.RoleModel;
import mapper.RowMapper;

public class RoleMapper implements RowMapper<RoleModel>{

	@Override
	public RoleModel mapRow(ResultSet rs) {
		try {
			RoleModel roleModel = new RoleModel();
			roleModel.setRoleId(rs.getInt("roleId"));
			roleModel.setRoleName(rs.getString("roleName"));
			return roleModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
