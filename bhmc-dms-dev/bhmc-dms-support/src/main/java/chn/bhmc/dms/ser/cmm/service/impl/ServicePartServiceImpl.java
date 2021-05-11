package chn.bhmc.dms.ser.cmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.service.dao.ServicePartDAO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartIfVO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartServiceImpl.java
 * @Description : 공통 공임 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("servicePartService")
public class ServicePartServiceImpl extends HService implements ServicePartService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="servicePartDAO")
    ServicePartDAO servicePartDAO;

    /**
     * 부품요청 Service
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    @Autowired
    ServiceCommonService serviceCommonService;

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 부품재고 Service
     */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return servicePartDAO.selectServicePartsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return servicePartDAO.selectServicePartsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 부품 히스토리 을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsHistByCondition(TabInfoSearchVO searchVO) throws Exception {

        ServicePartVO roPartVO = new ServicePartVO();
        List<ServicePartVO> partList = new ArrayList<ServicePartVO>();
        List<ServicePartIfVO> partIfList = new ArrayList<ServicePartIfVO>();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(searchVO.getsDlrCd().equals(LoginUtil.getDlrCd())){

            partList = servicePartDAO.selectServicePartsByCondition(searchVO);
        } else {
            //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("PREFIX_ID", "RO");
            message.put("DLR_CD", searchVO.getsDlrCd());
            message.put("DOC_NO", searchVO.getsDocNo());

            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER057");

            if (receiveData.getFooter().getIfResult().equals("Z")) {
                partIfList = receiveData.readMessages(ServicePartIfVO.class);

                for(int i = 0 ; i <  partIfList.size() ; i++){
                    roPartVO = new ServicePartVO();

                    roPartVO.setDlrCd(   StringUtil.isNullToString(partIfList.get(i).getDlrCd()));
                    roPartVO.setPreFixId(StringUtil.isNullToString(partIfList.get(i).getPreFixId()));
                    roPartVO.setDocNo(   StringUtil.isNullToString(partIfList.get(i).getDocNo()));
                    roPartVO.setLineNo( Integer.parseInt(partIfList.get(i).getLineNo() ));
                    roPartVO.setRoTp(StringUtil.isNullToString(partIfList.get(i).getRoTp()));
                    roPartVO.setItemCd(StringUtil.isNullToString(partIfList.get(i).getItemCd()));
                    roPartVO.setItemNm(StringUtil.isNullToString(partIfList.get(i).getItemNm()));
                    roPartVO.setItemPrc( Double.parseDouble(  partIfList.get(i).getItemPrc() ));
                    roPartVO.setItemQty( Double.parseDouble( partIfList.get(i).getItemQty() ));
                    roPartVO.setItemSalePrc( Double.parseDouble(partIfList.get(i).getItemSalePrc()));
                    roPartVO.setItemSaleAmt( Double.parseDouble(partIfList.get(i).getItemSaleAmt()));
                    roPartVO.setCalcUnitCd( StringUtil.isNullToString(partIfList.get(i).getCalcUnitCd()));
                    roPartVO.setCalcUnitNm( StringUtil.isNullToString(partIfList.get(i).getCalcUnitNm()));
                    roPartVO.setCrNm( StringUtil.isNullToString(partIfList.get(i).getCrNm()));
                    roPartVO.setDcAmt( Double.parseDouble( partIfList.get(i).getDcAmt()));
                    roPartVO.setDcRate( Double.parseDouble( partIfList.get(i).getDcRate()));
                    roPartVO.setItemTotAmt( Double.parseDouble( partIfList.get(i).getItemTotAmt()));
                    roPartVO.setCrNo( StringUtil.isNullToString(partIfList.get(i).getCrNo()));
                    roPartVO.setCrNm( StringUtil.isNullToString(partIfList.get(i).getCrNm()));
                    roPartVO.setCrTp( StringUtil.isNullToString(partIfList.get(i).getCrTp()));


                    partList.add(roPartVO);

                }

            } else {
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }
        }

        return partList;
    }

    /**
     * 공임을 등록/수정/삭제한다.
     * @param servicePartSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void multiServicePart(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String preFixId = serviceCmmVO.getPreFixId();

        ServicePartVO partVO = new ServicePartVO();
        partVO.setPreFixId(preFixId);
        partVO.setDocNo(serviceCmmVO.getDocNo());
        partVO.setDlrCd(dlrCd);
        servicePartDAO.deleteServicePart(partVO);

        if(!StringUtil.isNullToString(serviceCmmVO.getDelStatCd()).equals("C")){
            int lineNo = 1;

            for(ServicePartVO servicePartVO : servicePartSaveVO){
                servicePartVO.setRegUsrId(userId);
                servicePartVO.setDlrCd(dlrCd);
                servicePartVO.setPreFixId(preFixId);
                servicePartVO.setDocNo(serviceCmmVO.getDocNo());
                servicePartVO.setLineNo(lineNo++);
                servicePartDAO.insertServicePart(servicePartVO);

            }
        }
    }

    /**
     * 공임을 등록/수정/삭제한다(부품 요청 인터페이스용).
     * @param servicePartSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void multiServicePart(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO, boolean partIfYn) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String preFixId = serviceCmmVO.getPreFixId();

        //정비 쪽 부품 테이블 조회
        TabInfoSearchVO searchVO = new TabInfoSearchVO();
        searchVO.setsPreFixId(preFixId);
        searchVO.setsDocNo(serviceCmmVO.getDocNo());
        searchVO.setsDlrCd(dlrCd);
        List<ServicePartVO> sevicePartList =  servicePartDAO.selectServicePartsByCondition(searchVO);

        if(sevicePartList.size() > 0){
            if(!StringUtil.isEmpty(serviceCmmVO.getPastRoTp()) && !serviceCmmVO.getRoTp().equals(serviceCmmVO.getPastRoTp())){
                for(ServicePartVO partVO : sevicePartList){
                    if(StringUtil.nullConvert(partVO.getItemReqStatCd()).equals("02")){
                        throw processException("ser.info.notChgRoTp");
                    }
                }
            }
        }

        //부품요청 헤더 데이터 매핑
        IssueReqSaveVO issueReqSaveVO = new IssueReqSaveVO();
        List<IssueReqDetailVO> issueReqDetailVOList = new ArrayList<IssueReqDetailVO>();
        IssueReqVO issueReqVO = new IssueReqVO();

        int index = 0;
        for(ServicePartVO servicePartVO : servicePartSaveVO){

            for( ServicePartVO selectPartVO :  sevicePartList){

                // 부품 요청상태가 완료인경우 부품수량 비교
                if(selectPartVO.getItemCd().equals(servicePartVO.getItemCd()) &&
                   StringUtil.nullConvert(selectPartVO.getItemReqStatCd()).equals("02") &&
                   selectPartVO.getItemQty().compareTo(servicePartVO.getItemQty()) != 0){
                    CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER037", selectPartVO.getItemReqStatCd());
                    String[] lblList = new String[3];
                    lblList[0] = servicePartVO.getItemCd();
                    lblList[1] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                    lblList[2] = codeVO.getCmmCdNm();
                    throw processException("ser.info.impos", lblList);
                }

                if( servicePartVO.getItemCd().equals(selectPartVO.getItemCd()) && selectPartVO.getGiQty() > 0 ){
                    servicePartSaveVO.get(index).setGiQty(selectPartVO.getGiQty());
                }
            }
            index++;
        }

        //부품  출고수량이 없는 부품만 삭제
        ServicePartVO partVO = new ServicePartVO();
        partVO.setPreFixId(preFixId);
        partVO.setDocNo(serviceCmmVO.getDocNo());
        partVO.setDlrCd(dlrCd);
        partVO.setGiQty(0.00);
        servicePartDAO.deleteServicePart(partVO);

        boolean changeYn = false;
        String parReqStatCd = "02";
        if(servicePartSaveVO.size() > 0){
            parReqStatCd = "02";
        }else{
            parReqStatCd = "01";
        }

        //부품 출고 수량이 없는 부품만 부품 요청
        for(ServicePartVO servicePartVO : servicePartSaveVO){

            if(servicePartVO.getGiQty() == 0 ){

                int lineNo = servicePartDAO.selectServicePartMaxLineNo(searchVO);

                /*
                 * 출고전 부품 삭제 후 등록
                 * */

                //부품 등록
                servicePartVO.setRegUsrId(userId);
                servicePartVO.setDlrCd(dlrCd);
                servicePartVO.setPreFixId(preFixId);
                servicePartVO.setLineNo(lineNo);
                servicePartVO.setDocNo(serviceCmmVO.getDocNo());
                servicePartDAO.insertServicePart(servicePartVO);

                //정비 예약/부품예약/RO 추가/수정처리 시 부품요청상세정보 전달.
                IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
                issueReqDetailVO.setDlrCd(dlrCd);
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setItemCd(servicePartVO.getItemCd());
                issueReqDetailVO.setItemNm(servicePartVO.getItemNm());
                issueReqDetailVO.setPkgDocNo(servicePartVO.getPkgDocNo());
                issueReqDetailVO.setPkgItemCd(servicePartVO.getPkgItemCd());
                issueReqDetailVO.setResvDocNo(serviceCmmVO.getResvDocNo());
                issueReqDetailVO.setRoDocNo(serviceCmmVO.getDocNo());
                issueReqDetailVO.setParReqDocLineNo(servicePartVO.getLineNo());
                issueReqDetailVO.setRoLineNo(servicePartVO.getLineNo());
                //요청,예약,종료수량 부품수량 일치화.
                issueReqDetailVO.setReqQty(servicePartVO.getItemQty());
                issueReqDetailVO.setResvQty(servicePartVO.getItemQty());
                issueReqDetailVO.setEndQty(servicePartVO.getItemQty());
                //재고 제일 많은 창고 설정.

                String strgeCd = "WHP1";
                //부품창고  넣기.(재고수량있는창고:최대수량)
                StockInOutSearchVO stockInOutSearchVO = new StockInOutSearchVO();
                stockInOutSearchVO.setsDlrCd(dlrCd);
                stockInOutSearchVO.setsItemCd(servicePartVO.getItemCd());
                StockInOutVO stockInOutVO = stockInOutService.selectStockInOutMaxStrgeCdByItemCd(stockInOutSearchVO);

                if(stockInOutVO != null){
                    //- 페키지 일 경우 창고 세팅 로직 타게 한다. ( 창고 재고 제일 많은거)
                    //- 켐페인 일 경우 창고 세팅 로직 타게 한다. ( 창고 재고 제일 많은거)
                    //- 그냥 부품 추가 일 경우 창고 세팅 로직 안 타게 한다.
                    if(StringUtil.isEmpty(servicePartVO.getCrNo()) && StringUtil.isEmpty(servicePartVO.getPkgItemCd())){
                        issueReqDetailVO.setReqStrgeCd(servicePartVO.getReqStrgeCd());
                        issueReqDetailVO.setGrStrgeCd(servicePartVO.getGrStrgeCd());
                        issueReqDetailVO.setGiStrgeCd(servicePartVO.getGiStrgeCd());

                        issueReqDetailVO.setMovingAvgPrc((servicePartVO.getMovingAvgPrc()== null) ? 0 : servicePartVO.getMovingAvgPrc());
                        issueReqDetailVO.setMovingAvgAmt((servicePartVO.getMovingAvgPrc()== null) ? 0 : servicePartVO.getMovingAvgPrc() * servicePartVO.getItemQty());
                    }else{
                        issueReqDetailVO.setReqStrgeCd(stockInOutVO.getStrgeCd());
                        issueReqDetailVO.setGrStrgeCd(stockInOutVO.getStrgeCd());
                        issueReqDetailVO.setGiStrgeCd(stockInOutVO.getStrgeCd());

                        issueReqDetailVO.setMovingAvgPrc(stockInOutVO.getMovingAvgPrc());
                        issueReqDetailVO.setMovingAvgAmt(stockInOutVO.getMovingAvgPrc() * servicePartVO.getItemQty());
                    }
                }else{
                    issueReqDetailVO.setReqStrgeCd(strgeCd);
                    issueReqDetailVO.setGrStrgeCd(strgeCd);
                    issueReqDetailVO.setGiStrgeCd(strgeCd);

                    issueReqDetailVO.setMovingAvgPrc((servicePartVO.getMovingAvgPrc()== null) ? 0 : servicePartVO.getMovingAvgPrc());
                    issueReqDetailVO.setMovingAvgAmt((servicePartVO.getMovingAvgPrc()== null) ? 0 : servicePartVO.getMovingAvgPrc() * servicePartVO.getItemQty());
                }

                issueReqDetailVO.setCancYn("N");
                issueReqDetailVO.setParReqStatCd("01");
                issueReqDetailVO.setParGiTp(serviceCmmVO.getPartReqType());
                issueReqDetailVO.setReadyStatCd("01");//부품준비상태 : 01
                issueReqDetailVO.setUnitCd(servicePartVO.getCalcUnitCd());
                issueReqDetailVO.setTaxDdctGrtePrc(servicePartVO.getItemSalePrc());
                issueReqDetailVO.setItemPrc(servicePartVO.getItemPrc());
                issueReqDetailVO.setItemAmt(servicePartVO.getItemPrc() * servicePartVO.getItemQty());
                issueReqDetailVO.setRoTp(serviceCmmVO.getRoTp());
                issueReqDetailVO.setRoStatCd("01");
                issueReqDetailVO.setComItemCd(servicePartVO.getComItemCd());
                issueReqDetailVO.setComItemNm(servicePartVO.getComItemNm());
                issueReqDetailVO.setComItemPrc( (servicePartVO.getComItemPrc()== null) ? 0 : servicePartVO.getComItemPrc());
                issueReqDetailVO.setPaymCd(servicePartVO.getPaymCd());//지불자코드
                issueReqDetailVO.setPaymTp(servicePartVO.getPaymTp());//결제자유형
                issueReqDetailVO.setPaymUsrNm(servicePartVO.getPaymUsrNm());//결제자명
                issueReqDetailVO.setPartsPrcTp(servicePartVO.getPartsPrcTp());//부품가격유형
                issueReqDetailVOList.add(issueReqDetailVO);

                changeYn = true;

                parReqStatCd = "01";
            } else {
                servicePartVO.setUpdtUsrId(userId);
                servicePartVO.setDlrCd(dlrCd);
                servicePartVO.setPreFixId(preFixId);
                servicePartVO.setLineNo(servicePartVO.getLineNo());
                servicePartVO.setDocNo(serviceCmmVO.getDocNo());
                servicePartDAO.updateServicePart(servicePartVO);
            }
        }

        //if(StringUtils.defaultString(serviceCmmVO.getParReqStatCd(), "01").equals("02")){
            serviceCmmVO.setParReqStatCd(parReqStatCd);
        //}

        issueReqVO.setDlrCd(dlrCd);
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRoDocNo(serviceCmmVO.getDocNo());
        issueReqVO.setParGiTp(serviceCmmVO.getPartReqType());
        issueReqVO.setParReqStatCd(serviceCmmVO.getParReqStatCd());
        issueReqVO.setCancYn("N");

        issueReqVO.setCustCd( (StringUtil.nullConvert(serviceCmmVO.getPdiYn()).equals("Y")) ? "PDI" : serviceCmmVO.getDriverId());
        issueReqVO.setCustNm( (StringUtil.nullConvert(serviceCmmVO.getPdiYn()).equals("Y")) ? "PDI" : serviceCmmVO.getDriverNm());

        issueReqVO.setVinNo(serviceCmmVO.getVinNo());
        issueReqVO.setCarNo(serviceCmmVO.getCarRegNo());
        issueReqVO.setCarlineCd("");
        issueReqVO.setSerPrsnId(serviceCmmVO.getSaId());
        issueReqVO.setResvDocNo(serviceCmmVO.getResvDocNo());
        issueReqVO.setReadyStatCd("01");//부품준비상태 : 01
        issueReqVO.setRoTp(serviceCmmVO.getRoTp());
        issueReqVO.setRoStatCd(serviceCmmVO.getRoStatCd());//위탁확인 : 01

        /*
         * 부품요청헤더/상세 저장.
         * */

        issueReqSaveVO.setIssueReqVO(issueReqVO);
        if(changeYn){
            issueReqSaveVO.setIssueReqDetailVO(issueReqDetailVOList);
        }
        issueReqSaveVO = issueReqService.insertIssueReq(issueReqSaveVO);
    }



    /*
     * @see chn.bhmc.dms.ser.cmm.service.ServicePartService#selectServicePartMaxLineNo(chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO)
     */
    @Override
    public int selectServicePartMaxLineNo(TabInfoSearchVO searchVO) throws Exception {
        return servicePartDAO.selectServicePartMaxLineNo(searchVO);
    }

    /**
     * 공임을 등록/수정/삭제한다(부품 요청 인터페이스용).
     * @param servicePartSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void udpateServiceParts(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO) throws Exception {
        //부품 출고 수량이 없는 부품만 부품 요청
        for(ServicePartVO servicePartVO : servicePartSaveVO){
            servicePartVO.setUpdtUsrId(LoginUtil.getUserId());
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
            servicePartVO.setPreFixId(serviceCmmVO.getPreFixId());
            servicePartVO.setLineNo(servicePartVO.getLineNo());
            servicePartVO.setDocNo(serviceCmmVO.getDocNo());
            servicePartDAO.updateServicePart(servicePartVO);
        }
    }

    public void deleteServicePart(ServicePartVO servicePartVO) throws Exception {
        if( StringUtil.nullConvert(servicePartVO.getDlrCd()).equals("")){
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        servicePartDAO.deleteServicePart(servicePartVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.ServicePartService#insertServicePart(chn.bhmc.dms.ser.ro.vo.ServicePartVO)
     */
    @Override
    public void insertServicePart(ServicePartVO servicePartVO) throws Exception {

        if( StringUtil.nullConvert(servicePartVO.getDlrCd()).equals("")){
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        servicePartDAO.insertServicePart(servicePartVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.ServicePartService#updateServicePart(chn.bhmc.dms.ser.ro.vo.ServicePartVO)
     */
    @Override
    public void updateServicePart(ServicePartVO servicePartVO) throws Exception {

        if( StringUtil.nullConvert(servicePartVO.getDlrCd()).equals("")){
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        servicePartDAO.updateServicePart(servicePartVO);
    }

    /*
     * @see chn.bhmc.dms.ser.cmm.service.ServicePartService#selectServicePartByKey(chn.bhmc.dms.ser.cmm.vo.ServicePartVO)
     */
    @Override
    public ServicePartVO selectServicePartByKey(TabInfoSearchVO tabInfoSearchVO) throws Exception {
        return servicePartDAO.selectServicePartByKey(LoginUtil.getDlrCd(), tabInfoSearchVO.getsPreFixId(), tabInfoSearchVO.getsDocNo(), tabInfoSearchVO.getsItemCd());
    }

    @Override
    public boolean partGiQtyCheck(TabInfoSearchVO tabInfoSearchVO) throws Exception {

        if( StringUtil.nullConvert(tabInfoSearchVO.getsDlrCd()).equals("")){
            tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        tabInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<ServicePartVO> servicePartList = servicePartDAO.selectServicePartsByCondition(tabInfoSearchVO);

        boolean result = true;
        for(ServicePartVO partVO : servicePartList){
            if(!partVO.getItemReqStatCd().equals("02") && StringUtil.isEmpty(partVO.getComItemCd())){
                result = false;
                break;
            }
        }

        return result;

    }

    /*
     * @see chn.bhmc.dms.ser.cmm.service.ServicePartService#updateServicePartItemWork(chn.bhmc.dms.ser.cmm.vo.ServicePartVO)
     */
    @Override
    public void updateServicePartItemWork(ServicePartVO servicePartVO) throws Exception {
        servicePartDAO.updateServicePartItemWork(servicePartVO);
    }
}