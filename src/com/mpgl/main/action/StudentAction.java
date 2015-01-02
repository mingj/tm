package com.mpgl.main.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mpgl.base.BaseAction;
import com.mpgl.main.service.StudentService;
import com.mpgl.util.CommonUtil;
import com.mpgl.util.Constant;
import com.mpgl.util.Constant.RESOURCE_TYPE;
import com.mpgl.util.Constant.STATUS;
import com.mpgl.vo.CourseVo;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.StudentCourseVo;
import com.mpgl.vo.StudentVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

/**
 * 学生操作Action
 * 
 * @author Administrator
 * 
 */
public class StudentAction extends BaseAction {

	private StudentService service;

	private Map<String, Object> messageMap;

	private Map<String, Object> courseMap;
	
	private Map<String, Object> resourceMap;

	/**
	 * 已选修课程列表
	 */
	private List<CourseVo> scourseList;

	/**
	 * 未选修课程列表
	 */
	private List<CourseVo> ucourseList;

	private CourseVo courseVo;

	private StudentVo studentVo;
	
	private JobVo jobVo;
	
	private MessageVo messageVo;

	private List<ResourceVo> imageList;

	private List<ResourceVo> textList;

	private List<ResourceVo> vedioList;

	// 课件
	private List<ResourceVo> wareList;

	/**
	 * 作业列表
	 */
	private List<JobVo> jobList;
	
