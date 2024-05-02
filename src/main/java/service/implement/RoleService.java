package service.implement;

import java.util.List;

import javax.inject.Inject;

import Model.RoleModel;
import dao.IRoleDAO;
import service.IRoleService;

public class RoleService implements IRoleService{
	 @Inject
	 private IRoleDAO iRoleDAO;
	@Override
	public List<RoleModel> getAll() {
		return iRoleDAO.getAll();
	}

	@Override
	public RoleModel findOne(String roleName) {
		return iRoleDAO.findOne(roleName);
	}

}
