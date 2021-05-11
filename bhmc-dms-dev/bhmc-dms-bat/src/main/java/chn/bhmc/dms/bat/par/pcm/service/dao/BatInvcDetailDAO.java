package chn.bhmc.dms.bat.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.bat.par.pcm.vo.BatInvcDetailVO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatInvcDetailDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("batInvcDetailDAO")
public interface BatInvcDetailDAO {
    /**
     * 송장 상세정보를 추가한다.
     * @param batInvcVO - 추가할 정보가 담긴 BatInvcVO
     * @return 수정된 목록수
     */
    public int insertBatInvcDetail(BatInvcDetailVO batInvcVO) throws Exception;

    /**
     * 송장 상세정보를 수정한다.
     * @param batInvcVO - 수정할 정보가 담긴 BatInvcVO
     * @return 수정된 목록수
     */
    public int updateBatInvcDetail(BatInvcDetailVO batInvcVO) throws Exception;

    /**
     * Key에 해당하는 송장 상세정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param invcDocNo - 송장문서번호
     * @return 조회한 송장 상세 정보
     */
    public BatInvcDetailVO selectInvcDetailByKey(@Param("dlrCd") String dlrCd, @Param("invcDocNo") String invcDocNo) throws Exception;

    /**
     * 조회조건에 해당하는 송장 상세정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 송장 상세정보
     */
    public List<BatInvcDetailVO> selectInvcDetailsByCondition(BatInvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 송장 상세정보  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcDetailsByConditionCnt(BatInvcSearchVO searchVO) throws Exception;
}
