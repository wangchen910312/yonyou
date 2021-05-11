package chn.bhmc.dms.mob.api.part.dao;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoHeaderVO;


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
@Mapper("PartAdvanceReceivedInfoHeaderDAO")
public interface PartAdvanceReceivedInfoHeaderDAO {

    
    /**
     * Key에 해당하는 선수금 헤더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 선수금 헤더 정보
     */
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(@Param("dlrCd") String dlrCd) throws Exception;

    }
