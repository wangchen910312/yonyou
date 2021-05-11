package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.FreeServicePartSearchVO;
import chn.bhmc.dms.ser.wac.vo.FreeServicePartVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FreeServicePartService.java
 * @Description : 면비부품 서비스
 * @author Kwon ki hyun
 * @since 2016. 8. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 20.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface FreeServicePartService {


    /**
     *
     * 면비부품을 저장 / 수정 한다.
     *
     * @param freeServicePartVO
     * @return
     * @throws Exception
     */
    public String multiFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception;

    /**
    *
    * 면비 부품 정보를 등록한다.
    *
    * @param freeServicePartVO
    * @return
    * @throws Exception
    */
   public int insertFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception;

   /**
    *
    * 면비부품정보를 수정한다.
    *
    * @param freeServicePartVO
    * @return
    * @throws Exception
    */
   public int updateFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception;

   /**
    *
    * 면비부품정보를 삭제 한다.
    *
    * @param freeServicePartVO
    * @return
    * @throws Exception
    */
   public int deleteFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception;

   /**
    *
    * 면비부품 목록수를 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public int selectFreeServicePartByConditionCnt(FreeServicePartSearchVO searchVO)throws Exception;

   /**
    *
    * 면비부품 목록을 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public List<FreeServicePartVO> selectFreeServicePartByCondition(FreeServicePartSearchVO searchVO)throws Exception;

   /**
    *
    * 면비부품 상세 정보를 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public FreeServicePartVO selectFreeServicePartByKey(FreeServicePartSearchVO searchVO)throws Exception;

   /**
   *
   * 면비부품 상태 정보를 조회한다.
   *
   * @param searchVO
   * @return
   * @throws Exception
   */
  public String selectFreeItemRequestStatChkByKey(FreeServicePartVO freeServicePartVO)throws Exception;

  /**
   *
   * 면비부품을 Temp로 저장.
   *
   * @param sanbaoVO - 면비부품을 포함하는 sanbaoVO
   * @return bindingResult
   * @throws Exception
   */
  public int insertFreeItemToIf(FreeServicePartVO freeServicePartVO) throws Exception;


}
