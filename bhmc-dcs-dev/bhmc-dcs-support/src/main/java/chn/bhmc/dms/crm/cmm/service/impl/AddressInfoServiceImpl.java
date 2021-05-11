package chn.bhmc.dms.crm.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.dao.AddressInfoDAO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;

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
@Service("addressInfoService")
public class AddressInfoServiceImpl extends HService implements AddressInfoService {

    /**
     * DAO
     */
    @Resource(name="addressInfoDAO")
    AddressInfoDAO addressInfoDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

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

        return addressInfoDAO.selectAddressInfoByConditionCnt(searchVO);
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

        return addressInfoDAO.selectAddressInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#multiAddressInfo(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiAddressInfo(BaseSaveVO<AddressInfoVO> obj) throws Exception {

        for(AddressInfoVO addressInfoVO : obj.getInsertList()) {
            insertAddressInfo(addressInfoVO);
        }

        for(AddressInfoVO addressInfoVO : obj.getUpdateList()) {
            updateAddressInfo(addressInfoVO);
        }

        for(AddressInfoVO addressInfoVO : obj.getDeleteList()) {
            deleteAddressInfo(addressInfoVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#insertAddressInfo(chn.bhmc.dms.crm.cmm.vo.AddressInfoVO)
     */
    @Override
    public int insertAddressInfo(AddressInfoVO addressInfoVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(addressInfoVO.getDlrCd())){addressInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(addressInfoVO.getPltCd())) {addressInfoVO.setPltCd(LoginUtil.getPltCd());}

        addressInfoVO.setRegUsrId(LoginUtil.getUserId());
        return addressInfoDAO.insertAddressInfo(addressInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#updateAddressInfo(chn.bhmc.dms.crm.cmm.vo.AddressInfoVO)
     */
    @Override
    public int updateAddressInfo(AddressInfoVO addressInfoVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(addressInfoVO.getDlrCd())){addressInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(addressInfoVO.getPltCd())) {addressInfoVO.setPltCd(LoginUtil.getPltCd());}

        addressInfoVO.setUpdtUsrId(LoginUtil.getUserId());
        return addressInfoDAO.updateAddressInfo(addressInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#deleteAddressInfo(chn.bhmc.dms.crm.cmm.vo.AddressInfoVO)
     */
    @Override
    public int deleteAddressInfo(AddressInfoVO addressInfoVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(addressInfoVO.getDlrCd())){addressInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(addressInfoVO.getPltCd())) {addressInfoVO.setPltCd(LoginUtil.getPltCd());}

        addressInfoVO.setUpdtUsrId(LoginUtil.getUserId());
        return addressInfoDAO.deleteAddressInfo(addressInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#selectAddressInfoByKey(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public AddressInfoVO selectAddressInfoByKey(String dlrCd, String pltCd, String refTableNm, String refKeyNm, String addrTp, String fullYn) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(dlrCd)) {dlrCd = LoginUtil.getDlrCd();}
        if (StringUtils.isEmpty(pltCd)) {pltCd = LoginUtil.getPltCd();}

        return addressInfoDAO.selectAddressInfoByKey(dlrCd, pltCd, refTableNm, refKeyNm, addrTp, fullYn);
    }





}
