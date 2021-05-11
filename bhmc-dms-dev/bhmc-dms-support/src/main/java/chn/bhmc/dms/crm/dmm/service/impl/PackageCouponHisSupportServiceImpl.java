package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.PackageCouponHisSupportDAO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponHisSupportServiceImpl.java
 * @Description : 패키지 쿠폰 이력 서비스 구현체
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

@Service("packageCouponHisSupportService")
public class PackageCouponHisSupportServiceImpl extends HService implements PackageCouponHisSupportService{

    /**
     * 패키지쿠폰 이력 DAO
     */
    @Resource(name="packageCouponHisSupportDAO")
    PackageCouponHisSupportDAO packageCouponHisSupportDAO;


    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#selectPackageCouponHissByConditionCnt(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO)
     */
    @Override
    public int selectPackageCouponHissByConditionCnt(PackageCouponHisSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return packageCouponHisSupportDAO.selectPackageCouponHissByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#selectPackageCouponHissByCondition(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO)
     */
    @Override
    public List<PackageCouponHisVO> selectPackageCouponHissByCondition(PackageCouponHisSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return packageCouponHisSupportDAO.selectPackageCouponHissByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#selectPackageCouponHisUseByKey(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO)
     */
    @Override
    public List<PackageCouponHisVO> selectPackageCouponHisUseCondition(PackageCouponHisSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        List<PackageCouponHisVO> result = packageCouponHisSupportDAO.selectPackageCouponHisUseCondition(searchVO);

        return result;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisSupportService#updatePackageCouponHis(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO)
     */
    @Override
    public int updatePackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception {
        return packageCouponHisSupportDAO.updatePackageCouponHis(packageCouponHisVO);
    }

}
