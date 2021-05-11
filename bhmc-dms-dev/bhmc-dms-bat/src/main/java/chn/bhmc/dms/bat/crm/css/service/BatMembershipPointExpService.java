package chn.bhmc.dms.bat.crm.css.service;

import chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointExpVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipPointExpService.java
 * @Description : 멤버십 포인트 소멸예정 배치서비스
 * @author Kim Hyun Ho
 * @since 2016. 6. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface BatMembershipPointExpService {

    /**
     * 멤버십포인트 소멸예정 배치
     * @param null
     * @return Count
     */
    public int insertMembershipPointExp(BatMembershipPointExpVO expVO) throws Exception;

}
