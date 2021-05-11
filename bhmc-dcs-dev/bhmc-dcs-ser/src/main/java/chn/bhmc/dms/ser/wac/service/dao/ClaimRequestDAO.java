package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import able.com.vo.HMap;

import chn.bhmc.dms.ser.wac.vo.ClaimReqLbrVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqPartVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqRtnVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimRequestDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("claimRequestDAO")
public interface ClaimRequestDAO {


    /**
    *
    * 클레임 요청 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록수 데이터
    * @throws Exception
    */
    public int selectClaimRequestForRoByConditionCnt(ClaimReqSearchVO searchVO)throws Exception;


    /**
    *
    * 클레임 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqVO> selectClaimRequestForRoByCondition(ClaimReqSearchVO searchVO)throws Exception;

    /**
     *
     * 클레임 목록수 데이터 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 목록수 데이터
     * @throws Exception
     */
    public int selectClaimRequestForClaimByConditionCnt(ClaimReqSearchVO searchVO)throws Exception;

    /**
     *
     * 클레임 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 목록 데이터
     * @throws Exception
     */
    public List<ClaimReqVO> selectClaimRequestForClaimByCondition(ClaimReqSearchVO searchVO)throws Exception;

    /**
    *
    * 클레임 요청 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 상세 데이터
    * @throws Exception
    */
    public ClaimReqVO selectClaimRequestForRoByKey(ClaimReqSearchVO searchVO)throws Exception;

    /**
    *
    * 클레임 요청 공임 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 공임 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqLbrVO> selectClaimRequestForRoLabourByCondition(ClaimReqSearchVO searchVO)throws Exception;

    /**
    *
    * 클레임 요청 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqPartVO> selectClaimRequestForRoPartByCondition(ClaimReqSearchVO searchVO)throws Exception;

    /**
    *
    * 등록된 클레임 요청 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 상세 데이터
    * @throws Exception
    */
    public ClaimReqVO selectClaimRequestForClaimByKey(ClaimReqSearchVO searchVO)throws Exception;

    /**
    *
    * 등록된 클레임 요청 공임 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 공임 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqLbrVO> selectClaimRequestForClaimLabourByCondition(ClaimReqSearchVO searchVO)throws Exception;

    /**
    *
    * 등록된 클레임 요청 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqPartVO> selectClaimRequestForClaimPartByCondition(ClaimReqSearchVO searchVO)throws Exception;

    /**
    *
    * 클레임 요청 공임 정보를 등록 한다.
    *
    * @param saveVO - 클레임 요청 공임  등록 목록을 포함하는 ClaimReqLbrVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertClaimRequestLabour(ClaimReqLbrVO claimReqLbrVO)throws Exception;

    /**
     *
     * 클레임 부품 요청  정보를 등록 한다.
     *
     * @param saveVO - 클레임 요청 부품 등록 목록을 포함하는 ClaimReqPartVO
     * @return bindingResult
     * @throws Exception
     */
    public int insertClaimRequestPart(ClaimReqPartVO claimReqPartVO)throws Exception;

    /**
     *
     * 클레임 요청 공임 정보를 수정 한다.
     *
     * @param saveVO - 클레임 요청 공임  수정 목록을 포함하는 ClaimReqLbrVO
     * @return bindingResult
     * @throws Exception
     */
    public int updateClaimRequestLabour(ClaimReqLbrVO claimReqLbrVO)throws Exception;

    /**
     *
     * 클레임 부품 요청  정보를 수정 한다.
     *
     * @param saveVO - 클레임 요청 부품 수정  목록을 포함하는 ClaimReqPartVO
     * @return bindingResult
     * @throws Exception
     */
    public int updateClaimRequestPart(ClaimReqPartVO claimReqPartVO)throws Exception;

    /**
     *
     * 클레임 요청 공임 정보를 삭제 한다.
     *
     * @param saveVO - 클레임 요청 공임  삭제 목록을 포함하는 ClaimReqLbrVO
     * @return bindingResult
     * @throws Exception
     */
    public int deleteClaimRequestLabour(ClaimReqLbrVO claimReqLbrVO)throws Exception;

    /**
     *
     * 클레임 부품 요청  정보를 삭제 한다.
     *
     * @param saveVO - 클레임 요청 부품 삭제  목록을 포함하는 ClaimReqPartVO
     * @return bindingResult
     * @throws Exception
     */
    public int deleteClaimRequestPart(ClaimReqPartVO claimReqPartVO)throws Exception;

    /**
     *
     * 클레임 요청  정보를 등록 한다.
     *
     * @param saveVO - 클레임 요청 등록 목록을 포함하는 ClaimReqVO
     * @return bindingResult
     * @throws Exception
     */
    public int insertClaimRequest(ClaimReqVO claimReqVO)throws Exception;

    /**
    *
    * 클레임 요청  정보를 수정 한다.
    *
    * @param saveVO - 클레임 요청 수정 목록을 포함하는 ClaimReqVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateClaimRequest(ClaimReqVO claimReqVO)throws Exception;

    /**
    *
    * 클레임 요청  정보를 프로시져로 등록한다.
    *
    * @param saveVO - 클레임 요청 부품 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertClaimToTemp(ClaimReqVO claimReqVO) throws Exception;

    /**
     *
     * PIO 부품 체크
     *
     * @param claimReqVO
     * @return
     * @throws Exception
     */
    public int selectClaimRequestChkPioItems(ClaimReqVO claimReqVO) throws Exception;

    /**
     *
     * 클레임 반송 사유 조회
     *
     * @param claimReqVO
     * @return
     * @throws Exception
     */
    public List<ClaimReqRtnVO> selectClaimRequestReturnByCondition(ClaimReqSearchVO searchVO) throws Exception;

    /**
     *
     * 클레임 신청/신청취소/삼포 VIN 체크
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public HMap selectClaimRequestChk(HMap paramsMap) throws Exception;

}
