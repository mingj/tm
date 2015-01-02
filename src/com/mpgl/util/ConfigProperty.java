package com.mpgl.util;

import java.io.IOException;
import java.util.Properties;

/**
 * 资源配置文件操作类
 * 
 * @author user
 * 
 */
public class ConfigProperty {

	private static ConfigProperty instance;

	private Properties properties;

	private static final String CONFIG_FILE = "/config/base/configurtion.properties";

	private ConfigProperty() {
		properties = new Properties();
		try {
			properties.load(ConfigProperty.class
					.getResourceAsStream(CONFIG_FILE));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static ConfigProperty newInstance() {
		if (instance == null) {
			instance = new ConfigProperty();
		}
		return instance;
	}

	public Properties getProperties() {
		return properties;
	}

	public static String getProvalue(String Key) {
		Properties props = ConfigProperty.newInstance().getProperties();
		return props.getProperty(Key);
	}
}
