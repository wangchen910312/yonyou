package chn.bhmc.dms.ser.wac.service.dao;

import java.util.Date;
import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaLbrVO;
import chn.bhmc.dms.ser.wac.vo.PwaPartVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaRequestDAO.java
 * @Description : PWA 요청에 관한 데이터처리 매퍼 클래스
 * @author Kwon Ki Hyun
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("pwaRequestDAO")
public interface PwaRequestDAO {

    /**
    *
    * PWA 요청 데이터 목록수 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 요청 데이터 목록수
    * @throws Exception
    */
    public int selectPwaRequestMainsByConditionCnt(PwaSearchVO searchVO)throws Exception;

    /**
    *
    * PWA 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 요청 목록 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaRequestMainsByCondition(PwaSearchVO searchVO)throws Exception;

    /**
    *
    * PWA 상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
    public PwaVO selectPwaRequestByKey(PwaSearchVO searchVO)throws Exception;

    /**
    *
    * PWA 공임 정보 데이터 갯수 를  조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaRequestLbrsByConditionCnt(PwaSearchVO searchVO) throws Exception;

    /**
    *
    * PWA 공임 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaLbrVO> selectPwaRequestLbrsByCondition(PwaSearchVO searchVO) throws Exception;

    /**
    *
    * PWA 부품 정보 데이터 갯수 를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaRequestPartsByConditionCnt(PwaSearchVO searchVO) throws Exception;

    /**
    *
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaPartVO> selectPwaRequestPartsByCondition(PwaSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 공임수을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectRoLaborsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<PwaLbrVO> selectRoLaborsByCondition(TabInfoSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 부품목록수 을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectRoPartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<PwaPartVO> selectRoPartsByCondition(TabInfoSearchVO searchVO) throws Exception;


    /**
     *
     * MAX PWA DOC NO 를 조회한다.
     *
     * @param searchVO - 조회조건을 포함한 PwaSearchVO
     * @return MAX PWA DOC NO
     * @throws Exception
     */
    public String selectPwaRequestMaxDocNo(@Param("dlrCd") String dlrCd)throws Exception;

    /**
    *
    * PWA 요청 정보를 등록한다.
    *
    * @param saveVO - PWA 요청 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertPwaRequests(PwaVO pwaVO) throws Exception;


    /**
    *
    * PWA 요청 정보를 수정한다.
    *
    * @param saveVO - PWA 요청 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updatePwaRequests(PwaVO pwaVO)throws Exception;

    /**
    *
    * PWA 요청 정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deletePwaRequests(PwaVO pwaVO) throws Exception;

    /**
    *
    * PWA 요청 공임 정보를 등록한다.
    *
    * @param saveVO - PWA 요청 공임 등록  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertPwaRequestLabor(PwaLbrVO lbrVO) throws Exception;

    /**
    *
    * PWA 요청 공임 정보를 수정한다.
    *
    * @param saveVO - PWA 요청 공임 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updatePwaRequestLabor(PwaLbrVO lbrVO) throws Exception;

    /**
    *
    * PWA 요청 공임 정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 공임 삭제  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deletePwaRequestLabor(PwaLbrVO lbrVO) throws Exception;

    /**
    *
    * PWA 요청 부품 정보를 등록한다.
    *
    * @param saveVO - PWA 요청 부품 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertPwaRequestPart(PwaPartVO partVO) throws Exception;

    /**
    *
    * PWA 요청 부품 정보를 수정한다.
    *
    * @param saveVO - PWA 요청 부품 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updatePwaRequestPart(PwaPartVO partVO) throws Exception;

   /**
    *
    * PWA 요청 전체 공임 정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 공임 전체 삭제  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deletePwaRequestLaborAll(PwaVO pwaVO) throws Exception;

    /**
    *
    * PWA 요청 전체 부품 정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 부품 전체 삭제  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deletePwaRequestPartAll(PwaVO pwaVO) throws Exception;

    /**
    *
    * PWA 요청 부품 정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 부품 삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deletePwaRequestPart(PwaPartVO partVO) throws Exception;

    /**
    *
    * PWA 요청 상태정보를 수정한다.
    *
    * @param saveVO - PWA 요청 상태정보를 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updatePwaRequestStat(PwaVO pwaVO) throws Exception;


    /**
    *
    * PWA 요청  정보를 프로시져로 등록한다.
    *
    * @param saveVO - PWA 요청 부품 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertPwaRequestToIf(PwaVO pwaVO) throws Exception;



    /**
     *
     * PWA 요청 상태 정보를 조회 한다.
     *
     * @param saveVO - PWA 요청 상태 정보를 조회 한다.
     * @return bindingResult
     * @throws Exception
     */
    public String selectPwaRequestStatChkByKey(PwaVO pwaVO) throws Exception;

