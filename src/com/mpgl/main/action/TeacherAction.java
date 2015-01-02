package com.mpgl.main.action;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mpgl.base.BaseAction;
import com.mpgl.main.service.MainService;
import com.mpgl.main.service.TeacherService;
import com.mpgl.util.CommonUtil;
import com.mpgl.util.Constant;
import com.mpgl.util.Constant.RESOURCE_TYPE;
import com.mpgl.util.Constant.STATUS;
import com.mpgl.vo.CourseVo;
import com.mpgl.vo.Form;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

/**
 * 教师操作Action
 * 
 * @author Administrator
 * 
 */
public class TeacherAction extends BaseAction {
	
	private MainService mainService;

	private TeacherService service;

	private TeacherVo teacherVo;
	
	private CourseVo courseVo;
	
	private MessageVo messageVo;
	
	private ResourceVo resourceVo;
	
	private JobVo jobVo;

	private Map<String, Object> messageMap;

	private Map<String, Object> courseMap;

	private Map<String, Object> imageMap;

	private Map<String, Object> textMap;

	private Map<String, Object> vedioMap;
	
	private Map<String, Object> jobMap;
	
	private List<ResourceVo> imageList;
	
	private List<ResourceVo> textList;
	
	private List<ResourceVo> vedioList;
	
	//课件
	private List<ResourceVo> wareList;
	
	/**
	 * 下拉框数据列表
	 */
	private List<Map<String, Object>> comboboxList;
	
	private Integer messageCount;

	private Integer courseCount;

	private Integer jobCount;
	
