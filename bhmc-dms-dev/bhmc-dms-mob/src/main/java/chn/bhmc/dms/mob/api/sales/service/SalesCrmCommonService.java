package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.UserVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmCommonService.java
 * @Description : Crm 공통 Service
 * @author In Moon Lee
 * @since 2016.06.02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.02.     In Moon Lee     최초 생성
 * </pre>
 */

public interface SalesCrmCommonService {

   
    /**
     * 판매고문 목록 리스트
     * @param sSysCd 시스템구분 'D':딜러, 'I':법인
     * @param sDlrCd 로그인 사용자 딜러
     * @param sRoleId 역할ID
     * @return
     * @throws Exception
     */
    public List<UserVO> selectMngScIdListByCondition() throws Exception;

   


}
