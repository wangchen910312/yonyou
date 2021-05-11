package chn.bhmc.dms.par.ism.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;

import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.dao.IssueReqDAO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqStatusVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pcm.service.PurcRqstService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;

/**
 * 구매요청 헤더 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issueReqService")
public class IssueReqServiceImpl extends HService implements IssueReqService {

    @Resource(name="issueReqDAO")
    private IssueReqDAO issueReqDAO;

    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    @Resource(name="purcRqstService")
    PurcRqstService purcRqstService;

    @Resource(name="parReqDocNoIdgenService")
    TableIdGenService parReqDocNoIdgenService;

    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /*
     * 입출고예정 필수 체크 서비스
    */
    @Resource(name="grGiScheduleService")
    GrGiScheduleService grGiScheduleService;

    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;


    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#insertIssueReq(chn.bhmc.dms.par.ism.vo.IssueReqVO)
     */
    @Override
    public int insertIssueReq(IssueReqVO issueReqVO) throws Exception {

        //부품요청키 생성.
        if(StringUtils.isEmpty(issueReqVO.getParReqDocNo())){
            synchronized (parReqDocNoIdgenService) {
                // 부품요청키 가져오기.
                issueReqVO.setParReqDocNo(parReqDocNoIdgenService.getNextStringId());
            }
        }

        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRegUsrId(LoginUtil.getUserId());
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
        return issueReqDAO.insertIssueReq(issueReqVO);
    }



    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#insertInKeyIssueReq(chn.bhmc.dms.par.ism.vo.IssueReqVO)
     */
    @Override
    public int insertInKeyIssueReq(IssueReqVO issueReqVO) throws Exception {

        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRegUsrId(LoginUtil.getUserId());
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
        return issueReqDAO.insertIssueReq(issueReqVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#insertIssueReq(chn.bhmc.dms.par.ism.vo.IssueReqSaveVO)
     */
    @Override
    public IssueReqSaveVO insertIssueReq(IssueReqSaveVO issueReqSaveVO) throws Exception {

        IssueReqVO issueReqVO;
        List<IssueReqDetailVO> issueReqDetailVOList;

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

        // 구매요청 헤더 정보 가져오기.
        issueReqVO = issueReqSaveVO.getIssueReqVO();
        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRegUsrId(LoginUtil.getUserId());
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

        // 구매요청상세 목록 정보 가져오기.
        issueReqDetailVOList = issueReqSaveVO.getIssueReqDetailVO();
        // 유효성 메시지 Array
        String[] lblList = new String[1];

        // 딜러코드
        if(StringUtils.isEmpty(issueReqVO.getDlrCd())){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 부품요청상태코드
        if(StringUtils.isEmpty(issueReqVO.getParReqStatCd())){
            lblList[0] = messageSource.getMessage("par.lbl.parReqStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        // 부품요청상태코드 RO일때만(예약접수:SR,서비스RO:RO,부품판매:미정)
        if(StringUtils.isEmpty(issueReqVO.getParReqDocNo()) || "RO".equals(issueReqVO.getParGiTp())){
            // RO일련번호
            if(StringUtils.isEmpty(issueReqVO.getRoDocNo())){
                lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
        }

        if(StringUtils.isEmpty(issueReqVO.getParReqStatCd()) || "SR".equals(issueReqVO.getParGiTp())){
            // 예약문서번호
            if(StringUtils.isEmpty(issueReqVO.getResvDocNo())){
                lblList[0] = messageSource.getMessage("par.lbl.resvDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
        }
        // 센터코드
        if(StringUtils.isEmpty(issueReqVO.getPltCd())){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객코드
        if(StringUtils.isEmpty(issueReqVO.getCustCd())){
            lblList[0] = messageSource.getMessage("par.lbl.custCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객명
        if(StringUtils.isEmpty(issueReqVO.getCustNm())){
            lblList[0] = messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
        issueReqSearchVO.setsItemCntYn("N");//부품요청상세 카운트 여부.

        /*
         * 1.부품요청헤더 카운트 조회.
         * RO번호
         * */

        if(issueReqDAO.selectIssueReqsByConditionCnt(issueReqSearchVO) > 0 ){
            /*
             * 1.부품요청헤더 가져오기.
             *
             * */
            IssueReqVO issueReqByKeyVO = issueReqDAO.selectIssueReqByKey(LoginUtil.getDlrCd(), null, issueReqVO.getRoDocNo(), issueReqVO.getParGiTp());

            /*
             * 2.부품요청헤더 수정.
             *
             * */
            issueReqVO.setParReqDocNo(issueReqByKeyVO.getParReqDocNo());
            issueReqDAO.updateIssueReq(issueReqVO);

            /*
             * 3.출고예정수량 반환
             *
             * */

            //부품상세 검색 VO
            IssueReqSearchVO searchVO = new IssueReqSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());           //딜러코드
            searchVO.setsRoDocNo(issueReqVO.getRoDocNo());      //RO번호
            searchVO.setsParGiTp(issueReqVO.getParGiTp());      //부품요청유형

            if("RO".equals(issueReqVO.getParGiTp())){//입출고예정정보 삭제 RO 일때만
                searchVO.setsParGiTp("PG03");//유형 RO 및 차용제외.
                List<IssueReqDetailVO> issueReqDetailDeleteVOList = issueReqDetailService.selectIssueReqDetailsByCondition(searchVO);

                for(IssueReqDetailVO issueReqDetailDeleteVO : issueReqDetailDeleteVOList){
                    GrGiScheduleVO purcOrdGrGiScheduleRetrunVO = new GrGiScheduleVO();
                    purcOrdGrGiScheduleRetrunVO.setDlrCd(LoginUtil.getDlrCd());
                    purcOrdGrGiScheduleRetrunVO.setPltCd(LoginUtil.getPltCd());
                    purcOrdGrGiScheduleRetrunVO.setStrgeCd(issueReqDetailDeleteVO.getGrStrgeCd());
                    purcOrdGrGiScheduleRetrunVO.setItemCd(issueReqDetailDeleteVO.getItemCd());
                    purcOrdGrGiScheduleRetrunVO.setGrGiDocNo(issueReqDetailDeleteVO.getRoDocNo());
                    purcOrdGrGiScheduleRetrunVO.setGrGiDocLineNo(issueReqDetailDeleteVO.getRoLineNo());
                    purcOrdGrGiScheduleRetrunVO.setGrGiTp("I");//출고예정구분자
                    purcOrdGrGiScheduleRetrunVO.setProcQty(issueReqDetailDeleteVO.getReqQty()* -1);//출고예정정보반환.
                    purcOrdGrGiScheduleRetrunVO.setGrGiQty(issueReqDetailDeleteVO.getReqQty());
                    VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
                    purcOrdGrGiScheduleRetrunVO.setBpCd(bhmcVenderVO.getBpCd());
                    purcOrdGrGiScheduleRetrunVO.setRegUsrId(LoginUtil.getUserId());

                    if(purcOrdGrGiScheduleRetrunVO.getGrGiQty() > 0){//입출고수량 0보다 클때만 실행.
                        grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleRetrunVO);
                    }
                }
            }

            /*
             * 4.부품요청상세 삭제.
             *
             * */
            IssueReqDetailVO delIssueReqDetailVO = new IssueReqDetailVO();
            delIssueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            delIssueReqDetailVO.setRoDocNo(issueReqVO.getRoDocNo());

            if("SR".equals(issueReqVO.getParGiTp()) || "SP".equals(issueReqVO.getParGiTp())){//페이지 요청구분 : 예약,부품예약
                delIssueReqDetailVO.setReadyStatCd("01");//부품요청예류 요청만 삭제.
            }else{//페이지 요청구분 : RO
                delIssueReqDetailVO.setParReqStatCd("01");//RO부품 추가/삭제 로 인한 부품요청상세 등록만 삭제.
                delIssueReqDetailVO.setBorrowDocNoUseYn("N");//차용번호없는 부품만
            }

            //부품예류부품 정비예약(06) 부품예류(03)변환.
            delIssueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDetailService.updateIssueReqDetailReadyStatusReturn(delIssueReqDetailVO);

            //부품요청 삭제 처리.
            issueReqDetailService.deleteIssueReqDetail(delIssueReqDetailVO);

            if(issueReqDetailVOList != null){
                //부품요청리스트.
                for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                    if(StringUtils.isEmpty(issueReqVO.getParReqStatCd()) || "RO".equals(issueReqVO.getParGiTp())){
                        //RO번호
                        if(StringUtils.isEmpty(issueReqDetailVO.getRoDocNo())){
                            lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                            throw processException("par.info.issueCheckMsg", lblList);
                        }
                        //RO라인번호
                        if(issueReqDetailVO.getRoLineNo() < 1){
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.roDocLineNo", null, LocaleContextHolder.getLocale());
                            lblList[1] = "0";
                            throw processException("par.info.itemReqZeroCntMsg", lblList);
                        }
                    }
                    //부품번호
                    if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());
                        throw processException("par.info.issueCheckMsg", lblList);
                    }
                    //요청수량
                    if(issueReqDetailVO.getReqQty() < 0){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.reqQty", null, LocaleContextHolder.getLocale());
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }

                    if(StringUtils.isEmpty(issueReqDetailVO.getUnitCd())){
                        issueReqDetailVO.setUnitCd("EA");
                    }

                    if("SP".equals(issueReqVO.getParGiTp())){//부품예약일때 요청수량을 예약수량 설정.
                        issueReqDetailVO.setResvQty(issueReqDetailVO.getReqQty());
                    }

                    issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                    issueReqDetailVO.setParReqDocNo(issueReqByKeyVO.getParReqDocNo());

                    issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());

                    double itemQty = issueReqDetailVO.getEndQty();
                    double itemPrc = issueReqDetailVO.getItemPrc();
                    double itemAmt = itemPrc * itemQty;
                    double taxDdctAmt = (itemPrc / (1 + vatInfoVO.getVatApplyRate())) * itemQty;
                    double taxAmt = itemAmt - taxDdctAmt;
                    issueReqDetailVO.setTaxAmt(taxAmt);//세금액 계산

                    IssueReqSearchVO issueReqDetailSearchVO = new IssueReqSearchVO();
                    issueReqDetailSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    issueReqDetailSearchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());
                    issueReqDetailSearchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());
                    issueReqDetailSearchVO.setsItemCd(issueReqDetailVO.getItemCd());
                    issueReqDetailSearchVO.setsParGiTp(issueReqDetailVO.getParGiTp());

                    List<IssueReqDetailVO> issueReqDetailDbVOList = null;
                    if("SR".equals(issueReqDetailVO.getParGiTp()) || "SP".equals(issueReqDetailVO.getParGiTp())){
                        //예약,부품예약 저장 부품요청 상세 리스트
                        issueReqDetailDbVOList = issueReqDetailService.selectIssueReqDetailSrSpItemList(issueReqDetailSearchVO);
                    }else{
                        //RO 저장 부품요청 상세 리스트
                        issueReqDetailDbVOList = issueReqDetailService.selectIssueReqDetailRoItemList(issueReqDetailSearchVO);
                    }

                    //추가 구분자 유무
                    boolean iInsertYn = false;
                    //부품요청상세/RO라인번호 가져오기.
                    int maxParReqDocNo = 1;//기본값 1
                    if(issueReqDetailDbVOList.size() > 0){//부품요청상세 부품 있을 때
                        for(IssueReqDetailVO issueReqDetailDbVO : issueReqDetailDbVOList){
                            if("SR".equals(issueReqDetailDbVO.getParGiTp()) || "SP".equals(issueReqDetailDbVO.getParGiTp())){//부품요청유형 예약접수(SR): 부품예약(SP)
                                if("01".equals(issueReqDetailDbVO.getReadyStatCd()) || "02".equals(issueReqDetailDbVO.getReadyStatCd())){//부품예류상태 등록(01) : 준비(02)
                                    iInsertYn = true;//1개라도 있으면 추가 구분자 유무 true
                                }
                            }else{
                                iInsertYn = true;//1개라도 있으면 추가 구분자 유무 true
                            }
                        }
                    }else{//부품요청상세 부품 없을 때
                        iInsertYn = true;
                    }

                    //부품요청상세 추가.
                    if(iInsertYn){
                        if("RO".equals(issueReqDetailVO.getParGiTp())){
                            //부품요청번호 RO번호 일치화.
                            maxParReqDocNo = issueReqDetailService.selectIssueReqDetailsMaxNumByConditionCnt(searchVO);
                            issueReqDetailVO.setParReqDocLineNo(maxParReqDocNo);
                            issueReqDetailVO.setRoLineNo(issueReqDetailVO.getRoLineNo());
                            issueReqDetailVO.setParReqDocStockLineNo(issueReqDetailVO.getRoLineNo());
                        }
                        issueReqDetailService.insertIssueReqDetailRo(issueReqDetailVO);
                    }

                    if("RO".equals(issueReqVO.getParGiTp())){
                        //입출고예정정보
                        GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();
                        purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcOrdGrGiScheduleVO.setStrgeCd(issueReqDetailVO.getGrStrgeCd());
                        purcOrdGrGiScheduleVO.setItemCd(issueReqDetailVO.getItemCd());
                        purcOrdGrGiScheduleVO.setGrGiDocNo(issueReqDetailVO.getRoDocNo());
                        purcOrdGrGiScheduleVO.setGrGiDocLineNo(issueReqDetailVO.getRoLineNo());
                        purcOrdGrGiScheduleVO.setGrGiTp("I");//출고예정구분자
                        purcOrdGrGiScheduleVO.setProcQty(issueReqDetailVO.getReqQty());
                        purcOrdGrGiScheduleVO.setGrGiQty(issueReqDetailVO.getReqQty());
                        VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setBpCd(bhmcVenderVO.getBpCd());
                        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        if(purcOrdGrGiScheduleVO.getGrGiQty() > 0){//입출고수량 0보다 클때만 실행.
                            grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                        }
                    }

                }
            }
        }else{
            // 부품요청키 생성.
            String parReqDocNo = "";
            synchronized (parReqDocNoIdgenService) {
                // 부품요청키 가져오기.
                parReqDocNo = parReqDocNoIdgenService.getNextStringId();
                issueReqVO.setParReqDocNo(parReqDocNo);
            }

            // 부품요청헤더 추가.
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setPltCd(LoginUtil.getPltCd());
            issueReqVO.setRegUsrId(LoginUtil.getUserId());
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDAO.insertIssueReq(issueReqVO);

            if(issueReqDetailVOList != null){
                for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                    if("RO".equals(issueReqVO.getParGiTp())){
                        //RO번호
                        if(StringUtils.isEmpty(issueReqDetailVO.getRoDocNo())){
                            lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                            throw processException("par.info.issueCheckMsg", lblList);
                        }
                        //RO라인번호
                        if(issueReqDetailVO.getRoLineNo() < 1){
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.roDocLineNo", null, LocaleContextHolder.getLocale());
                            lblList[1] = "0";
                            throw processException("par.info.itemReqZeroCntMsg", lblList);
                        }
                    }
                    //부품번호
                    if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());
                        throw processException("par.info.issueCheckMsg", lblList);
                    }
                    //요청수량
                    if(issueReqDetailVO.getReqQty() < 1){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.reqQty", null, LocaleContextHolder.getLocale());
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }

                    if(StringUtils.isEmpty(issueReqDetailVO.getUnitCd())){
                        issueReqDetailVO.setUnitCd("EA");
                    }

                    if("SP".equals(issueReqVO.getParGiTp())){
                        issueReqDetailVO.setResvQty(issueReqDetailVO.getReqQty());
                    }

                    //부품요청번호 RO번호 일치화.
                    issueReqDetailVO.setParReqDocNo(parReqDocNo);
                    issueReqDetailVO.setParReqDocLineNo(issueReqDetailVO.getRoLineNo());
                    issueReqDetailVO.setParReqDocStockLineNo(issueReqDetailVO.getRoLineNo());
                    issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                    issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());

                    double itemQty = issueReqDetailVO.getEndQty();
                    double itemPrc = issueReqDetailVO.getItemPrc();
                    double itemAmt = itemPrc * itemQty;
                    double taxDdctAmt = (itemPrc / (1 + vatInfoVO.getVatApplyRate())) * itemQty;
                    double taxAmt = itemAmt - taxDdctAmt;
                    issueReqDetailVO.setTaxAmt(taxAmt);//세금액 계산

                    issueReqDetailService.insertIssueReqDetailRo(issueReqDetailVO);

                    if("RO".equals(issueReqVO.getParGiTp())){
                        //BMP시에만 출고예정정보 생성함.
                        //[구매오더]입출고예정정보
                        GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();
                        purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcOrdGrGiScheduleVO.setStrgeCd(issueReqDetailVO.getGrStrgeCd());
                        purcOrdGrGiScheduleVO.setItemCd(issueReqDetailVO.getItemCd());
                        purcOrdGrGiScheduleVO.setGrGiDocNo(issueReqDetailVO.getRoDocNo());
                        purcOrdGrGiScheduleVO.setGrGiDocLineNo(issueReqDetailVO.getRoLineNo());
                        purcOrdGrGiScheduleVO.setGrGiTp("I");//출고예정구분자
                        purcOrdGrGiScheduleVO.setProcQty(issueReqDetailVO.getReqQty());
                        purcOrdGrGiScheduleVO.setGrGiQty(issueReqDetailVO.getReqQty());
                        VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setBpCd(bhmcVenderVO.getBpCd());
                        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        if(purcOrdGrGiScheduleVO.getGrGiQty() > 0){//입출고수량 0보다 클때만 실행.
                            grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                        }
                    }
                }
            }
        }

        //부품구매요청
        if("SP".equals(issueReqVO.getParGiTp())){
            BaseSaveVO<IssueReqDetailVO> purcRgstObj = new BaseSaveVO<IssueReqDetailVO>();
             //purcRgstObj.setUpdateList(issueReqDetailVOList);
       	     //purcRqstService.multiIssueReqDetailPartsRoes(purcRgstObj);
            //R19031700389 客户反馈配件预留单号：PE2019030007，删除配件编号：0000.点击确认一直显示加载中 贾明 start 2019-3-20 
            if(issueReqDetailVOList != null){
            	 purcRgstObj.setUpdateList(issueReqDetailVOList);
            	 purcRqstService.multiIssueReqDetailPartsRoes(purcRgstObj);
            }
          //R19031700389 客户反馈配件预留单号：PE2019030007，删除配件编号：0000.点击确认一直显示加载中 贾明 end 2019-3-20 
        }

        return issueReqSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#insertIssueInnerReq(chn.bhmc.dms.par.ism.vo.IssueReqSaveVO)
     */
    @Override
    public IssueReqSaveVO insertIssueInnerReq(IssueReqSaveVO issueReqSaveVO) throws Exception {

        IssueReqVO issueReqVO;
        List<IssueReqDetailVO> issueReqDetailVOList;

        // 구매요청 헤더 정보 가져오기.
        issueReqVO = issueReqSaveVO.getIssueReqVO();
        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRegUsrId(LoginUtil.getUserId());
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

        // 구매요청상세 목록 정보 가져오기.
        issueReqDetailVOList = issueReqSaveVO.getIssueReqDetailVO();
        // 유효성 메시지 Array
        String[] lblList = new String[1];

        // 딜러코드
        if(StringUtils.isEmpty(issueReqVO.getDlrCd())){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 부품요청상태코드
        if(StringUtils.isEmpty(issueReqVO.getParReqStatCd())){
            lblList[0] = messageSource.getMessage("par.lbl.parReqStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        //RO일련번호
        if(StringUtils.isEmpty(issueReqVO.getRoDocNo())){
            lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        // 센터코드
        if(StringUtils.isEmpty(issueReqVO.getPltCd())){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());

        if(!StringUtils.isEmpty(issueReqVO.getParReqDocNo())){
            //부품요청헤더 수정.
            issueReqDAO.updateIssueReq(issueReqVO);
            // 부품요청상세 삭제.
            IssueReqDetailVO delIssueReqDetailVO = new IssueReqDetailVO();
            delIssueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            delIssueReqDetailVO.setParGiTp("IN");
            delIssueReqDetailVO.setParReqDocNo(issueReqVO.getParReqDocNo());
            delIssueReqDetailVO.setParReqStatCd("01");//등록만
            issueReqDetailService.deleteIssueReqDetail(delIssueReqDetailVO);

            for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                //부품번호
                if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                    lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());
                    throw processException("par.info.issueCheckMsg", lblList);
                }
                //내부수령일때만 요청수량 체크.
                if("02".equals(issueReqDetailVO.getParReqStatCd())){
                    //요청수량
                    if(issueReqDetailVO.getReqQty() < 1){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.reqQty", null, LocaleContextHolder.getLocale());
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }
                }else if("01".equals(issueReqDetailVO.getParReqStatCd())){//요청일때 수량 0 처리
                    issueReqDetailVO.setResvQty(0);
                    issueReqDetailVO.setReqQty(0);
                    issueReqDetailVO.setEndQty(0);
                }

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setParReqDocNo(issueReqVO.getParReqDocNo());
                //부품요청번호 RO번호 일치화.
                issueReqDetailVO.setParReqDocLineNo(issueReqDetailVO.getRoLineNo());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                //부품단위코드 없을 때
                if(StringUtils.isEmpty(issueReqDetailVO.getUnitCd())){
                    issueReqDetailVO.setUnitCd("EA");
                }
                //기타출고유형
                issueReqDetailVO.setEtcGiTp(issueReqVO.getGiStatCd());
                // 부품요청상세 추가.
                issueReqDetailService.insertIssueReqDetail(issueReqDetailVO);

            }
        }else{
            // 부품요청키 생성.
            String parReqDocNo = "";
            synchronized (parReqDocNoIdgenService) {
                ParReqDocNoIdGenStrategy parReqDocNoIdGenStrategy = (ParReqDocNoIdGenStrategy)parReqDocNoIdgenService.getStrategy();
                parReqDocNoIdGenStrategy.setPrefix("RQ");
                // 부품요청키 가져오기.
                parReqDocNo = parReqDocNoIdgenService.getNextStringId();
                issueReqVO.setParReqDocNo(parReqDocNo);
                issueReqVO.setRoDocNo(parReqDocNo);
            }

            // 부품요청헤더 추가.
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setPltCd(LoginUtil.getPltCd());
            issueReqVO.setRegUsrId(LoginUtil.getUserId());
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

            if(StringUtils.isEmpty(issueReqVO.getCustNm())){
                issueReqVO.setCustNm(" ");
            }

            issueReqDAO.insertIssueReq(issueReqVO);

            for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                //부품번호
                if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                    lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());
                    throw processException("par.info.issueCheckMsg", lblList);
                }
                //내부수령일때만 요청수량 체크.
                if("02".equals(issueReqDetailVO.getParReqStatCd())){
                    //요청수량
                    if(issueReqDetailVO.getReqQty() < 1){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.reqQty", null, LocaleContextHolder.getLocale());
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }
                }else if("01".equals(issueReqDetailVO.getParReqStatCd())){//요청일때 수량 0 처리
                    issueReqDetailVO.setResvQty(0);
                    issueReqDetailVO.setReqQty(0);
                    issueReqDetailVO.setEndQty(0);
                }

                // 부품요청번호 RO번호 일치화.
                issueReqDetailVO.setParReqDocLineNo(issueReqDetailVO.getRoLineNo());
                issueReqDetailVO.setParReqDocNo(parReqDocNo);
                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                // 부품단위코드 없을 때
                if(StringUtils.isEmpty(issueReqDetailVO.getUnitCd())){
                    issueReqDetailVO.setUnitCd("EA");
                }
                //기타출고유형
                issueReqDetailVO.setEtcGiTp(issueReqVO.getGiStatCd());
                issueReqDetailService.insertIssueReqDetail(issueReqDetailVO);
            }
        }

        return issueReqSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#updateIssueReq(chn.bhmc.dms.par.ism.vo.IssueReqVO)
     */
    @Override
    public int updateIssueReq(IssueReqVO issueReqVO) throws Exception {
        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
        return issueReqDAO.updateIssueReq(issueReqVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#updateIssueReq(chn.bhmc.dms.par.ism.vo.IssueReqSaveVO)
     */
    @Override
    public IssueReqSaveVO updateIssueReq(IssueReqSaveVO issueReqSaveVO) throws Exception {
        IssueReqVO issueReqVO;
        List<IssueReqDetailVO> issueReqDetailVOList;

        // 구매요청 헤더 정보 가져오기.
        issueReqVO = issueReqSaveVO.getIssueReqVO();
        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRegUsrId(LoginUtil.getUserId());
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

        // 구매요청상세 목록 정보 가져오기.
        issueReqDetailVOList = issueReqSaveVO.getIssueReqDetailVO();
        // 유효성 메시지 Array
        String[] lblList = new String[1];

        // 딜러코드
        if(StringUtils.isEmpty(LoginUtil.getDlrCd())){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 부품요청상태코드
        if(StringUtils.isEmpty(issueReqVO.getParReqStatCd())){
            lblList[0] = messageSource.getMessage("par.lbl.parReqStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        // 부품요청상태코드 RO일때만(예약접수:SR,서비스RO:RO,부품판매:미정)
        if("RO".equals(issueReqVO.getParReqStatCd())){
            // RO일련번호
            if(StringUtils.isEmpty(issueReqVO.getRoDocNo())){
                lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 차대번호
            if(StringUtils.isEmpty(issueReqVO.getVinNo())){
                lblList[0] = messageSource.getMessage("par.lbl.vinNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 차량번호
            if(StringUtils.isEmpty(issueReqVO.getCarNo())){
                lblList[0] = messageSource.getMessage("par.lbl.carNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }

            issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
            issueReqSearchVO.setsParReqStatCd("02"); // 완료
            // 출고요청상세 작업 진행 체크.
            if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO) > 0){
                lblList[0] = messageSource.getMessage("par.lbl.releaseReq", null, LocaleContextHolder.getLocale()); //출고요청
                throw processException("global.info.isWorkRun", lblList);// 진행 중 입니다.
            }
        }

        if(StringUtils.isEmpty(issueReqVO.getParReqStatCd()) || "SR".equals(issueReqVO.getParReqStatCd())){
            // 예약문서번호
            if(StringUtils.isEmpty(issueReqVO.getResvDocNo())){
                lblList[0] = messageSource.getMessage("par.lbl.resvDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
        }
        // 센터코드
        if(StringUtils.isEmpty(issueReqVO.getPltCd())){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객코드
        if(StringUtils.isEmpty(issueReqVO.getCustCd())){
            lblList[0] = messageSource.getMessage("par.lbl.custCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객명
        if(StringUtils.isEmpty(issueReqVO.getCustNm())){
            lblList[0] = messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
        if(issueReqDAO.selectIssueReqsByConditionCnt(issueReqSearchVO) > 0 )
        {
            // 부품요청헤더 가져오기.
            IssueReqVO issueReqByKeyVO = issueReqDAO.selectIssueReqByKey(LoginUtil.getDlrCd(), null, issueReqVO.getRoDocNo(), null);

            // 부품요청헤더 수정.
            issueReqVO.setParReqDocNo(issueReqByKeyVO.getParReqDocNo());
            issueReqDAO.updateIssueReq(issueReqVO);

            // 부품요청상세 삭제.
            IssueReqDetailVO delIssueReqDetailVO = new IssueReqDetailVO();
            delIssueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            delIssueReqDetailVO.setRoDocNo(issueReqVO.getRoDocNo());
            issueReqDetailService.deleteIssueReqDetail(delIssueReqDetailVO);

            // 부품요청상세 추가.
            int parReqDocLineNo = 0;
            for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                if(StringUtils.isEmpty(issueReqVO.getParReqStatCd()) || "RO".equals(issueReqVO.getParReqStatCd())){
                    //RO번호
                    if(StringUtils.isEmpty(issueReqDetailVO.getRoDocNo())){
                        lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                        throw processException("par.info.issueCheckMsg", lblList);
                    }
                    //RO라인번호
                    if(issueReqDetailVO.getRoLineNo() < 1){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.roDocLineNo", null, LocaleContextHolder.getLocale());
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }
                }
                //부품번호
                if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                    lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());
                    throw processException("par.info.issueCheckMsg", lblList);
                }

                //요청수량
                if(issueReqDetailVO.getReqQty() < 1){
                    lblList = new String[2];
                    lblList[0] = messageSource.getMessage("par.lbl.reqQty", null, LocaleContextHolder.getLocale());
                    lblList[1] = "0";
                    throw processException("par.info.itemReqZeroCntMsg", lblList);
                }

                // 부품요청라인번호 없을 때 추가
                if(issueReqDetailVO.getParReqDocLineNo() < 1){
                    parReqDocLineNo = parReqDocLineNo + 1;
                    issueReqDetailVO.setParReqDocLineNo(parReqDocLineNo);
                    issueReqDetailVO.setRoLineNo(parReqDocLineNo);
                    issueReqDetailVO.setResvDocLineNo(parReqDocLineNo);
                }

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setParReqDocNo(issueReqByKeyVO.getParReqDocNo());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());

                // 부품요청상세 추가.
                issueReqDetailService.insertIssueReqDetail(issueReqDetailVO);
            }
        }

        return issueReqSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#deleteIssueReq(chn.bhmc.dms.par.ism.vo.IssueReqVO)
     */
    @Override
    public int deleteIssueReq(IssueReqVO issueReqVO) throws Exception {
        return issueReqDAO.deleteIssueReq(issueReqVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#selectIssueReqByKey(java.lang.String)
     */
    @Override
    public IssueReqVO selectIssueReqByKey(String dlrCd, String parReqDocNo, String roDocNo, String parGiTp) throws Exception {
        return issueReqDAO.selectIssueReqByKey(dlrCd, parReqDocNo, roDocNo, parGiTp);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#selectIssueReqsByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqVO> selectIssueReqsByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDAO.selectIssueReqsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#selectIssueReqsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqsByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDAO.selectIssueReqsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#selectIssueReqStatuesByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqStatusVO> selectIssueReqStatuesByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDAO.selectIssueReqStatuesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#selectIssueReqStatuesByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqStatuesByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDAO.selectIssueReqStatuesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#updateIssueHeaderStatus()
     */
    @Override
    public void updateIssueHeaderStatus(String parReqDocNo) throws Exception {

        String sParReqDocNo = parReqDocNo;

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsParReqDocNo(sParReqDocNo);
        issueReqSearchVO.setsParReqStatCd("01");//PAR_REQ_STAT_CD:REQ
        issueReqSearchVO.setsBorrowStatCd("BORROW_STAT_06");//차용상태 반환 제외.
        //부품요청상세 등록 및 차용상태코드 반환(03) 제외 카운트
        int totIssueReqDetailRequestCnt = issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO);
        //부품요청상세 전체 조회.
        issueReqSearchVO.setsParReqStatCd("");
        int totIssueReqDetailCnt = issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO);

        IssueReqVO issueReqVO = new IssueReqVO();
        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setParReqDocNo(sParReqDocNo);
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

        //부품요청상태 요청 카운트 조회
        if(totIssueReqDetailRequestCnt == 0 && totIssueReqDetailCnt > 0){//부품차용 등록상태 부품 없을 때 & 정비수령 부품요청전체수량 > 0
            //부품요청상세 출고 완료수량(+) 반품수량(-) 계산 정보 조회.
            IssueReqDetailVO issueReqDetailVO = issueReqDetailService.selectIssueReqDetailMaxEndQty(issueReqSearchVO);

            //반품수량이 완료수량과 크거나 같을 때 등록상태 : 반품
            if(issueReqDetailVO.getEndQty() <= 0){
                issueReqVO.setParReqStatCd("03");
            }else{//등록상태 : 완성
                issueReqVO.setParReqStatCd("02");
            }
        }else{
            issueReqVO.setParReqStatCd("01");
        }

        issueReqDAO.updateIssueReq(issueReqVO);
    }



}
