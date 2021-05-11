package chn.bhmc.dms.sal.fin.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

import chn.bhmc.dms.sal.fin.vo.PayInfoDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoVO;
import chn.bhmc.dms.sal.fin.vo.ResponseData;


/**
 *  수납관리 서비스
 *
 * @author Kang Seok Han
 * @since 2017. 1. 09.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.09         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface PayInfoService {

    /**
     * 수납관리 header목록을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectPayInfosByConditionCnt(PayInfoSearchVO searchVO) throws Exception;
    public List<PayInfoVO> selectPayInfosByCondition(PayInfoSearchVO searchVO) throws Exception;

    /**
     * 수납관리 detail목록을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectPayInfoDetailsByConditionCnt(PayInfoSearchVO searchVO) throws Exception;
    public List<PayInfoDetailVO> selectPayInfoDetailsByCondition(PayInfoSearchVO searchVO) throws Exception;
    
    /**
     * 수납관리 HEADER 정보 생성한다.
     **/
    public int insertPayInfoHeader(PayInfoVO saveVO) throws Exception;
    public int updatePayInfoHeader(PayInfoVO saveVO) throws Exception;
    
    /**
     * 수납관리 Header 정보 생성/저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int multiPayInfoHeader(PayInfoVO saveVO)  throws Exception;
    
    /**
     * 수납 입금을 환불한다.
     */
    public ResponseData saveReFundPayInfo(BaseSaveVO<PayInfoDetailVO> payInfoVO) throws Exception;
    
    /**
     * 수납 내역 전체를 취소한다
     **/
    public int cancelPayInfo(PayInfoVO cancelVO) throws Exception;
    
    /**
     * 수납처리를 한다.
     **/
    public int savePayInfo(PayInfoDetailVO saveVO) throws Exception;
    
    /**
     * CRM 포인트로 교환한 용품의 수납처리를 한다.
     */
    public int saveCrmGoodsPointPayInfo(PayInfoDetailVO saveVO) throws Exception;
    
    /**
     * 정산상태를 변경한다.
     **/
    public int changePayInfo(PayInfoDetailVO saveVO) throws Exception;
    
    /**
     * 수납을 지운다. (예약판매, 보험)
     **/
    public int deltePayinfoDetail(PayInfoVO vo) throws Exception;
    public int deltePayinfoHeader(PayInfoVO vo) throws Exception;

    /**
     * 수납관리 header 상세정보를 조회한다.
     * @param searchVO
     * @return PayInfoVO
     * @throws Exception
     */
    public PayInfoVO selectPayInfosByKey (PayInfoSearchVO searchVO) throws Exception;

    /**
     * 완성차의 기동차영수증조회
     **/
    public PayInfoVO selectReceiptSearchByKey (PayInfoSearchVO searchVO) throws Exception;

}
