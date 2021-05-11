package chn.bhmc.dms.sample.dao;

import java.util.Map;

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
}
