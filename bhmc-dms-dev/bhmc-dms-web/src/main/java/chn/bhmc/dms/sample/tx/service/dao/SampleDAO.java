package chn.bhmc.dms.sample.tx.service.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("sampleDAO")
public interface SampleDAO {
    public void selectProcedureTest(Map<String, String> params);
    
    public int insertSample(@Param("aaa") String aaa, @Param("id") int id);
    
    public int updateSample(@Param("aaa") String aaa, @Param("id") int id);

    public int deleteSample(@Param("aaa") String aaa, @Param("id") int id);
    
    public int deleteInsertSample(@Param("aaa") String aaa, @Param("id") int id);
}