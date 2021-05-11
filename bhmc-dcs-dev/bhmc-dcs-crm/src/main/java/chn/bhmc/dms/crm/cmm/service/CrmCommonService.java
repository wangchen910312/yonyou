package chn.bhmc.dms.crm.cmm.service;

import chn.bhmc.dms.crm.cmm.vo.CronMakerVO;

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

public interface CrmCommonService {

    /**
     * CRON 주기 설정 ( 초,분,시,일,월,주 -> Cron 주기 변환 )
     * @param CronMakerVO
     * @return CronMakerVO
     */
    public CronMakerVO cronExpression(CronMakerVO saveVO)throws Exception ;

}
