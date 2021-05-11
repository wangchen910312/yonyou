package chn.bhmc.dms.bat.crm.cso.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO;
import chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsOriService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptDAO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtVO;

/**
 * BatIfSalesOpptDmsDcsServiceImpl
 *
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE      최초 생성
 * </pre>
 */
@Service("batIfSalesOpptDmsOriService")
public class BatIfSalesOpptDmsOriServiceImpl extends HService implements BatIfSalesOpptDmsOriService {

    /**
     * SalesOppt DAO
     */
    @Resource(name="batSalesOpptDAO")
    BatSalesOpptDAO batSalesOpptDAO;

    /**
     * BatIfCustomerInfoDmsService
     */
    @Resource(name="batIfCustomerInfoDmsService")
    BatIfCustomerInfoDmsService batIfCustomerInfoDmsService;

    /*
     * @see chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsOriService#selectSalesOpptDmsOri()
     */
    @Override
    public int selectSalesOpptDmsOri() throws Exception {

        int updateCnt = 0;
        int isHaveCnt = 0;
        String currSalesOpptSeq = "";
        String custNo = "";

        BatSalesOpptProcessMgmtSearchVO searchVO = new BatSalesOpptProcessMgmtSearchVO();
        List<BatSalesOpptProcessMgmtVO> salesOpptProcessMgmtVOList = new ArrayList<BatSalesOpptProcessMgmtVO>();

        // 업데이트 할 목록이 있는지 확인
        updateCnt = batSalesOpptDAO.selectSalesOpptProcessDmsOriginalByConditionCnt(searchVO);

        if (updateCnt > 0) {
            salesOpptProcessMgmtVOList = batSalesOpptDAO.selectSalesOpptProcessDmsOriginalByCondition(searchVO);
            updateCnt = salesOpptProcessMgmtVOList.size();

            for (int i=0; i < updateCnt ; i++) {
                BatSalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new  BatSalesOpptProcessMgmtVO();

                salesOpptProcessMgmtVO = salesOpptProcessMgmtVOList.get(i);

                boolean successChk = true;

                // 판매기회 여부 확인
                isHaveCnt = 0;
                searchVO.setsSiebelRowId(salesOpptProcessMgmtVO.getSiebelRowId());
                isHaveCnt = selectSalesOpptProcessByConditionCnt(searchVO);

                if (isHaveCnt > 0) { //판매기회가 있음.
                    /**
                     * 진행중인 판매리드가 있는지 확인한다.
                     * true : Return
                     * false : Update, leadStatCd = '01'
                     */
                    searchVO.setsLeadStatCd("check");
                    currSalesOpptSeq = selectSalesOpptProcessMgmtsByCondition(searchVO);

                    if (currSalesOpptSeq != null ) {  // 미진행 상태 01,02,03,04,05가 아님 (실패상태)
                        //Update leadStatCd = '01'
                        salesOpptProcessMgmtVO.setLeadStatCd("01");
                        salesOpptProcessMgmtVO.setDupSeq(salesOpptProcessMgmtVO.getSeq());

                        salesOpptProcessMgmtVO.setSeq(currSalesOpptSeq);

                        // 판매기회 업데이트
                        updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                        // 고객정보 업데이트
                        updateCustomerFromSalesOppt(salesOpptProcessMgmtVO);

                        //salesOpptProcessMgmtVO.setBatStatCd("S");

                    } else {
                        //salesOpptProcessMgmtVO.setBatStatCd("S");
                        // 진행중인 판매리드가 있습니다.
                        //salesOpptProcessMgmtVO.setBatMesgCont(messageSource.getMessage("crm.info.processingLead", null, LocaleContextHolder.getLocale()));
                        successChk = false;
                    }


                } else { // 판매기회가 없음.
                    // 1. 고객이 있는지 확인 (없으면 신규 생성)
                    // 2. 판매기회 생성
                    BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
                    customerInfoVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());
                    customerInfoVO.setSiebelRowId(salesOpptProcessMgmtVO.getSiebelRowId());
                    isHaveCnt = batIfCustomerInfoDmsService.selectCustomerRowId(customerInfoVO);

                    // 1. 고객이 있는지 확인 (없으면 신규 생성)
                    if (isHaveCnt > 0) {
                        // 고객정보 업데이트
                        salesOpptProcessMgmtVO.setUpdtUsrId("system");
                        updateCustomerFromSalesOppt(salesOpptProcessMgmtVO);
                    } else {
                        // 고객신규생성
                        salesOpptProcessMgmtVO.setRegUsrId("system");
                        salesOpptProcessMgmtVO.setUpdtUsrId("system");
                        customerInfoVO = insertCustomerFromSalesOppt(salesOpptProcessMgmtVO);

                        if ("F".equals(customerInfoVO.getBatStatCd())) {
                            //salesOpptProcessMgmtVO.setBatMesgCont(customerInfoVO.getBatMesgCont());
                            //salesOpptProcessMgmtVO.setBatStatCd(customerInfoVO.getBatStatCd());
                            successChk = false;
                        }
                    }

                    // 2. 판매기회 생성
                    if (successChk) {
                        custNo = customerInfoVO.getCustNo();
                        salesOpptProcessMgmtVO.setCustNo(custNo);
                        salesOpptProcessMgmtVO.setRegUsrId("system");
                        salesOpptProcessMgmtVO.setUpdtUsrId("system");

                        // 판매기회 중복이력 일련번호
                        // salesOpptProcessMgmtVO.setDupSeq(salesOpptProcessMgmtVO.getSeq());

                        // 판매기회생성
                        salesOpptProcessMgmtVO = insertSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                        /*if ("F".equals(salesOpptProcessMgmtVO.getBatStatCd())) {
                            salesOpptProcessMgmtVO.setBatMesgCont(customerInfoVO.getBatMesgCont());
                        } else {
                            // 정상적으로 반영 되었습니다.
                            salesOpptProcessMgmtVO.setBatMesgCont(messageSource.getMessage("global.info.success", null, LocaleContextHolder.getLocale()));
                        }*/
                    }

                }
                // 판매기회 중복이력 테이블 업데이트 한다.
                batSalesOpptDAO.updateSalesOpptProcessDupMgmt(salesOpptProcessMgmtVO);
            }
        }
        return 0;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsOriService#selectSalesOpptDmsOriDup()
     * CR_0211IR 인터페이스 수신테이블에서 CR_0211T(판매리드) 또는 CR_0218T(중복이력)테이블로 처리
     */
    @Override
    public int selectSalesOpptDmsOriDup() throws Exception {

        /**
         *
         *     1.인터페이스 테이블에 처리할 데이터 유무 확인
         *     2.신규 '판매기회' 확인 (고객번호로 확인)
         *       2-1. 고객 정보가 있는지 확인 ( Siebel_Row_Id )
         *       2-1-1. 있는 경우 업데이트
         *       2-1-2. 없는 경우 신규 생성
         *         2-1-2-1. 고객존재여부확인
         *     3.중복 '판매기회' 확인 (고객번호로 확인)
         *       3-1. 실패인 경우 ('01'~'05'가 아닌경우)
         *       3-1-1. '판매기회' 업데이트 (Siebel_Lead_Row_Id)
         *       3-1-2. '고객' 업데이트
         *       3-2. 진행중인 경우 (중복이력에 남긴다.)
         *       3-2-1. '중복이력' 업데이트
         *     4.인터페이스 테이블 해당 ROW 삭제 (CR_0211IR)
         */

        try {
            int isHaveCnt = 0;
            String currSalesOpptSeq = ""; // 현재 판매기회 seq
            String custNo = ""; // 고객번호

            //1.인터페이스 테이블에 처리할 데이터 유무 확인
            BatSalesOpptProcessMgmtSearchVO searchVO = new BatSalesOpptProcessMgmtSearchVO();
            isHaveCnt = batSalesOpptDAO.selectSalesOpptIfReceiveByConditionCnt(searchVO);

            if (isHaveCnt > 0) {  // 인터페이스 테이블 존재유무 if Start

                List<BatSalesOpptProcessMgmtVO> salesOpptProcessMgmtVOList = new ArrayList<BatSalesOpptProcessMgmtVO>();

                salesOpptProcessMgmtVOList = batSalesOpptDAO.selectSalesOpptIfReceiveByCondition(searchVO);

                isHaveCnt = 0;
                isHaveCnt = salesOpptProcessMgmtVOList.size();

                BatSalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new BatSalesOpptProcessMgmtVO();
                BatSalesOpptProcessMgmtSearchVO batSalesOpptProcessMgmtSearchVO = new BatSalesOpptProcessMgmtSearchVO();
                BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();

                for (int i=0; i < isHaveCnt ; i++) { // for Start
                    salesOpptProcessMgmtVO = new BatSalesOpptProcessMgmtVO();
                    batSalesOpptProcessMgmtSearchVO = new BatSalesOpptProcessMgmtSearchVO();

                    salesOpptProcessMgmtVO = salesOpptProcessMgmtVOList.get(i);

                    boolean successChk = true;

                    // 2.신규 '판매기회' 확인 (고객번호로 확인)
                    isHaveCnt = 0;
                    batSalesOpptProcessMgmtSearchVO.setsSiebelRowId(salesOpptProcessMgmtVO.getSiebelRowId());
                    isHaveCnt = selectSalesOpptProcessByConditionCnt(batSalesOpptProcessMgmtSearchVO);

                    if (isHaveCnt > 0) { //   2-1-1. 판매기회가 있는 경우 업데이트

                        batSalesOpptProcessMgmtSearchVO.setsLeadStatCd("check");

                        // 3.중복 '판매기회' 확인 (고객번호로 확인)
                        isHaveCnt = selectSalesOpptProcessByConditionCnt(batSalesOpptProcessMgmtSearchVO);

                        if (isHaveCnt > 0) { //  3-1. 실패인 경우 ('01'~'05'가 아닌경우)
                            currSalesOpptSeq = selectSalesOpptProcessMgmtsByCondition(batSalesOpptProcessMgmtSearchVO);

                            if (currSalesOpptSeq != null) {
                                //   3-1-1. '판매기회' 업데이트 (Siebel_Lead_Row_Id)
                                salesOpptProcessMgmtVO.setLeadStatCd("01");
                                salesOpptProcessMgmtVO.setSeq(currSalesOpptSeq);

                                updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                                //   3-1-2. '고객' 업데이트
                                updateCustomerFromSalesOppt(salesOpptProcessMgmtVO);

//                                salesOpptProcessMgmtVO.setBatStatCd("S");

                            }
                        } else {  //   3-2. 진행중인 경우 (중복이력에 남긴다.)
                            batSalesOpptDAO.insertSalesOpptDup(salesOpptProcessMgmtVO);
       /*                     salesOpptProcessMgmtVO.setBatStatCd("S");
                            // 진행중인 판매리드가 있습니다.
                            salesOpptProcessMgmtVO.setBatMesgCont(messageSource.getMessage("crm.info.processingLead", null, LocaleContextHolder.getLocale()));
                            */
                            successChk = false;
                        }


                    } else { //   2-1-2. 판매기회가 없는 경우 신규 생성
                           //   2-1-2-1. 고객존재 여부확인
                        customerInfoVO = new BatCustomerInfoVO();
                        customerInfoVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());
                        customerInfoVO.setSiebelRowId(salesOpptProcessMgmtVO.getSiebelRowId());
                        isHaveCnt = batIfCustomerInfoDmsService.selectCustomerRowId(customerInfoVO);

                        if (isHaveCnt > 0) { // 고객있음. (고객 업데이트)
                            salesOpptProcessMgmtVO.setUpdtUsrId("SYSTEM");
                            updateCustomerFromSalesOppt(salesOpptProcessMgmtVO);
                        } else {  // 고객없음. (고객 신규 생성)
                            salesOpptProcessMgmtVO.setRegUsrId("SYSTEM");
                            salesOpptProcessMgmtVO.setUpdtUsrId("SYSTEM");
                            customerInfoVO = insertCustomerFromSalesOppt(salesOpptProcessMgmtVO);

                            if ("F".equals(customerInfoVO.getBatStatCd())) {
                                /*
                                salesOpptProcessMgmtVO.setBatMesgCont(customerInfoVO.getBatMesgCont());
                                salesOpptProcessMgmtVO.setBatStatCd(customerInfoVO.getBatStatCd());
                                */
                                successChk = false;
                            }

                        }

                        // 고객생성중 실패가 아닌경우 판매기회 신규 생성
                        if (successChk) {
                            custNo = customerInfoVO.getCustNo();
                            salesOpptProcessMgmtVO.setCustNo(custNo);
                            salesOpptProcessMgmtVO.setRegUsrId("SYSTEM");
                            salesOpptProcessMgmtVO.setUpdtUsrId("SYSTEM");

                            salesOpptProcessMgmtVO = insertSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
                            /*
                            if ("F".equals(salesOpptProcessMgmtVO.getBatStatCd())) {
                                salesOpptProcessMgmtVO.setBatMesgCont(salesOpptProcessMgmtVO.getBatMesgCont());
                            } else {
                                // 정상적으로 반영 되었습니다.
                                salesOpptProcessMgmtVO.setBatMesgCont(messageSource.getMessage("global.info.success", null, LocaleContextHolder.getLocale()));
                            }
                            */
                        }
                    }

                    // 4.인터페이스 테이블 해당 ROW 삭제 (CR_0211IR)
                    batSalesOpptDAO.deleteSalesOpptIfReceive(salesOpptProcessMgmtVO);
                } // for Start
            } // 인터페이스 테이블 존재유무 if end

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }

