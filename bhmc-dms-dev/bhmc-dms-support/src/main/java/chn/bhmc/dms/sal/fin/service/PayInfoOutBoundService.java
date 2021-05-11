package chn.bhmc.dms.sal.fin.service;

import java.util.List;

import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundVO;


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

public interface PayInfoOutBoundService {

    /**
     * 수납관리 header목록을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public List<PayInfoOutBoundVO> selectPayInfosByCondition(PayInfoOutBoundSearchVO searchVO) throws Exception;

    /**
     * 수납관리 HEADER 정보 생성한다.
     **/
    public int insertPayInfoHeader(PayInfoOutBoundVO saveVO) throws Exception;
    public int updatePayInfoHeader(PayInfoOutBoundVO saveVO) throws Exception;
    
    /**
     * 정산상태를 변경한다.
     **/
    public int changePayInfo(PayInfoOutBoundDetailVO saveVO) throws Exception;

    
}
