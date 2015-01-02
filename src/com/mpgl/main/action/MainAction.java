package com.mpgl.main.action;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import com.mpgl.base.BaseAction;
import com.mpgl.main.service.MainService;
import com.mpgl.main.service.StudentService;
import com.mpgl.main.service.TeacherService;
import com.mpgl.poi.ExcelUtil;
import com.mpgl.util.CommonUtil;
import com.mpgl.util.Constant;
import com.mpgl.util.Constant.RESOURCE_TYPE;
import com.mpgl.vo.MenuVo;
import com.mpgl.vo.OrgVo;
import com.mpgl.vo.RoleVo;
import com.mpgl.vo.StudentVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

/**
 * 核心Action
 * 
 * @author 廖陈特
 * 
 */
@SuppressWarnings({ "serial" })
public class MainAction extends BaseAction {

	/**
	 * 核心Service
	 */
	private MainService mainService;

	/**
	 * 教师SERVICE
	 */
	private TeacherService teacherService;

	/**
	 * 学生Service;
	 */
	private StudentService studentService;

	/**
	 * 返回错误信息
	 */
	private String error;

	// 用户管理相关属性
	/**
	 * UserVo
	 */
	private UserVo user;

	/**
	 * 单个用户数据
	 */
	private Map<String, Object> userMap;

	/**
	 * DataGrid用户数据
	 */
	private Map<String, Object> userGrid;

	// 角色管理相关属性
	/**
	 * 单个角色信息
	 */
	private RoleVo role;

	/**
	 * 角色信息
	 */
	private Map<String, Object> roleMap;

	/**
	 * 角色DataGrid数据
	 */
	private Map<String, Object> roleGrid;

	/**
	 * 
	 */
	private Map<String, Object> gridMap;

	// 系统管理相关属性
	/**
	 * 字典表数据
	 */
	private List<Map<String, Object>> dictionaryList;

	/**
	 * 下拉列表数据
	 */
	private List<Map<String, Object>> comboboxs;

	/**
	 * Combobox角色列表数据
	 */
	private List<Map<String, Object>> roleCombobox;

	/* 文件上传用到的相关属性 */

	private File excel;

	private String excelFileName;

	private String excelContentType;

	/* 导出文件相关属性 */
	/**
	 * 返回的文件输入流
	 */
	private InputStream ins;

	/**
	 * 文件名
	 */
	private String fileName;

	/**
	 * 状态码
	 */
	private String code = Constant.CODE_EOF;

	private TeacherVo teacherVo;

	private StudentVo studentVo;
	
	private OrgVo orgVo;

	// 公共页面跳转和操作相关
	/**
	 * 跳转到欢迎界面
	 * 
	 * @return
	 */
	public String goWelcome() {
		return SUCCESS;
	}

	/*-----------登录相关--------------*/
	/**
	 * 跳转到登录界面
	 * 
	 * @return
	 */
	public String goLogin() {
		session.remove(Constant.LOGIN);
		return SUCCESS;
	}

