package br.com.babyshark.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
public class JPAConfiguration {

	@Bean(name = "dataSource", destroyMethod = "close")
	public DataSource getDataSource() throws PropertyVetoException {

		ComboPooledDataSource dataSource = new ComboPooledDataSource();
		dataSource.setDriverClass("com.mysql.cj.jdbc.Driver");
		dataSource.setUser("root");
		dataSource.setPassword("12345");
		dataSource.setJdbcUrl("jdbc:mysql://localhost/babyshark?serverTimezone=UTC");

		dataSource.setMinPoolSize(3);
		dataSource.setMaxPoolSize(10);
		dataSource.setIdleConnectionTestPeriod(10);

		return dataSource;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {

		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		factoryBean.setJpaVendorAdapter(vendorAdapter);

		factoryBean.setDataSource(dataSource);

		Properties properties = new Properties();
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
		properties.setProperty("hibernate.show_sql", "true");
		properties.setProperty("hibernate.hbm2ddl.auto", "update");
		properties.setProperty("hibernate.cache.region.factory_class",
				"org.hibernate.cache.ehcache.EhCacheRegionFactory");
		properties.setProperty("hibernate.cache.use_second_level_cache", "true");
		properties.setProperty("hibernate.cache.use_query_cache", "true");
		properties.setProperty("net.sf.ehcache.configurationResourceName", "myehcache.xml");
		
		factoryBean.setJpaProperties(properties);
		factoryBean.setPackagesToScan("br.com.babyshark.entity");

		return factoryBean;
	}

	@Bean
	public JpaTransactionManager getTransactionManager(EntityManagerFactory emf) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(emf);
		return transactionManager;
	}

}
