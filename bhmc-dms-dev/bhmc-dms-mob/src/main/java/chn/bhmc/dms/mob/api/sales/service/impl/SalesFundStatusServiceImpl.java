package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.sales.dao.SalesFundStatusDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesFundStatusService;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusIFVO;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusReplace;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DayFundStatusServiceImpl
 * @Description : 일자금현황
 * @author
 * @since 2016. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("SalesFundStatusService")
public class SalesFundStatusServiceImpl extends HService implements SalesFundStatusService, JxlsSupport {

    /**
     * 일자금현황 DAO 선언
     */
    @Resource(name="SalesFundStatusDAO")
    SalesFundStatusDAO SalesFundStatusDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;


    /**
     * 월별 자금현황의 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectFundStatusByConditionCnt(FundStatusSearchVO searchVO) throws Exception{
        return SalesFundStatusDAO.selectFundStatusByConditionCnt(searchVO);
    }

    /**
     * 월별 자금현황을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */

    @SuppressWarnings("unused")
    public List<FundStatusVO> selectFundStatusByCondition(FundStatusSearchVO searchVO) throws Exception{

        List<FundStatusVO> resultList = SalesFundStatusDAO.selectFundStatusByCondition(searchVO);

        /**
         * 당월의 경우 - 현재일의 내역을 DB조회 값을 더해준다.
         */
        String nYyMm  = DateUtil.getDate("yyyyMM");
        String sYyMm = searchVO.getsYy()+searchVO.getsMm();
        if(nYyMm.equals(sYyMm)){
            FundStatusVO rVO = null;
            if(resultList != null && resultList.size() > 0){
                rVO = resultList.get(resultList.size()-1);
            }else{
                resultList = new ArrayList<FundStatusVO>();
                rVO = new FundStatusVO();
                rVO.setYyMmDd(DateUtil.getDate("yyyy-MM") );
                resultList.add(rVO);
            }

            double prt3DpstAmt = rVO.getPrt3DpstAmt();   // 입금 - 삼방자금
            double prt2DpstAmt = rVO.getPrt2DpstAmt();   // 입금 - 이방자금
            double cashDpstAmt = rVO.getCashDpstAmt();   // 입금 - 현금
            double totDpstAmt  = rVO.getTotDpstAmt();    // 입금 - 합계

            double wdrwPrt3Amt = rVO.getWdrwPrt3Amt();   // 출금 - 삼방자금
            double wdrwPrt2Amt = rVO.getWdrwPrt2Amt();   // 출금 - 이방자금
            double wdrwCashAmt = rVO.getWdrwCashAmt();   // 출금 - 현금
            double wdrwAmt     = rVO.getWdrwAmt();       // 출금 - 합계

            double prt3BalAmt  = rVO.getPrt3BalAmt();    // 잔액 - 삼방자금
            double prt2BalAmt  = rVO.getPrt2BalAmt();    // 잔액 - 이방자금
            double cashBalAmt  = rVO.getCashBalAmt();    // 잔액 - 현금
            double totBalAmt   = rVO.getTotBalAmt();     // 잔액 - 합계

            double bfPrt3BalAmt  = 0.00;    // 전잔액 - 삼방자금
            double bfPrt2BalAmt  = 0.00;    // 전잔액 - 이방자금
            double bfCashBalAmt  = 0.00;    // 전잔액 - 현금
            double bfTotBalAmt   = 0.00;    // 전잔액 - 합계
            double bfPrcChgAmt   = 0.00;    // 전잔액 - 조정금
            double bfIncnAmt     = 0.00;    // 전잔액 - 인센티브

            // 현재일자의 데이터는 EAI에서 불러와서 넣어준다.
            for (FundStatusVO eVO : selectNowDayFundStatusEaiSearch(searchVO)) {

                prt3DpstAmt += eVO.getPrt3DpstAmt();   // 입금 - 삼방자금
                prt2DpstAmt += eVO.getPrt2DpstAmt();   // 입금 - 이방자금
                cashDpstAmt += eVO.getCashDpstAmt();   // 입금 - 현금
                totDpstAmt  += eVO.getTotDpstAmt();    // 입금 - 합계

                wdrwPrt3Amt += eVO.getWdrwPrt3Amt();   // 출금 - 삼방자금
                wdrwPrt2Amt += eVO.getWdrwPrt2Amt();   // 출금 - 이방자금
                wdrwCashAmt += eVO.getWdrwCashAmt();   // 출금 - 현금
                wdrwAmt     += eVO.getWdrwAmt();       // 출금 - 합계

                prt3BalAmt  += eVO.getPrt3BalAmt();    // 잔액 - 삼방자금
                prt2BalAmt  += eVO.getPrt2BalAmt();    // 잔액 - 이방자금
                cashBalAmt  += eVO.getCashBalAmt();    // 잔액 - 현금
                totBalAmt   += eVO.getTotBalAmt();     // 잔액 - 합계

                if(searchVO.getsMm().equals("01")){
                    String yyyy = String.valueOf(Integer.parseInt((sYyMm).substring(0,4)) - 1);
                    searchVO.setsYy(yyyy);
                    searchVO.setsMm("12");
                }else{
                    String mm = String.valueOf(Integer.parseInt(searchVO.getsMm()) - 1);
                    mm = lpad(mm+"", "0", 2);
                    searchVO.setsMm(mm);
                }

                //전월자금갯수조회
                int srchCnt = SalesFundStatusDAO.selectBeforeAmtInfoSearchCnt(searchVO);
                if(srchCnt > 0){
                    FundStatusReplace bfInfoVO = SalesFundStatusDAO.selectBeforeAmtInfoSearch(searchVO);

                    bfPrt3BalAmt  +=  bfInfoVO.getBfPrt3BalAmt();    // 전잔액 - 삼방자금
                    bfPrt2BalAmt  +=  bfInfoVO.getBfPrt2BalAmt();    // 전잔액 - 이방자금
                    bfCashBalAmt  +=  bfInfoVO.getBfCashBalAmt();    // 전잔액 - 현금
                    bfTotBalAmt   +=  bfInfoVO.getBfTotBalAmt();     // 전잔액 - 합계
                    bfPrcChgAmt   +=  bfInfoVO.getBfPrcChgAmt();     // 전잔액 - 조정금
                    bfIncnAmt     +=  bfInfoVO.getBfIncnAmt();       // 전잔액 - 인센티브
                }
            }

            rVO.setPrt3DpstAmt(prt3DpstAmt);
            rVO.setPrt2DpstAmt(prt2DpstAmt);
            rVO.setCashDpstAmt(cashDpstAmt);
            rVO.setTotDpstAmt(totDpstAmt);

            rVO.setWdrwPrt3Amt(wdrwPrt3Amt);
            rVO.setWdrwPrt2Amt(wdrwPrt2Amt);
            rVO.setWdrwCashAmt(wdrwCashAmt);
            rVO.setWdrwAmt(wdrwAmt);

            rVO.setPrt3BalAmt(prt3BalAmt);
            rVO.setPrt2BalAmt(prt2BalAmt);
            rVO.setCashBalAmt(cashBalAmt);
            rVO.setTotBalAmt(totBalAmt);

            rVO.setBfPrt3BalAmt(bfPrt3BalAmt);
            rVO.setBfPrt2BalAmt(bfPrt2BalAmt);
            rVO.setBfCashBalAmt(bfCashBalAmt);
            rVO.setBfTotBalAmt(bfTotBalAmt);

            rVO.setBfPrcChgAmt(bfPrcChgAmt);
            rVO.setBfIncnAmt(bfIncnAmt);

        }else{
            /**
             * 당월이 아닌 경우.
             */
            
            FundStatusVO rVO = null;
            if(resultList != null && resultList.size() > 0){
                rVO = resultList.get(resultList.size()-1);
            }else{
                resultList = new ArrayList<FundStatusVO>();
                rVO = new FundStatusVO();
                resultList.add(rVO);
            }
            
            double prt3DpstAmt = rVO.getPrt3DpstAmt();   // 입금 - 삼방자금
            double prt2DpstAmt = rVO.getPrt2DpstAmt();   // 입금 - 이방자금
            double cashDpstAmt = rVO.getCashDpstAmt();   // 입금 - 현금
            double totDpstAmt  = rVO.getTotDpstAmt();    // 입금 - 합계

            double wdrwPrt3Amt = rVO.getWdrwPrt3Amt();   // 출금 - 삼방자금
            double wdrwPrt2Amt = rVO.getWdrwPrt2Amt();   // 출금 - 이방자금
            double wdrwCashAmt = rVO.getWdrwCashAmt();   // 출금 - 현금
            double wdrwAmt     = rVO.getWdrwAmt();       // 출금 - 합계

            double prt3BalAmt  = rVO.getPrt3BalAmt();    // 잔액 - 삼방자금
            double prt2BalAmt  = rVO.getPrt2BalAmt();    // 잔액 - 이방자금
            double cashBalAmt  = rVO.getCashBalAmt();    // 잔액 - 현금
            double totBalAmt   = rVO.getTotBalAmt();     // 잔액 - 합계

            double bfPrt3BalAmt  = 0.00;    // 전잔액 - 삼방자금
            double bfPrt2BalAmt  = 0.00;    // 전잔액 - 이방자금
            double bfCashBalAmt  = 0.00;    // 전잔액 - 현금
            double bfTotBalAmt   = 0.00;    // 전잔액 - 합계
            double bfPrcChgAmt   = 0.00;    // 전잔액 - 조정금
            double bfIncnAmt     = 0.00;    // 전잔액 - 인센티브
            
            if(searchVO.getsMm().equals("01")){
                String yyyy = String.valueOf(Integer.parseInt((sYyMm).substring(0,4)) - 1);
                searchVO.setsYy(yyyy);
                searchVO.setsMm("12");
            }else{
                String mm = String.valueOf(Integer.parseInt(searchVO.getsMm()) - 1);
                mm = lpad(mm+"", "0", 2);
                searchVO.setsMm(mm);
            }
            
            //전월자금갯수조회
            int srchCnt = SalesFundStatusDAO.selectBeforeAmtInfoSearchCnt(searchVO);
            if(srchCnt > 0){
                FundStatusReplace bfInfoVO = SalesFundStatusDAO.selectBeforeAmtInfoSearch(searchVO);

                bfPrt3BalAmt  +=  bfInfoVO.getBfPrt3BalAmt();    // 전잔액 - 삼방자금
                bfPrt2BalAmt  +=  bfInfoVO.getBfPrt2BalAmt();    // 전잔액 - 이방자금
                bfCashBalAmt  +=  bfInfoVO.getBfCashBalAmt();    // 전잔액 - 현금
                bfTotBalAmt   +=  bfInfoVO.getBfTotBalAmt();     // 전잔액 - 합계
                bfPrcChgAmt   +=  bfInfoVO.getBfPrcChgAmt();     // 전잔액 - 조정금
                bfIncnAmt     +=  bfInfoVO.getBfIncnAmt();       // 전잔액 - 인센티브
            }
        }

        return resultList;
    }

  