    /**
    *
    * PWA 요청  인터페이스 전송 여부 조회
    *
    * @param saveVO - PWA 요청  인터페이스 전송 여부 조회
    * @return bindingResult
    * @throws Exception
    */
   public int selectPwaRequestIfSendByConditionCnt(PwaVO pwaVO) throws Exception;

   /**
   *
   * PWA 요청 인터페이스  정보를 삭제한다.
   *
   * @param saveVO - PWA 요청 부품 전체 삭제  목록을 포함하는 SaveVO
   * @return bindingResult
   * @throws Exception
   */
   public int deleteIfPwaRequests(PwaVO pwaVO) throws Exception;

   /**
   *
   * PWA 요청 부품 인터페이스 정보를 삭제한다.
   *
   * @param saveVO - PWA 요청 부품 삭제 목록을 포함하는 SaveVO
   * @return bindingResult
   * @throws Exception
   */
   public int deleteIfPwaRequestLabor(PwaVO pwaVO) throws Exception;

   /**
    *
    * PWA 요청 부품 인터페이스  정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 부품 삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   public int deleteIfPwaRequestPart(PwaVO pwaVO) throws Exception;

   /**
    *
    * PWA 요청 인터페이스  정보를 등록한다.
    *
    * @param saveVO - PWA 요청 부품 전체 등록  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   public int insertIfPwaRequests(PwaVO pwaVO) throws Exception;

   /**
    *
    * PWA 요청 부품 인터페이스 정보를 등록한다.
    *
    * @param saveVO - PWA 요청 부품 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   public int insertIfPwaRequestParts(PwaVO pwaVO) throws Exception;

   /**
    *
    * PWA 요청 부품 인터페이스  정보를 등록한다.
    *
    * @param saveVO - PWA 요청 부품 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   public int insertIfPwaRequestLabors(PwaVO pwaVO) throws Exception;

   /**
    *
    * PWA 요청 정보 rollback
    *
    * @param saveVO - PWA 요청 부품 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   public int updatePwaRequestRollBack(PwaVO pwaVO) throws Exception;

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
     * 获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态的 csr清单 　62 贾明 2020-3-24
     * @param searchVO
     * @return
     * @throws Exception
     */
     public int selectPwaRelateRequiMainsByConditionCnt(PwaSearchVO searchVO)throws Exception;

    /**
     * 获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态的 csr清单 　62 贾明 2020-3-24
     * @param searchVO
     * @return
     * @throws Exception
     */
     public List<PwaVO> selectPwaRelateRequiMainsByCondition(PwaSearchVO searchVO)throws Exception;
     
     /**
      * 结算单关联过延保索赔结算类型的PWA单据； 结算单已关联过PWA申请，请修改
      * 获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态的 csr清单 　62 贾明 2020-3-27
      * @param searchVO
      * @return
      * @throws Exception
      */
     public List<PwaVO> selectPwaRelateRequiByCondition(PwaSearchVO searchVO)throws Exception;
	 public Integer selectSpecialCarWarrantyEndInfo(String vinNo)throws Exception;
	 public Date selectCarWarrantyEndDtByKey(PwaVO pwaVO);
}
