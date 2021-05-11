package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService;
import chn.bhmc.dms.crm.dmm.service.dao.PackageCouponMasterMngDAO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponMasterMngServiceImpl.java
 * @Description : 패키지쿠폰 Master관리 구현체
 * @author Kim Hyun Ho
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("packageCouponMasterMngService")
public class PackageCouponMasterMngServiceImpl  extends HService implements PackageCouponMasterMngService{

    /**
     * 패키지쿠폰 Master관리 DAO
     */
    @Resource(name="packageCouponMasterMngDAO")
    PackageCouponMasterMngDAO packageCouponMasterMngDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService#selectPackageCouponMasterMngsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO)
     */
    @Override
    public int selectPackageCouponMasterMngsByConditionCnt(PackageCouponMasterMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return packageCouponMasterMngDAO.selectPackageCouponMasterMngsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService#selectPackageCouponMasterMngsByCondition(chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO)
     */
    @Override
    public List<PackageCouponMasterMngVO> selectPackageCouponMasterMngsByCondition(PackageCouponMasterMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return packageCouponMasterMngDAO.selectPackageCouponMasterMngsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService#multiSurveySatisFactions(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPackageCouponMasterMngs(BaseSaveVO<PackageCouponMasterMngVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(PackageCouponMasterMngVO packageCouponMasterMngVO : obj.getInsertList()){
            packageCouponMasterMngVO.setRegUsrId(userId);
            packageCouponMasterMngVO.setDlrCd(dlrCd);
            insertPackageCouponMasterMng(packageCouponMasterMngVO);
        }

        for(PackageCouponMasterMngVO packageCouponMasterMngVO : obj.getUpdateList()){
            packageCouponMasterMngVO.setUpdtUsrId(userId);
            updatePackageCouponMasterMng(packageCouponMasterMngVO);
        }

        for(PackageCouponMasterMngVO packageCouponMasterMngVO : obj.getDeleteList()){
            deletePackageCouponMasterMng(packageCouponMasterMngVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService#insertPackageCouponMasterMng(chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngVO)
     */
    @Override
    public int insertPackageCouponMasterMng(PackageCouponMasterMngVO packageCouponMasterMngVO) throws Exception {
        return packageCouponMasterMngDAO.insertPackageCouponMasterMng(packageCouponMasterMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService#updatePackageCouponMasterMng(chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngVO)
     */
    @Override
    public int updatePackageCouponMasterMng(PackageCouponMasterMngVO packageCouponMasterMngVO) throws Exception {
        return packageCouponMasterMngDAO.updatePackageCouponMasterMng(packageCouponMasterMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService#deletePackageCouponMasterMng(chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngVO)
     */
    @Override
    public int deletePackageCouponMasterMng(PackageCouponMasterMngVO packageCouponMasterMngVO) throws Exception {
        return packageCouponMasterMngDAO.deletePackageCouponMasterMng(packageCouponMasterMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService#selectPackageCouponMasterMngByKey(chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO)
     */
    @Override
    public PackageCouponMasterMngVO selectPackageCouponMasterMngByKey(PackageCouponMasterMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return packageCouponMasterMngDAO.selectPackageCouponMasterMngByKey(searchVO);
    }

}
