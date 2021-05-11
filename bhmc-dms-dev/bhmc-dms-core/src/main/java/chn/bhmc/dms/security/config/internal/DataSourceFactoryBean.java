
package chn.bhmc.dms.security.config.internal;

import javax.sql.DataSource;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import chn.bhmc.dms.security.config.SecurityConfig;


public class DataSourceFactoryBean implements FactoryBean<DataSource>, ApplicationContextAware {
	private static final String DEF_DATASOURCE_NAME = "dataSource";

	private ApplicationContext context = null;

	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}

	public DataSource getObject() throws Exception {
		SecurityConfig config = context.getBean(SecurityConfig.class);

		if (config == null) {
			throw new NoSuchBeanDefinitionException("No bean of type [SecurityConfig.class] is defined.");
		}

		if (config.getDataSource() != null) {
			return config.getDataSource();
		} else {
			if (context.containsBean(DEF_DATASOURCE_NAME)) {

				return (DataSource)context.getBean(DEF_DATASOURCE_NAME);
			} else {
				throw new NoSuchBeanDefinitionException("No bean of name [dataSource] is defined.");
			}
		}
	}

	public Class<DataSource> getObjectType() {
		return DataSource.class;
	}

	public boolean isSingleton() {
		return true;
	}

}
