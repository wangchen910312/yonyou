package chn.bhmc.dms.sal.acu.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngOutBoundService;
import chn.bhmc.dms.sal.acu.service.dao.ContBeforeMngOutBoundDAO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngOutBoundVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSupportSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContBeforeMngOutBoundServiceImpl
 * @Description : 계약
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("contBeforeMngOutBoundService")
public class ContBeforeMngOutBoundServiceImpl extends HService implements ContBeforeMngOutBoundService {

    /**
     * 예약판매 주문번호 생성 id gen
     */
    @Resource(name="contBeforeMngIdgenService")
    TableIdGenService contBeforeMngIdgenService;

    /**
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    // 시스템 설정 서비스
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 예약판매 DAO 선언
     */
    @Resource(name="contBeforeMngOutBoundDAO")
    ContBeforeMngOutBoundDAO contBeforeMngOutBoundDAO;

    /**
     * 계약을 생성/저장 한다.
     */
    @Override
    public String saveOpptContBefore(ContBeforeMngOutBoundVO saveVO) throws Exception{

        isOpptContBefore(saveVO);

        //Date BeforeDt = saveVO.getBeforeDt();
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //Date toDay = simpleformat.parse(DateUtil.getDate("yyyy-MM-dd"));
        //if(  BeforeDt == null ){
            // [계약일자]을(를) 확인하여 주세요.
        //    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractDt", null, LocaleContextHolder.getLocale())});
        //};
        //if( BeforeDt.before(toDay) ){
            // {계약일자}은 {현재일자}보다 작을 수 없습니다.
        //    throw processException("sal.info.CheckDateForm", new String[]{ messageSource.getMessage("global.lbl.contractDt", null, LocaleContextHolder.getLocale()) , messageSource.getMessage("sal.lbl.toDay", null, LocaleContextHolder.getLocale()) });
        //}

        if( StringUtils.isEmpty(saveVO.getCarlineCd()) ){
            // [차종]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())});
        }
        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            //throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        };
        if( StringUtils.isEmpty(saveVO.getCustNo()) ){
            // [고객코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustTp()) ){
            // [고객유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustNm()) ){
            // [고객명]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
        };

        String beforeNo = "";
        saveVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        // A + 년월 Seq
        beforeNo = contBeforeMngIdgenService.getNextStringId();
        saveVO.setBeforeNo(beforeNo);

        Date toDay = DateUtil.convertToDate(DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));
        saveVO.setBeforeDt(toDay);

        // SA_0209T : 예판저장
        contBeforeMngOutBoundDAO.insertContBeforeMng(saveVO);

        return beforeNo;
    }

    /**
     * 진행중인 예약판매 기회가 있는지 유무 체크
     */
    public void isOpptContBefore(ContBeforeMngOutBoundVO searchVO) throws Exception{

        if( StringUtils.isEmpty(searchVO.getSaleOpptNo()) ){
            // [판매기회번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.saleOpptSeq", null, LocaleContextHolder.getLocale())});
        };

        // 진행중인 판매기회가 있으면 계약 저장을 못하도록 함.
        if(contBeforeMngOutBoundDAO.selectOpptBeforeCountsByConditionCnt(searchVO) > 0 ){
            // [판매기회번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.info.isopptContractChk", null, LocaleContextHolder.getLocale())});
        }
    }


    /**
     * 예약판매 고객정보 update
     */
    @Override
    public int updateContBeforeCustInfo(String custNo, String dlrCd) throws Exception{
        String sDlrCd = dlrCd;

        if( StringUtils.isEmpty(custNo) ){
            // [고객]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(sDlrCd) ){
            sDlrCd = LoginUtil.getDlrCd();
        };

        ContBeforeMngSupportSearchVO searchVO = new ContBeforeMngSupportSearchVO();
        searchVO.setsDlrCd(sDlrCd);
        searchVO.setsCustNo(custNo);
        List<ContBeforeMngOutBoundVO> cntList = contBeforeMngOutBoundDAO.selectContBeforeMngsByCondition(searchVO);

        for(ContBeforeMngOutBoundVO vo : cntList){
            if( "10".equals(vo.getBeforeStatCd())
            // || "20".equals(vo.getBeforeStatCd())
             ){

                // 고객정보를 불러온다.
                CustomerInfoSearchVO cSearchVO = new CustomerInfoSearchVO();
                cSearchVO.setsDlrCd(dlrCd);
                cSearchVO.setsCustNo(custNo);
                cSearchVO.setsAddrTp("02");
                List<CustomerInfoVO>  custList = customerInfoOutBoundService.selectCustomerInfoByCondition(cSearchVO);

                if(custList != null && custList.size() > 0){
                    CustomerInfoVO custInfoVO = custList.get(0);

                    ContBeforeMngOutBoundVO saveVO = new ContBeforeMngOutBoundVO();
                    saveVO.setRegUsrId(LoginUtil.getUserId());
                    saveVO.setUpdtUsrId(LoginUtil.getUserId());

                    saveVO.setDlrCd(vo.getDlrCd());
                    saveVO.setBeforeNo(vo.getBeforeNo());
                    saveVO.setCustNm(custInfoVO.getCustNm());
                    saveVO.setCustTp(custInfoVO.getCustTp());
                    saveVO.setTaxpayerNo(custInfoVO.getTaxpayerNo());
                    saveVO.setPurcMngNm(custInfoVO.getPurcMngNm());
                    saveVO.setSsnCrnTp(custInfoVO.getMathDocTp());
                    saveVO.setSsnCrnNo(custInfoVO.getSsnCrnNo());
                    saveVO.setTelNo1(custInfoVO.getHpNo());
                    saveVO.setTelNo2(custInfoVO.getTelNo());
                    saveVO.setEmailNm(custInfoVO.getEmailNm());
                    saveVO.setSungCd(custInfoVO.getSungCd());
                    saveVO.setCityCd(custInfoVO.getCityCd());
                    saveVO.setDistCd(custInfoVO.getDistCd());
                    saveVO.setSungNm(custInfoVO.getSungNm());
                    saveVO.setCityNm(custInfoVO.getCityNm());
                    saveVO.setDistNm(custInfoVO.getDistNm());
                    saveVO.setAddrDetlCont(custInfoVO.getAddrDetlCont());
                    saveVO.setAddrTp(StringUtils.isNotBlank(custInfoVO.getAddrTp())?custInfoVO.getAddrTp():"02");
                    saveVO.setZipCd(custInfoVO.getZipCd());
                    saveVO.setSaleEmpNo(custInfoVO.getMngScId());
                    contBeforeMngOutBoundDAO.updateContBeforeMngCustInfo(saveVO);
                }
            }
        }

        return 1;
    }


}
