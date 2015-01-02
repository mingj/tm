package com.mpgl.poi;

import java.awt.Color;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.formula.functions.Columns;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.mpgl.util.Constant;

public class ExcelUtil {
	/**
	 * 日志
	 */
	private static Logger logger = Logger.getLogger(ExcelUtil.class);

	private Workbook wb = null;

	private String name;

	private Sheet sheet;

	/**
	 * 通过一个Microsoft Office Excel文件构建一个Excel对象
	 * 
	 * @param filename
	 *            Microsoft Office Excel 文件名（包含完整路径）
	 * @throws Exception
	 */
	public ExcelUtil(String fileName, File file) throws Exception {
		name = fileName;
		InputStream inputStream = null;
		try {
			inputStream = new FileInputStream(file);
			boolean isExcel2003 = true;
			/** */
			/** 对文件的合法性进行验证 */
			if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
				isExcel2003 = false;
			}
			/** 根据版本选择创建Workbook的方式 */
			wb = isExcel2003 ? new HSSFWorkbook(inputStream)
					: new XSSFWorkbook(inputStream);
		} finally {
			if (null != inputStream) {
				inputStream.close();
			}
		}
	}

	/**
	 * 导出Excel使用此构造函数
	 * 
	 * @throws Exception
	 */
	public ExcelUtil() throws Exception {
		wb = new HSSFWorkbook();
	}

	/**
	 * 读取EXCEL的数据
	 * 
	 * @param columns
	 *            字段名数组
	 * @param sheetIndex
	 *            sheet页索引
	 * @return
	 */
	public List<Map<String, Object>> getData(String[] columns, int sheetIndex) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		sheet = wb.getSheetAt(sheetIndex);
		int firstNum = sheet.getFirstRowNum();
		int lastNum = sheet.getLastRowNum();
		for (int i = firstNum + 1; i <= lastNum; i++) {
			Row row = sheet.getRow(i);
			Map<String, Object> map = new HashMap<String, Object>();
			for (int j = 0; j < columns.length; j++) {
				Cell cell = row.getCell(j);
				Object val = "";
				if (cell != null) {
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_BOOLEAN:
						val = cell.getBooleanCellValue();
						break;
					case Cell.CELL_TYPE_FORMULA:
						val = cell.getCellFormula();
						break;
					case Cell.CELL_TYPE_NUMERIC:
						if (DateUtil.isCellDateFormatted(cell)) {
							val = Constant.DEFAULT_DATE_FORMAT.format(cell
									.getDateCellValue());
						} else {
							val = getRightStr(cell.getNumericCellValue() + "");
						}
						break;
					case Cell.CELL_TYPE_STRING:
						val = cell.getStringCellValue();
					default:
						val = cell.getRichStringCellValue();
					}
				}
				map.put(columns[j], String.valueOf(val));
			}
			list.add(map);
		}
		return list;
	}

	/**
	 * 读取EXCEL的数据
	 * 
	 * @param columns
	 *            字段名数组
	 * @param sheetName
	 *            sheet页名字
	 * @return
	 */
	public List<Map<String, Object>> getData(String[] columns, String sheetName) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		sheet = wb.getSheet(sheetName);
		int firstNum = sheet.getFirstRowNum();
		int lastNum = sheet.getLastRowNum();
		for (int i = firstNum + 1; i <= lastNum; i++) {
			Row row = sheet.getRow(i);
			Map<String, Object> map = new HashMap<String, Object>();
			for (int j = 0; j < columns.length; j++) {
				Cell cell = row.getCell(j);
				Object val = "";
				if (cell != null) {
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_BOOLEAN:
						val = cell.getBooleanCellValue();
						break;
					case Cell.CELL_TYPE_FORMULA:
						val = cell.getCellFormula();
						break;
					case Cell.CELL_TYPE_NUMERIC:
						if (DateUtil.isCellDateFormatted(cell)) {
							val = Constant.DEFAULT_DATE_FORMAT.format(cell
									.getDateCellValue());
						} else {
							val = getRightStr(cell.getNumericCellValue() + "");
						}
						break;
					case Cell.CELL_TYPE_STRING:
						val = cell.getStringCellValue();
					default:
						val = cell.getRichStringCellValue();
					}
				}
				map.put(columns[j], String.valueOf(val));
			}
			list.add(map);
		}
		return list;
	}

	/**
	 * 产生门牌数据文件
	 * 
	 * @param columns
	 * @param list
	 * @return
	 */
	public Workbook createHouseNumberFile(String[] columns, String[] keys,
			List<Map<String, Object>> list) {
		sheet = wb.createSheet("门牌数据");
//		sheet.setColumnWidth(0, 15*256);
		Row titleRow = sheet.createRow(0);
//		titleRow.setHeight((short)2000);
//		CellStyle titleStyle = this.createTitleCellStyle(wb);
		for (int i = 0; i < columns.length; i++) {
			Cell cell = titleRow.createCell(i);
			cell.setCellValue(columns[i]);
//			cell.setCellStyle(titleStyle);
		}
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				Row row = sheet.createRow(i + 1);
				for (int k = 0; k < keys.length; k++) {
					String key = keys[k];
					Cell cell = row.createCell(k);
					cell.setCellValue(this.getValueByString(map.get(key)));
				}
			}
		}
		return wb;
	}
	
	/**
	 * 创建标题样式
	 * @param wb
	 * @return
	 */
	public CellStyle createTitleCellStyle(Workbook wb) {
		CellStyle style = wb.createCellStyle();
		//设置边框
		style.setFillForegroundColor(HSSFColor.BLUE_GREY.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		return style;
	}
	
	public String getValueByString(Object object) {
		return object != null ? object.toString() : "";
	}

	/**
	 * 返回导出的输入流
	 * 
	 * @param columns
	 * @param list
	 * @return
	 * @throws IOException
	 */
	public InputStream exportStream(String[] columns, String[] keys,
			List<Map<String, Object>> list) throws IOException {
		createHouseNumberFile(columns, keys, list);
		ByteArrayOutputStream write = new ByteArrayOutputStream();
		wb.write(write);
		write.flush();
		byte[] bytes = write.toByteArray();
		InputStream ins = new ByteArrayInputStream(bytes, 0, bytes.length);
		write.close();
		return ins;
	}

	private static String getRightStr(String sNum) {
		DecimalFormat decimalFormat = new DecimalFormat("0.000000");
		String resultStr = decimalFormat.format(new Double(sNum));
		if (resultStr.matches("^[-+]?\\d+\\.[0]+$")) {
			resultStr = resultStr.substring(0, resultStr.indexOf("."));
		}
		return resultStr;
	}

}
