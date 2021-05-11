package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pcm.vo.ClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.ClaimVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimItemVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimVO;

/**
 * 클레임 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee     최초 생성
 * </pre>
 */
@Mapper("claimDAO")
public interface ClaimDAO {

    /**
     * 클레임 정보를 등록한다.
     * @param ClaimVO - 등록할 정보가 담긴 ClaimVO
     * @return 등록된 목록수
     */
    public int insertClaim(ClaimVO claimVO);

    /**
     * 기술품질 클레임 정보를 등록한다.
     * @param OversAndShortsClaimVO - 등록할 정보가 담긴 oversAndShortsClaimVO
     * @return 등록된 목록수
     */
    public int insertQualityClaim(QualityClaimVO qualityClaimVO);

    /**
     * 과부족 클레임 정보를 등록한다.
     * @param OversAndShortsClaimVO - 등록할 정보가 담긴 oversAndShortsClaimVO
     * @return 등록된 목록수
     */
    public int insertOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO);

    /**
     * 과부족 클레임 품목 정보를 등록한다.
     * @param OversAndShortsClaimItemVO - 등록할 정보가 담긴 oversAndShortsClaimItemVO
     * @return 등록된 목록수
     */
    public int insertOversAndShortsClaimItem(OversAndShortsClaimItemVO oversAndShortsClaimItemVO);

    /**
     * 조회조건에 해당하는 클레임관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<ClaimVO> selectClaimManageItemByCondition(ClaimSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 클레임관리 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectClaimManageItemByConditionCnt(ClaimSearchVO searchVO);

    /**
     * 조회조건에 해당하는 품질클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<QualityClaimVO> selectQualityClaimByCondition(QualityClaimSearchVO searchVO);
    
    /**
     * 품질클레임 정보를 조회한다.(클레임다운로드 출력물용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<QualityClaimVO> selectQualityClaimDownloadListByCondition(QualityClaimSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품질클레임 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 QualityClaimSearchVO
     * @return 조회 목록 수
     */
    public int selectQualityClaimByConditionCnt(QualityClaimSearchVO searchVO);

    /**
     * 조회조건에 해당하는 과부족클레임 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public List<OversAndShortsClaimVO> selectOversAndShortsClaimByCondition(OversAndShortsClaimSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 과부족클레임 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록 수
     */
    public int selectOversAndShortsClaimByConditionCnt(OversAndShortsClaimSearchVO searchVO);

    /**
     * 조회조건에 해당하는 과부족클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public List<OversAndShortsClaimItemVO> selectOversAndShortsClaimItemsByKey(OversAndShortsClaimSearchVO searchVO);
    
    /**
     * 조회조건에 해당하는 과부족클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public List<OversAndShortsClaimItemVO> selectOversAndShortsClaimInfcItemsByKey(OversAndShortsClaimSearchVO searchVO);

    /**
     * 클레임번호에 해당하는 품질클레임  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 QualityClaimSearchVO
     * @return 조회 목록
     */
    public QualityClaimVO selectQualityClaimByKey(QualityClaimSearchVO searchVO);

    /**
     * 클레임번호에 해당하는 과부족클레임  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public OversAndShortsClaimVO selectOversAndShortsClaimByKey(OversAndShortsClaimSearchVO searchVO);
    
    /**
     * 클레임수신번호에 해당하는 과부족클레임  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public OversAndShortsClaimVO selectOversAndShortsClaimInfcByKey(OversAndShortsClaimSearchVO searchVO);

    /**
     * Statements
     *
     * @param claimVO
     */
    public int updateClaimCnfm(ClaimVO claimVO);

    /**
     * Statements
     *
     * @param QualityClaimVO
     */
    public int updateQualityBMPClaim(QualityClaimVO qualityClaimVO);

    /**
    * Statements
    *
    * @param QualityClaimVO
    */
    public int updateQualityClaim(QualityClaimVO qualityClaimVO);

    /**
     * Statements
     *
     * @param QualityClaimVO
     */
    public int deleteQualityClaim(QualityClaimVO qualityClaimVO);

    /**
     * Statements
     *
     * @param OversAndShortsClaimVO
     */
    public int updateOversAndShortsBMPClaim(OversAndShortsClaimVO oversAndShortsClaimVO);
    /**
     * Statements
     *
     * @param QualityClaimVO
     */
    public int updateQualityClaimStatus(QualityClaimVO qualityClaimVO);

    /**
     * Statements
     *
     * @param QualityClaimVO
     */
    public int updateQualityClaimIsCheck(QualityClaimVO qualityClaimVO);

    /**
     * Statements
     *
     * @param QualityClaimVO
     */
    public int updateReClaimOrder(QualityClaimVO qualityClaimVO);

    /**
     * Statements
     *
     * @param QualityClaimVO
     */
    public int updateQualityClaimBillNo(QualityClaimVO qualityClaimVO);

    /**
     * Statements
     *
     * @param OversAndShortsClaimVO
     */
    public int updateOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO);
    
    /**
     * Statements
     *
     * @param OversAndShortsClaimVO
     */
    public int updateOversAndShortsClaimStatus(OversAndShortsClaimVO oversAndShortsClaimVO);

    /**
     * Statements
     *
     * @param OversAndShortsClaimItemVO
     */
    public int updateOversAndShortsClaimItem(OversAndShortsClaimItemVO oversAndShortsClaimItemVO);

    /**
     * Statements
     *
     * @param OversAndShortsClaimItemVO
     */
    public int deleteOversAndShortsClaimItem(OversAndShortsClaimItemVO oversAndShortsClaimItemVO);
    
    /**
     * 조회조건에 해당하는 과부족클레임품목의 Validation 체크한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return 조회 목록
     */
    public int checkOversAndShortsClaimItemByDocNo(OversAndShortsClaimSearchVO searchVO);


    /**
     * 과부족클레임번호에 해당하는 부품라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimVO
     * @return 조회 목록 수
     */
    public int selectOversAndShortsClaimMaxLineNo(OversAndShortsClaimVO oversAndShortsClaimVO);


}
