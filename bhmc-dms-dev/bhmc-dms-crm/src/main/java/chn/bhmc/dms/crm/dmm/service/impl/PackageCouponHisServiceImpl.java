package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.PackageCouponHisDAO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponHisServiceImpl.java
 * @Description : 패키지 쿠폰 이력 서비스 구현체
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

@Service("packageCouponHisService")
public class PackageCouponHisServiceImpl extends HService implements PackageCouponHisService{

    /**
     * 패키지쿠폰 이력 DAO
     */
    @Resource(name="packageCouponHisDAO")
    PackageCouponHisDAO packageCouponHisDAO;

    /**
     * 패키지쿠폰 이력 Support Service
     */
    @Resource(name="packageCouponHisSupportService")
    PackageCouponHisSupportService packageCouponHisSupportService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#multiPackageCouponMasterMngs(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPackageCouponHiss(BaseSaveVO<PackageCouponHisVO> obj) throws Exception {
        for(PackageCouponHisVO packageCouponHisVO : obj.getInsertList()){
            insertPackageCouponHis(packageCouponHisVO);
        }
        for(PackageCouponHisVO packageCouponHisVO : obj.getUpdateList()){
            updatePackageCouponHis(packageCouponHisVO);
        }
        for(PackageCouponHisVO packageCouponHisVO : obj.getDeleteList()){
            deletePackageCouponHis(packageCouponHisVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#insertPackageCouponHis(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO)
     */
    @Override
    public int insertPackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception {
        // insert하기전 동일한 쿠폰 번호가 있는지 확인
        PackageCouponHisSearchVO searchVO = new PackageCouponHisSearchVO();
        searchVO.setsDlrCd(packageCouponHisVO.getDlrCd());
        searchVO.setsCupnNo(packageCouponHisVO.getCupnNo());

        PackageCouponHisVO hisVO = packageCouponHisDAO.selectPackageCouponHisByKey(searchVO);

        if(hisVO == null){
            packageCouponHisVO.setRegUsrId(LoginUtil.getUserId());
            packageCouponHisVO.setDlrCd(LoginUtil.getDlrCd());
            if(packageCouponHisVO.getCupnUseYn() == null || packageCouponHisVO.getCupnUseYn().equals("")){
                packageCouponHisVO.setCupnUseYn("N");
            }
            return packageCouponHisDAO.insertPackageCouponHis(packageCouponHisVO);
        }else{
            //이미 등록 된 {쿠폰번호} 입니다.
            throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("crm.lbl.cupnNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#updatePackageCouponHis(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO)
     */
    @Override
    public int updatePackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception {
        packageCouponHisVO.setUpdtUsrId(LoginUtil.getUserId());
        return packageCouponHisSupportService.updatePackageCouponHis(packageCouponHisVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#deletePackageCouponHis(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO)
     */
    @Override
    public int deletePackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception {
        return packageCouponHisDAO.deletePackageCouponHis(packageCouponHisVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#selectPackageCouponHisByKey(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO)
     */
    @Override
    public PackageCouponHisVO selectPackageCouponHisByKey(PackageCouponHisSearchVO searchVO) throws Exception {
        PackageCouponHisVO result = packageCouponHisDAO.selectPackageCouponHisByKey(searchVO);
        if(result ==  null){
            result = new PackageCouponHisVO();
            result.setIsResult(false);
            //사용할수 있는 쿠폰이 없습니다.
            result.setResultMsg(messageSource.getMessage("crm.err.noPackageCoupon", null, LocaleContextHolder.getLocale()));
        }
        return result;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#selectMembershipTransMngsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO)
     */
    @Override
    public int selectTransPackageCouponsByConditionCnt(PackageCouponHisSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return packageCouponHisDAO.selectTransPackageCouponsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#selectMembershipTransMngsByCondition(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO)
     */
    @Override
    public List<PackageCouponHisVO> selectTransPackageCouponsByCondition(PackageCouponHisSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return packageCouponHisDAO.selectTransPackageCouponsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#updatePackageCouponTransHis(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO)
     */
    @Override
    public int updatePackageCouponTransHis(PackageCouponHisVO packageCouponHisVO) throws Exception {
        if (StringUtils.isEmpty(packageCouponHisVO.getDlrCd())){packageCouponHisVO.setDlrCd(LoginUtil.getDlrCd());}
        return packageCouponHisSupportService.updatePackageCouponHis(packageCouponHisVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponHisService#insertPackageCouponTrnasHis(chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO)
     */
    @Override
    public int insertPackageCouponTransHis(PackageCouponHisVO packageCouponHisVO) throws Exception {
        // TODO 동일한 쿠폰번호가 있는지 확인이 필요하지만 양도의 경우 중복검사 안함
        return packageCouponHisDAO.insertPackageCouponTransHis(packageCouponHisVO);
    }

}
