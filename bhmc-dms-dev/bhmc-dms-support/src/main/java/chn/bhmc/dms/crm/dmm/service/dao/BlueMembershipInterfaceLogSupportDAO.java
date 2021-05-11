package chn.bhmc.dms.crm.dmm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfLogVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipInterfaceLogSupportDAO
 * @Description : 블루멤버십 IF LOG DAO
 * @author Lee In Moon
 * @since 2017.03.03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017.03.03.     Lee In Moon     최초 생성
 * </pre>
 */

@Mapper("blueMembershipInterfaceLogSupportDAO")
public interface BlueMembershipInterfaceLogSupportDAO {

    /**
     * 블루멤버십 IF LOG 쌓는다
     * @param paramVO - dlrCd, bmIfParam, bmIfReturn
     */
    public int insertBlueMembershipInterfaceLog(BlueMembershipIfLogVO paramVO) throws Exception;

}

