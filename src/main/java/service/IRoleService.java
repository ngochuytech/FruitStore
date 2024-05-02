package service;

import java.util.List;

import Model.RoleModel;

public interface IRoleService {
	List<RoleModel> getAll();
	RoleModel findOne(String roleName);
}
