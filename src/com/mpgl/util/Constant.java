package com.mpgl.util;

import java.text.SimpleDateFormat;

/**
 * 常量类
 * 
 * @author user
 * 
 */
public interface Constant {

	/**
	 * 项目根路径
	 */
	String PROJECT_ROOT = System.getProperty("catalina.base") + "/webapps/tm/";

	/**
	 * 模版文件夹路径
	 */
	String TEMPLATE_PATH = "template/";

	/**
	 * 视频库路径
	 */
	String SP_PATH = "resource/sp/";

	/**
	 * 图片库路径
	 */
	String TP_PATH = "resource/tp/";

	/**
	 * 文本库路径
	 */
	String WB_PATH = "resource/wb/";
	
	/**
	 * 课件路径
	 */
	String KJ_PATH = "resource/kj/";

	/**
	 * 默认日期格式
	 */
	SimpleDateFormat DEFAULT_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * DataGrid数据集KEY
	 */
	String ROW_KEY = "rows";

	/**
	 * DataGrid数据集总条数
	 */
	String ROW_TOTAL = "total";

	/**
	 * SESSION中用户信息存放KEY
	 */
	String USER = "USER_INFO";

	/**
	 * SESSION登录错误信息存放Key
	 */
	String LOGIN = "LOGIN_ERROR";

	/**
	 * 状态码-错误
	 */
	String CODE_EOF = "400";

	/**
	 * 状态码-成功
	 */
	String CODE_WIN = "500";

	/**
	 * 无响应
	 */
	String CODE_NAN = "600";
	
	/**
	 * 重复
	 */
	String CODE_REP = "700";
	
	String CODE_NULL = "800";

	/**
	 * 登录角色ID
	 * @author Administrator
	 *
	 */
	public interface ROLE {
		
		String ADMIN = "1";
		
		String TEACHER = "2";
		
		String STUDENT = "3";
	}
	
	public interface STATUS {
		/**
		 * 激活
		 */
		String ACTIVE = "1";
		
		/**
		 * 关闭
		 */
		String CLOSE = "2";
		
	}
	
	public interface RESOURCE_TYPE {
		
		String IMG = "3";
		
		String TEXT = "2";
		
		String VEDIO = "1";
		/**
		 * 课件
		 */
		String WARE = "4";
	}

	/**
	 * 导入数据 列名数组
	 * 
	 * @author user
	 * 
	 */
	public interface ImportColumn {
	}

	/**
	 * 导出数据 列名数组
	 * 
	 * @author user
	 * 
	 */
	public interface ExportColumn {
	}

}