	/**
	 * 登出
	 * 
	 * @return
	 */
	public String goLoginOut() {
		session.remove(Constant.LOGIN);
		session.remove(Constant.USER);
		return SUCCESS;
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public String login() {
		// TODO 增加判断教师、学生、管理员登录
		user = mainService.login(form);
		if (user == null) {
			error = "ERROR.LOGIN";
			return INPUT;
		}
		session.put(Constant.USER, user);
		RoleVo role = mainService.getRoleByUser(user);
		List<MenuVo> menus = mainService.getMenuByRole(role);
		role.setMenuList(menus);
		user.setRoleVo(role);
		if (Constant.ROLE.ADMIN.equals(form.getRole_id())) {
			return SUCCESS;
		} else if (Constant.ROLE.TEACHER.equals(form.getRole_id())) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("code", user.getUsername());
			TeacherVo teacher = teacherService.queryTeacher(param);
			user.setTeacher(teacher);
			return TEACHER;
		} else if (Constant.ROLE.STUDENT.equals(form.getRole_id())) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("code", user.getUsername());
			StudentVo student = studentService.queryStudent(param);
			user.setStudent(student);
			return STUDENT;
		} else {
			return INPUT;
		}
	}

	/*-----------系统管理相关--------------*/
	/**
	 * 跳转用户管理界面
	 * 
	 * @return
	 */
	public String goUserManager() {
		return SUCCESS;
	}

	/**
	 * 新增用户数据
	 * 
	 * @return
	 */
	public String doAddUser() {
		if (mainService.checkUserName(user)) {
			user.setCreate_time(Constant.DEFAULT_DATE_FORMAT.format(new Date()));
			mainService.addUser(user);
			code = Constant.CODE_WIN;
		} else {
			code = "用户帐号已存在";
		}
		return SUCCESS;
	}

	/**
	 * 更新用户数据
	 * 
	 * @return
	 */
	public String doUpdateUser() {
		user.setUpdate_time(Constant.DEFAULT_DATE_FORMAT.format(new Date()));
		mainService.updateUser(user);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除用户数据
	 * 
	 * @return
	 */
	public String doDeleteUser() {
		mainService.deleteUser(user);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 查询单个用户信息[JSON]
	 * 
	 * @return
	 */
	public String queryUserByJson() {
		userMap = mainService.queryUser(this.form);
		return SUCCESS;
	}

	/**
	 * 查询用户列表[JSON]
	 * 
	 * @return
	 */
	public String queryUserDataGridByJson() {
		userGrid = mainService.queryUserDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询角色列表[JSON]
	 * 
	 * @return
	 */
	public String queryRoleListByJson() {
		roleCombobox = mainService.queryRoleList();
		return SUCCESS;
	}

	/**
	 * 跳转角色管理界面
	 * 
	 * @return
	 */
	public String goRoleManager() {
		return SUCCESS;
	}

	/**
	 * 查询角色列表
	 * 
	 * @return
	 */
	public String queryRoleDataGridByJson() {
		roleGrid = mainService.queryRoleDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询单个角色信息
	 * 
	 * @return
	 */
	public String queryRoleByJson() {
		roleMap = mainService.queryRole(this.form);
		return SUCCESS;
	}

	/**
	 * 新增角色数据
	 * 
	 * @return
	 */
	public String doAddRole() {
		mainService.addRole(role);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 更新角色数据
	 * 
	 * @return
	 */
	public String doUpdateRole() {
		mainService.updateRole(role);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除角色数据
	 * 
	 * @return
	 */
	public String doDeleteRole() {
		mainService.deleteRole(role);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 查询字典表数据[JSON]
	 * 
	 * @return
	 */
	public String queryDictionaryByJson() {
		dictionaryList = mainService.queryDictionaryByKey(form);
		return SUCCESS;
	}

	/**
	 * 查询SELECT控件数据
	 * 
	 * @return
	 */
	public String querySelectByJson() {
		comboboxs = mainService.queryCombobx(form);
		return SUCCESS;
	}

	/**
	 * 查询用户密码
	 * 
	 * @return
	 */
	public String doQueryPwd() {
		user = (UserVo) session.get(Constant.USER);
		return SUCCESS;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String doUpdatePassword() {
		try {
			UserVo user = (UserVo) session.get(Constant.USER);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("password", this.getForm().getPassword());
			mainService.updateUserPassword(map);
			user.setPassword(this.getForm().getPassword());
			code = Constant.CODE_WIN;
		} catch (Exception e) {
			log.error("修改密码错误:", e);
			code = Constant.CODE_EOF;
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 上传文件
	 * 
	 * @return
	 */
	public String uploadFile() {
		try {
			if (excel != null) {
				String savePath = Constant.PROJECT_ROOT;
				String file_path = "";
				if (RESOURCE_TYPE.IMG.equals(form.getFileType())) {
					savePath += Constant.TP_PATH;
					file_path += Constant.TP_PATH;
				} else if (RESOURCE_TYPE.TEXT.equals(form.getFileType())) {
					savePath += Constant.WB_PATH;
					file_path += Constant.WB_PATH;
				} else if (RESOURCE_TYPE.VEDIO.equals(form.getFileType())) {
					savePath += Constant.SP_PATH;
					file_path += Constant.SP_PATH;
				} else if (RESOURCE_TYPE.WARE.equals(form.getFileType())) {
					savePath += Constant.KJ_PATH;
					file_path += Constant.KJ_PATH;
				}
				String extention = CommonUtil.getFileExtension(excelFileName);
				String uuid = CommonUtil.getUUID().replaceAll("-", "");
				// 新文件名
				String newFileName = uuid + "." + extention;
				file_path += newFileName;
				File file = new File(savePath, newFileName);
				FileUtils.copyFile(excel, file);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("file_name", CommonUtil.getFileName(excelFileName));
				map.put("id", uuid);
				map.put("file_path", file_path);
				map.put("resouce_type", form.getFileType());
				map.put("teacher_id", this.getCurrentUser().getTeacher()
						.getId());
				map.put("course_id", form.getCourse_id());
				map.put("create_date", CommonUtil.systemDate());
				map.put("extension", CommonUtil.getFileExtension(excelFileName));
				mainService.saveFile(map);
				code = Constant.CODE_WIN;
			}
		} catch (Exception e) {
			log.error("上传文件:", e);
			code = Constant.CODE_EOF;
		}
		return SUCCESS;
	}

	public String goTeacherManager() {
		return SUCCESS;
	}

	/**
	 * 查询教师信息
	 * 
	 * @return
	 */
	public String queryTeacherDataGridByJson() {
		gridMap = mainService.queryTeacherDataGrid(this.getForm());
		return SUCCESS;
	}

	public String doAddTeacherCode() {
		mainService.addTeacherCode(teacherVo);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	public String doDeleteTeacherCode() {
		mainService.deleteTeacherCode(teacherVo);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}
	
	public String goStudentManager() {
		return SUCCESS;
	}
	
	public String queryStudentDataGridByJson() {
		gridMap = mainService.queryStudentDataGrid(this.getForm());
		return SUCCESS;
	}
	
	public String doAddStudentCode() {
		mainService.addStudentCode(studentVo);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}
	
	public String doDeleteStudentCode() {
		mainService.deleteStudentCode(studentVo);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}
	
	public String goOrgManager() {
		return SUCCESS;
	}
	
	public String queryOrgDataGridByJson() {
		gridMap = mainService.queryOrgDataGrid(this.getForm());
		return SUCCESS;
	}
	
	public String doAddOrg() {
		mainService.addOrg(orgVo);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}
	public String doUpdateOrg() {
		mainService.updateOrg(orgVo);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}
	public String doDeleteOrg() {
		mainService.deleteOrg(orgVo);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}
	
	public MainService getMainService() {
		return mainService;
	}

	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	public UserVo getUser() {
		return user;
	}

	public void setUser(UserVo user) {
		this.user = user;
	}

	public File getExcel() {
		return excel;
	}

	public void setExcel(File excel) {
		this.excel = excel;
	}

	public String getExcelFileName() {
		return excelFileName;
	}

	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}

	public String getExcelContentType() {
		return excelContentType;
	}

	public void setExcelContentType(String excelContentType) {
		this.excelContentType = excelContentType;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Map<String, Object> getUserGrid() {
		return userGrid;
	}

	public void setUserGrid(Map<String, Object> userGrid) {
		this.userGrid = userGrid;
	}

	public List<Map<String, Object>> getRoleCombobox() {
		return roleCombobox;
	}

	public void setRoleCombobox(List<Map<String, Object>> roleCombobox) {
		this.roleCombobox = roleCombobox;
	}

	public Map<String, Object> getUserMap() {
		return userMap;
	}

	public void setUserMap(Map<String, Object> userMap) {
		this.userMap = userMap;
	}

	public List<Map<String, Object>> getDictionaryList() {
		return dictionaryList;
	}

	public void setDictionaryList(List<Map<String, Object>> dictionaryList) {
		this.dictionaryList = dictionaryList;
	}

	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		MainAction.log = log;
	}

	public InputStream getIns() {
		return ins;
	}

	public void setIns(InputStream ins) {
		this.ins = ins;
	}

	public String getFileName() {
		try {
			fileName = new String(fileName.getBytes(), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			log.error("导出文件名转码错误", e);
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public RoleVo getRole() {
		return role;
	}

	public void setRole(RoleVo role) {
		this.role = role;
	}

	public Map<String, Object> getRoleMap() {
		return roleMap;
	}

	public void setRoleMap(Map<String, Object> roleMap) {
		this.roleMap = roleMap;
	}

	public Map<String, Object> getRoleGrid() {
		return roleGrid;
	}

	public void setRoleGrid(Map<String, Object> roleGrid) {
		this.roleGrid = roleGrid;
	}

	public List<Map<String, Object>> getComboboxs() {
		return comboboxs;
	}

	public void setComboboxs(List<Map<String, Object>> comboboxs) {
		this.comboboxs = comboboxs;
	}

	public TeacherService getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Map<String, Object> getGridMap() {
		return gridMap;
	}

	public void setGridMap(Map<String, Object> gridMap) {
		this.gridMap = gridMap;
	}

	public TeacherVo getTeacherVo() {
		return teacherVo;
	}

	public void setTeacherVo(TeacherVo teacherVo) {
		this.teacherVo = teacherVo;
	}

	public StudentVo getStudentVo() {
		return studentVo;
	}

	public void setStudentVo(StudentVo studentVo) {
		this.studentVo = studentVo;
	}

	public OrgVo getOrgVo() {
		return orgVo;
	}

	public void setOrgVo(OrgVo orgVo) {
		this.orgVo = orgVo;
	}
}
