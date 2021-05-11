package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CouponService;
import chn.bhmc.dms.crm.dmm.service.dao.CouponDAO;
import chn.bhmc.dms.crm.dmm.vo.CouponSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CouponVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CouponServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("couponService")
public class CouponServiceImpl   extends HService implements CouponService{

    /**
     * 쿠폰 DAO
     */
    @Resource(name="couponDAO")
    CouponDAO couponDAO;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CouponService#selectCouponsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.CouponSearchVO)
     */
    @Override
    public int selectCouponsByConditionCnt(CouponSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return couponDAO.selectCouponsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CouponService#selectCouponsByCondition(chn.bhmc.dms.crm.dmm.vo.CouponSearchVO)
     */
    @Override
    public List<CouponVO> selectCouponsByCondition(CouponSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return couponDAO.selectCouponsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CouponService#multiPackageCouponMasterMngs(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCoupons(BaseSaveVO<CouponVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(CouponVO couponVO : obj.getInsertList()){
            couponVO.setRegUsrId(userId);
            couponVO.setDlrCd(dlrCd);
            insertCoupon(couponVO);
        }

        for(CouponVO couponVO : obj.getUpdateList()){
            couponVO.setUpdtUsrId(userId);
            updateCoupon(couponVO);
        }

        for(CouponVO couponVO : obj.getDeleteList()){
            deleteCoupon(couponVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CouponService#insertCoupon(chn.bhmc.dms.crm.dmm.vo.CouponVO)
     */
    @Override
    public int insertCoupon(CouponVO couponVO) throws Exception {
        // TODO Auto-generated method stub
        return couponDAO.insertCoupon(couponVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CouponService#updateCoupon(chn.bhmc.dms.crm.dmm.vo.CouponVO)
     */
    @Override
    public int updateCoupon(CouponVO couponVO) throws Exception {
        // TODO Auto-generated method stub
        return couponDAO.updateCoupon(couponVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CouponService#deleteCoupon(chn.bhmc.dms.crm.dmm.vo.CouponVO)
     */
    @Override
    public int deleteCoupon(CouponVO couponVO) throws Exception {
        // TODO Auto-generated method stub
        return couponDAO.deleteCoupon(couponVO);
    }

}
