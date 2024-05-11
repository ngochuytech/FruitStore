package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.RoleModel;
import Model.UserModel;
import mapper.RowMapper;

public class UserMapper implements RowMapper<UserModel>{

	@Override
	public UserModel mapRow(ResultSet rs) {
		try {
			UserModel userModel = new UserModel();
			userModel.setUserId(rs.getInt("IDuser"));
			userModel.setuName(rs.getString("userName"));
			userModel.setSdt(rs.getString("Number"));
			userModel.setAddress(rs.getString("Address"));
			userModel.setEmail(rs.getString("Email"));
			RoleModel roleModel = new RoleMapper().mapRow(rs);
			userModel.setRolemodel(roleModel);
			return userModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
