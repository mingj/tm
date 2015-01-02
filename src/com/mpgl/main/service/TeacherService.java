package com.mpgl.main.service;

import java.util.List;
import java.util.Map;

import com.mpgl.vo.CourseVo;
import com.mpgl.vo.Form;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

public interface TeacherService {

	void registerTeacher(UserVo vo);

	/**
	 * 查询单个教师信息
	 * 
	 * @param param
	 *            code:工号
	 * @return
	 */
	TeacherVo queryTeacher(Map<String, Object> param);

	/**
	 * 判断用户是否存在
	 * 
	 * @param vo
	 * @return
	 */
	boolean isExistByUser(UserVo vo);

	/**
	 * 更新教师信息
	 * 
	 * @param vo
	 */
	void updateTeacher(TeacherVo vo);

	/**
	 * 查询教师发布的教学通知(分页)
	 * 
	 * @param param
	 *            teacher_id 教师ID
	 * @return
	 */
	Map<String, Object> queryMessagePageList(Map<String, Object> param);

	/**
	 * 查询教学通知数量
	 * 
	 * @param param
	 *            teacher_id 教师ID
	 * @return
	 */
	public int queryMessageListCount(Map<String, Object> param);

	/**
	 * 查询单个教学通知信息
	 * 
	 * @param param
	 * @return
	 */
	MessageVo queryMessage(Map<String, Object> param);

	/**
	 * 查询课程分页列表
	 * 
	 * @param param
	 *            teacher_id 教师ID
	 * @return
	 */
	Map<String, Object> queryCoursePageList(Map<String, Object> param);

	/**
	 * 查询单个课程信息
	 * 
	 * @param param
	 * @return
	 */
	CourseVo queryCourse(Map<String, Object> param);

	void addCourse(CourseVo vo);

	void editCourse(CourseVo vo);

	void deleteCourse(CourseVo vo);

	void deleteResource(ResourceVo vo);

	/**
	 * 查询课程数量
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public int queryCourseListCount(Map<String, Object> param);

	/**
	 * 查询发布作业数量
	 * 
	 * @param param
	 *            teacher_id
	 * @return
	 */
	public int queryJobListCount(Map<String, Object> param);

	/**
	 * 查询资源库分页列表
	 * 
	 * @param param
	 * @return
	 */
	Map<String, Object> queryResourcePageList(Map<String, Object> param);

	/**
	 * 查询资源库列表
	 * 
	 * @param param
	 *            resource_type 类型， teacher_id教师ID,course_id课程ID
	 * @return
	 */
	List<ResourceVo> queryResourceList(Map<String, Object> param);

	/**
	 * 查询一个资源信息
	 * 
	 * @param param
	 *            id
	 * @return
	 */
	ResourceVo queryResource(Map<String, Object> param);

	/**
	 * 查询各个课程下面的已发布作业
	 * 
	 * @param param
	 *            teacher_id,course_Id
	 * @return
	 */
	Map<String, Object> queryJobPageList(Map<String, Object> param);

	/**
	 * 查询单个作业信息
	 * 
	 * @param param
	 * @return
	 */
	JobVo queryJob(Map<String, Object> param);

	void addJob(JobVo vo);

	void editJob(JobVo vo);

	void deleteJob(JobVo vo);

	void addMessage(MessageVo vo);

	void editMessage(MessageVo vo);

	void deleteMessage(MessageVo vo);

}
