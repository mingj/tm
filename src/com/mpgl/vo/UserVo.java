package com.mpgl.vo;

/**
 * 用户VO
 * @author Administrator
 *
 */
public class UserVo {

	private String id;
	
	private String name;

	private String username;

	private String password;
	
	private String role_id;
	
	private String isLock;
	
	private RoleVo roleVo;
	
	private String create_time;
	
	private String update_time;
	
	/**
	 * 老师信息
	 */
	private TeacherVo teacher;
	
	/**
	 * 学生信息
	 */
	private StudentVo student;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public RoleVo getRoleVo() {
		return roleVo;
	}

	public void setRoleVo(RoleVo roleVo) {
		this.roleVo = roleVo;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getIsLock() {
		return isLock;
	}

	public void setIsLock(String isLock) {
		this.isLock = isLock;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public TeacherVo getTeacher() {
		return teacher;
	}

	public void setTeacher(TeacherVo teacher) {
		this.teacher = teacher;
	}

	public StudentVo getStudent() {
		return student;
	}

	public void setStudent(StudentVo student) {
		this.student = student;
	}
}
