package chn.bhmc.dms.ws.sal.bdw.service.dao;

import java.util.List;
import java.util.Map;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalExtColorBasicDataDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 8. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 16.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Mapper("salExtColorBasicDataDAO")
public interface SalExtColorBasicDataDAO {

    public List<Map<String, Object>> getExtColorBasicDataSearch(Map<String, Object> params)throws Exception;

}
