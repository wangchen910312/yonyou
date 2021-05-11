package chn.bhmc.dms.bat.crm.css.service;

import chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointDelVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipPointDelService.java
 * @Description : 멤버십 소멸예정 포인트 소멸  서비스
 * @author Kim Hyun Ho
 * @since 2016. 6. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 24.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface BatMembershipPointDelService {

    /**
     * 멤버십포인트 소멸 배치
     * @param batMembershipPointDelVO
     * @return Count
     */
    public void deleteMembershipPointDel(BatMembershipPointDelVO delVO) throws Exception;
}
