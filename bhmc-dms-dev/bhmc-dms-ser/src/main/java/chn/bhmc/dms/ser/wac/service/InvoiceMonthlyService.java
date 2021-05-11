package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlyDeductVO;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlyDetailVO;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlySearchVO;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlyVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvoiceMonthlyService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface InvoiceMonthlyService {

    /**
    *
    * 인보이스 목록수 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 목록수
    * @throws Exception
    */
   public int selectInvoiceMonthlyByConditionCnt(InvoiceMonthlySearchVO searchVO)throws Exception;

   /**
    *
    * 인보이스 목록 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 목록
    * @throws Exception
    */
   public List<InvoiceMonthlyVO> selectInvoiceMonthlyByCondition(InvoiceMonthlySearchVO searchVO)throws Exception;

   /**
    *
    * 인보이스 상세 목록수 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 상세 목록수
    * @throws Exception
    */
   public int selectInvoiceMonthlyDetailByConditionCnt(InvoiceMonthlySearchVO searchVO)throws Exception;

   /**
    *
    * 인보이스 상세 목록 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 상세 목록
    * @throws Exception
    */
   public List<InvoiceMonthlyDetailVO> selectInvoiceMonthlyDetailByCondition(InvoiceMonthlySearchVO searchVO)throws Exception;

   /**
   *
   * 인보이스 공제  목록 조회
   *
   * @param InvoiceMonthlySearchVO
   * @return 인보이스 공제 목록
   * @throws Exception
   */
   public List<InvoiceMonthlyDeductVO> selectInvoiceMonthlyDeductByCondition(InvoiceMonthlySearchVO searchVO)throws Exception;

}
