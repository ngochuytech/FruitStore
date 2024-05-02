package dao;

import java.util.List;

import Model.RoleModel;

public interface IRoleDAO {
	List<RoleModel> getAll();
	RoleModel findOne(String roleName);
}
