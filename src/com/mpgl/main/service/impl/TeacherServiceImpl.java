package com.mpgl.main.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mpgl.main.dao.TeacherDao;
import com.mpgl.main.service.TeacherService;
import com.mpgl.util.Constant;
import com.mpgl.util.Constant.STATUS;
import com.mpgl.vo.CourseVo;
import com.mpgl.vo.Form;
import com.mpgl.vo.JobVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.ResourceVo;
import com.mpgl.vo.TeacherVo;
import com.mpgl.vo.UserVo;

public class TeacherServiceImpl implements TeacherService {

	private TeacherDao dao;

	public TeacherDao getDao() {
		return dao;
	}

	public void setDao(TeacherDao dao) {
		this.dao = dao;
	}

	@Override
	public TeacherVo queryTeacher(Map<String, Object> param) {
		List<TeacherVo> list = dao.queryTeacher(param);
		TeacherVo vo = null;
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
	public int queryMessageListCount(Map<String, Object> param) {
		return dao.queryMessageListCount(param);
	}

	@Override
	public int queryCourseListCount(Map<String, Object> param) {
		return dao.queryCourseListCount(param);
	}

	@Override
	public int queryJobListCount(Map<String, Object> param) {
		return dao.queryJobListCount(param);
	}

	@Override
	public Map<String, Object> queryCoursePageList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(Constant.ROW_KEY, dao.queryCoursePageList(param));
		map.put(Constant.ROW_TOTAL, dao.queryCourseListCount(param));
		return map;
	}

	@Override
	public Map<String, Object> queryResourcePageList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(Constant.ROW_KEY, dao.queryResourcePageList(param));
		map.put(Constant.ROW_TOTAL, dao.queryResourceListCount(param));
		return map;
	}

	@Override
	public void updateTeacher(TeacherVo vo) {
		dao.updateTeacher(vo);
	}

	@Override
	public CourseVo queryCourse(Map<String, Object> param) {
		CourseVo vo = null;
		List<CourseVo> list = dao.queryCourse(param);
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
	public void editCourse(CourseVo vo) {
		dao.editCourse(vo);
	}

	@Override
	public void addCourse(CourseVo vo) {
		dao.addCourse(vo);
	}

	@Override
	public void deleteCourse(CourseVo vo) {
		// 删除课程下文件
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("teacher_id", vo.getTeacher_id());
		param.put("course_id", vo.getId());
		param.put("status", STATUS.ACTIVE);
		List<ResourceVo> fileList = this.queryResourceList(param);
		if (fileList != null) {
			for (ResourceVo resourceVo : fileList) {
				File file = new File(Constant.PROJECT_ROOT
						+ resourceVo.getFile_path());
				if (file.exists()) {
					file.delete();
				}
				dao.deleteReource(resourceVo);
			}
		}
		// 删除课程下文件记录
		// 先删除课程信息
		dao.deleteCourse(vo);
	}

	@Override
	public void deleteResource(ResourceVo vo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("file_id", vo.getId());
		List<ResourceVo> fileList = this.queryResourceList(param);
		if (fileList != null) {
			for (ResourceVo resourceVo : fileList) {
				File file = new File(Constant.PROJECT_ROOT
						+ resourceVo.getFile_path());
				if (file.exists()) {
					file.delete();
				}
				dao.deleteReource(resourceVo);
			}
		}
	}

	@Override
	public ResourceVo queryResource(Map<String, Object> param) {
		ResourceVo vo = null;
		List<ResourceVo> list = dao.queryResourceList(param);
		if (list != null && list.size() > 0) {
			vo = list.get(0);
		}
		return vo;
	}

	@Override
	public Map<String, Object> queryJobPageList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(Constant.ROW_KEY, dao.queryJobPageList(param));
		map.put(Constant.ROW_TOTAL, dao.queryJobPageListCount(param));
		return map;
	}

	@Override
	public JobVo queryJob(Map<String, Object> param) {
		JobVo vo = null;
		List<JobVo> list = dao.queryJobList(param);
		if (list != null && list.size() > 0) {
			vo = list.get(0);
		}
		return vo;
	}

	@Override
	public void addJob(JobVo vo) {
		dao.addJob(vo);
		
	}

	@Override
	public void editJob(JobVo vo) {
		dao.editJob(vo);
	}

	@Override
	public void deleteJob(JobVo vo) {
		dao.deleteJob(vo);
		
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
	public void addMessage(MessageVo vo) {
		dao.addMessage(vo);
	}

	@Override
	public void editMessage(MessageVo vo) {
		dao.editMessage(vo);
	}

	@Override
	public void deleteMessage(MessageVo vo) {
		dao.deleteMessage(vo);
	}

	@Override
	public void registerTeacher(UserVo vo) {
		//注册教师
		dao.registerTeacher(vo.getTeacher());
		dao.registerUser(vo);
	}

	@Override
	public boolean isExistByUser(UserVo vo) {
		List<UserVo> list = dao.queryUser(vo);
		if(list != null && list.size() > 0) {
			return true;
		}
		return false;
	}

}
