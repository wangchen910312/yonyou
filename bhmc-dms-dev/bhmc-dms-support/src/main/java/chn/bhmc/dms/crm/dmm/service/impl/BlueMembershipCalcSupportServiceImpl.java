package chn.bhmc.dms.crm.dmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipCalcSupportDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcSupportServiceImpl.java
 * @Description : 블루멤버십 포인트 및 쿠폰 사용 이력 저장 서비스
 * @author Lee In Moon
 * @since 2016.09.03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.03.     Lee In Moon     최초 생성
 * </pre>
 */

@Service("blueMembershipCalcSupportService")
public class BlueMembershipCalcSupportServiceImpl extends HService implements BlueMembershipCalcSupportService{

    /**
     * 블루멤버십 정산 DAO
     */
    @Resource(name="blueMembershipCalcSupportDAO")
    BlueMembershipCalcSupportDAO blueMembershipCalcSupportDAO;

    /**
     * 블루멤버십 포인트 사용 이력 저장
     * @param calcVO - 검색할 정보가 담긴 BlueMembershipCalcVO
     * @return int
     */
    @Override
    public int insertBlueMembershipHis(BlueMembershipCalcVO calcVO) throws Exception {

        return blueMembershipCalcSupportDAO.insertBlueMembershipHis(calcVO);
    }

    /**
     * 블루멤버십 쿠폰 사용이력을 등록한다.
     * @param calcVO - 검색할 정보가 담긴 BlueMembershipCalcVO
     * @return int
     */
    @Override
    public int insertBlueMembershipCouponHis(BlueMembershipCalcVO calcVO) throws Exception {

        return blueMembershipCalcSupportDAO.insertBlueMembershipCouponHis(calcVO);
    }

}
