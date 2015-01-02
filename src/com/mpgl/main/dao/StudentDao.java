package com.mpgl.main.dao;

import java.util.List;
import java.util.Map;

import com.mpgl.vo.CourseVo;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.StudentCourseVo;
import com.mpgl.vo.StudentVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

public interface StudentDao {
	
	void registerStudent(StudentVo vo);

	void registerUser(UserVo vo);
	
	List<UserVo> queryUser(UserVo vo);

	public List<StudentVo> queryStudent(Map<String, Object> param);
	
	void editStudent(StudentVo vo);

	/**
	 * 查询教学通知列表
	 * 
	 * @param param
	 *            student_id
	 * @return
	 */
	public List<MessageVo> queryMessagePageList(Map<String, Object> param);

	/**
	 * 查询教学通知数量
	 * 
	 * @param param
	 *            student_id
	 * @return
	 */
	public int queryMessageListCount(Map<String, Object> param);
	
	/**
	 * 
	 * @param param
	 * @return
	 */
	List<MessageVo> queryMessageList(Map<String, Object> param);
	
	/**
	 * 查询学生课程列表
	 * 
	 * @param param
	 *            student_id
	 * @return
	 */
	public List<CourseVo> queryCoursePageList(Map<String, Object> param);
	
	/**
	 * 查询学生课程列表数量
	 * 
	 * @param param
	 *            student_id
	 * @return
	 */
	public int queryCoursePageListCount(Map<String, Object> param);

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
	public List<ResourceVo> queryResourceList(Map<String, Object> param);
	
	
	/**
	 * 资源库分页列表
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public List<ResourceVo> queryResourcePageList(Map<String, Object> param);

	/**
	 * 查询资源库数量
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public int queryResourceListCount(Map<String, Object> param);
	
	/**
	 * 
	 * @param param
	 * @return
	 */
	public List<JobVo> queryJobByCourseList(Map<String, Object> param);
	
}