        return 0;
    }

    public int updateCustomerFromSalesOppt(BatSalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {
        // 고객정보 업데이트
        BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
        customerInfoVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());
        customerInfoVO.setSiebelRowId(salesOpptProcessMgmtVO.getSiebelRowId());
        customerInfoVO.setTelNo(salesOpptProcessMgmtVO.getTelNo());
        customerInfoVO.setHpNo(salesOpptProcessMgmtVO.getHpNo());
        customerInfoVO.setOfficeTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
        customerInfoVO.setWechatId(salesOpptProcessMgmtVO.getWechatId());
        customerInfoVO.setEmailNm(salesOpptProcessMgmtVO.getEmailNm());
        customerInfoVO.setCustCd("01"); //잠재고객으로 등록

        return batIfCustomerInfoDmsService.updateCustomerFromSalesOppt(customerInfoVO);

    }

    public BatCustomerInfoVO insertCustomerFromSalesOppt(BatSalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {

        BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
        customerInfoVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());
        customerInfoVO.setRegUsrId(salesOpptProcessMgmtVO.getRegUsrId());

        customerInfoVO.setCustNm(salesOpptProcessMgmtVO.getCustNm());
        customerInfoVO.setCustTp(salesOpptProcessMgmtVO.getCustTp());
        customerInfoVO.setSiebelRowId(salesOpptProcessMgmtVO.getSiebelRowId());
        customerInfoVO.setTelNo(salesOpptProcessMgmtVO.getTelNo());
        customerInfoVO.setHpNo(salesOpptProcessMgmtVO.getHpNo());
        customerInfoVO.setOfficeTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
        customerInfoVO.setWechatId(salesOpptProcessMgmtVO.getWechatId());
        customerInfoVO.setEmailNm(salesOpptProcessMgmtVO.getEmailNm());
        customerInfoVO.setCustCd("01"); //잠재고객으로 등록
        customerInfoVO.setPrefCommMthCd("01");
        customerInfoVO.setPrefCommNo(salesOpptProcessMgmtVO.getHpNo());

        return batIfCustomerInfoDmsService.insertCustomer(customerInfoVO);

    }


    public int selectSalesOpptProcessByConditionCnt(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        return batSalesOpptDAO.selectSalesOpptProcessByConditionCnt(searchVO);
    }

    public String selectSalesOpptProcessMgmtsByCondition(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        return batSalesOpptDAO.selectSalesOpptProcessMgmtsByCondition(searchVO);
    }

    public int updateSalesOpptProcessMgmt(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO) throws Exception {
        return batSalesOpptDAO.updateSalesOpptProcessMgmt(batSalesOpptProcessMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#insertSalesOpptProcessMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     */
    public BatSalesOpptProcessMgmtVO insertSalesOpptProcessMgmt(BatSalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {
        // 필수체크
        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getLeadStatCd())){salesOpptProcessMgmtVO.setLeadStatCd("01");}

        // 기본값 셋팅
        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getBhmcYn())) {salesOpptProcessMgmtVO.setBhmcYn("Y");}
        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getDelYn())) {salesOpptProcessMgmtVO.setDelYn("N");}
        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getRvsitYn())) {salesOpptProcessMgmtVO.setRvsitYn("N");}

        int insertCnt = batSalesOpptDAO.insertSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
        //String batMesgCont = " ";

        if (insertCnt <= 0) {
            // 신규 등록 실패
            //batMesgCont = messageSource.getMessage("global.err.regFailedParam", new String[]{messageSource.getMessage("global.lbl.lead", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
            // salesOpptProcessMgmtVO.setBatMesgCont(batMesgCont);
            // salesOpptProcessMgmtVO.setBatStatCd("F"); // S : Success , F : Fail

        } else {
            // salesOpptProcessMgmtVO.setBatStatCd("S"); // S : Success , F : Fail
        }


        return salesOpptProcessMgmtVO;
    }




}
