package com.mpgl.main.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import com.mpgl.base.BaseAction;
import com.mpgl.main.service.TeacherService;
import com.mpgl.util.Constant;
import com.mpgl.vo.ResourceVo;

/**
 * 文件下载
 * 
 * @author user
 * 
 */
public class FileDownloadAction extends BaseAction {

	/**
	 * 日志
	 */
	private static Logger log = Logger.getLogger(FileDownloadAction.class);

	private InputStream ins;

	private String fileName;

	private String id;

	private TeacherService teacherService;

	@Override
	public String execute() {
		// fileName = ConfigProperty.newInstance().getProvalue(this.fileKey);
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("file_id", id);
			ResourceVo vo = teacherService.queryResource(param);
			fileName = vo.getFile_name() + "." + vo.getExtension();
			String path = Constant.PROJECT_ROOT + vo.getFile_path();
			ins = new FileInputStream(new File(path));
		} catch (FileNotFoundException e) {
			log.error("文件下载错误:", e);
		}
		return SUCCESS;
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

	public TeacherService getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