    /**
     * 일별 자금현황을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FundStatusVO> selectFundStatusDaysByCondition(FundStatusSearchVO searchVO) throws Exception{

        String nYyMm  = DateUtil.getDate("yyyy") + DateUtil.getDate("MM");
        String sYyMm = searchVO.getsYy()+searchVO.getsMm();

        List<FundStatusVO> resultList = null;

        if(nYyMm.equals(sYyMm)){
            resultList = SalesFundStatusDAO.selectFundStatusDaysByCondition(searchVO);

            // 현재일자의 데이터는 EAI에서 불러와서 넣어준다.
            for (FundStatusVO eVO : selectNowDayFundStatusEaiSearch(searchVO)) {
                resultList.add(eVO);
            }
        }else{
            resultList = SalesFundStatusDAO.selectFundStatusDaysByCondition(searchVO);
        }

        return resultList;
    }

    // 금일 날짜 자금현황을 eai에서 불러온다.
    public List<FundStatusVO> selectNowDayFundStatusEaiSearch(FundStatusSearchVO searchVO) throws Exception{
        Map<String, Object> message = new HashMap<String, Object>();

        message.put("DPYEAR", searchVO.getsYy());
        message.put("DPMOTH", searchVO.getsMm());
        message.put("DPDAY", DateUtil.getDate("dd"));       // 현재일
        message.put("DPDELR", searchVO.getsDlrCd());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL050");           // service id
        camelClient.setSender(searchVO.getsDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        List<FundStatusIFVO> resultIFList = null;
        List<FundStatusVO>  resultList = null;
        FundStatusVO rVO = null;

        if (receiveData.getFooter().getIfResult().equals("Z")) {

            resultIFList = receiveData.readMessages(FundStatusIFVO.class);
            resultList = new ArrayList<FundStatusVO>();

            for(FundStatusIFVO ifVO : resultIFList){
                rVO = new FundStatusVO();
                rVO.setDlrCd(ifVO.getDpdelr());
                rVO.setYy(ifVO.getDpyear());
                rVO.setMm(ifVO.getDpmoth());
                rVO.setDd(ifVO.getDpday());
                rVO.setYyMmDd( ifVO.getDpyear()+"-"+ifVO.getDpmoth()+"-"+ifVO.getDpday() );

                rVO.setPrt3DpstAmt(ifVO.getDpprt3());   //입금:3방
                rVO.setPrt2DpstAmt(ifVO.getDpprt2());   //입금:2방
                rVO.setCashDpstAmt(ifVO.getDpcash());   //입금:현금
                rVO.setIncnAmt(ifVO.getDpincn());       //입금:인센티브
                rVO.setTotDpstAmt(ifVO.getDpippr());    //입금:합계
                rVO.setPrcChgAmt(ifVO.getDpipamt());    //입금:조정금

                rVO.setWdrwPrt3Amt(ifVO.getDpoprt3());  //출금:3방
                rVO.setWdrwPrt2Amt(ifVO.getDpoprt2());  //출금:2방
                rVO.setWdrwCashAmt(ifVO.getDpocash());  //출금:현금
                rVO.setWdrwAmt(ifVO.getDpoppr());       //출금:합계
                rVO.setWdrwCnclAmt(ifVO.getDpopcn());   //출금:취소

                rVO.setPrt3BalAmt(ifVO.getDpbal3());    //잔액:3방
                rVO.setPrt2BalAmt(ifVO.getDpbal2());    //잔액:2방
                rVO.setCashBalAmt(ifVO.getDpcrcs());    //잔액:현금
                rVO.setTotBalAmt(ifVO.getDpdepo());     //잔액:합계

                double totdpstAmt = rVO.getTotDpstAmt(); //입금:합계
                double wdrwAmt = rVO.getWdrwAmt();       //출금:합계
                double totBalAmt = rVO.getTotBalAmt();   //잔액:합계

                double sumAmt = totdpstAmt+wdrwAmt+totBalAmt;

                if(sumAmt == 0.00){
                    rVO.setDd("");
                }

                resultList.add(rVO);
            }
        }

        return resultList;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        FundStatusSearchVO searchVO = new FundStatusSearchVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<FundStatusVO> list = selectFundStatusDaysByCondition(searchVO);
        context.putVar("items", list);
    }

    /**
     * LPAD 구현
     */
    private String lpad(String val, String pad, int length){
        if(val != null && val.length() > 0){
            while(val.length() < length){
                val = pad + val;
            }
        }
        return val;
    }

}
