package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.PwaLbrVO;
import chn.bhmc.dms.ser.wac.vo.PwaPartVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveService.java
 * @Description : PWA 승인 서비스
 * @author Kwon Ki Hyun
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface PwaApproveService {

    
    /**
     * PWA 승인 상태를 수정한다.
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public PwaVO updateStatePwaApproves(PwaVO pwaVO) throws Exception;

    /**
     * 클레임에서 사용된 RO NO를  승인된 PWA 에 등록한다.
     * Statements
     *
     * @param pwaVO
     * @return 
     * @throws Exception
     */
    public int updatePwaApproveNoInClaim(PwaVO pwaVO)throws Exception;
    
    /**
     * 
     * PWA 승인 데이터 목록수 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return PWA 승인 데이터 목록수 
     * @throws Exception
     */
    public int selectPwaApproveMainsByConditionCnt(PwaSearchVO searchVO)throws Exception;

    /**
    * 
    * PWA 승인 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 목록 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaApproveMainsByCondition(PwaSearchVO searchVO) throws Exception;
    
    /**
    * 
    * PWA 공임 정보 데이터 갯수 를  조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApproveLbrsByConditionCnt(PwaSearchVO searchVO)throws Exception;

    /**
    * 
    * PWA 공임 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaLbrVO> selectPwaApproveLbrsByCondition(PwaSearchVO searchVO)throws Exception;

    /**
    * 
    * PWA 부품 정보 데이터 갯수 를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApprovePartsByConditionCnt(PwaSearchVO searchVO)throws Exception;

    /**
    * 
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaPartVO> selectPwaApprovePartsByCondition(PwaSearchVO searchVO) throws Exception;

    /**
    * 
    * 승인 PWA 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 승인 PWA  정보 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaApproveClaimByCondition(PwaSearchVO searchVO) throws Exception;

    /**
    * 
    * PWA 상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
    public PwaVO selectPwaApproveByKey(PwaSearchVO searchVO) throws Exception;

}
