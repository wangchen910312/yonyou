package chn.bhmc.dms.bat.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO;

/**
 * BatchInvoice Header Service
 *
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim      최초 생성
 * </pre>
 */
public interface BatInvcService {

    /**
     * 송장 헤더정보를 추가한다.
     * @param batInvcVO - 추가할 정보가 담긴 BatInvcVO
     * @return 수정된 목록수
     */
    public int insertBatInvcHeader(BatInvcVO batInvcVO) throws Exception;

    /**
     * 송장 헤더정보를 수정한다.
     * @param batInvcVO - 수정할 정보가 담긴 BatInvcVO
     * @return 수정된 목록수
     */
    public int updateBatInvcHeader(BatInvcVO batInvcVO) throws Exception;

    /**
     * Key에 해당하는 송장 헤더정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param invcDocNo - 송장문서번호
     * @return 조회한 송장 헤더 정보
     */
    public BatInvcVO selectInvcByKey(String dlrCd, String invcDocNo) throws Exception;

    /**
     * 조회조건에 해당하는 송장 헤더정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 송장 헤더정보
     */
    public List<BatInvcVO> selectInvcsByCondition(BatInvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 송장 헤더정보  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsByConditionCnt(BatInvcSearchVO searchVO) throws Exception;

}
