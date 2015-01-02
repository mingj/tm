package com.mpgl.main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mpgl.main.dao.StudentDao;
import com.mpgl.main.service.StudentService;
import com.mpgl.util.Constant;
import com.mpgl.vo.CourseVo;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.StudentCourseVo;
import com.mpgl.vo.StudentVo;
import com.mpgl.vo.UserVo;

public class StudentServiceImpl implements StudentService {

	private StudentDao dao;

	public StudentDao getDao() {
		return dao;
	}

	public void setDao(StudentDao dao) {
		this.dao = dao;
	}

	@Override
	public StudentVo queryStudent(Map<String, Object> param) {
		StudentVo vo = null;
		List<StudentVo> list = dao.queryStudent(param);
		if (list != null && list.size() > 0) {
			vo = list.get(0);
		}
		return vo;
	}

	@Override
	public Map<String, Object> queryMessagePageList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(Constant.ROW_KEY, dao.queryMessagePageList(param));
		map.put(Constant.ROW_TOTAL, dao.queryMessageListCount(param));
		return map;
	}

	@Override
	public List<CourseVo> queryCourseList(Map<String, Object> param) {
		return dao.queryCourseList(param);
	}

	@Override
	public void electiveCourse(StudentCourseVo vo) {
		dao.electiveCourse(vo);
	}

	@Override
	public void unElectiveCourse(StudentCourseVo vo) {
		dao.unElectiveCourse(vo);
	}

	@Override
	public void editStudent(StudentVo vo) {
		dao.editStudent(vo);
	}

	@Override
	public Map<String, Object> queryCoursePageList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(Constant.ROW_KEY, dao.queryCoursePageList(param));
		map.put(Constant.ROW_TOTAL, dao.queryCoursePageListCount(param));
		return map;
	}

	@Override
	public CourseVo queryCourse(Map<String, Object> param) {
		CourseVo vo = null;
		List<CourseVo> list = dao.queryCourseList(param);
		if (list != null && list.size() > 0) {
			vo = list.get(0);
		}
		return vo;
	}

	@Override
	public List<ResourceVo> queryResourceList(Map<String, Object> param) {
		return dao.queryResourceList(param);
	}

	@Override
	public Map<String, Object> queryResourcePageList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(Constant.ROW_KEY, dao.queryResourcePageList(param));
		map.put(Constant.ROW_TOTAL, dao.queryResourceListCount(param));
		return map;
	}

	@Override
	public List<JobVo> queryJobByCourseList(Map<String, Object> param) {
		return dao.queryJobByCourseList(param);
	}

	@Override
	public JobVo queryJob(Map<String, Object> param) {
		JobVo vo = null;
		List<JobVo> list = dao.queryJobByCourseList(param);
		if (list != null && list.size() > 0) {
			vo = list.get(0);
		}
		return vo;
	}

	@Override
	public MessageVo queryMessage(Map<String, Object> param) {
		MessageVo vo = null;
		List<MessageVo> list = dao.queryMessageList(param);
		if (list != null && list.size() > 0) {
			vo = list.get(0);
		}
		return vo;
	}
	
	@Override
	public boolean isExistByUser(UserVo vo) {
		List<UserVo> list = dao.queryUser(vo);
		if(list != null && list.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void registerStudent(UserVo vo) {
		//注册教师
		dao.registerStudent(vo.getStudent());
		dao.registerUser(vo);
	}

}
