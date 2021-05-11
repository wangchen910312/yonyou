package chn.bhmc.dms.crm.cmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.dao.AddressInfoDAO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
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
@Service("addressInfoService")
public class AddressInfoServiceImpl extends HService implements AddressInfoService {

    /**
     * DAO
     */
    @Resource(name="addressInfoDAO")
    AddressInfoDAO addressInfoDAO;

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

        // 고객 주소 등록의 경우 대표주소가 반드시 1개 있어야 한다.
        // 없는 경우 마지막을 대표주소로 처리하도록 한다.
//        String refTableNm = "";
//        String flagChk = "N";
//        if ((obj.getInsertList().size() != 0) || (obj.getUpdateList().size() != 0)) {
//            for(AddressInfoVO addressInfoVO : obj.getInsertList()) {
//                refTableNm = addressInfoVO.getRefTableNm();
//                if ("CR_0101T".equals(refTableNm)){
//                    if ("N".equals(flagChk)) {
//                        if ("Y".equals(addressInfoVO.getFlagYn())) {
//                            flagChk = "Y";
//                        }
//                    } else {
//                        addressInfoVO.setFlagYn("N");
//                    }
//                }
//            }
//
//            for(AddressInfoVO addressInfoVO : obj.getUpdateList()) {
//                refTableNm = addressInfoVO.getRefTableNm();
//                if ("CR_0101T".equals(refTableNm)){
//                    if ("N".equals(flagChk)) {
//                        if ("Y".equals(addressInfoVO.getFlagYn())) {
//                            flagChk = "Y";
//                        }
//                    } else {
//                        addressInfoVO.setFlagYn("N");
//                    }
//                }
//            }
//
//            if (("CR_0101T".equals(refTableNm)) && ("N".equals(flagChk))) {
//                throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.lbl.selectAddr", null, LocaleContextHolder.getLocale())});
//            }
//        }

        for(AddressInfoVO addressInfoVO : obj.getUpdateList()) {
            updateAddressInfo(addressInfoVO);
        }

        for(AddressInfoVO addressInfoVO : obj.getDeleteList()) {
            deleteAddressInfo(addressInfoVO);
        }

        for(AddressInfoVO addressInfoVO : obj.getInsertList()) {
            insertAddressInfo(addressInfoVO);
        }

        if ( obj.getInsertList().size() > 0 || obj.getUpdateList().size() > 0 || obj.getDeleteList().size() > 0 ) {

            AddressInfoVO addressInfoVO = new AddressInfoVO();
            if ( obj.getUpdateList().size() > 0 ) {
                addressInfoVO = obj.getUpdateList().get(0);
            } else if ( obj.getDeleteList().size() > 0 ) {
                addressInfoVO = obj.getDeleteList().get(0);
            } else if ( obj.getInsertList().size() > 0 ) {
                addressInfoVO = obj.getInsertList().get(0);
            }
            // 주소 등록 후(등록,수정) addrTp:02(주소타입 : 영수증주소) 가 있는지 체크
            if (selectAddressTpCheck(addressInfoVO) > 1 ){
                throw processException("global.info.itemOnlyMsg", new String[]{
                        messageSource.getMessage("sal.lbl.addrTp", null, LocaleContextHolder.getLocale())
                        ,messageSource.getMessage("crm.lbl.invoiceTp", null, LocaleContextHolder.getLocale())
                });
            }

        }


    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#insertAddressInfo(chn.bhmc.dms.crm.cmm.vo.AddressInfoVO)
     */
    @Override
    public int insertAddressInfo(AddressInfoVO addressInfoVO) throws Exception {
        try {
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(addressInfoVO.getDlrCd())){addressInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(addressInfoVO.getPltCd())) {addressInfoVO.setPltCd(LoginUtil.getPltCd());}

            if (StringUtils.isEmpty(addressInfoVO.getSungCd())){
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.sungNm", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(addressInfoVO.getCityCd())){
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.cityNm", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(addressInfoVO.getDistCd())){
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.distNm", null, LocaleContextHolder.getLocale())});
            }

            // 주소 등록 전 addrTp:02(주소타입 : 영수증주소) 가 있는지 체크
            if ("02".equals(addressInfoVO.getAddrTp())) {

                if (selectAddressTpCheck(addressInfoVO) > 1 ){
                    throw processException("global.info.itemOnlyMsg", new String[]{
                            messageSource.getMessage("sal.lbl.addrTp", null, LocaleContextHolder.getLocale())
                            ,messageSource.getMessage("crm.lbl.invoiceTp", null, LocaleContextHolder.getLocale())
                    });
                }

            }

            addressInfoVO.setRegUsrId(LoginUtil.getUserId());
            addressInfoDAO.insertAddressInfo(addressInfoVO);

            return updateAddressFlagYnChk(addressInfoVO);

        } catch (Exception e) {
            throw new BizException(e.getMessage());
        }
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
        addressInfoDAO.updateAddressInfo(addressInfoVO);

