package chn.bhmc.dms.ser.wac.service.dao;

import java.util.Date;
import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.wac.vo.PwaLbrVO;
import chn.bhmc.dms.ser.wac.vo.PwaPartVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveDAO.java
 * @Description : Pwa 승인에 관한 데이터처리 매퍼 클래스 
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
@Mapper("pwaApproveDAO")
public interface PwaApproveDAO {

    

    /**
     * PWA 승인 상태를 수정한다.
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int updateStatePwaApproves(PwaVO pwaVO)throws Exception;
 
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
    public int selectPwaApproveMainsByConditionCnt(PwaSearchVO searchVO) throws Exception;

    /**
    * 
    * PWA 승인 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 목록 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaApproveMainsByCondition(PwaSearchVO searchVO)throws Exception;

    /**
    * 
    * PWA 공임 정보 데이터 갯수 를  조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApproveLbrsByConditionCnt(PwaSearchVO searchVO) throws Exception;

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
    * @return PWA 부품  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApprovePartsByConditionCnt(PwaSearchVO searchVO)throws Exception;

    /**
    * 
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 부품  정보 데이터
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
    public PwaVO selectPwaApproveByKey(PwaSearchVO searchVO)throws Exception;
    
    /**
     * PWA 반력 이력 헤더
     * Statements
     *
     * @param pwaVO
     * @return 
     * @throws Exception
     */
    public int insertPwaReturn(PwaVO pwaVO)throws Exception;
    
    /**
     * PWA 반력 이력 부품
     * Statements
     *
     * @param pwaVO
     * @return 
     * @throws Exception
     */
    public int insertPwaPartReturn(PwaVO pwaVO)throws Exception;
    
    /**
     * PWA 반력 이력 공임
     * Statements
     *
     * @param pwaVO
     * @return 
     * @throws Exception
     */
    public int insertPwaLaborReturn(PwaVO pwaVO)throws Exception;
    
    /**
     * PWA 반력 SEQ
     * Statements
     *
     * @param pwaVO
     * @return 
     * @throws Exception
     */
    public int selectPwaReturnHistSeqByKey(PwaVO pwaVO)throws Exception;
    
    
    /**
    * 
    * PWA 이력 데이터 목록수 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 데이터 목록수 
    * @throws Exception
    */
    public int selectPwaHistoryByConditionCnt(PwaSearchVO searchVO) throws Exception;

    /**
    * 
    * PWA 이력 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 목록 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaHistoryByCondition(PwaSearchVO searchVO)throws Exception;
    /**
     * 特殊车辆查询保修结束日期
     * @param vinNo
     * @return
     */
	public Integer selectSpecialCarWarrantyEndInfo(String vinNo);

	/**
     * 车辆查询保修结束日期
     * @param vinNo
     * @return
     */
	public Date selectCarWarrantyEndDtByKey(PwaVO pwaVO);
     
}

