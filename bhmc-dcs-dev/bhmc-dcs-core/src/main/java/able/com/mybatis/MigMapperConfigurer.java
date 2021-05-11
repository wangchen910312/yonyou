package able.com.mybatis;

import org.mybatis.spring.mapper.MapperScannerConfigurer;

public class MigMapperConfigurer extends MapperScannerConfigurer
{
  public MigMapperConfigurer()
  {
    super.setAnnotationClass(MigMapper.class);
    super.setSqlSessionFactoryBeanName("sqlMigSession");
  }
}
