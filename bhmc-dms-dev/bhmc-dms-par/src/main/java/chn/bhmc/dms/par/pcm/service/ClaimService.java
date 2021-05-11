package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pcm.vo.ClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.ClaimVO;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimItemVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimVO;




/**
 * 클레임 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface ClaimService {
    /**
     *클레임  정보를 등록한다.
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdVO
     * @return 등록된 목록수
     */
    public int createClaim(List<InvcItemVO> list, InvcVO invcVO) throws Exception;

    /**
     *과부족클레임  정보를 등록한다.
     * @param oversAndShortsClaimVO - 등록할 정보가 담긴 OversAndShortsClaimVO
     * @return 등록된 목록수
     */
    public int createOversAndShortsClaimByInvoice(List<OversAndShortsClaimItemVO> list, OversAndShortsClaimVO oversAndShortsClaimVO) throws Exception;

    /**
     *품질클레임  정보를 등록한다.
     * @param qualityClaimVO - 등록할 정보가 담긴 QualityClaimVO
     * @return 등록된 목록수
     */
    public int createQualityClaimByInvoice(List<QualityClaimVO> list) throws Exception;

    public String selectNextClaimDocNo() throws Exception;

    public String selectNextOversAndShortsClaimDocNo() throws Exception;

    public String selectNextQualityClaimDocNo() throws Exception;

    /**
     * 조회조건에 해당하는 클레임 대상 정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 클레임  정의 정보
     */
    public List<InvcItemVO> selectClaimItemByCondition(InvcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 클레임 대상 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectClaimItemByConditionCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 클레임 관리 정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 클레임  정의 정보
     */
    public List<ClaimVO> selectClaimManageItemByCondition(ClaimSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 클레임 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectClaimManageItemByConditionCnt(ClaimSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 클레임  정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 ClaimSearchVO
     * @return 조회한 클레임  정의 정보
     */
    public List<ClaimVO> selectClaimsByCondition(ClaimSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 클레임  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimSearchVO
     * @return 조회 목록 수
     */
    public int selectClaimsByConditionCnt(ClaimSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 클레임 부품 정보를 조회한다.
     * @param ClaimSearchVO - 조회할 정보가 담긴 ClaimSearchVO
     * @return 조회한 클레임  정보
     */
    public List<ClaimVO> selectClaimItemByKey(ClaimSearchVO searchVO) throws Exception;


    /**
     * 클레임  정보를 확정한다.
     * @param purcOrdVO - 수정할 정보가 담긴 ClaimVO
     * @return 확정된 목록수
     */
    public int updateClaimCnfm(List<ClaimVO> claimVO) throws Exception;

    /**
     * 클레임확정 정보를 취소한다.
     * @param purcOrdVO - 취소할 정보가 담긴 ClaimVO
     * @return 취소된 목록수
     */
    public int cancelClaimCnfm(ClaimVO claimVO) throws Exception;

    /**
     * 클레임 정보를 삭제한다.
     * @param purcOrdVO - 삭제할 정보가 담긴 ClaimVO
     * @return 삭제된 목록수
     */
    public int deleteClaimDoc(ClaimVO claimVO) throws Exception;


    /**
     * 입고  정보를 확정한다.
     * @param purcOrdVO - 수정할 정보가 담긴 ClaimVO
     * @return 확정된 목록수
     */
    public int createClaimByReceiveCnfm(ClaimVO claimVO) throws Exception;

    /**
     * 조회조건에 해당하는 품질클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<QualityClaimVO> selectQualityClaimByCondition(QualityClaimSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 품질클레임 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectQualityClaimByConditionCnt(QualityClaimSearchVO searchVO) throws Exception;

    /**
     * 클레임번호에 해당하는 품질클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 QualityClaimSearchVO
     * @return 조회 목록
     */
    public QualityClaimVO selectQualityClaimByKey(QualityClaimSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 과부족클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public List<OversAndShortsClaimVO> selectOversAndShortsClaimByCondition(OversAndShortsClaimSearchVO searchVO) throws Exception;


    /**
     * 클레임번호에 해당하는 과부족클레임  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public OversAndShortsClaimVO selectOversAndShortsClaimByKey(OversAndShortsClaimSearchVO searchVO) throws Exception;

    /**
     * 클레임수신번호에 해당하는 과부족클레임  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public OversAndShortsClaimVO selectOversAndShortsClaimInfcByKey(OversAndShortsClaimSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 과부족클레임 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록 수
     */
    public int selectOversAndShortsClaimByConditionCnt(OversAndShortsClaimSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 과부족클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public List<OversAndShortsClaimItemVO> selectOversAndShortsClaimItemsByKey(OversAndShortsClaimSearchVO searchVO) throws Exception;
    
    /**
     * 조회조건에 해당하는 과부족클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public List<OversAndShortsClaimItemVO> selectOversAndShortsClaimInfcItemsByKey(OversAndShortsClaimSearchVO searchVO) throws Exception;



    /**
     * Statements
     *
     * @param QualityClaimVO
     */
    public QualityClaimVO updateQualityClaim(QualityClaimVO qualityClaimVO) throws Exception;

    /**
     *품질클레임  정보를 등록한다.
     * @param qualityClaimVO - 등록할 정보가 담긴 QualityClaimVO
     * @return 등록된 목록수
     */
    public QualityClaimVO createQualityClaim(QualityClaimVO qualityClaimVO) throws Exception;

    /**
     *과부족 클레임  정보를 수정한다.
     * @param oversAndShortsClaimSaveVO - 수정할 정보가 담긴 oversAndShortsClaimSaveVO
     * @return 수정된 목록수
     */
    public OversAndShortsClaimVO multiOversAndShortsClaim(BaseSaveVO<OversAndShortsClaimItemVO> oversAndShortsClaimSaveVO, OversAndShortsClaimVO oversAndShortsClaimVO) throws Exception;

    /**
     * 신규품질클레임  정보를 전송한다.
     * @param qualityClaimVO - 전송할 정보가 담긴 QualityClaimVO
     * @return 전송된 목록수
     */
    public int sendCreateQualityClaim(QualityClaimVO qualityClaimVO) throws Exception;

    /**
     * 신품질클레임  수정 정보를 전송한다.
     * @param qualityClaimVO - 전송할 정보가 담긴 QualityClaimVO
     * @return 전송된 목록수
     */
    public int sendUpdateQualityClaim(QualityClaimVO qualityClaimVO) throws Exception;

    /**
     * 신품질클레임   전송 정보를 삭제한다.
     * @param qualityClaimVO - 전송할 정보가 담긴 QualityClaimVO
     * @return 전송된 목록수
     */
    public int sendDeleteQuelityClaim(QualityClaimVO qualityClaimVO) throws Exception;

    /**
     * 품질클레임건 상태 정보를 전송한다.
     * @param qualityClaimVO - 전송할 정보가 담긴 QualityClaimVO
     * @return 전송된 목록수
     */
    public int sendQuelityClaimStatus(List<QualityClaimVO> list) throws Exception;

    /**
     * 품질클레임건 탁송표기 정보를 전송한다.
     * @param qualityClaimVO - 전송할 정보가 담긴 QualityClaimVO
     * @return 전송된 목록수
     */
    public int sendQuelityClaimIsCheck(List<QualityClaimVO> list) throws Exception;

    /**
     * 품질클레임건 회수운송장번호 정보를 전송한다.
     * @param qualityClaimVO - 전송할 정보가 담긴 QualityClaimVO
     * @return 전송된 목록수
     */
    public int sendReClaimOrder(List<QualityClaimVO> list) throws Exception;

    /**
     * 품질클레임건 회수운송장번호 정보를 전송한다.
     * @param qualityClaimVO - 전송할 정보가 담긴 QualityClaimVO
     * @return 전송된 목록수
     */
    public int sendQualityClaimBillNo(List<QualityClaimVO> list) throws Exception;
    
    /**
     * 과부족클레임  정보를 전송한다.
     * @param OversAndShortsClaimVO - 전송할 정보가 담긴 OversAndShortsClaimVO
     * @return 전송된 목록수
     */
    public int sendCreateOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO, List<OversAndShortsClaimItemVO> list) throws Exception;

    /**
     * 과부족클레임  수정 정보를 전송한다.
     * @param OversAndShortsClaimVO - 전송할 정보가 담긴 OversAndShortsClaimVO
     * @return 전송된 목록수
     */
    public int sendUpdateOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO, List<OversAndShortsClaimItemVO> list) throws Exception;

    /**
     * 과부족클레임   전송 정보를 삭제한다.
     * @param OversAndShortsClaimVO - 전송할 정보가 담긴 OversAndShortsClaimVO
     * @return 전송된 목록수
     */
    public int sendDeleteOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO) throws Exception;

}
