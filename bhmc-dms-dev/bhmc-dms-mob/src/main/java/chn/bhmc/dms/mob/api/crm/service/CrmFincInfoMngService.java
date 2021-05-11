package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.FincInfoMngVO;


/**
 *  금융정보관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.09         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface CrmFincInfoMngService {

    /**
     * CRM : 고객의 금융 정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCustFincInfosByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngVO> selectCustFincInfosByCondition(FincInfoMngSearchVO searchVO) throws Exception;

}
