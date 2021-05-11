package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstVO;

/**
 * 구매요청 서비스
 *
 * @author In Bo Shim
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PurcRqstService {

    /**
     *구매요청  정보를 등록한다.
     * @param purcRgstVO - 등록할 정보가 담긴 PurcRqstVO
     * @return 등록된 목록수
     */
    public int insertPurcRqst(PurcRqstVO purcRgstVO) throws Exception;

    /**
     *구매요청  정보를 수정한다.
     * @param purcRgstVO - 수정할 정보가 담긴 PurcRqstVO
     * @return 수정된 목록수
     */
    public int updatePurcRqst(PurcRqstVO purcRgstVO) throws Exception;

    /**
     * 구매요청에 대한 구매오더 시 구매요청 정보를 수정한다.
     * @param purcRqstVO - 수정할 정보가 담긴 PurcRqstVO
     * @return 수정된 목록수
     */
    public int updatePurcRqstCnfm(PurcRqstVO purcRqstVO) throws Exception;

    /**
     * 구매입고확정 시 구매요청 정보를 수정한다.(문자 수신 완료여부)
     * @param purcRqstVO - 수정할 정보가 담긴 PurcRqstVO
     * @return 수정된 목록수
     */
    public int updatePurcRqstByReceiveCnfm(PurcRqstSearchVO purcRqstSearchVO) throws Exception;

    /**
     * 구매요청  정보를 삭제한다.
     * @param purcRgstVO - 삭제할 정보가 담긴 PurcRqstVO
     * @return 삭제된 목록수
     */
    public int deletePurcRqst(PurcRqstVO purcRgstVO) throws Exception;

    /**
     * 부품예약 RO 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailVO
     */
    public void multiIssueReqDetailPartsRoes(BaseSaveVO<IssueReqDetailVO> obj) throws Exception;

    /**
     * Key에 해당하는 구매요청  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 구매요청  정의 정보
     */
    public PurcRqstVO selectPurcRqstByKey(String dlrCd, String purcReqNo, String refDocNo, String strgeCd, String itemCd) throws Exception;

    /**
     * 조회 조건에 해당하는구매요청  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록
     */
    public List<PurcRqstVO> selectPurcRqstesByCondition(PurcRqstSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매요청  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcRqstesByConditionCnt(PurcRqstSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는구매요청 팝업  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록
     */
    public List<PurcRqstVO> selectPurcReqsPopByCondition(PurcRqstSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매요청 팝업  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReqsPopByConditionCnt(PurcRqstSearchVO searchVO) throws Exception;

    /**
     * 구매요청에 대한 구매오더 시 구매요청 정보를 수정한다.
     * @param purcRqstVO - 수정할 정보가 담긴 PurcRqstVO
     * @return 수정된 목록수
     */
    public boolean updatePurcRqstCnfmByPurcOrd(List<PurcRqstVO> list) throws Exception;


    /**
     * 입고확정에 대한 문자 수신 여부 수정할 구매요청자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록
     */
    public List<PurcRqstVO> selectPurcReqUsersByConditionForSms(PurcRqstSearchVO searchVO) throws Exception;

    /**
     * 입고확정에 대한 문자 수신 여부 수정할 구매요청 카운트를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReqItemsByConditionForSmsCnt(PurcRqstSearchVO searchVO) throws Exception;

}
