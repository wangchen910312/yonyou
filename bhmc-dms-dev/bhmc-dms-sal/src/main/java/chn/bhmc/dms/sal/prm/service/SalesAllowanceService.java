package chn.bhmc.dms.sal.prm.service;

import java.util.List;

import chn.bhmc.dms.sal.prm.vo.SalesAllowanceSearchVO;
import chn.bhmc.dms.sal.prm.vo.SalesAllowanceVO;




/**
 *  Sales Allowance 현황 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.26         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface SalesAllowanceService {


    /**
     *  메인 조회
     */
    public int selectSalesAllowanceMainsByConditionCnt(SalesAllowanceSearchVO searchVO) throws Exception;
    public List<SalesAllowanceVO> selectSalesAllowanceMainsByCondition(SalesAllowanceSearchVO searchVO) throws Exception;


    /**
     *  메인 조회
     */
    public int selectSalesAllowanceSubsByConditionCnt(SalesAllowanceSearchVO searchVO) throws Exception;
    public List<SalesAllowanceVO> selectSalesAllowanceSubsByCondition(SalesAllowanceSearchVO searchVO) throws Exception;

}
