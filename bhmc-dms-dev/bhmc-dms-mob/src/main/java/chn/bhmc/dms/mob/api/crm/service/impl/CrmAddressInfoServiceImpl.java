package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmAddressInfoDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmAddressInfoService;
import chn.bhmc.dms.mob.api.crm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.AddressInfoVO;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddressInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 25.     Kyo Jin Lee     최초 생성
 * </pre>
 */
@Service("CrmaddressInfoService")
public class CrmAddressInfoServiceImpl extends HService implements CrmAddressInfoService {

    /**
     * DAO
     */
    @Resource(name="CrmaddressInfoDAO")
    CrmAddressInfoDAO CrmaddressInfoDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    @Resource(name="contractReOutBoundService")
    ContractReOutBoundService contractReOutBoundService;

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#selectAddressInfoByConditionCnt(chn.bhmc.dms.crm.cmm.vo.AddressInfoVO)
     */
    @Override
    public int selectAddressInfoByConditionCnt(AddressInfoSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        // 참조 테이블이 없는 경우 기본 고객 테이블 참조
        if (StringUtils.isEmpty(searchVO.getsRefTableNm())) {
            searchVO.setsRefTableNm("CR_0101T");
        }

        return CrmaddressInfoDAO.selectAddressInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#selectAddressInfoByCondition(chn.bhmc.dms.crm.cmm.vo.AddressInfoVO)
     */
    @Override
    public List<AddressInfoVO> selectAddressInfoByCondition(AddressInfoSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        // 참조 테이블이 없는 경우 기본 고객 테이블 참조
        if (StringUtils.isEmpty(searchVO.getsRefTableNm())) {
            searchVO.setsRefTableNm("CR_0101T");
        }

        return CrmaddressInfoDAO.selectAddressInfoByCondition(searchVO);
    }


}