        updateAddressFlagYnChk(addressInfoVO);

        // 고객쪽 업데이트 후 판매정보 업데이트를 위한 서비스 호출
        if ("CR_0101T".equals(addressInfoVO.getRefTableNm())) {
            contractReOutBoundService.updateContractCustInfo(addressInfoVO.getrefKeyNm(), addressInfoVO.getDlrCd());
        }

        return 1;
    }

    public int updateAddressFlagYnChk(AddressInfoVO addressInfoVO) throws Exception {

        /* 고객에는 flag_Yn이 무조건 1건이여야 합니다.
         * 고객에 대해서 체크를 하여 2건일 경우 최신 정보를 Y로 처리 하도록 한다.
         * 고객 주소인 경우만 체크 하도록 한다.
         */

        if ( "CR_0101T".equals(addressInfoVO.getRefTableNm()) ) {
            AddressInfoSearchVO addressInfoSearchVO = new AddressInfoSearchVO();

            addressInfoSearchVO.setsRefKeyNm(addressInfoVO.getrefKeyNm());
            addressInfoSearchVO.setsFlagYn("Y");
            addressInfoSearchVO.setsDlrCd(addressInfoVO.getDlrCd());

            if ( StringUtils.isEmpty(addressInfoSearchVO.getsDlrCd()) ) {
                addressInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            }

            List<AddressInfoVO> addChkList =addressInfoDAO.selectAddressInfoByCondition(addressInfoSearchVO);

            if ( addChkList != null && addChkList.size() >= 2 )  {
                // Y 로 된것중 최근것을 Y로 업데이트 한다.
                String addrSeq = addChkList.get(0).getSeq();  // 최신 1건
                for(AddressInfoVO addressInfoUdtVO : addChkList) {
                    addressInfoUdtVO.setFlagYn("N");
                    addressInfoUdtVO.setRefTableNm("CR_0101T");
                    addressInfoDAO.updateAddressInfo(addressInfoUdtVO);
                }
                addressInfoVO.setFlagYn("Y");
                addressInfoVO.setSeq(addrSeq);
                addressInfoDAO.updateAddressInfo(addressInfoVO);
            }
        }

        return 1;
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
        addressInfoDAO.deleteAddressInfo(addressInfoVO);
        return updateAddressFlagYnChk(addressInfoVO);
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

    /*
     * @see chn.bhmc.dms.crm.cmm.service.AddressInfoService#updateAddressInfoOnCustNo(chn.bhmc.dms.crm.cmm.vo.AddressInfoVO)
     */
    @Override
    public int updateAddressInfoOnCustNo(AddressInfoVO addressInfoVO) throws Exception {
        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(addressInfoVO.getDlrCd())){addressInfoVO.setDlrCd(LoginUtil.getDlrCd());}

        String seq = "";
        int rltCnt = 0;

        addressInfoVO.setUpdtUsrId(LoginUtil.getUserId());

        List<AddressInfoVO> addrList = new ArrayList<AddressInfoVO>();
        AddressInfoSearchVO addressInfoSearchVO = new AddressInfoSearchVO();

        addressInfoSearchVO.setsRefTableNm(addressInfoVO.getRefTableNm());
        addressInfoSearchVO.setsRefKeyNm(addressInfoVO.getrefKeyNm());
        if ( addressInfoVO.getAddrTp() != null && "02".equals(addressInfoVO.getAddrTp())) {
            addressInfoSearchVO.setsAddrTp("02");
        } else {
            addressInfoSearchVO.setsFlagYn("Y");
        }

        addrList = selectAddressInfoByCondition(addressInfoSearchVO);

        if (addrList.size() != 0){
            seq = addrList.get(0).getSeq();
            addressInfoVO.setSeq(seq);
            //addressInfoVO.setFlagYn("Y");
            //addressInfoVO.setAddrTp(addrList.get(0).getAddrTp());
            addressInfoVO.setUseYn("Y");
            updateAddressInfo(addressInfoVO);
        }

        return rltCnt;
    }
    //addrTp : 02는 1개만 존재해야 하기 때문에 확인
    public int selectAddressTpCheck(AddressInfoVO addressInfoVO) throws Exception {

        int addressTpCheck = 0;

        if (StringUtils.isEmpty(addressInfoVO.getDlrCd())){addressInfoVO.setDlrCd(LoginUtil.getDlrCd());}

        AddressInfoSearchVO searchVO = new AddressInfoSearchVO();
        searchVO.setsRefTableNm(addressInfoVO.getRefTableNm());
        searchVO.setsRefKeyNm(addressInfoVO.getrefKeyNm());
        searchVO.setsAddrTp("02");      // 영수증 주소 수량 확인 ( 영수증 주소는 1개만 입력 가능 )
        addressTpCheck = selectAddressInfoByConditionCnt(searchVO);

        return addressTpCheck;
    }


}