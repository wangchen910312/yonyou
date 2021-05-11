package chn.bhmc.dms.crm.css.service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionPresentService.java
 * @Description : 만족도 조사 낮은점수 처리관리
 * @author Kim Hyun Ho
 * @since 2016. 5. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 30.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface SatisFactionPresentService {

    /**
     * 만족도 낮은점수 처리 현황을 수정한다.
     * @param saveVO
     */
    public void multiSatisFactionPresent(BaseSaveVO<SatisFactionMobileResultVO> saveVO) throws Exception;

}