	public String doTeacherRegister() {
		//首先校验教师工号是否存在
		if(teacherVo != null) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("code", teacherVo.getCode());
			TeacherVo vo = service.queryTeacher(param);
			if(vo != null) {
				UserVo userVo = new UserVo();
				userVo.setUsername(teacherVo.getCode());
				userVo.setPassword(this.getForm().getPassword());
				userVo.setName(teacherVo.getName());
				userVo.setCreate_time(CommonUtil.systemDate());
				userVo.setRole_id(Constant.ROLE.TEACHER);
				userVo.setTeacher(teacherVo);
				if(service.isExistByUser(userVo)) {
					ajaxStatus = Constant.CODE_REP;
					return SUCCESS;
				}
				teacherVo.setId(vo.getId());
				service.registerTeacher(userVo);
				ajaxStatus = Constant.CODE_WIN;
			} else {
				ajaxStatus = Constant.CODE_NULL;
			}
		}
		return SUCCESS;
	}

	/**
	 * 跳转教师主界面
	 * 
	 * @return
	 */
	public String goTeacher() {
		TeacherVo teacher = this.getCurrentUser().getTeacher();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", teacher.getId());
		messageCount = service.queryMessageListCount(param);
		courseCount = service.queryCourseListCount(param);
		jobCount = service.queryJobListCount(param);
		messageMap = service.queryMessagePageList(this.getPageMap(param));
		param.put("status", Constant.STATUS.ACTIVE);
		courseMap = service.queryCoursePageList(this.getPageMap(param));

		param.put("resource_type", RESOURCE_TYPE.IMG);
		imageMap = service.queryResourcePageList(param);

		param.put("resource_type", RESOURCE_TYPE.TEXT);
		textMap = service.queryResourcePageList(param);

		param.put("resource_type", RESOURCE_TYPE.VEDIO);
		vedioMap = service.queryResourcePageList(param);
		return SUCCESS;
	}

	public String goTeacherInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", this.getCurrentUser().getTeacher().getCode());
		teacherVo = service.queryTeacher(param);
		return SUCCESS;
	}

	public String goTeacherEdit() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", this.getCurrentUser().getTeacher().getCode());
		teacherVo = service.queryTeacher(param);
		return SUCCESS;
	}

	public String doTeacherEdit() {
		teacherVo.setId(this.getCurrentUser().getTeacher().getId());
		service.updateTeacher(teacherVo);
		return SUCCESS;
	}

	/**
	 * 跳转课程管理界面
	 * 
	 * @return
	 */
	public String goCourseManager() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", this.getCurrentUser().getTeacher().getId());
		param.put("course_name", this.getForm().getCourse_name());
		param.put("code", this.getForm().getCode());
		courseMap = service.queryCoursePageList(this.getPageMap(param));
		pageVo.setRowCount(Integer.parseInt(courseMap.get(Constant.ROW_TOTAL)
				.toString()));
		return SUCCESS;
	}
	
	/**
	 * 跳转查看单个课程信息页面
	 * @return
	 */
	public String goCourseInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", this.getCurrentUser().getTeacher().getId());
		param.put("course_id", courseVo.getId());
		param.put("status", STATUS.ACTIVE);
		courseVo = service.queryCourse(param);
		
		param.put("resource_type", RESOURCE_TYPE.IMG);
		imageList = service.queryResourceList(param);
		
		param.put("resource_type", RESOURCE_TYPE.TEXT);
		textList = service.queryResourceList(param);
		
		param.put("resource_type", RESOURCE_TYPE.VEDIO);
		vedioList = service.queryResourceList(param);
		
		param.put("resource_type", RESOURCE_TYPE.WARE);
		wareList = service.queryResourceList(param);
		return SUCCESS;
	}

	/**
	 * 跳转课程新增页面
	 * 
	 * @return
	 */
	public String goCourseAdd() {
		return SUCCESS;
	}
	
	/**
	 * 课程新增
	 * 
	 * @return
	 */
	public String doCourseAdd() {
		courseVo.setTeacher_id(this.getCurrentUser().getTeacher().getId());
		courseVo.setCreate_date(CommonUtil.systemDate());
		service.addCourse(courseVo);
		return SUCCESS;
	}
	
	/**
	 * 跳转课程修改页面
	 * 
	 * @return
	 */
	public String goCourseEdit() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", this.getCurrentUser().getTeacher().getId());
		param.put("course_id", courseVo.getId());
		param.put("status", STATUS.ACTIVE);
		courseVo = service.queryCourse(param);
		return SUCCESS;
	}

	/**
	 * 保存修改课程信息
	 * 
	 * @return
	 */
	public String doCourseEdit() {
		service.editCourse(courseVo);
		return SUCCESS;
	}
	
	/**
	 * 删除课程信息
	 * @return
	 */
	public String doCourseDel() {
		courseVo.setTeacher_id(this.getCurrentUser().getTeacher().getId());
		service.deleteCourse(courseVo);
		ajaxStatus = Constant.CODE_WIN;
		return SUCCESS;
	}
	/**
	 * 删除课程下文件信息
	 * @return
	 */
	public String doResourceDel() {
		service.deleteResource(resourceVo);
		ajaxStatus = Constant.CODE_WIN;
		return SUCCESS;
	}
	
	/**
	 * 跳转教师-教学资料库界面
	 * @return
	 */
	public String goTeachResource() {
		TeacherVo teacher = this.getCurrentUser().getTeacher();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", teacher.getId());
		param.put("status", Constant.STATUS.ACTIVE);
		param.put("file_name", this.getForm().getFile_name());
		textMap = service.queryResourcePageList(this.getPageMap(param));
		pageVo.setRowCount(Integer.parseInt(textMap.get(Constant.ROW_TOTAL)
				.toString()));
		return SUCCESS;
	}
	
	
	public String goPublishJob() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", this.getCurrentUser().getTeacher().getId());
		param.put("course_id", this.getForm().getCourse_id());
		param.put("title", this.getForm().getTitle());
		jobMap = service.queryJobPageList(this.getPageMap(param));
		this.initPage(jobMap);
		Form fm = this.getForm();
		fm.setComboboxKey("name");
		fm.setComboboxValue("id");
		fm.setComboboxTable("t_course_info");
		fm.setComboboxWhere("and teacher_id='" + this.getCurrentUser().getTeacher().getId()+ "'");
		comboboxList = mainService.queryCombobx(fm);
		return SUCCESS;
	}
	
	public String goJobInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", jobVo.getId());
		jobVo = service.queryJob(param);
		return SUCCESS;
	}
	
	public String goJobAdd() {
		Form fm = this.getForm();
		fm.setComboboxKey("name");
		fm.setComboboxValue("id");
		fm.setComboboxTable("t_course_info");
		fm.setComboboxWhere("and teacher_id='" + this.getCurrentUser().getTeacher().getId()+ "'");
		comboboxList = mainService.queryCombobx(fm);
		return SUCCESS;
	}
	
	public String goJobEdit() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", jobVo.getId());
		jobVo = service.queryJob(param);
		Form fm = this.getForm();
		fm.setComboboxKey("name");
		fm.setComboboxValue("id");
		fm.setComboboxTable("t_course_info");
		fm.setComboboxWhere("and teacher_id='" + this.getCurrentUser().getTeacher().getId()+ "'");
		comboboxList = mainService.queryCombobx(fm);
		return SUCCESS;
	}
	
	public String doJobAdd() {
		jobVo.setTeacher_id(this.getCurrentUser().getTeacher().getId());
		jobVo.setCreate_date(CommonUtil.systemDate());
		service.addJob(jobVo);
		return SUCCESS;
	}
	public String doJobEdit() {
		service.editJob(jobVo);
		return SUCCESS;
	}
	
	public String doJobDel() {
		service.deleteJob(jobVo);
		ajaxStatus = Constant.CODE_WIN;
		return SUCCESS;
	}
	
	public String goMessageManager() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", this.getCurrentUser().getTeacher().getId());
		param.put("course_id", this.getForm().getCourse_id());
		param.put("title", this.getForm().getTitle());
		messageMap = service.queryMessagePageList(this.getPageMap(param));
		this.initPage(messageMap);
		Form fm = this.getForm();
		fm.setComboboxKey("name");
		fm.setComboboxValue("id");
		fm.setComboboxTable("t_course_info");
		fm.setComboboxWhere("and teacher_id='" + this.getCurrentUser().getTeacher().getId()+ "'");
		comboboxList = mainService.queryCombobx(fm);
		return SUCCESS;
	}
	
	public String goMessageInfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", messageVo.getId());
		messageVo = service.queryMessage(param);
		return SUCCESS;
	}
	
	public String goMessageAdd() {
		Form fm = this.getForm();
		fm.setComboboxKey("name");
		fm.setComboboxValue("id");
		fm.setComboboxTable("t_course_info");
		fm.setComboboxWhere("and teacher_id='" + this.getCurrentUser().getTeacher().getId()+ "'");
		comboboxList = mainService.queryCombobx(fm);
		return SUCCESS;
	}
	
	public String goMessageEdit() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", messageVo.getId());
		messageVo = service.queryMessage(param);
		Form fm = this.getForm();
		fm.setComboboxKey("name");
		fm.setComboboxValue("id");
		fm.setComboboxTable("t_course_info");
		fm.setComboboxWhere("and teacher_id='" + this.getCurrentUser().getTeacher().getId()+ "'");
		comboboxList = mainService.queryCombobx(fm);
		return SUCCESS;
	}
	
	public String doMessageAdd() {
		messageVo.setTeacher_id(this.getCurrentUser().getTeacher().getId());
		messageVo.setCreate_date(CommonUtil.systemDate());
		service.addMessage(messageVo);
		return SUCCESS;
	}
	public String doMessageEdit() {
		service.editMessage(messageVo);
		return SUCCESS;
	}
	public String doMessageDel() {
		service.deleteMessage(messageVo);
		ajaxStatus = Constant.CODE_WIN;
		return SUCCESS;
	}


	public TeacherService getService() {
		return service;
	}

	public void setService(TeacherService service) {
		this.service = service;
	}

	public Integer getMessageCount() {
		return messageCount;
	}

	public void setMessageCount(Integer messageCount) {
		this.messageCount = messageCount;
	}

	public Integer getCourseCount() {
		return courseCount;
	}

	public void setCourseCount(Integer courseCount) {
		this.courseCount = courseCount;
	}

	public Integer getJobCount() {
		return jobCount;
	}

	public void setJobCount(Integer jobCount) {
		this.jobCount = jobCount;
	}

	public Map<String, Object> getMessageMap() {
		return messageMap;
	}

	public void setMessageMap(Map<String, Object> messageMap) {
		this.messageMap = messageMap;
	}

	public Map<String, Object> getCourseMap() {
		return courseMap;
	}

	public void setCourseMap(Map<String, Object> courseMap) {
		this.courseMap = courseMap;
	}

	public Map<String, Object> getImageMap() {
		return imageMap;
	}

	public void setImageMap(Map<String, Object> imageMap) {
		this.imageMap = imageMap;
	}

	public Map<String, Object> getTextMap() {
		return textMap;
	}

	public void setTextMap(Map<String, Object> textMap) {
		this.textMap = textMap;
	}

	public Map<String, Object> getVedioMap() {
		return vedioMap;
	}

	public void setVedioMap(Map<String, Object> vedioMap) {
		this.vedioMap = vedioMap;
	}

	public TeacherVo getTeacherVo() {
		return teacherVo;
	}

	public void setTeacherVo(TeacherVo teacherVo) {
		this.teacherVo = teacherVo;
	}

	public CourseVo getCourseVo() {
		return courseVo;
	}

	public void setCourseVo(CourseVo courseVo) {
		this.courseVo = courseVo;
	}

	public MessageVo getMessageVo() {
		return messageVo;
	}

	public void setMessageVo(MessageVo messageVo) {
		this.messageVo = messageVo;
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

	public ResourceVo getResourceVo() {
		return resourceVo;
	}

	public void setResourceVo(ResourceVo resourceVo) {
		this.resourceVo = resourceVo;
	}

	public Map<String, Object> getJobMap() {
		return jobMap;
	}

	public void setJobMap(Map<String, Object> jobMap) {
		this.jobMap = jobMap;
	}

	public MainService getMainService() {
		return mainService;
	}

	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	public List<Map<String, Object>> getComboboxList() {
		return comboboxList;
	}

	public void setComboboxList(List<Map<String, Object>> comboboxList) {
		this.comboboxList = comboboxList;
	}

	public JobVo getJobVo() {
		return jobVo;
	}

	public void setJobVo(JobVo jobVo) {
		this.jobVo = jobVo;
	}

}
