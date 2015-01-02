package com.mpgl.main.service;

import java.util.List;
import java.util.Map;

import com.mpgl.vo.CourseVo;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.StudentCourseVo;
import com.mpgl.vo.StudentVo;
import com.mpgl.vo.UserVo;

public interface StudentService {
	
	void registerStudent(UserVo vo);
	
	/**
	 * 判断用户是否存在
	 * 
	 * @param vo
	 * @return
	 */
	boolean isExistByUser(UserVo vo);

	/**
	 * 查询单个学生信息
	 * 
	 * @param param
	 * @return
	 */
	public StudentVo queryStudent(Map<String, Object> param);
	
	void editStudent(StudentVo vo);
	
	/**
	 * 查询学生课程信息 分页
	 * @param param
	 * @return
	 */
	public Map<String, Object> queryCoursePageList(Map<String, Object> param);

	/**
	 * 查询教师发布的教学通知(分页)
	 * 
	 * @param param
	 *            student_id 学生ID
	 * @return
	 */
	Map<String, Object> queryMessagePageList(Map<String, Object> param);
	
	/**
	 * 
	 * @param param
	 * @return
	 */
	MessageVo queryMessage(Map<String, Object> param);

	/**
	 * 查询课程列表
	 * 
	 * @param param
	 *            student_id 学生ID，status:select已选修、unselect未选修
	 * @return
	 */
	List<CourseVo> queryCourseList(Map<String, Object> param);

	/**
	 * 选修课程
	 * 
	 * @param vo
	 */
	void electiveCourse(StudentCourseVo vo);

	/**
	 * 退修课程
	 * 
	 * @param vo
	 */
	void unElectiveCourse(StudentCourseVo vo);
	
	/**
	 * 
	 * @param param
	 * @return
	 */
	CourseVo queryCourse(Map<String, Object> param);
	
	/**
	 * 
	 * @param param
	 * @return
	 */
	List<ResourceVo> queryResourceList(Map<String, Object> param);
	
	Map<String, Object> queryResourcePageList(Map<String, Object> param);
	
	List<JobVo> queryJobByCourseList(Map<String, Object> param);
	
	JobVo queryJob(Map<String, Object> param);
}
