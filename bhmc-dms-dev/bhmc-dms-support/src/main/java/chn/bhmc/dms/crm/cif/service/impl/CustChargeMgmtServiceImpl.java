package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;
import chn.bhmc.dms.core.util.DateUtil;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustChargeMgmtService;
import chn.bhmc.dms.crm.cif.service.dao.CustChargeHistDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustChargeMstDAO;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustChargeMgmtServiceImpl.java
 * @Description : 고객 예치금 충전 관리
 * @author  Liu jing
 * @since 2017. 1. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 16.     liu jing                 최초 생성
 * </pre>
 */
@Service("custChargeMgmtService")
public class CustChargeMgmtServiceImpl extends HService implements CustChargeMgmtService,JxlsSupport{

    @Resource(name="custChargeHistDAO")
    CustChargeHistDAO custChargeHistDAO;

    @Resource(name="custChargeMstDAO")
    CustChargeMstDAO custChargeMstDAO;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;





    @Override
    public int selectCustChargeMstByConditionCnt(CustChargeMstSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}
        return custChargeMstDAO.selectCustChargeMstByConditionCnt(searchVO);
    }

    @Override
    public List<CustChargeMstVO> selectCustChargeMstByCondition(CustChargeMstSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}
        return custChargeMstDAO.selectCustChargeMstByCondition(searchVO);
    }

    @Override
    public CustChargeMstVO selectCustChargeMstByKey(CustChargeMstSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}
        return custChargeMstDAO.selectCustChargeMstByKey(searchVO);
    }

    @Override
    public int insertCustChargeMst(CustChargeMstVO custChargeMstVO) throws Exception {
        if (StringUtils.isEmpty(custChargeMstVO.getDlrCd())){custChargeMstVO.setDlrCd(LoginUtil.getDlrCd());}
       return custChargeMstDAO.insertCustChargeMst(custChargeMstVO);
    }


    public int updateCustChargeMst(CustChargeMstVO custChargeMstVO) throws Exception {
        return custChargeMstDAO.updateCustChargeMst(custChargeMstVO) ;
    }

    @Override
    public int selectCustChargeHistByConditionCnt(CustChargeHistSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}

        return custChargeHistDAO.selectCustChargeHistByConditionCnt(searchVO);
    }

    @Override
    public List<CustChargeHistVO> selectCustChargeHistByCondition(CustChargeHistSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}
        return custChargeHistDAO.selectCustChargeHistByCondition(searchVO);
    }

    public CustChargeHistVO selectCustChargeHistByKey(CustChargeHistSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}
        return custChargeHistDAO.selectCustChargeHistByKey(searchVO);
    }

    public int updateCustChargeHist(CustChargeHistVO custChargeHistVO) throws Exception {
        return custChargeHistDAO.updateCustChargeHist(custChargeHistVO) ;
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        CustChargeMstSearchVO searchVO = new CustChargeMstSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        if (StringUtils.isNotEmpty((String)params.get("sStartDt"))) {
            searchVO.setsStartDt(DateUtil.convertToDate((String)params.get("sStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sEndDt"))) {
            searchVO.setsEndDt(DateUtil.convertToDate((String)params.get("sEndDt")));
        }
        List<CustChargeMstVO> list = selectCustChargeMstByCondition(searchVO);
        context.putVar("items", list);
    }


    @Override
    public int insertCustChargeHist(CustChargeHistVO custChargeHistVO) throws Exception {
        CustChargeMstVO custChargeMstVO = new CustChargeMstVO();
        CustChargeMstSearchVO custChargeMstSearchVO = new CustChargeMstSearchVO();

        if (StringUtils.isEmpty(custChargeMstSearchVO.getsDlrCd())){custChargeMstSearchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if (StringUtils.isEmpty(custChargeHistVO.getChrTp())){
            throw processException("crm.lbl.chargeChgTp");
        }
        if (custChargeHistVO.getPaymAmt() == 0){
            // 충전 금액 data validation
            throw processException("crm.info.noPaymAmt");
        }
        if (StringUtils.isEmpty(custChargeHistVO.getCustNo())){
            //충전 고객 번호 data validation
            throw processException("crm.info.noCust");
        }

        CommonCodeVO code = commonCodeService.selectCommonCodeByKey("CRM097",custChargeHistVO.getSourTp());
        String SourTp = code.getRemark1();
        int result = 0;
        // ableAmt select 하고,custChargeHistVO set 함
        // 사용 하는 금액이 사용금액 보다 크다면 exception 발생

        if (custChargeHistVO.getAbleAmt() == null){

//            CustChargeHistVO ableAmtVO = new CustChargeHistVO();
//            CustChargeHistSearchVO custChargehistSearchVO = new CustChargeHistSearchVO();
//            custChargehistSearchVO.setsDlrCd(custChargeHistVO.getDlrCd());
//            custChargehistSearchVO.setsCustNo(custChargeHistVO.getCustNo());
//            ableAmtVO = selectCustChargeHistByKey(custChargehistSearchVO);
//            custChargeHistVO.setAbleAmt(ableAmtVO.getAbleAmt());

            CustChargeMstSearchVO searchVO = new CustChargeMstSearchVO();
            searchVO.setsDlrCd(custChargeHistVO.getDlrCd());
            searchVO.setsCustNo(custChargeHistVO.getCustNo());
            CustChargeMstVO custMstVO =  selectCustChargeMstByKey(searchVO);
            custChargeHistVO.setAbleAmt(custMstVO.getAbleAmt());

        }

//        if (StringUtils.isEmpty(custChargeHistVO.getRcptTp())){
//            //충전 영수증 유형 data validation
//            throw processException("crm.info.noInvoiceTp");
//        }
//        if (StringUtils.isEmpty(custChargeHistVO.getRcptNo())){
//            // 충전 영수증 번호 data validation
//            throw processException("crm.info.noInvoiceNo");
//        }
        if (StringUtils.isEmpty(custChargeHistVO.getPaymMthCd())){
            // 충전 지불 방식 data validation
            throw processException("crm.info.noPayMethod");
        }

        if ("+".equals(custChargeHistVO.getChrTp())){
            //+ 경우
            //고객에서 충전 하면;
            //다른 영역에서 취소 하면
            custChargeHistVO.setAbleAmt(custChargeHistVO.getAbleAmt()+custChargeHistVO.getPaymAmt());
        }else{
            //- 경우
            //고객에서 취소 하면
            //다른 영역에서 사용 하면
            if (custChargeHistVO.getAbleAmt() < custChargeHistVO.getPaymAmt()){
                throw processException("crm.lbl.rechargeNoAmt");
            }
              custChargeHistVO.setAbleAmt(custChargeHistVO.getAbleAmt()-custChargeHistVO.getPaymAmt());
        }

        result = custChargeHistDAO.insertCustChargeHist(custChargeHistVO);

        custChargeMstSearchVO.setsCustNo(custChargeHistVO.getCustNo());
        custChargeMstVO.setCustNo(custChargeHistVO.getCustNo());


        if(result == 1){
            if(custChargeMstDAO.selectCustChargeMstByKey(custChargeMstSearchVO) == null){

                custChargeMstVO.setCustNm(custChargeHistVO.getCustNm());
                custChargeMstVO.setDlrCd(custChargeHistVO.getDlrCd());
                custChargeMstVO.setAbleAmt(custChargeHistVO.getPaymAmt());
                custChargeMstVO.setTotChrAmt(custChargeHistVO.getPaymAmt());
                custChargeMstVO.setTotUseAmt(0.0);
                custChargeMstVO.setRegUsrId(custChargeHistVO.getRegUsrId());
                custChargeMstVO.setUpdtUsrId(custChargeHistVO.getUpdtUsrId());

                if ("-".equals(custChargeHistVO.getChrTp())) {
                    throw processException("crm.lbl.rechargeNoAmt");
                }
                result = custChargeMstDAO.insertCustChargeMst(custChargeMstVO);
                //custChargeHistVO.setAbleAmt(custChargeHistVO.getPaymAmt());
                //custChargeHistDAO.updateCustChargeHist(custChargeHistVO);
            }
            else{
                custChargeMstVO = custChargeMstDAO.selectCustChargeMstByKey(custChargeMstSearchVO);
                if ("+".equals(custChargeHistVO.getChrTp())) {

                    //if(CRM097의Remart1 != -){}
                    custChargeMstVO.setAbleAmt(custChargeMstVO.getAbleAmt()+custChargeHistVO.getPaymAmt());
                    if("+".equals(SourTp)){
                        custChargeMstVO.setTotChrAmt(custChargeMstVO.getTotChrAmt()+custChargeHistVO.getPaymAmt());
                    }else{
                        custChargeMstVO.setTotUseAmt(custChargeMstVO.getTotUseAmt()-custChargeHistVO.getPaymAmt());
                    }
                    //custChargeMstVO.setTotUseAmt(custChargeMstVO.getTotChrAmt()-custChargeMstVO.getAbleAmt());
                } else {
                    int amtCalc = (int) (custChargeMstVO.getAbleAmt() - custChargeHistVO.getPaymAmt());
                    if (amtCalc < 0) {
                        throw processException("crm.lbl.rechargeNoAmt");
                    }
                    custChargeMstVO.setAbleAmt(custChargeMstVO.getAbleAmt()-custChargeHistVO.getPaymAmt());
                    //custChargeMstVO.setTotChrAmt(custChargeMstVO.getTotChrAmt()+custChargeHistVO.getPaymAmt());

                    if (custChargeMstVO.getTotChrAmt() < custChargeHistVO.getPaymAmt()) {
                        throw processException("crm.lbl.rechargeNoAmt");
                    }
                    if("-".equals(SourTp)){
                        custChargeMstVO.setTotChrAmt(custChargeMstVO.getTotChrAmt()-custChargeHistVO.getPaymAmt());
                    }else{
                        custChargeMstVO.setTotUseAmt(custChargeMstVO.getTotUseAmt()+custChargeHistVO.getPaymAmt());
                    }
                }
                result = custChargeMstDAO.updateCustChargeMst(custChargeMstVO);
            }
        }
        return result;
    }
}

