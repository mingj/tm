package com.mpgl.main.dao;

import java.util.List;
import java.util.Map;

import com.mpgl.vo.Form;
import com.mpgl.vo.MenuVo;
import com.mpgl.vo.OrgVo;
import com.mpgl.vo.RoleVo;
import com.mpgl.vo.StudentVo;
import com.mpgl.vo.SubMenuVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

/**
 * 核心DAO接口
 * 
 * @author 廖陈特
 * 
 */
public interface MainDao {

	/**
	 * 用户登录-查询信息
	 * 
	 * @param form
	 * @return
	 */
	List<UserVo> login(Form form);

	/**
	 * 校验用户账户是否存在
	 * 
	 * @param vo
	 * @return
	 */
	int checkUserName(UserVo vo);

	/**
	 * 修改用户密码
	 * 
	 * @param map
	 */
	void updateUserPassword(Map<String, Object> map);

	/**
	 * 查询用户的角色列表
	 * 
	 * @param user
	 * @return
	 */
	List<RoleVo> queryRoleByUser(UserVo user);

	/**
	 * 查询角色拥有的菜单列表
	 * 
	 * @param role
	 * @return
	 */
	List<MenuVo> queryMenuByRole(RoleVo role);

	/**
	 * 查询菜单的子菜单列表
	 * 
	 * @param map
	 * @return
	 */
	List<SubMenuVo> querySubMenuByMenu(Map<String, Object> map);

	/**
	 * 查询字典表数据
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryDictionaryByKey(Form form);

	/**
	 * 查询用户列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryUserList(Form form);

	/**
	 * 查询不分页数据
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryUserListBySingle(Form form);

	/**
	 * 查询用户列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryUserListCount(Form form);

	/**
	 * 查询角色列表
	 * 
	 * @return
	 */
	List<Map<String, Object>> queryRoleList();

	/**
	 * 新增用户
	 * 
	 * @param vo
	 */
	void addUser(UserVo vo);

	/**
	 * 修改用户
	 * 
	 * @param vo
	 */
	void updateUser(UserVo vo);

	/**
	 * 删除用户
	 * 
	 * @param vo
	 */
	void deleteUser(UserVo vo);

	/**
	 * 查询角色列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryRoleLists(Form form);

	/**
	 * 查询角色列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryRoleListCount(Form form);

	/**
	 * 查询单个角色
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryRoleListBySingle(Form form);

	int addRole(RoleVo vo);

	void updateRole(RoleVo vo);

	void deleteRole(RoleVo vo);

	void addRoleRefPage(RoleVo vo);

	void deleteRoleRefPage(RoleVo vo);

	/**
	 * 查询页面列表
	 * 
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> queryPageList();

	/**
	 * 查询页面与角色关联列表
	 * 
	 * @param map
	 * @return
	 */
	List<Integer> queryRoleRefPage(Form form);

	/**
	 * 查询下拉框数据
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryCombobx(Form form);

	/**
	 * 保存文件上传信息
	 * 
	 * @param map
	 */
	public void saveFile(Map<String, Object> map);

	List<Map<String, Object>> queryTeacherList(Form form);

	int queryTeacherListCount(Form form);

	void addTeacherCode(TeacherVo vo);

	void deleteTeacherCode(TeacherVo vo);

	List<Map<String, Object>> queryStudentList(Form form);

	int queryStudentListCount(Form form);

	void addStudentCode(StudentVo vo);

	void deleteStudentCode(StudentVo vo);

	List<Map<String, Object>> queryOrgList(Form form);

	int queryOrgListCount(Form form);

	void addOrg(OrgVo vo);

	void updateOrg(OrgVo vo);

	void deleteOrg(OrgVo vo);

}