	public String doStudentRegister() {
		
		//首先校验教师工号是否存在
		if(studentVo != null) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("code", studentVo.getCode());
			StudentVo vo = service.queryStudent(param);
			if(vo != null) {
				UserVo userVo = new UserVo();
				userVo.setUsername(studentVo.getCode());
				userVo.setPassword(this.getForm().getPassword());
				userVo.setName(studentVo.getName());
				userVo.setCreate_time(CommonUtil.systemDate());
				userVo.setRole_id(Constant.ROLE.STUDENT);
				userVo.setStudent(studentVo);
				if(service.isExistByUser(userVo)) {
					ajaxStatus = Constant.CODE_REP;
					return SUCCESS;
				}
				studentVo.setId(vo.getId());
				service.registerStudent(userVo);
				ajaxStatus = Constant.CODE_WIN;
			} else {
				ajaxStatus = Constant.CODE_NULL;
			}
		}
		return SUCCESS;
	}

	/**
	 * 跳转学生主界面
	 * 
	 * @return
	 */
	public String goStudent() {
		StudentVo student = this.getCurrentUser().getStudent();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("student_id", student.getId());
		messageMap = service.queryMessagePageList(this.getPageMap(param));
		// 查询已选修课程列表
		param.put("status", "select");
		scourseList = service.queryCourseList(param);
		// 查询未选修课程列表
		param.put("status", "unselect");
		ucourseList = service.queryCourseList(param);
		return SUCCESS;
	}

	public String goStudentInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", this.getCurrentUser().getStudent().getCode());
		studentVo = service.queryStudent(param);
		return SUCCESS;
	}

	public String goStudentEdit() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", this.getCurrentUser().getStudent().getCode());
		studentVo = service.queryStudent(param);
		return SUCCESS;
	}

	public String doStudentEdit() {
		studentVo.setId(this.getCurrentUser().getStudent().getId());
		service.editStudent(studentVo);
		return SUCCESS;
	}

	public String goStudentCourse() {
		Map<String, Object> param = new HashMap<String, Object>();
		StudentVo student = this.getCurrentUser().getStudent();
		param.put("student_id", student.getId());
		param.put("code", this.getForm().getCode());
		param.put("course_name", this.getForm().getCourse_name());
		if (null == this.getForm().getStatus()
				|| "".equals(this.getForm().getStatus())) {
			param.put("status", "select");
		} else {
			param.put("status", this.getForm().getStatus());
		}
		courseMap = service.queryCoursePageList(this.getPageMap(param));
		this.initPage(courseMap);
		return SUCCESS;
	}

	/**
	 * 选修课程
	 * 
	 * @return
	 */
	public String doElective() {
		StudentVo student = this.getCurrentUser().getStudent();
		StudentCourseVo vo = new StudentCourseVo();
		vo.setStudent_id(student.getId());
		vo.setCourse_id(courseVo.getId());
		service.electiveCourse(vo);
		ajaxStatus = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 退修课程
	 * 
	 * @return
	 */
	public String doUnElective() {
		StudentVo student = this.getCurrentUser().getStudent();
		StudentCourseVo vo = new StudentCourseVo();
		vo.setStudent_id(student.getId());
		vo.setCourse_id(courseVo.getId());
		service.unElectiveCourse(vo);
		ajaxStatus = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 跳转查看单个课程信息页面
	 * 
	 * @return
	 */
	public String goStudentCourseInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("student_id", this.getCurrentUser().getStudent().getId());
		param.put("course_id", courseVo.getId());
		param.put("status", "select");

		courseVo = service.queryCourse(param);

		param.put("resource_type", RESOURCE_TYPE.IMG);
		imageList = service.queryResourceList(param);

		param.put("resource_type", RESOURCE_TYPE.TEXT);
		textList = service.queryResourceList(param);

		param.put("resource_type", RESOURCE_TYPE.VEDIO);
		vedioList = service.queryResourceList(param);

		param.put("resource_type", RESOURCE_TYPE.WARE);
		wareList = service.queryResourceList(param);
		
		jobList = service.queryJobByCourseList(param);
		return SUCCESS;
	}
	
	public String goStudentCourseJobInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", jobVo.getId());
		jobVo = service.queryJob(param);
		return SUCCESS;
	}
	
	public String goStudentResource() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("student_id", this.getCurrentUser().getStudent().getId());
		param.put("file_name", this.getForm().getFile_name());
		resourceMap = service.queryResourcePageList(this.getPageMap(param));
		this.initPage(resourceMap);
		return SUCCESS;
	}
	
	public String goStudentMessage() {
		StudentVo student = this.getCurrentUser().getStudent();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("student_id", student.getId());
		param.put("course_id", this.getForm().getCourse_id());
		param.put("title", this.getForm().getTitle());
		messageMap = service.queryMessagePageList(this.getPageMap(param));
		this.initPage(messageMap);
		return SUCCESS;
	}
	
	public String goStudentMessageInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", messageVo.getId());
		messageVo = service.queryMessage(param);
		return SUCCESS;
	}

	public StudentService getService() {
		return service;
	}

	public void setService(StudentService service) {
		this.service = service;
	}

	public Map<String, Object> getMessageMap() {
		return messageMap;
	}

	public void setMessageMap(Map<String, Object> messageMap) {
		this.messageMap = messageMap;
	}

	public List<CourseVo> getScourseList() {
		return scourseList;
	}

	public void setScourseList(List<CourseVo> scourseList) {
		this.scourseList = scourseList;
	}

	public List<CourseVo> getUcourseList() {
		return ucourseList;
	}

	public void setUcourseList(List<CourseVo> ucourseList) {
		this.ucourseList = ucourseList;
	}

	public CourseVo getCourseVo() {
		return courseVo;
	}

	public void setCourseVo(CourseVo courseVo) {
		this.courseVo = courseVo;
	}

	public StudentVo getStudentVo() {
		return studentVo;
	}

	public void setStudentVo(StudentVo studentVo) {
		this.studentVo = studentVo;
	}

	public Map<String, Object> getCourseMap() {
		return courseMap;
	}

	public void setCourseMap(Map<String, Object> courseMap) {
		this.courseMap = courseMap;
	}

	public List<ResourceVo> getImageList() {
		return imageList;
	}

	public void setImageList(List<ResourceVo> imageList) {
		this.imageList = imageList;
	}

	public List<ResourceVo> getTextList() {
		return textList;
	}

	public void setTextList(List<ResourceVo> textList) {
		this.textList = textList;
	}

	public List<ResourceVo> getVedioList() {
		return vedioList;
	}

	public void setVedioList(List<ResourceVo> vedioList) {
		this.vedioList = vedioList;
	}

	public List<ResourceVo> getWareList() {
		return wareList;
	}

	public void setWareList(List<ResourceVo> wareList) {
		this.wareList = wareList;
	}

	public List<JobVo> getJobList() {
		return jobList;
	}

	public void setJobList(List<JobVo> jobList) {
		this.jobList = jobList;
	}

	public JobVo getJobVo() {
		return jobVo;
	}

	public void setJobVo(JobVo jobVo) {
		this.jobVo = jobVo;
	}

	public Map<String, Object> getResourceMap() {
		return resourceMap;
	}

	public void setResourceMap(Map<String, Object> resourceMap) {
		this.resourceMap = resourceMap;
	}

	public MessageVo getMessageVo() {
		return messageVo;
	}

	public void setMessageVo(MessageVo messageVo) {
		this.messageVo = messageVo;
	}

}
