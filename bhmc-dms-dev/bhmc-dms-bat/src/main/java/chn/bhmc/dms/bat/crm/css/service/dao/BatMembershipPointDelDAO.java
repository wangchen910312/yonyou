package chn.bhmc.dms.bat.crm.css.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointDelVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipPointDelDAO.java
 * @Description : 멤버십 소멸예정 포인트 소멸 DAO.
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

@Mapper("batMembershipPointDelDAO")
public interface BatMembershipPointDelDAO {

    /**
     * 멤버십포인트 소멸 배치
     * @param batMembershipPointDelVO
     * @return Count
     */
    public void deleteMembershipPointDel(BatMembershipPointDelVO delVO) throws Exception;
}
