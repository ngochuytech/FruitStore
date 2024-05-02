package dao.implement;

import java.util.List;

import Model.RoleModel;
import dao.IRoleDAO;
import mapper.implement.RoleMapper;

public class RoleDAO extends AbstractDAO<RoleModel> implements IRoleDAO{

	@Override
	public List<RoleModel> getAll() {
		String sql = "select * from [Role]";
		List<RoleModel> list = query(sql, new RoleMapper());
		return list;
	}

	@Override
	public RoleModel findOne(String roleName) {
		String sql = "select * from [Role] where roleName = ?";
		List<RoleModel> list =  query(sql, new RoleMapper(), roleName);
		return  list.isEmpty()? null : list.get(0);
	}

}
