package chn.bhmc.dms.crm.dmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinHistoryService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipJoinHistoryDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinHistoryServiceImpl.java
 * @Description : 블루멤버십 인증 히스토리
 * @author Lee In Moon
 * @since 2016.09.28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.28.     Lee In Moon     최초 생성
 * </pre>
 */

@Service("blueMembershipJoinHistoryService")
public class BlueMembershipJoinHistoryServiceImpl extends HService implements BlueMembershipJoinHistoryService{

    /**
     * 블루멤버십 인증 히스토리 DAO
     */
    @Resource(name="blueMembershipJoinHistoryDAO")
    BlueMembershipJoinHistoryDAO blueMembershipJoinHistoryDAO;

    /*
     * 블루멤버십 인증 히스토리 인서트
     */
    @Override
    public int insertBlueMembershipJoinHistory(BlueMembershipJoinVO joinVO) throws Exception {
        return blueMembershipJoinHistoryDAO.insertBlueMembershipJoinHistory(joinVO);

    }

}