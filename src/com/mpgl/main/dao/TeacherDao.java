package com.mpgl.main.dao;

import java.util.List;
import java.util.Map;

import com.mpgl.vo.CourseVo;
import com.mpgl.vo.Form;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

public interface TeacherDao {

	void registerTeacher(TeacherVo vo);

	void registerUser(UserVo vo);

	List<UserVo> queryUser(UserVo vo);

	/**
	 * 查询教师信息
	 * 
	 * @param param
	 *            code
	 * @return
	 */
	public List<TeacherVo> queryTeacher(Map<String, Object> param);

	/**
	 * 更新教师信息
	 * 
	 * @param vo
	 */
	void updateTeacher(TeacherVo vo);

	/**
	 * 查询教学通知列表
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public List<MessageVo> queryMessagePageList(Map<String, Object> param);

	/**
	 * 查询教学通知数量
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public int queryMessageListCount(Map<String, Object> param);

	/**
	 * 查询教学通知数组
	 * 
	 * @param param
	 * @return
	 */
	List<MessageVo> queryMessageList(Map<String, Object> param);

	void addMessage(MessageVo vo);

	void editMessage(MessageVo vo);

	void deleteMessage(MessageVo vo);

	/**
	 * 课程分页列表
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public List<CourseVo> queryCoursePageList(Map<String, Object> param);

	/**
	 * 查询课程信息
	 * 
	 * @param param
	 *            course_id 课程ID,teacher_id开设老师
	 * @return
	 */
	public List<CourseVo> queryCourse(Map<String, Object> param);

	public int addCourse(CourseVo vo);

	public void editCourse(CourseVo vo);

	public void deleteCourse(CourseVo vo);

	/**
	 * 查询课程数量
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public int queryCourseListCount(Map<String, Object> param);

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

	void deleteReource(ResourceVo vo);

	/**
	 * 查询发布作业数量
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public int queryJobListCount(Map<String, Object> param);

	/**
	 * 查询资源库列表
	 * 
	 * @param param
	 *            resource_type 类型， teacher_id教师ID
	 * @return
	 */
	public List<ResourceVo> queryResourceList(Map<String, Object> param);

	public List<JobVo> queryJobPageList(Map<String, Object> param);

	public int queryJobPageListCount(Map<String, Object> param);

	public List<JobVo> queryJobList(Map<String, Object> param);

	void addJob(JobVo vo);

	void editJob(JobVo vo);

	void deleteJob(JobVo vo);
}
