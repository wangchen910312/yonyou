package chn.bhmc.dms.mob.api.main.dao;


import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.main.vo.AdvanceReceivedInfoHeaderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AdvanceReceivedInfoHeaderDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("MainAdvanceReceivedInfoHeaderDAO")
public interface MainAdvanceReceivedInfoHeaderDAO {

    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(@Param("dlrCd") String dlrCd) throws Exception;

}
