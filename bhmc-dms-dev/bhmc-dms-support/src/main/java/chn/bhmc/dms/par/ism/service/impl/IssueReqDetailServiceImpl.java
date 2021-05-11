package chn.bhmc.dms.par.ism.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqResvService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.service.dao.IssueReqDetailDAO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailBorrowSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailResvSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqRoItemDelVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.rev.service.PartReservationService;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.rev.vo.PartReservationSearchVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 구매요청 상세 구현 클래스
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
@Service("issueReqDetailService")
public class IssueReqDetailServiceImpl extends HService implements IssueReqDetailService , JxlsSupport {

    Logger logger = LoggerFactory.getLogger(IssueReqDetailServiceImpl.class);

    /**
     * 부품요청 상세 DAO
     */
    @Resource(name="issueReqDetailDAO")
    private IssueReqDetailDAO issueReqDetailDAO;

    /**
     * 정비통합 부품 서비스
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    /**
     * 정비통합 공임 서비스
     */
    @Resource(name="serviceLaborService")
    ServiceLaborService serviceLaborService;

    /**
     * 부품요청키젠 서비스
     */

    @Resource(name="parReqDocNoIdgenService")
    TableIdGenService parReqDocNoIdgenService;

    /**
     * 부품요청 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 부품요청예약 서비스
     */
    @Resource(name="issueReqResvService")
    IssueReqResvService issueReqResvService;

    /**
     * 부품예류 키생성
     */
    @Resource(name="parResvReadyDocNoIdgenService")
    TableIdGenService parResvReadyDocNoIdgenService;

    /**
     * 부품차용 키생성
     */
    @Resource(name="parBorrowDocNoIdgenService")
    TableIdGenService parBorrowDocNoIdgenService;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 부품출고키젠 서비스
     */
    @Resource(name="giDocNoIdgenService")
    EgovIdGnrService giDocNoIdgenService;

    /**
     * 부품출고헤더 서비스
     */
    @Resource(name="issuePartsOutService")
    IssuePartsOutService issuePartsOutService;

    /**
     * 부품출고상세 서비스
     */
    @Resource(name="issuePartsOutDetailService")
    IssuePartsOutDetailService issuePartsOutDetailService;

    /*
     * 입출고예정 필수 체크 서비스
    */
    @Resource(name="grGiScheduleService")
    GrGiScheduleService grGiScheduleService;

    /**
     * 업체 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * SA 서비스
     */
    @Resource(name="issueReqTechManService")
    IssueReqTechManService issueReqTechManService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * RO관리 서비스
     */
    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     * 정비예약 서비스
     */
    @Resource(name="reservationReceiptService")
    ReservationReceiptService reservationReceiptService;

    /**
     * 부품예약 서비스
     */
    @Resource(name="partReservationService")
    PartReservationService partReservationService;

    /**
     * 维修预约_配件预留_通知预留单创建人  贾明 2018-4-2
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;


    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#insertIssueReqDetailRo(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public int insertIssueReqDetailRo(IssueReqDetailVO issueReqDetailVO) throws Exception {
        issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
        issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
        issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
        return issueReqDetailDAO.insertIssueReqDetailRo(issueReqDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#insertIssueReqDetailResv(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public int insertIssueReqDetailReady(IssueReqDetailVO issueReqDetailVO) throws Exception {
        issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
        issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
        issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
        return issueReqDetailDAO.insertIssueReqDetailReady(issueReqDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsMaxNumByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqDetailsMaxNumByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailsMaxNumByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#insertIssueReqDetail(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public int insertIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception {
        issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
        issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
        issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
        return issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#insertIssueReqDetailBorrow(chn.bhmc.dms.par.ism.vo.IssueReqDetailBorrowSaveVO)
     */
    @Override
    public IssueReqDetailBorrowSaveVO insertIssueReqDetailBorrow(IssueReqDetailBorrowSaveVO issueReqDetailBorrowSaveVO)
            throws Exception {

        IssueReqVO issueReqVO = issueReqDetailBorrowSaveVO.getIssueReqVO();
        String[] lblList = new String[1];

        //RO상태에 따른 부품작업 진행 처리.
        RepairOrderSearchVO repairOrderVO = new RepairOrderSearchVO();
        repairOrderVO.setsDlrCd(LoginUtil.getDlrCd());
        repairOrderVO.setsRoDocNo(issueReqVO.getRoDocNo());
        RepairOrderVO repairOrderDbVO = repairOrderService.selectRepairOrderByKey(repairOrderVO);

        //RO상태 위탁확인:01, 수리서비스:02 , 작업상태 : 작업완료 외 작업진행 불가 처리.
        if(!"01".equals(repairOrderDbVO.getRoStatCd()) && !"02".equals(repairOrderDbVO.getRoStatCd())){
            logger.error("ro Status 01 or 02 not Equal. not work.");
            throw processException("par.lbl.checkRoNotWorkMsg", lblList);
        }

        //RO 작업상태 확인 완료 : 05
        if("05".equals(repairOrderDbVO.getWrkStatCd())){
            logger.error("ro Status complete. not work.");
            throw processException("par.info.checkRoWrkNotWorkMsg", lblList);
        }

        /*
         * 1. 체크된 차용정보를 가져온다.
         * */

        List<IssueReqDetailVO> issueReqDetailBorrowVOList = issueReqDetailBorrowSaveVO.getIssueReqDetailVO();
        //변경할 정비차용상태코드
        String updateBorrowStatCd = issueReqDetailBorrowSaveVO.getBorrowStatCd();

        /*
         * 2. 체크된 차용정보를 출고요청정보를 저장한다.
         *
         *    저장 시점에 출고요청된 부품이 있는지 확인. 있으면 메시지 출력한다.
         *
         * */

        // 출고요청 상세 추가.
        for(IssueReqDetailVO issueReqDetailVO : issueReqDetailBorrowVOList){

            IssueReqSearchVO searchVO = new IssueReqSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());
            searchVO.setsItemCd(issueReqDetailVO.getItemCd());
            searchVO.setsBorrowStatCd("BORROW_STAT_02");

            if( issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){

                if(!"02".equals(issueReqDetailVO.getBorrowStatCd())){
                    throw processException("par.info.checkBorrowNotWorkMsg", lblList);
                }

                issueReqDetailVO.setReqQty(issueReqDetailVO.getBorrowQty());//차용수량 ==>요청수량
                issueReqDetailVO.setResvQty(issueReqDetailVO.getBorrowQty());//차용수량 ==>예약수량
                issueReqDetailVO.setEndQty(issueReqDetailVO.getBorrowQty());//차용수량 ==>종료수량
                issueReqDetailVO.setBorrowStatCd(updateBorrowStatCd);//변경할 정비차용상태코드 적용.

                //RO번호 가져오기.
                TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
                tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                tabInfoSearchVO.setsPreFixId(issueReqDetailVO.getParGiTp());//정비구분자 : RO
                tabInfoSearchVO.setsDocNo(issueReqDetailVO.getRoDocNo());
                tabInfoSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

                int roLineNo = 0;
                ServicePartVO servicePartByKeyVO = servicePartService.selectServicePartByKey(tabInfoSearchVO);

                if(servicePartByKeyVO != null){
                    roLineNo = servicePartByKeyVO.getLineNo();
                }else{
                    //RO라인번호 없을 때 RO 부품기준 최대 라인번호 가져오기.
                    tabInfoSearchVO.setsItemCd(null);
                    roLineNo = servicePartService.selectServicePartMaxLineNo(tabInfoSearchVO);
                }

                issueReqDetailVO.setRoLineNo(roLineNo);

                //정비 부품정보 추가/수정
                servicePartsInsertUpdate(issueReqDetailVO);

                //정비차용 시 중복부품 허용 시 추가로 변경해야 함.
                issueReqDetailDAO.updateIssueReqDetailBorrow(issueReqDetailVO);

                /*
                 * 부품요청헤더 상태 처리.
                 *
                 * */
                issueReqService.updateIssueHeaderStatus(issueReqVO.getParReqDocNo());


            }else{
                // 이미 등록된 부품입니다.
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.duplicatePartInfoChk", lblList);
            }
        }

        return issueReqDetailBorrowSaveVO;
    }


    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#insertIssueReqDetailResv(chn.bhmc.dms.par.ism.vo.IssueReqDetailResvSaveVO)
     */
    @Override
    public IssueReqDetailResvSaveVO insertIssueReqDetailResv(IssueReqDetailResvSaveVO issueReqDetailResvSaveVO, boolean mvtActYn)
            throws Exception {

        /*
         * 1. 체크된 예류 부품정보를 가져온다.
         * */

        IssueReqVO issueReqVO = issueReqDetailResvSaveVO.getIssueReqVO();

        String[] lblList = new String[1];

        //RO상태에 따른 부품작업 진행 처리.
        RepairOrderSearchVO repairOrderVO = new RepairOrderSearchVO();
        repairOrderVO.setsDlrCd(LoginUtil.getDlrCd());
        repairOrderVO.setsRoDocNo(issueReqVO.getRoDocNo());
        RepairOrderVO repairOrderDbVO = repairOrderService.selectRepairOrderByKey(repairOrderVO);

        //RO상태 위탁확인:01, 수리서비스:02 외 작업진행 불가 처리.
        if(!"01".equals(repairOrderDbVO.getRoStatCd()) && !"02".equals(repairOrderDbVO.getRoStatCd())){
            throw processException("par.lbl.checkRoNotWorkMsg", lblList);
        }

        List<IssueReqDetailVO> issueReqDetailResvVOList = issueReqDetailResvSaveVO.getIssueReqDetailVO();
        String updateReadyStatCd = issueReqDetailResvSaveVO.getReadyStatCd();

        /*
         * 1.체크된 예류정보를 출고요청정보를 저장한다.
         * 2.수불문서 예약 ==>가용처리.
         * 3.저장 시점에 출고요청된 부품이 있는지 확인. 있으면 메시지 출력한다.
         *
         * */

        // 출고요청 상세 추가.
        for(IssueReqDetailVO issueReqDetailVO : issueReqDetailResvVOList){

            //준비상태 수정.
            issueReqDetailVO.setReadyStatCd(updateReadyStatCd);
            issueReqDetailDAO.updateIssueReqDetailReady(issueReqDetailVO);

            //수불실행여부 true 일때 수불취소 실행.
            if(mvtActYn){
                //수불 예약==>가용
                MvtDocVO mvtVO = new MvtDocVO();                            //수불 헤더 VO(판매예약)
                List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불 상세 VO 리스트(판매예약)
                MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();             //수불상세 VO 생성.

                // 수불함수 헤더 정보 담기.
                mvtVO.setMvtTp("24"); //재고이동취소(예약=>가용) : 24
                mvtDocItemVO.setCancStmtYn("Y");// 취소구분
                mvtVO.setMvtDocNo(issueReqDetailVO.getMvtDocNo());
                mvtVO.setMvtDocYyMm(issueReqDetailVO.getMvtDocYyMm());
                // 고객정보
                mvtVO.setCustNo(issueReqDetailVO.getCustCd());
                // 수불상세 VO 데이타 담기.
                mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
                mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
                mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
                mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
                mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());
                mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());
                mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
                mvtDocItemVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
                mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getGiStrgeCd());
                mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getGiStrgeCd());
                mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
                mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");//통화코드

                list.add(mvtDocItemVO);

                //수불문서요청.
                //판매출고(가용 or 예약) 호출
                mvtDocService.multiSaveMvtDocs(mvtVO, list);
            }

            //RO번호 가져오기.
            TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
            tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            tabInfoSearchVO.setsPreFixId(issueReqVO.getParGiTp());//정비구분자 : RO
            tabInfoSearchVO.setsDocNo(issueReqVO.getRoDocNo());//부품예류에는 RO번호가 없어 부품요청헤더 RO번호를 가져온다.
            tabInfoSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

            int roLineNo = 0;
            ServicePartVO servicePartByKeyVO = servicePartService.selectServicePartByKey(tabInfoSearchVO);

            if(servicePartByKeyVO != null){
                roLineNo = servicePartByKeyVO.getLineNo();
            }else{
                //RO라인번호 없을 때 RO 부품기준 최대 라인번호 가져오기.
                tabInfoSearchVO.setsItemCd(null);
                roLineNo = servicePartService.selectServicePartMaxLineNo(tabInfoSearchVO);
            }

            IssueReqDetailVO issueReqDetailAddVO = new IssueReqDetailVO();
            issueReqDetailAddVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailAddVO.setParReqDocNo(issueReqVO.getParReqDocNo());
            issueReqDetailAddVO.setRoDocNo(issueReqVO.getRoDocNo());
            issueReqDetailAddVO.setRoLineNo(roLineNo);
            issueReqDetailAddVO.setRoTp(issueReqVO.getRoTp());
            issueReqDetailAddVO.setResvDocNo(issueReqDetailVO.getResvDocNo());
            issueReqDetailAddVO.setReadyStatCd(issueReqDetailVO.getReadyStatCd());
            issueReqDetailAddVO.setReadyDocNo(issueReqDetailVO.getReadyDocNo());

            issueReqDetailAddVO.setItemCd(issueReqDetailVO.getItemCd());
            issueReqDetailAddVO.setItemNm(issueReqDetailVO.getItemNm());
            issueReqDetailAddVO.setUnitCd(issueReqDetailVO.getUnitCd());
            issueReqDetailAddVO.setParGiTp("RO");
            issueReqDetailAddVO.setParReqStatCd("01");//요청

            issueReqDetailAddVO.setPkgItemCd(issueReqDetailVO.getPkgItemCd());
            issueReqDetailAddVO.setPkgDetlDcRate(issueReqDetailVO.getPkgDetlDcRate());
            issueReqDetailAddVO.setPkgDetlDcAmt(issueReqDetailVO.getPkgDetlDcAmt());
            issueReqDetailAddVO.setPkgDetlDcTotAmt(issueReqDetailVO.getPkgDetlDcTotAmt());

            issueReqDetailAddVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
            issueReqDetailAddVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
            issueReqDetailAddVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
            issueReqDetailAddVO.setGiLocCd(issueReqDetailVO.getGiLocCd());

            issueReqDetailAddVO.setReqQty(issueReqDetailVO.getResvQty());
            issueReqDetailAddVO.setResvQty(issueReqDetailVO.getResvQty());
            issueReqDetailAddVO.setEndQty(issueReqDetailVO.getResvQty());
            issueReqDetailAddVO.setItemPrc(issueReqDetailVO.getItemPrc());
            issueReqDetailAddVO.setItemAmt(issueReqDetailVO.getItemAmt());
            issueReqDetailAddVO.setTaxAmt(issueReqDetailVO.getTaxAmt());
            issueReqDetailAddVO.setTaxDdctAmt(issueReqDetailVO.getTaxDdctAmt());
            issueReqDetailAddVO.setPaymTp(issueReqDetailVO.getPaymTp());
            issueReqDetailAddVO.setPaymCd(issueReqDetailVO.getPaymCd());
            issueReqDetailAddVO.setPaymUsrNm(issueReqDetailVO.getPaymUsrNm());
            issueReqDetailAddVO.setPartsPrcTp(issueReqDetailVO.getPartsPrcTp());
            issueReqDetailAddVO.setMovingAvgPrc(issueReqDetailVO.getMovingAvgPrc());
            issueReqDetailAddVO.setMovingAvgAmt(issueReqDetailVO.getMovingAvgAmt());

            issueReqDetailAddVO.setCancYn("N");
            issueReqDetailAddVO.setRegUsrId(LoginUtil.getUserId());

            //부품요청 상세 추가.
            issueReqDetailDAO.insertIssueReqDetail(issueReqDetailAddVO);
            // RO일때만
            if("RO".equals(issueReqDetailAddVO.getParGiTp())){

                //정비 부품정보 추가/수정
                servicePartsInsertUpdate(issueReqDetailAddVO);

                //출고예정정보 추가.
                createGrGiScheduleRequest(issueReqDetailAddVO);
            }

            /*
             * 부품요청헤더 상태 처리.
             *
             * */
            issueReqService.updateIssueHeaderStatus(issueReqVO.getParReqDocNo());

            /*
             * 정비 RO & 부품요청상세 부품수량 일치화.
             *
             * */
            calculateIssueReqDetailsPriceInfo(issueReqVO, repairOrderDbVO);

        }

        return issueReqDetailResvSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#cancelIssueReqDetailResv(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public void cancelIssueReqDetailResv(IssueReqDetailVO issueReqDetailVO) throws Exception {

        MvtDocVO mvtVO = new MvtDocVO();                            //수불문서헤더 VO
        List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불문서아이템 리스트 VO
        MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();             //수불문서아이템 VO

        // 수불함수 헤더 정보 담기.
        mvtVO.setMvtTp("24"); //재고이동취소(예약=>가용) : 24
        mvtDocItemVO.setCancStmtYn("Y");// 취소구분
        mvtVO.setMvtDocNo(issueReqDetailVO.getMvtDocNo());
        mvtVO.setMvtDocYyMm(issueReqDetailVO.getMvtDocYyMm());
        // 고객정보
        mvtVO.setCustNo(issueReqDetailVO.getCustCd());
        // 수불상세 VO 데이타 담기.
        mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
        mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
        mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
        mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
        mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
        mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());
        mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());
        mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
        mvtDocItemVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
        mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getGiStrgeCd());
        mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getGiStrgeCd());
        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
        mvtDocItemVO.setDdlnYn("N");
        mvtDocItemVO.setCurrCd("");//통화코드

        list.add(mvtDocItemVO);

        //수불문서요청.
        //판매출고(가용 or 예약) 호출
        mvtDocService.multiSaveMvtDocs(mvtVO, list);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#updateIssueReqDetail(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public int updateIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception {
        issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
        issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
        return issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#updateIssueReqDetailReadyStatusReturn(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public int updateIssueReqDetailReadyStatusReturn(IssueReqDetailVO issueReqDetailVO) throws Exception {
        return issueReqDetailDAO.updateIssueReqDetailReadyStatusReturn(issueReqDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#deleteIssueReqDetail(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public int deleteIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception {
        return issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);
    }


    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#multiItemGroups(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssueReqDetails(BaseSaveVO<IssueReqDetailVO> obj) throws Exception {

        /*
         * 1. 추가 시 기 부품요청상세 데이타 존재유무 체크.
         *
         * */

        //부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        String[] lblList = new String[1];

        // 부품요청상세 삭제 데이타
        for(IssueReqDetailVO issueReqDetailVO : obj.getDeleteList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsItemCd(issueReqDetailVO.getItemCd());              //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                if("01".equals(issueReqDetailVO.getParReqStatCd())){
                    issueReqDetailVO.setRoLineNo(0);
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);

                    ServicePartVO servicePartVO = new ServicePartVO();
                    servicePartVO.setPreFixId("RO");//정비부품 구분자.
                    servicePartVO.setDocNo(issueReqDetailVO.getRoDocNo());
                    servicePartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    servicePartVO.setItemCd(issueReqDetailVO.getDbItemCd());

                    servicePartService.deleteServicePart(servicePartVO);

                    //출고예정정보 반환 추가.
                    createGrGiScheduleReturn(issueReqDetailVO);
                }
            }
        }

        // 부품요청상세 Insert Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getInsertList()){
            // 부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());

            //부품요청상태 대기 시 저장 시 출고수량 , 금액, 세금액 0 처리.
            if("01".equals(issueReqDetailVO.getParReqStatCd())){
                issueReqDetailVO.setEndQty(0);
                issueReqDetailVO.setItemAmt(0);
                issueReqDetailVO.setTaxAmt(0);
            }

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                // RO일때만
                if("RO".equals(issueReqDetailVO.getParGiTp())){

                    ServicePartVO servicePartVO = new ServicePartVO();
                    servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                    servicePartVO.setDocNo(issueReqDetailVO.getRoDocNo());
                    servicePartVO.setRoTp("01"); // General
                    servicePartVO.setPreFixId(issueReqDetailVO.getParGiTp());   //정비구분자 : RO
                    servicePartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    servicePartVO.setItemCd(issueReqDetailVO.getItemCd());
                    servicePartVO.setItemNm(issueReqDetailVO.getItemNm());
                    servicePartVO.setReqQty(issueReqDetailVO.getReqQty());      //요청수량
                    servicePartVO.setGiQty(issueReqDetailVO.getEndQty());       //출고수량
                    servicePartVO.setItemQty(issueReqDetailVO.getEndQty());     //부품수량 =>출고수량
                    servicePartVO.setItemPrc(issueReqDetailVO.getItemPrc());    //부품금액
                    servicePartVO.setItemTotAmt(Math.round(issueReqDetailVO.getItemPrc() * issueReqDetailVO.getEndQty() * 100.0)/100.0); //총금액

                    servicePartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                    servicePartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    servicePartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                    servicePartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    servicePartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                    servicePartVO.setRegUsrId(LoginUtil.getUserId());

                    servicePartService.insertServicePart(servicePartVO);

                    //출고예정정보 추가.
                    createGrGiScheduleRequest(issueReqDetailVO);
                }
            }
        }

        // 부품요청상세 Update Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            // 부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }
            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
            issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());

            //부품요청상태 대기 시 저장 시 출고수량 , 금액, 세금액 0 처리.
            if(issueReqDetailVO.getParReqStatCd().equals("01")){
                issueReqDetailVO.setEndQty(0);
                issueReqDetailVO.setItemAmt(0);
                issueReqDetailVO.setTaxAmt(0);
            }

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                //RO일때만
                if("RO".equals(issueReqDetailVO.getParGiTp())){
                    // 부품추가
                    ServicePartVO servicePartVO = new ServicePartVO();
                    servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                    servicePartVO.setDocNo(issueReqDetailVO.getRoDocNo());
                    servicePartVO.setRoTp("01"); // General
                    servicePartVO.setPreFixId(issueReqDetailVO.getParGiTp());//정비구분자 : RO
                    servicePartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    servicePartVO.setItemCd(issueReqDetailVO.getItemCd());
                    servicePartVO.setItemNm(issueReqDetailVO.getItemNm());
                    servicePartVO.setReqQty(issueReqDetailVO.getReqQty());      //요청수량
                    servicePartVO.setGiQty(issueReqDetailVO.getEndQty());       //출고수량
                    servicePartVO.setItemQty(issueReqDetailVO.getEndQty());     //부품수량 =>출고수량
                    servicePartVO.setItemPrc(issueReqDetailVO.getItemPrc());    //부품금액
                    servicePartVO.setItemTotAmt(Math.round(issueReqDetailVO.getItemPrc() * issueReqDetailVO.getEndQty() * 100.0)/100.0); //총금액
                    servicePartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                    servicePartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    servicePartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                    servicePartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    servicePartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                    servicePartVO.setRegUsrId(LoginUtil.getUserId());

                    servicePartService.insertServicePart(servicePartVO);

                    //출고예정정보 추가
                    createGrGiScheduleRequest(issueReqDetailVO);

                }
            }else{
                if("01".equals(issueReqDetailVO.getParReqStatCd())){
                    issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                    // RO일때만
                    if("RO".equals(issueReqDetailVO.getParGiTp())){

                        ServicePartVO servicePartVO = new ServicePartVO();
                        servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                        servicePartVO.setDocNo(issueReqDetailVO.getRoDocNo());
                        servicePartVO.setRoTp("01"); // General
                        servicePartVO.setPreFixId(issueReqDetailVO.getParGiTp());//정비구분자 : RO
                        servicePartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                        servicePartVO.setItemCd(issueReqDetailVO.getItemCd());
                        servicePartVO.setItemNm(issueReqDetailVO.getItemNm());
                        servicePartVO.setReqQty(issueReqDetailVO.getReqQty());      //요청수량
                        servicePartVO.setGiQty(issueReqDetailVO.getEndQty());       //출고수량
                        servicePartVO.setItemQty(issueReqDetailVO.getEndQty());     //부품수량 =>출고수량
                        servicePartVO.setItemPrc(issueReqDetailVO.getItemPrc());    //부품금액
                        servicePartVO.setItemTotAmt(Math.round(issueReqDetailVO.getItemPrc() * issueReqDetailVO.getEndQty() * 100.0)/100.0); //총금액
                        servicePartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                        servicePartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        servicePartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                        servicePartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        servicePartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        servicePartVO.setUpdtUsrId(LoginUtil.getUserId());

                        servicePartService.updateServicePartItemWork(servicePartVO);

                        //출고예정정보 추가
                        createGrGiScheduleRequest(issueReqDetailVO);
                    }
                }
            }
        }

    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#multiIssueReqDetails(chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO)
     */
    @Override
    public void multiIssueReqDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception {

        /*
         * 1. 추가 시 기 부품요청상세 데이타 존재유무 체크.
         *
         * */

        IssueReqVO issueReqVO = issueReqDetailSaveVO.getIssueReqVO();
        BaseSaveVO<IssueReqDetailVO> obj = (BaseSaveVO<IssueReqDetailVO>) issueReqDetailSaveVO.getIssueReqDetailVO();


        //부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        String[] lblList = new String[1];

        //RO상태에 따른 부품작업 진행 처리.
        RepairOrderSearchVO repairOrderVO = new RepairOrderSearchVO();
        repairOrderVO.setsDlrCd(LoginUtil.getDlrCd());
        repairOrderVO.setsRoDocNo(issueReqVO.getRoDocNo());
        RepairOrderVO repairOrderDbVO = repairOrderService.selectRepairOrderByKey(repairOrderVO);

        //RO상태 위탁확인:01, 수리서비스:02 외 작업진행 불가 처리.
        if(!"01".equals(repairOrderDbVO.getRoStatCd()) && !"02".equals(repairOrderDbVO.getRoStatCd())){
            throw processException("par.lbl.checkRoNotWorkMsg", lblList);
        }

        /*
         * RO유형 변경 확인 체크.
         * */
        if(!repairOrderDbVO.getRoTp().equals(issueReqVO.getRoTp())){
            //RO부품 없을 때 재조회 메시지 호출.
            throw processException("par.info.changedInfoMsg", lblList);
        }

        //부품요청상세 삭제데이타
        for(IssueReqDetailVO issueReqDetailVO : obj.getDeleteList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsParReqStatCd("01");                                //부품요청상태 요청(01)
            searchVO.setsItemCd(issueReqDetailVO.getItemCd());              //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            //부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                if("01".equals(issueReqDetailVO.getParReqStatCd())){

                    //출고예정정보 반환.
                    createGrGiScheduleReturn(issueReqDetailVO);

                    /*
                     * 부품예류부품 삭제 시 예류상태 : 03 변경 처리.
                     * */
                    if("06".equals(issueReqDetailVO.getReadyStatCd())){
                        issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                        issueReqDetailVO.setReadyStatCd("03");//준비상태 03 : 예류
                        issueReqResvService.updateIssuePartsReadyStatus(issueReqDetailVO);
                    }

                    if(!StringUtils.isEmpty(issueReqDetailVO.getBorrowDocNo()) && !StringUtils.isEmpty(issueReqDetailVO.getBorrowStatCd())){
                        //차용문서번호, 차용상태정보 있을 때 차용상태 차용 변경.
                        issueReqDetailDAO.updateCancelIssueDetailBorrowStatus(LoginUtil.getDlrCd(), issueReqDetailVO.getParReqDocNo(), issueReqDetailVO.getParReqDocLineNo(), issueReqDetailVO.getItemCd(), issueReqDetailVO.getBorrowDocNo(), "02");
                    }else{
                        //부품요청상세 삭제.

                        issueReqDetailVO.setRoLineNo(0);
                        issueReqDetailVO.setResvDocLineNo(0);
                        issueReqDetailVO.setReadyStatCd(null);

                        issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                        issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);
                    }
                }
                //반품부품 및 출고상태 등록 01 인 부품만 삭제.
                if(issueReqDetailVO.getParReqStatCd().equals("03") && issueReqDetailVO.getGiDocStatCd().equals("01")){
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);
                }
            }
        }

        //부품요청상세 삭제 데이타 있을 시 RO 부품삭제 처리.
        if(obj.getDeleteList().size() > 0 ){
            /*
             * 4. 출고/반품  후 수량 0인 항목 정비RO 부품삭제 처리.
             *
             * */
            IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();

            if("RO".equals(issueReqVO.getParGiTp())){
                issueReqSearchVO = new IssueReqSearchVO();
                issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
                List<IssueReqRoItemDelVO> issueReqDetailEndQtySumList = issueReqDetailDAO.selectIssueReqItemsEndQtySumDetailsRoByCondition(issueReqSearchVO);

                for(IssueReqRoItemDelVO issueReqRoItemDelVO: issueReqDetailEndQtySumList){
                    if(issueReqRoItemDelVO.getEndQty() <= 0){//출고수량 0보다 작을 때
                        ServicePartVO servicePartVO = new ServicePartVO();
                        servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                        servicePartVO.setPreFixId(issueReqVO.getParGiTp());
                        servicePartVO.setDocNo(issueReqRoItemDelVO.getRoDocNo());
                        servicePartVO.setItemCd(issueReqRoItemDelVO.getItemCd());
                        servicePartService.deleteServicePart(servicePartVO);
                    }
                }
            }
        }


        //부품요청상세 Insert Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getInsertList()){
            //부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());//부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsParReqStatCd(issueReqDetailVO.getParReqStatCd());  //부품요청상태
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());          //RO라인번호
            searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
            issueReqDetailVO.setReqQty(issueReqDetailVO.getEndQty());       //저장시 출고수량 ==>요청수량 대체.

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){

                // 페이지유형 RO and 부품요청상태 등록(01)
                if("RO".equals(issueReqDetailVO.getParGiTp()) && "01".equals(issueReqDetailVO.getParReqStatCd())){

                    //정비 부품정보 추가/수정
                    servicePartsInsertUpdate(issueReqDetailVO);

                    //출고예정정보 완료 추가.
                    createGrGiScheduleEnd(issueReqDetailVO);

                }

                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
            }
        }

        // 부품요청상세 Update Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            // 부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }
            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsParReqStatCd(issueReqDetailVO.getParReqStatCd());  //부품요청상태
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());          //RO라인번호
            searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
            issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDetailVO.setReqQty(issueReqDetailVO.getEndQty());       //저장시 출고수량 ==>요청수량 대체.

            //부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){

                //RO번호 가져오기.
                TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
                tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                tabInfoSearchVO.setsPreFixId(issueReqDetailVO.getParGiTp());//정비구분자 : RO
                tabInfoSearchVO.setsDocNo(issueReqDetailVO.getRoDocNo());
                tabInfoSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

                int roLineNo = 0;
                ServicePartVO servicePartByKeyVO = servicePartService.selectServicePartByKey(tabInfoSearchVO);

                if(servicePartByKeyVO != null){
                    roLineNo = servicePartByKeyVO.getLineNo();
                }else{
                    //RO라인번호 없을 때 RO 부품기준 최대 라인번호 가져오기.
                    tabInfoSearchVO.setsItemCd(null);
                    roLineNo = servicePartService.selectServicePartMaxLineNo(tabInfoSearchVO);
                }

                issueReqDetailVO.setRoLineNo(roLineNo);

                if("RO".equals(issueReqDetailVO.getParGiTp())){

                    //정비 부품정보 추가/수정
                    servicePartsInsertUpdate(issueReqDetailVO);

                    //출고예정정보 완료 추가.
                    createGrGiScheduleEnd(issueReqDetailVO);
                }

                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);

            }else{
                if("01".equals(issueReqDetailVO.getParReqStatCd()) || "03".equals(issueReqDetailVO.getParReqStatCd())){

                    //RO일때만
                    if("RO".equals(issueReqDetailVO.getParGiTp())){

                        //정비 부품정보 추가/수정
                        servicePartsInsertUpdate(issueReqDetailVO);

                        //출고예정정보 완료 추가.
                        createGrGiScheduleEnd(issueReqDetailVO);
                    }

                    issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);//pt_0502t 내용수정
                }
            }
        }

        /*
         * 부품요청 정비차용상태 수정.
         *
         * */
        updateBorrowStatCdIssueReqHeader(issueReqVO.getParReqDocNo());

        /*
         * 부품요청헤더 상태 처리.
         *
         * */
        issueReqService.updateIssueHeaderStatus(issueReqVO.getParReqDocNo());

        /*
         * 정비 RO & 부품요청상세 부품수량 일치화.
         *
         * */
        calculateIssueReqDetailsPriceInfo(issueReqVO, repairOrderDbVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#calculateIssueReqDetailsPriceInfo(chn.bhmc.dms.par.ism.vo.IssueReqVO)
     */
    @Override
    public void calculateIssueReqDetailsPriceInfo(IssueReqVO issueReqVO, RepairOrderVO repairOrderVO) throws Exception {

        //저장 때 로직 시작
        IssueReqSearchVO searchItemVO = new IssueReqSearchVO();
        searchItemVO.setsDlrCd(LoginUtil.getDlrCd());
        searchItemVO.setsRoDocNo(issueReqVO.getRoDocNo());
        searchItemVO.setsRoTp(repairOrderVO.getRoTp());
        List<IssueReqDetailVO> issueReqDetailItemsVOList = issueReqDetailDAO.selectIssueReqItemsGroupEndQtyDetailsByCondition(searchItemVO);


        // 딜러회원 부품할인율 가져오기
        int parDcRate = 0;

        if(StringUtils.isNotEmpty(repairOrderVO.getCarOwnerId())){
            MembershipSearchVO membershipSearchVO = new MembershipSearchVO();

            membershipSearchVO.setsCustNo(repairOrderVO.getCarOwnerId());
            membershipSearchVO.setsVinNo(repairOrderVO.getVinNo());
            MembershipVO membershipVO = membershipSupportService.selectMembershipInfoByKey(membershipSearchVO);

            if(StringUtils.isNotEmpty(membershipVO.getMembershipNo())){
                for(MembershipGradeMngVO membershipGradeMngVO : membershipVO.getMembershipGradeMngList()){
                    if(membershipVO.getGradeCd().equals(membershipGradeMngVO.getGradeSeq())){
                        parDcRate = membershipGradeMngVO.getSerParDcRate();
                    }
                }
            }
        }

        for(IssueReqDetailVO issueReqDetailItemVO : issueReqDetailItemsVOList){

            ServicePartVO servicePartVO = new ServicePartVO();
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
            servicePartVO.setDocNo(issueReqVO.getRoDocNo());
            servicePartVO.setPreFixId("RO");//정비구분자 : RO
            servicePartVO.setItemCd(issueReqDetailItemVO.getItemCd());

            //요청/출고/부품수량 계산.
            if(issueReqDetailItemVO.getReqQty() > 0){//요청수량 > 0 부분완료
                servicePartVO.setReqQty(issueReqDetailItemVO.getEndQty());      //요청수량(원수량)
                servicePartVO.setGiQty(issueReqDetailItemVO.getCalEndQty());    //출고수량
            }else{//요청수량 = 0 완료
                servicePartVO.setReqQty(issueReqDetailItemVO.getEndQty());      //요청수량(완료수량치환)
                servicePartVO.setGiQty(issueReqDetailItemVO.getEndQty());       //출고수량
            }

            servicePartVO.setItemQty(issueReqDetailItemVO.getEndQty());                                         //부품수량 =>출고수량

            /*
             * 일반 : 부품단가(세금포함), 부품판매단가(세금포함)
             * 보증 : 부품단가(세금미포함), BMP구매금액
             * */

            servicePartVO.setItemPrc(issueReqDetailItemVO.getItemPrc());                                                //부품단가
            //servicePartVO.setItemAmt(issueReqDetailItemVO.getItemAmt());                                                //부품금액 (2018.05.23, 계산된 보증금액을 넣어준다.)
            servicePartVO.setItemAmt((Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00));           //부품금액 (2018.06.29, 다시 원래의 단가 * 수량으로 한다, BWMS와 협의가 맞는것.)
            servicePartVO.setMovingAvgPrc(issueReqDetailItemVO.getMovingAvgPrc());                                      //이동평균단가
            servicePartVO.setMovingAvgAmt((Math.round(issueReqDetailItemVO.getMovingAvgPrc() * issueReqDetailItemVO.getEndQty()*100.0)/100.00));   //이동평균금액

            if("02".equals(repairOrderVO.getRoTp())){//보증시 단가만 변경.
                servicePartVO.setItemSalePrc(issueReqDetailItemVO.getBmpPurcPrc());                             //BMP구매금액
            }else{
                servicePartVO.setItemSalePrc(issueReqDetailItemVO.getItemPrc());                                //정비판매단가
            }

            //할인금액 가져오기.
            TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
            tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            tabInfoSearchVO.setsDocNo(issueReqVO.getRoDocNo());
            tabInfoSearchVO.setsPreFixId("RO");
            tabInfoSearchVO.setsItemCd(issueReqDetailItemVO.getItemCd());
            ServicePartVO servicePartDbVO = servicePartService.selectServicePartByKey(tabInfoSearchVO);

            Double dcAmt = 0.0;
            Double dcSerAmt = 0.0;

            if(servicePartDbVO != null ){
                if(parDcRate > 0){
                    // RO유형이 일반일 경우만 할인율 계산
                    if("01".equals(repairOrderVO.getRoTp())){
                        //할인율계산
                        dcSerAmt = (Math.round(((Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00)) * (parDcRate/100.00)*100.0)/100.00);
                        dcAmt = issueReqDetailItemVO.getItemAmt() - dcSerAmt;
                        servicePartVO.setDcRate((double)parDcRate);
                        servicePartVO.setDcAmt(dcSerAmt);
                    } else {
                        dcAmt = (Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00);
                        servicePartVO.setDcAmt(0.0);
                    }
                }else{
                    //할인율계산
                    dcAmt = (Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00);
                    servicePartVO.setDcAmt(0.0);
                }

                servicePartVO.setItemSaleAmt((Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00));    //정비판매총금액
                servicePartVO.setItemTotAmt(dcAmt);     //총금액
                servicePartVO.setUpdtUsrId(LoginUtil.getUserId());

                servicePartService.updateServicePartItemWork(servicePartVO);//여기서 se_0160t의 item_sale_amt , item_tot_amt ,req_qty, dc_amt , gi_qty , 이평가 를 update함
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#calculateIssueReqDetailsPriceInfo(chn.bhmc.dms.par.ism.vo.IssuePartsOutVO)
     */
    @Override
    public void calculateIssueReqDetailsPriceInfo(IssuePartsOutVO issuePartsOutVO, RepairOrderVO repairOrderVO) throws Exception {

        //출고 때 로직 시작
        IssueReqSearchVO searchItemVO = new IssueReqSearchVO();
        searchItemVO.setsDlrCd(LoginUtil.getDlrCd());
        searchItemVO.setsRoDocNo(issuePartsOutVO.getRoDocNo());
        searchItemVO.setsRoTp(repairOrderVO.getRoTp());
        List<IssueReqDetailVO> issueReqDetailItemsVOList = issueReqDetailDAO.selectIssueReqItemsGroupEndQtyDetailsByCondition(searchItemVO);

        // 딜러회원 부품할인율 가져오기
        int parDcRate = 0;
        if(StringUtils.isNotEmpty(repairOrderVO.getCarOwnerId())){
            MembershipSearchVO membershipSearchVO = new MembershipSearchVO();

            membershipSearchVO.setsCustNo(repairOrderVO.getCarOwnerId());
            membershipSearchVO.setsVinNo(repairOrderVO.getVinNo());
            MembershipVO membershipVO = membershipSupportService.selectMembershipInfoByKey(membershipSearchVO);

            if(StringUtils.isNotEmpty(membershipVO.getMembershipNo())){
                for(MembershipGradeMngVO membershipGradeMngVO : membershipVO.getMembershipGradeMngList()){
                    if(membershipVO.getGradeCd().equals(membershipGradeMngVO.getGradeSeq())){
                        parDcRate = membershipGradeMngVO.getSerParDcRate();
                    }
                }
            }
        }

        for(IssueReqDetailVO issueReqDetailItemVO : issueReqDetailItemsVOList){

            ServicePartVO servicePartVO = new ServicePartVO();
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
            servicePartVO.setDocNo(issuePartsOutVO.getRoDocNo());
            servicePartVO.setPreFixId("RO");//정비구분자 : RO
            servicePartVO.setItemCd(issueReqDetailItemVO.getItemCd());

            //요청/출고/부품수량 계산.
            if(issueReqDetailItemVO.getReqQty() > 0){//요청수량 > 0 부분완료
                servicePartVO.setReqQty(issueReqDetailItemVO.getEndQty());      //요청수량(원수량)
                servicePartVO.setGiQty(issueReqDetailItemVO.getCalEndQty());    //출고수량
            }else{//요청수량 = 0 완료
                servicePartVO.setReqQty(issueReqDetailItemVO.getEndQty());      //요청수량(완료수량치환)
                servicePartVO.setGiQty(issueReqDetailItemVO.getEndQty());       //출고수량
            }

            servicePartVO.setItemQty(issueReqDetailItemVO.getEndQty());                                         //부품수량 =>출고수량

            /*
             * 일반 : 부품단가(세금포함), 부품판매단가(세금포함)
             * 보증 : 부품단가(세금미포함), BMP구매금액
             * */

            servicePartVO.setItemPrc(issueReqDetailItemVO.getItemPrc());                                        //부품단가
            //servicePartVO.setItemAmt(issueReqDetailItemVO.getItemAmt());                                        //부품금액 (2018.05.23, 계산된 보증금액을 넣어준다.)
            servicePartVO.setItemAmt((Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty()*100.0)/100.00));   //부품금액

            if("02".equals(repairOrderVO.getRoTp())){//보증시 단가만 변경.
                servicePartVO.setItemSalePrc(issueReqDetailItemVO.getBmpPurcPrc());                             //BMP구매금액
            }else{
                servicePartVO.setItemSalePrc(issueReqDetailItemVO.getItemPrc());                                //정비판매단가
            }

            //할인금액 가져오기.
            TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
            tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            tabInfoSearchVO.setsDocNo(issuePartsOutVO.getRoDocNo());
            tabInfoSearchVO.setsPreFixId("RO");
            tabInfoSearchVO.setsItemCd(issueReqDetailItemVO.getItemCd());
            ServicePartVO servicePartDbVO = servicePartService.selectServicePartByKey(tabInfoSearchVO);

            Double dcAmt = 0.0;
            Double dcSerAmt = 0.0;

            if(servicePartDbVO != null ){
                if(parDcRate > 0){
                    // RO유형이 일반일 경우만 할인율 계산
                    if("01".equals(repairOrderVO.getRoTp())){
                        //할인율계산
                        dcSerAmt = (Math.round(((Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00)) * (parDcRate/100.00)*100.0)/100.00);
                        dcAmt = (Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00) - dcSerAmt;
                        servicePartVO.setDcRate((double)parDcRate);
                        servicePartVO.setDcAmt(dcSerAmt);
                    } else {
                        dcAmt = (Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00);
                        servicePartVO.setDcAmt(0.0);
                    }
                }else{
                    //할인율계산
                    dcAmt = (Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00);
                    servicePartVO.setDcAmt(0.0);
                }

                servicePartVO.setItemSaleAmt((Math.round(issueReqDetailItemVO.getItemPrc() * issueReqDetailItemVO.getEndQty() * 100.0)/100.00));     //정비판매총금액
                servicePartVO.setItemTotAmt(dcAmt);  //총금액
                servicePartVO.setUpdtUsrId(LoginUtil.getUserId());

                servicePartVO.setMovingAvgPrc(issueReqDetailItemVO.getMovingAvgPrc());
                servicePartVO.setMovingAvgAmt((Math.round(issueReqDetailItemVO.getMovingAvgPrc() * issueReqDetailItemVO.getEndQty()*100.0)/100.00));   //이동평균금액

                servicePartService.updateServicePartItemWork(servicePartVO);
            }
        }

    }

    /**
     * RO 정비부품 추가/수정
     * @param issueReqDetailVO - 조회 조건을 포함하는 IssueReqDetailVO 부품요청상세
     * @param serviceLaborDbVO - 조회 조건을 포함하는 ServiceLaborVO   정비RO공임
     */
    private void servicePartsInsertUpdate(IssueReqDetailVO issueReqDetailVO) throws Exception {

        /*
         *  정비 RO 부품 추가/수정 처리.
         *
         * */

        TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
        tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        tabInfoSearchVO.setsPreFixId(issueReqDetailVO.getParGiTp());        //정비구분자 : RO
        tabInfoSearchVO.setsDocNo(issueReqDetailVO.getRoDocNo());           //RO번호
        tabInfoSearchVO.setsItemCd(issueReqDetailVO.getItemCd());           //부품번호

        ServicePartVO servicePartVO = new ServicePartVO();
        servicePartVO.setDlrCd(LoginUtil.getDlrCd());                       //딜러코드
        servicePartVO.setDocNo(issueReqDetailVO.getRoDocNo());              //RO번호
        servicePartVO.setRoTp(issueReqDetailVO.getRoTp());                  //RO유형
        servicePartVO.setPreFixId(issueReqDetailVO.getParGiTp());           //정비구분자 : RO
        servicePartVO.setLineNo(issueReqDetailVO.getRoLineNo());            //RO라인번호
        servicePartVO.setItemCd(issueReqDetailVO.getItemCd());              //부품번호
        servicePartVO.setItemNm(issueReqDetailVO.getItemNm());              //부품명
        servicePartVO.setReqQty(issueReqDetailVO.getReqQty());              //요청수량
        //저장 시 출고 수량만 0 처리.
        servicePartVO.setGiQty(0.0);                                        //출고수량
        servicePartVO.setItemQty(issueReqDetailVO.getEndQty());             //부품수량 =>출고수량
        servicePartVO.setItemPrc(issueReqDetailVO.getItemPrc());            //부품금액
        servicePartVO.setItemSalePrc(issueReqDetailVO.getTaxDdctGrtePrc()); //판매금액(보증가원가)
        servicePartVO.setItemTotAmt(issueReqDetailVO.getItemPrc() * 0.0);   //총금액
        servicePartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());          //계산단위
        servicePartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());        //입고창고
        servicePartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());        //출고창고
        servicePartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());      //요청창고
        servicePartVO.setLocCd(issueReqDetailVO.getGiLocCd());              //로케이션

        servicePartVO.setPkgDocNo(issueReqDetailVO.getPkgDocNo());          //패키지문서번호
        servicePartVO.setPkgItemCd(issueReqDetailVO.getPkgItemCd());        //패키지부품번호

        servicePartVO.setPaymTp(issueReqDetailVO.getPaymTp());              //결제자유형
        servicePartVO.setPaymUsrNm(issueReqDetailVO.getPaymUsrNm());        //결제자명
        servicePartVO.setPaymCd(issueReqDetailVO.getPaymCd());              //지불자코드

        servicePartVO.setMovingAvgPrc(issueReqDetailVO.getMovingAvgPrc());  //이동평균가격.(부품원가격)
        servicePartVO.setMovingAvgAmt(issueReqDetailVO.getMovingAvgAmt());  //이동평균금액.(부품원금액)

        servicePartVO.setRegUsrId(LoginUtil.getUserId());
        servicePartVO.setUpdtUsrId(LoginUtil.getUserId());

        if(!"03".equals(issueReqDetailVO.getParReqStatCd())){//반품 아닐때만
            if(servicePartService.selectServicePartsByConditionCnt(tabInfoSearchVO) > 0){
                servicePartService.updateServicePartItemWork(servicePartVO);//여기서 se_0160t를 item_prc, item_qty, req_qty, 이평가, 넣는다 (새로 저장한 부품에 대한)
            }else{
                servicePartService.insertServicePart(servicePartVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#cancelIssueResvReadyDetails(chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO)
     */
    @Override
    public void cancelIssueResvReadyDetails(ReservationReceiptVO reservationReceiptVO) throws Exception {

        /*
         * 부품예류 처리 시
         *
         * 부품요청상세 1 / 출고문서헤더 1건 / 출고문서상세1건 / 수불정보 1 건 씩 추가 및 수정한다.
         *
         * */

        //부품예류/부품예류취소/수불처리/수불처리취소/부품출고/부품출고취소.
        boolean bMvtDocNoYn = false;                                // 수불처리 유/무

        //부품예류취소
        String sReadyStatCancelCd = "05";//예류취소

        //부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        String[] lblList = new String[1];

        if(!StringUtils.isEmpty(reservationReceiptVO.getResvDocNo())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsResvDocNo(reservationReceiptVO.getResvDocNo());

            List<IssueReqVO> issueReqVOList = issueReqService.selectIssueReqsByCondition(searchVO);
            IssueReqVO issueReqVO = null;

            if(issueReqVOList.size() > 0){
                issueReqVO =  issueReqVOList.get(0);
                issueReqVO.setReadyStatCd(sReadyStatCancelCd);
            }

            if(issueReqVO != null){

                searchVO.setsReadyStatCd("03");//준비상태 : 예류(03)

                List<IssueReqDetailVO> obj = issueReqResvService.selectIssueReqDetailResvesByCondition(searchVO);

                // 부품요청상세 Update Data
                for(IssueReqDetailVO issueReqDetailVO : obj){

                    //부품상세 준비상태코드 적용.
                    issueReqDetailVO.setReadyStatCd(issueReqVO.getReadyStatCd());

                    // 출고창고
                    if(StringUtils.isEmpty(issueReqDetailVO.getGiStrgeCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale()); // 출고창고
                        throw processException("par.info.issueCheckMsg", lblList);
                    }
                    //부품번호
                    if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                        throw processException("par.info.issueCheckMsg", lblList);
                    }

                    //부품예류일때만 예류수량 체크
                    if("03".equals(issueReqDetailVO.getReadyStatCd())){
                        //예류수량 < 가용수량
                        if(issueReqDetailVO.getResvQty() > issueReqDetailVO.getAvlbStockQty()){
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale()); //예류수량
                            lblList[1] = messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale()); //가용재고
                            throw processException("par.info.itemReqCntMsg", lblList);
                        }
                    }

                    //예류수량 <= 0
                    if(issueReqDetailVO.getResvQty() <= 0){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale()); //예류수량
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }


                    MvtDocVO mvtVO = new MvtDocVO();                            //수불 헤더 VO(판매예약)
                    List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불 상세 VO 리스트(판매예약)
                    MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();             //수불상세 VO 생성.

                    bMvtDocNoYn = false;

                    //부품예류취소일때
                    if("05".equals(issueReqDetailVO.getReadyStatCd()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){
                        bMvtDocNoYn = true;
                        // 수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("24"); //재고이동취소(예약=>가용) : 24
                        mvtDocItemVO.setCancStmtYn("Y");// 취소구분
                        mvtVO.setMvtDocNo(issueReqDetailVO.getMvtDocNo());
                        mvtVO.setMvtDocYyMm(issueReqDetailVO.getMvtDocYyMm());
                    }else if("03".equals(issueReqDetailVO.getReadyStatCd()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){//출고확정일때
                        bMvtDocNoYn = true;
                        // 수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("23");//재고이동(가용=>예약) : 23
                        mvtDocItemVO.setCancStmtYn("N");// 취소구분
                    }

                    if(bMvtDocNoYn){

                        //고객정보
                        mvtVO.setCustNo(issueReqDetailVO.getCustCd());
                        //수불상세 VO 데이타 담기.
                        mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                        mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
                        mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
                        mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
                        mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());
                        mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());
                        mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
                        mvtDocItemVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                        mvtDocItemVO.setDdlnYn("N");
                        mvtDocItemVO.setCurrCd("");//통화코드

                        list.add(mvtDocItemVO);

                        //수불문서요청.
                        //판매출고(가용 or 예약) 호출
                        mvtDocService.multiSaveMvtDocs(mvtVO, list);
                    }

                    searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
                    searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
                    searchVO.setsResvDocNo(issueReqDetailVO.getResvDocNo());        //예약접수번호
                    searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
                    searchVO.setsCancYn("N");                                       //취소여부

                    issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    //부품예류키 없을 때
                    if(StringUtils.isEmpty(issueReqDetailVO.getReadyDocNo())){
                        //부품예류키 생성.
                        String parResvReadyDocDocNo = "";
                        synchronized (parResvReadyDocNoIdgenService) {
                            //부품예류키 가져오기.
                            parResvReadyDocDocNo = parResvReadyDocNoIdgenService.getNextStringId();
                        }
                        issueReqDetailVO.setReadyDocNo(parResvReadyDocDocNo);
                    }

                    //부품요청상세 카운트 조회.
                    if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){

                        issueReqDetailDAO.insertIssueReqDetailReady(issueReqDetailVO);

                        ServicePartVO servicePartVO = new ServicePartVO();
                        if("SR".equals(issueReqDetailVO.getParGiTp()) || "SP".equals(issueReqDetailVO.getParGiTp())){

                            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                            servicePartVO.setDocNo(issueReqDetailVO.getResvDocNo());
                            servicePartVO.setRoTp(issueReqDetailVO.getRoTp());

                            if("SR".equals(issueReqDetailVO.getParGiTp())){
                                servicePartVO.setPreFixId("RE");//정비예약 구분자 : RE
                            }else if("SP".equals(issueReqDetailVO.getParGiTp())){
                                servicePartVO.setPreFixId("PRE");//정비예약 구분자 : PRE
                            }

                            servicePartVO.setLineNo(issueReqDetailVO.getResvDocLineNo());
                            servicePartVO.setItemCd(issueReqDetailVO.getDbItemCd());
                            servicePartVO.setItemNm(issueReqDetailVO.getItemNm());
                            servicePartVO.setReqQty(issueReqDetailVO.getReqQty());      //요청수량
                            servicePartVO.setItemQty(issueReqDetailVO.getEndQty());     //부품수량 =>출고수량
                            servicePartVO.setGiQty(issueReqDetailVO.getEndQty());       //출고수량
                            servicePartVO.setItemPrc(issueReqDetailVO.getItemPrc());    //부품금액
                            servicePartVO.setItemTotAmt(issueReqDetailVO.getItemPrc() * issueReqDetailVO.getReqQty()); //총금액
                            servicePartVO.setPkgItemCd(issueReqDetailVO.getPkgItemCd());
                            servicePartVO.setReadyStatCd(issueReqDetailVO.getReadyStatCd());
                            servicePartVO.setRegUsrId(LoginUtil.getUserId());

                            servicePartService.insertServicePart(servicePartVO);
                        }
                    }else{
                        if("01".equals(issueReqDetailVO.getParReqStatCd())){
                            issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                        }
                    }

                    //부품출고헤더 VO
                    IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
                    issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutVO.setGiDocTp("SR");
                    issuePartsOutVO.setGiDocStatCd("01");

                    if("03".equals(issueReqDetailVO.getReadyStatCd())){
                        issuePartsOutVO.setCancYn("N");
                    }else{
                        issuePartsOutVO.setCancYn("Y");
                    }
                    issuePartsOutVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutVO.setParGiTp(issueReqVO.getParGiTp());
                    issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
                    issuePartsOutVO.setSerPrsnId(issueReqVO.getSerPrsnId());
                    issuePartsOutVO.setCustCd(issueReqVO.getCustCd());
                    issuePartsOutVO.setCustNm(issueReqVO.getCustNm());
                    issuePartsOutVO.setVinNo(issueReqVO.getVinNo());
                    issuePartsOutVO.setCarNo(issueReqVO.getCarNo());
                    issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());

                    //부품출고상세 요청번호 /부품번호 검색.
                    IssuePartsOutDetailSearchVO issuePartsOutDetailSearchVO = new IssuePartsOutDetailSearchVO();
                    issuePartsOutDetailSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutDetailSearchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutDetailSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

                    IssuePartsOutDetailVO issuePartsOutDetailVO = new IssuePartsOutDetailVO();
                    issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutDetailVO.setGiDocNo(issuePartsOutVO.getGiDocNo());
                    issuePartsOutDetailVO.setGiDocStatCd("01");
                    issuePartsOutDetailVO.setGiDocLineNo(1);
                    issuePartsOutDetailVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutDetailVO.setParGiTp(issueReqVO.getParGiTp());
                    issuePartsOutDetailVO.setParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                    issuePartsOutDetailVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    issuePartsOutDetailVO.setRoDocLineNo(issueReqDetailVO.getRoLineNo());
                    issuePartsOutDetailVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    issuePartsOutDetailVO.setGiLocCd(issueReqDetailVO.getGiLocCd());
                    issuePartsOutDetailVO.setItemCd(issueReqDetailVO.getItemCd());
                    issuePartsOutDetailVO.setItemNm(issueReqDetailVO.getItemNm());
                    issuePartsOutDetailVO.setGiQty(0.0);
                    issuePartsOutDetailVO.setUnitCd(issueReqDetailVO.getUnitCd());
                    issuePartsOutDetailVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    //생성 수불 정보 설정.
                    issuePartsOutDetailVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutDetailVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                    issuePartsOutDetailVO.setMvtDocLineNo(1);

                    issuePartsOutDetailVO.setAbcInd("");
                    issuePartsOutDetailVO.setCustCd(issueReqDetailVO.getCustCd());
                    issuePartsOutDetailVO.setCustNm(issueReqDetailVO.getCustNm());
                    issuePartsOutDetailVO.setSerPrsnId(issueReqDetailVO.getSerPrsnId());
                    issuePartsOutDetailVO.setCarNo(issueReqDetailVO.getCarNo());
                    issuePartsOutDetailVO.setVinNo(issueReqDetailVO.getVinNo());
                    issuePartsOutDetailVO.setCarlineCd(issueReqDetailVO.getCarlineCd());
                    issuePartsOutDetailVO.setCarlineNm(issueReqDetailVO.getCarlineNm());
                    issuePartsOutDetailVO.setGiStatCd("01");
                    issuePartsOutDetailVO.setReceiveId(issueReqDetailVO.getReceiveId());
                    issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty());
                    issuePartsOutDetailVO.setReturnId(issueReqDetailVO.getReturnId());
                    issuePartsOutDetailVO.setCancId(issueReqDetailVO.getCancId());

                    //부품출고상세
                    if(issuePartsOutDetailService.selectIssuePartsOutDetailsByConditionCnt(issuePartsOutDetailSearchVO) == 0){
                        //헤더추가
                        issuePartsOutVO.setGiDocNo(giDocNoIdgenService.getNextStringId());
                        issuePartsOutService.insertIssuePartsOut(issuePartsOutVO);
                        //상세추가
                        issuePartsOutDetailVO.setGiDocNo(issuePartsOutVO.getGiDocNo());
                        issuePartsOutDetailService.insertIssuePartsOutDetail(issuePartsOutDetailVO);

                    }else{
                        //헤더수정.
                        issuePartsOutVO.setGiDocNo(issueReqDetailVO.getGiDocNo());
                        issuePartsOutService.updateIssuePartsOut(issuePartsOutVO);
                        //상세수정
                        issuePartsOutDetailService.updateIssuePartsOutDetail(issuePartsOutDetailVO);
                    }
                }
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#cancelIssueResvReadyDetails(chn.bhmc.dms.ser.rev.vo.PartReservationVO)
     */
    @Override
    public void cancelIssueResvReadyDetails(PartReservationVO partReservationVO) throws Exception {

        /*
         * 부품예류 처리 시
         *
         * 부품요청상세 1 / 출고문서헤더 1건 / 출고문서상세1건 / 수불정보 1 건 씩 추가 및 수정한다.
         *
         * */

        //부품예류/부품예류취소/수불처리/수불처리취소/부품출고/부품출고취소.
        boolean bMvtDocNoYn = false;                                // 수불처리 유/무

        //부품예류취소
        String sReadyStatCancelCd = "05";//예류취소

        //부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        String[] lblList = new String[1];

        if(!StringUtils.isEmpty(partReservationVO.getParResvDocNo())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsResvDocNo(partReservationVO.getParResvDocNo());

            List<IssueReqVO> issueReqVOList = issueReqService.selectIssueReqsByCondition(searchVO);
            IssueReqVO issueReqVO = null;

            if(issueReqVOList.size() > 0){
                issueReqVO =  issueReqVOList.get(0);
                issueReqVO.setReadyStatCd(sReadyStatCancelCd);
            }

            if(issueReqVO != null){

                searchVO.setsReadyStatCd("03");//준비상태 : 예류(03)

                List<IssueReqDetailVO> obj = issueReqResvService.selectIssueReqDetailResvesByCondition(searchVO);

                //부품요청상세 Update Data
                for(IssueReqDetailVO issueReqDetailVO : obj){

                    //부품상세 준비상태코드 적용.
                    issueReqDetailVO.setReadyStatCd(issueReqVO.getReadyStatCd());

                    //출고창고
                    if(StringUtils.isEmpty(issueReqDetailVO.getGiStrgeCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale());          //출고창고
                        throw processException("par.info.issueCheckMsg", lblList);
                    }
                    //부품번호
                    if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());             //부품번호
                        throw processException("par.info.issueCheckMsg", lblList);
                    }

                    //부품예류일때만 예류수량 체크
                    if("03".equals(issueReqDetailVO.getReadyStatCd())){
                        //예류수량 < 가용수량
                        if(issueReqDetailVO.getResvQty() > issueReqDetailVO.getAvlbStockQty()){
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale());        //예류수량
                            lblList[1] = messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale());   //가용재고
                            throw processException("par.info.itemReqCntMsg", lblList);
                        }
                    }

                    //예류수량 <= 0
                    if(issueReqDetailVO.getResvQty() <= 0){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale());            //예류수량
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }


                    MvtDocVO mvtVO = new MvtDocVO();                            //수불 헤더 VO(판매예약)
                    List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불 상세 VO 리스트(판매예약)
                    MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();             //수불상세 VO 생성.

                    bMvtDocNoYn = false;

                    //부품예류취소일때
                    if("05".equals(issueReqDetailVO.getReadyStatCd()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){
                        bMvtDocNoYn = true;
                        // 수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("24"); //재고이동취소(예약=>가용) : 24
                        mvtDocItemVO.setCancStmtYn("Y");// 취소구분
                        mvtVO.setMvtDocNo(issueReqDetailVO.getMvtDocNo());
                        mvtVO.setMvtDocYyMm(issueReqDetailVO.getMvtDocYyMm());
                    }else if("03".equals(issueReqDetailVO.getReadyStatCd()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){//출고확정일때
                        bMvtDocNoYn = true;
                        // 수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("23");//재고이동(가용=>예약) : 23
                        mvtDocItemVO.setCancStmtYn("N");// 취소구분
                    }

                    if(bMvtDocNoYn){

                        // 고객정보
                        mvtVO.setCustNo(issueReqDetailVO.getCustCd());
                        // 수불상세 VO 데이타 담기.
                        mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                        mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
                        mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
                        mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
                        mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());
                        mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());
                        mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
                        mvtDocItemVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                        mvtDocItemVO.setDdlnYn("N");
                        mvtDocItemVO.setCurrCd("");//통화코드

                        list.add(mvtDocItemVO);

                        //수불문서요청.
                        //판매출고(가용 or 예약) 호출
                        mvtDocService.multiSaveMvtDocs(mvtVO, list);
                    }

                    searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
                    searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
                    searchVO.setsResvDocNo(issueReqDetailVO.getResvDocNo());        //예약접수번호
                    searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
                    searchVO.setsCancYn("N");                                       //취소여부

                    issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    //부품예류키 없을 때
                    if(StringUtils.isEmpty(issueReqDetailVO.getReadyDocNo())){
                        //부품예류키 생성.
                        String parResvReadyDocDocNo = "";
                        synchronized (parResvReadyDocNoIdgenService) {
                            //부품예류키 가져오기.
                            parResvReadyDocDocNo = parResvReadyDocNoIdgenService.getNextStringId();
                        }
                        issueReqDetailVO.setReadyDocNo(parResvReadyDocDocNo);
                    }

                    // 부품요청상세 카운트 조회.
                    if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){

                        issueReqDetailDAO.insertIssueReqDetailReady(issueReqDetailVO);

                        ServicePartVO servicePartVO = new ServicePartVO();
                        if("SR".equals(issueReqDetailVO.getParGiTp()) || "SP".equals(issueReqDetailVO.getParGiTp())){

                            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                            servicePartVO.setDocNo(issueReqDetailVO.getResvDocNo());
                            servicePartVO.setRoTp(issueReqDetailVO.getRoTp());

                            if("SR".equals(issueReqDetailVO.getParGiTp())){
                                servicePartVO.setPreFixId("RE");//정비예약 구분자 : RE
                            }else if("SP".equals(issueReqDetailVO.getParGiTp())){
                                servicePartVO.setPreFixId("PRE");//정비예약 구분자 : PRE
                            }

                            servicePartVO.setLineNo(issueReqDetailVO.getResvDocLineNo());
                            servicePartVO.setItemCd(issueReqDetailVO.getDbItemCd());
                            servicePartVO.setItemNm(issueReqDetailVO.getItemNm());
                            servicePartVO.setReqQty(issueReqDetailVO.getReqQty());      //요청수량
                            servicePartVO.setItemQty(issueReqDetailVO.getEndQty());     //부품수량 =>출고수량
                            servicePartVO.setGiQty(issueReqDetailVO.getEndQty());       //출고수량
                            servicePartVO.setItemPrc(issueReqDetailVO.getItemPrc());    //부품금액
                            servicePartVO.setItemTotAmt(issueReqDetailVO.getItemPrc() * issueReqDetailVO.getReqQty()); //총금액
                            servicePartVO.setPkgItemCd(issueReqDetailVO.getPkgItemCd());
                            servicePartVO.setReadyStatCd(issueReqDetailVO.getReadyStatCd());
                            servicePartVO.setRegUsrId(LoginUtil.getUserId());

                            servicePartService.insertServicePart(servicePartVO);
                        }
                    }else{
                        if("01".equals(issueReqDetailVO.getParReqStatCd())){
                            issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                        }
                    }

                    //부품출고헤더 VO
                    IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
                    issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutVO.setGiDocTp("SR");
                    issuePartsOutVO.setGiDocStatCd("01");

                    if("03".equals(issueReqDetailVO.getReadyStatCd())){
                        issuePartsOutVO.setCancYn("N");
                    }else{
                        issuePartsOutVO.setCancYn("Y");
                    }
                    issuePartsOutVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutVO.setParGiTp(issueReqVO.getParGiTp());
                    issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
                    issuePartsOutVO.setSerPrsnId(issueReqVO.getSerPrsnId());
                    issuePartsOutVO.setCustCd(issueReqVO.getCustCd());
                    issuePartsOutVO.setCustNm(issueReqVO.getCustNm());
                    issuePartsOutVO.setVinNo(issueReqVO.getVinNo());
                    issuePartsOutVO.setCarNo(issueReqVO.getCarNo());
                    issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());

                    //부품출고상세 요청번호 /부품번호 검색.
                    IssuePartsOutDetailSearchVO issuePartsOutDetailSearchVO = new IssuePartsOutDetailSearchVO();
                    issuePartsOutDetailSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutDetailSearchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutDetailSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

                    IssuePartsOutDetailVO issuePartsOutDetailVO = new IssuePartsOutDetailVO();
                    issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutDetailVO.setGiDocNo(issuePartsOutVO.getGiDocNo());
                    issuePartsOutDetailVO.setGiDocStatCd("01");
                    issuePartsOutDetailVO.setGiDocLineNo(1);
                    issuePartsOutDetailVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutDetailVO.setParGiTp(issueReqVO.getParGiTp());
                    issuePartsOutDetailVO.setParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                    issuePartsOutDetailVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    issuePartsOutDetailVO.setRoDocLineNo(issueReqDetailVO.getRoLineNo());
                    issuePartsOutDetailVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    issuePartsOutDetailVO.setGiLocCd(issueReqDetailVO.getGiLocCd());
                    issuePartsOutDetailVO.setItemCd(issueReqDetailVO.getItemCd());
                    issuePartsOutDetailVO.setItemNm(issueReqDetailVO.getItemNm());
                    issuePartsOutDetailVO.setGiQty(0.0);
                    issuePartsOutDetailVO.setUnitCd(issueReqDetailVO.getUnitCd());
                    issuePartsOutDetailVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    //생성 수불 정보 설정.
                    issuePartsOutDetailVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutDetailVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                    issuePartsOutDetailVO.setMvtDocLineNo(1);

                    issuePartsOutDetailVO.setAbcInd("");
                    issuePartsOutDetailVO.setCustCd(issueReqDetailVO.getCustCd());
                    issuePartsOutDetailVO.setCustNm(issueReqDetailVO.getCustNm());
                    issuePartsOutDetailVO.setSerPrsnId(issueReqDetailVO.getSerPrsnId());
                    issuePartsOutDetailVO.setCarNo(issueReqDetailVO.getCarNo());
                    issuePartsOutDetailVO.setVinNo(issueReqDetailVO.getVinNo());
                    issuePartsOutDetailVO.setCarlineCd(issueReqDetailVO.getCarlineCd());
                    issuePartsOutDetailVO.setCarlineNm(issueReqDetailVO.getCarlineNm());
                    issuePartsOutDetailVO.setGiStatCd("01");
                    issuePartsOutDetailVO.setReceiveId(issueReqDetailVO.getReceiveId());
                    issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty());
                    issuePartsOutDetailVO.setReturnId(issueReqDetailVO.getReturnId());
                    issuePartsOutDetailVO.setCancId(issueReqDetailVO.getCancId());

                    //부품출고상세
                    if(issuePartsOutDetailService.selectIssuePartsOutDetailsByConditionCnt(issuePartsOutDetailSearchVO) == 0){
                        //헤더추가
                        issuePartsOutVO.setGiDocNo(giDocNoIdgenService.getNextStringId());
                        issuePartsOutService.insertIssuePartsOut(issuePartsOutVO);
                        //상세추가
                        issuePartsOutDetailVO.setGiDocNo(issuePartsOutVO.getGiDocNo());
                        issuePartsOutDetailService.insertIssuePartsOutDetail(issuePartsOutDetailVO);

                    }else{
                        //헤더수정.
                        issuePartsOutVO.setGiDocNo(issueReqDetailVO.getGiDocNo());
                        issuePartsOutService.updateIssuePartsOut(issuePartsOutVO);
                        //상세수정
                        issuePartsOutDetailService.updateIssuePartsOutDetail(issuePartsOutDetailVO);
                    }
                }
            }
        }

    }



    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#cancelIssueResvReadyStatus(chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO)
     */
    @Override
    public void cancelIssueResvReadyStatus(ReservationReceiptVO reservationReceiptVO) throws Exception {

        if(reservationReceiptVO != null){
            if(!StringUtils.isEmpty(reservationReceiptVO.getResvDocNo())){
                //예류취소 : 05
                issueReqDetailDAO.updateCancelIssueResvReadyStatus(LoginUtil.getDlrCd(), reservationReceiptVO.getResvDocNo(), "05");
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#cancelIssueResvReadyStatus(chn.bhmc.dms.ser.rev.vo.PartReservationVO)
     */
    @Override
    public void cancelIssueResvReadyStatus(PartReservationVO partReservationVO) throws Exception {
        if(partReservationVO != null){
            if(!StringUtils.isEmpty(partReservationVO.getParResvDocNo())){
                //예류취소 : 05
                issueReqDetailDAO.updateCancelIssueResvReadyStatus(LoginUtil.getDlrCd(), partReservationVO.getParResvDocNo(), "05");
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#multiIssueResvReadyDetails(chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO)
     */
    @Override
    public void multiIssueResvReadyDetails(IssueReqDetailSaveVO issueReqDetailSaveVO, boolean mvtActYn) throws Exception {

        /*
         * 부품예류 처리 시
         *
         * 부품요청상세 1 / 출고문서헤더 1건 / 출고문서상세1건 / 수불정보 1 건 씩 추가 및 수정한다.
         *
         * */

        //부품예류/부품예류취소/수불처리/수불처리취소/부품출고/부품출고취소.
        boolean bMvtDocNoYn = false;                                // 수불처리 유/무
        //부품요청 헤더 가져오기.
        IssueReqVO issueReqVO = issueReqDetailSaveVO.getIssueReqVO();
        //부품요청 상세 가져오기.
        BaseSaveVO<IssueReqDetailVO> obj = (BaseSaveVO<IssueReqDetailVO>) issueReqDetailSaveVO.getIssueReqDetailVO();

        // 부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        String[] lblList = new String[1];

            // 부품요청상세 Update Data
            for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){

                /*
                 * 상태 확인 후 부품작업 진행 처리.
                 * */

                boolean bProcessYn = false;

                if("SR".equals(issueReqDetailVO.getParGiTp())){

                    ReservationReceiptSearchVO reservationReceiptSearchVO = new ReservationReceiptSearchVO();
                    reservationReceiptSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    reservationReceiptSearchVO.setsResvDocNo(issueReqDetailVO.getResvDocNo());
                    ReservationReceiptVO reservationReceiptVO = reservationReceiptService.selectReservationReceiptByKey(reservationReceiptSearchVO);

                    if(reservationReceiptVO != null && !"C".equals(reservationReceiptVO.getResvStatCd())){
                        bProcessYn = true;
                    }
                }

                if(!bProcessYn && "SP".equals(issueReqDetailVO.getParGiTp())){

                    PartReservationSearchVO partReservationSearchVO = new PartReservationSearchVO();
                    partReservationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    partReservationSearchVO.setsParResvDocNo(issueReqDetailVO.getResvDocNo());
                    PartReservationVO partReservationVO = partReservationService.selectPartReservationByKey(partReservationSearchVO);

                    if(partReservationVO != null && !"C".equals(partReservationVO.getParResvStatCd())){
                        bProcessYn = true;
                    }

                   //维修预约_配件预留_通知预留单创建人 贾明 2018-4-2 start
                   //carNo    车牌号码
      	           //itemNm   配件名称
      	           //partsResvUsrNm 配件预约者

                    List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
                    NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
                    targetVO.setUsrId(issueReqDetailVO.getPartsResvUsrId());
                    targetVO.setUsrNm(issueReqDetailVO.getPartsResvUsrNm());
                    targetVO.setMesgTmplTpList("P");
                    targetUsers.add(targetVO);
                    String sysCd = Constants.SYS_CD_DLR;
                    String alrtPolicyGrpId = "SER-0011";
                    String dlrCd = LoginUtil.getDlrCd();

                    NotificationMessageContext context = new NotificationMessageContext();
                    context.getVelocityContext().put("itemNm", issueReqDetailVO.getItemNm());
                    context.getVelocityContext().put("carNo", issueReqDetailVO.getCarNo());
                    context.getVelocityContext().put("parResvDocNo", issueReqDetailVO.getResvDocNo());//配件预约号码
                    notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
                  //维修预约_配件预留_通知预留单创建人 贾明 2018-4-2 end
                }

                if(bProcessYn){


                //정비 예약수량 가져오기.
                TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
                tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());

                if("SR".equals(issueReqDetailVO.getParGiTp())){
                    tabInfoSearchVO.setsPreFixId("RE");
                }else if("SP".equals(issueReqDetailVO.getParGiTp())){
                    tabInfoSearchVO.setsPreFixId("PRE");
                }else{
                    tabInfoSearchVO.setsPreFixId("RO");
                }

                tabInfoSearchVO.setsDocNo(issueReqDetailVO.getRoDocNo());
                tabInfoSearchVO.setsLineNo(issueReqDetailVO.getParReqDocLineNo());//부품라인번호 : 정비라인번호 확인
                tabInfoSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

                ServicePartVO servicePartReadDbVO = new ServicePartVO();
                List<ServicePartVO> servicePartVOList = servicePartService.selectServicePartsByCondition(tabInfoSearchVO);

                if(servicePartVOList.size() > 0){
                    servicePartReadDbVO = servicePartVOList.get(0);
                }else{
                    //부품예류 없을 때 재조회 메시지 호출.
                    throw processException("par.info.changedInfoMsg", lblList);
                }

                IssueReqDetailVO issueReqDetailDbVO = issueReqDetailDAO.selectIssueReqDetailByKey(issueReqDetailVO.getDlrCd(), issueReqDetailVO.getItemCd(), issueReqDetailVO.getParReqDocNo(), issueReqDetailVO.getParReqDocLineNo(), null, issueReqDetailVO.getRoDocNo(), issueReqDetailVO.getRoLineNo(), issueReqDetailVO.getResvDocNo(), issueReqDetailVO.getResvDocLineNo(), null);

                //부품요청상세 예류취소가 아닐 때 실행.
                if(issueReqDetailDbVO != null && !"05".equals(issueReqDetailDbVO.getReadyStatCd())){

                    //정비 & 부품 예약수량 일치화.
                    issueReqDetailVO.setReqQty(servicePartReadDbVO.getItemQty());
                    issueReqDetailVO.setResvQty(servicePartReadDbVO.getItemQty());
                    issueReqDetailVO.setEndQty(servicePartReadDbVO.getItemQty());

                    //부품상세 준비상태코드 적용.
                    issueReqDetailVO.setReadyStatCd(issueReqVO.getReadyStatCd());

                    // 출고창고
                    if(StringUtils.isEmpty(issueReqDetailVO.getGiStrgeCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale()); // 출고창고
                        throw processException("par.info.issueCheckMsg", lblList);
                    }
                    //부품번호
                    if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                        lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                        throw processException("par.info.issueCheckMsg", lblList);
                    }

                    //부품예류일때만 예류수량 체크
                    if("03".equals(issueReqDetailVO.getReadyStatCd())){
                        //예류수량 < 가용수량
                        if(issueReqDetailVO.getResvQty() > issueReqDetailVO.getAvlbStockQty()){
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale()); //예류수량
                            lblList[1] = messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale()); //가용재고
                            throw processException("par.info.itemReqCntMsg", lblList);
                        }
                    }

                    //예류수량 <= 0
                    if(issueReqDetailVO.getResvQty() <= 0){
                        lblList = new String[2];
                        lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale()); //예류수량
                        lblList[1] = "0";
                        throw processException("par.info.itemReqZeroCntMsg", lblList);
                    }


                    MvtDocVO mvtVO = new MvtDocVO();                            //수불 헤더 VO(판매예약)
                    List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불 상세 VO 리스트(판매예약)
                    MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();             //수불상세 VO 생성.

                    bMvtDocNoYn = false;

                    //부품예류취소일때
                    if("05".equals(issueReqDetailVO.getReadyStatCd()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){
                        bMvtDocNoYn = true;
                        // 수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("24"); //재고이동취소(예약=>가용) : 24
                        mvtDocItemVO.setCancStmtYn("Y");// 취소구분
                        mvtVO.setMvtDocNo(issueReqDetailVO.getMvtDocNo());
                        mvtVO.setMvtDocYyMm(issueReqDetailVO.getMvtDocYyMm());
                    }else if("03".equals(issueReqDetailVO.getReadyStatCd()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){//출고확정일때
                        bMvtDocNoYn = true;
                        // 수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("23");//재고이동(가용=>예약) : 23
                        mvtDocItemVO.setCancStmtYn("N");// 취소구분
                    }

                    if(bMvtDocNoYn){

                        // 고객정보
                        mvtVO.setCustNo(issueReqDetailVO.getCustCd());
                        // 수불상세 VO 데이타 담기.
                        mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                        mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
                        mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
                        mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
                        mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());
                        mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());
                        mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
                        mvtDocItemVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                        mvtDocItemVO.setDdlnYn("N");
                        mvtDocItemVO.setCurrCd("");//통화코드

                        list.add(mvtDocItemVO);

                        //수불문서요청.
                        //판매출고(가용 or 예약) 호출
                        mvtDocService.multiSaveMvtDocs(mvtVO, list);
                    }

                    searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
                    searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
                    searchVO.setsResvDocNo(issueReqDetailVO.getResvDocNo());        //예약접수번호
                    searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
                    searchVO.setsCancYn("N");                                       //취소여부

                    issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    //부품예류키 없을 때
                    if(StringUtils.isEmpty(issueReqDetailVO.getReadyDocNo())){
                        //부품예류키 생성.
                        String parResvReadyDocDocNo = "";
                        synchronized (parResvReadyDocNoIdgenService) {
                            //부품예류키 가져오기.
                            parResvReadyDocDocNo = parResvReadyDocNoIdgenService.getNextStringId();
                        }
                        issueReqDetailVO.setReadyDocNo(parResvReadyDocDocNo);
                    }

                    // 부품요청상세 카운트 조회.
                    if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                        if("01".equals(issueReqDetailVO.getParReqStatCd())){
                            issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                            //예약일때만
                            if("SR".equals(issueReqDetailVO.getParGiTp()) || "SP".equals(issueReqDetailVO.getParGiTp())){

                                ServicePartVO servicePartVO = new ServicePartVO();
                                servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                                servicePartVO.setDocNo(issueReqDetailVO.getResvDocNo());
                                servicePartVO.setRoTp(issueReqDetailVO.getRoTp());
                                if("SR".equals(issueReqDetailVO.getParGiTp())){
                                    servicePartVO.setPreFixId("RE");//정비예약 구분자 : RE
                                }else if("SP".equals(issueReqDetailVO.getParGiTp())){
                                    servicePartVO.setPreFixId("PRE");//정비예약 구분자 : PRE
                                }
                                servicePartVO.setLineNo(issueReqDetailVO.getResvDocLineNo());
                                servicePartVO.setItemCd(issueReqDetailVO.getDbItemCd());
                                servicePartVO.setItemNm(issueReqDetailVO.getItemNm());
                                servicePartVO.setReqQty(issueReqDetailVO.getReqQty());      //요청수량

                                if("01".equals(issueReqDetailVO.getReadyStatCd())){//저장 시 출고수량 0
                                    servicePartVO.setGiQty(0.0);                                //출고수량
                                }else{
                                    servicePartVO.setGiQty(issueReqDetailVO.getEndQty());       //출고수량
                                }

                                servicePartVO.setItemQty(issueReqDetailVO.getEndQty());     //부품수량 =>출고수량
                                servicePartVO.setItemPrc(issueReqDetailVO.getItemPrc());    //부품금액
                                servicePartVO.setItemTotAmt(issueReqDetailVO.getItemPrc() * issueReqDetailVO.getReqQty()); //총금액
                                servicePartVO.setPkgItemCd(issueReqDetailVO.getPkgItemCd());
                                servicePartVO.setReadyStatCd(issueReqDetailVO.getReadyStatCd());
                                servicePartVO.setRegUsrId(LoginUtil.getUserId());
                                servicePartVO.setUpdtUsrId(LoginUtil.getUserId());
                                servicePartVO.setMovingAvgPrc(issueReqDetailVO.getMovingAvgPrc());
                                servicePartVO.setMovingAvgAmt(issueReqDetailVO.getMovingAvgAmt());

                                servicePartService.updateServicePartItemWork(servicePartVO);
                            }
                        }
                    }

                    //부품출고헤더 VO
                    IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
                    issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutVO.setGiDocTp("SR");
                    issuePartsOutVO.setGiDocStatCd("01");

                    if("03".equals(issueReqDetailVO.getReadyStatCd())){
                        issuePartsOutVO.setCancYn("N");
                    }else{
                        issuePartsOutVO.setCancYn("Y");
                    }
                    issuePartsOutVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutVO.setParGiTp(issueReqVO.getParGiTp());
                    issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
                    issuePartsOutVO.setSerPrsnId(issueReqVO.getSerPrsnId());
                    issuePartsOutVO.setCustCd(issueReqVO.getCustCd());
                    issuePartsOutVO.setCustNm(issueReqVO.getCustNm());
                    issuePartsOutVO.setVinNo(issueReqVO.getVinNo());
                    issuePartsOutVO.setCarNo(issueReqVO.getCarNo());
                    issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());

                    //부품출고상세 요청번호 /부품번호 검색.
                    IssuePartsOutDetailSearchVO issuePartsOutDetailSearchVO = new IssuePartsOutDetailSearchVO();
                    issuePartsOutDetailSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutDetailSearchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutDetailSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

                    IssuePartsOutDetailVO issuePartsOutDetailVO = new IssuePartsOutDetailVO();
                    issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
                    issuePartsOutDetailVO.setGiDocNo(issuePartsOutVO.getGiDocNo());
                    issuePartsOutDetailVO.setGiDocStatCd("01");
                    issuePartsOutDetailVO.setGiDocLineNo(1);
                    issuePartsOutDetailVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                    issuePartsOutDetailVO.setParGiTp(issueReqVO.getParGiTp());
                    issuePartsOutDetailVO.setParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                    issuePartsOutDetailVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    issuePartsOutDetailVO.setRoDocLineNo(issueReqDetailVO.getRoLineNo());
                    issuePartsOutDetailVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    issuePartsOutDetailVO.setGiLocCd(issueReqDetailVO.getGiLocCd());
                    issuePartsOutDetailVO.setItemCd(issueReqDetailVO.getItemCd());
                    issuePartsOutDetailVO.setItemNm(issueReqDetailVO.getItemNm());
                    issuePartsOutDetailVO.setGiQty(0.0);
                    issuePartsOutDetailVO.setUnitCd(issueReqDetailVO.getUnitCd());
                    issuePartsOutDetailVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    //생성 수불 정보 설정.
                    issuePartsOutDetailVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutDetailVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                    issuePartsOutDetailVO.setMvtDocLineNo(1);

                    issuePartsOutDetailVO.setAbcInd("");
                    issuePartsOutDetailVO.setCustCd(issueReqDetailVO.getCustCd());
                    issuePartsOutDetailVO.setCustNm(issueReqDetailVO.getCustNm());
                    issuePartsOutDetailVO.setSerPrsnId(issueReqDetailVO.getSerPrsnId());
                    issuePartsOutDetailVO.setCarNo(issueReqDetailVO.getCarNo());
                    issuePartsOutDetailVO.setVinNo(issueReqDetailVO.getVinNo());
                    issuePartsOutDetailVO.setCarlineCd(issueReqDetailVO.getCarlineCd());
                    issuePartsOutDetailVO.setCarlineNm(issueReqDetailVO.getCarlineNm());
                    issuePartsOutDetailVO.setGiStatCd("01");
                    issuePartsOutDetailVO.setReceiveId(issueReqDetailVO.getReceiveId());
                    issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty());
                    issuePartsOutDetailVO.setReturnId(issueReqDetailVO.getReturnId());
                    issuePartsOutDetailVO.setCancId(issueReqDetailVO.getCancId());

                    //부품출고상세
                    if(issuePartsOutDetailService.selectIssuePartsOutDetailsByConditionCnt(issuePartsOutDetailSearchVO) == 0){
                        //헤더추가
                        issuePartsOutVO.setGiDocNo(giDocNoIdgenService.getNextStringId());
                        issuePartsOutService.insertIssuePartsOut(issuePartsOutVO);
                        //상세추가
                        issuePartsOutDetailVO.setGiDocNo(issuePartsOutVO.getGiDocNo());
                        issuePartsOutDetailService.insertIssuePartsOutDetail(issuePartsOutDetailVO);

                    }else{
                        //헤더수정.
                        issuePartsOutVO.setGiDocNo(issueReqDetailVO.getGiDocNo());
                        issuePartsOutService.updateIssuePartsOut(issuePartsOutVO);
                        //상세수정
                        issuePartsOutDetailService.updateIssuePartsOutDetail(issuePartsOutDetailVO);
                    }

                }//부품요청상세 DB 체크 종료

            }//예약/부품예약 상태 체크 DB

        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#multiIssueOtherReadyDetails(chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO)
     */
    @Override
    public void multiIssueOtherReadyDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception {

        /*
         * 1. 추가 시 기 부품요청상세 데이타 존재유무 체크.
         *
         * */

        //부품예류/부품예류취소/수불처리/수불처리취소/부품출고/부품출고취소.
        boolean bMvtDocNoYn = false;                                //수불처리 유/무
        MvtDocVO mvtVO = new MvtDocVO();                            //수불 헤더 VO(판매예약)
        List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불 상세 VO 리스트(판매예약)

        //부품요청 가져오기.
        IssueReqVO otherIssueReqVO = issueReqDetailSaveVO.getIssueReqVO();
        //부품상세 가져오기.
        BaseSaveVO<IssueReqDetailVO> obj = (BaseSaveVO<IssueReqDetailVO>) issueReqDetailSaveVO.getIssueReqDetailVO();

        String[] lblList = new String[1];
        // 부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();

        // 부품요청상세 삭제 데이타
        for(IssueReqDetailVO issueReqDetailVO : obj.getDeleteList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsItemCd(issueReqDetailVO.getItemCd());              //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                if("01".equals(issueReqDetailVO.getParReqStatCd())){//요청건 만 삭제.
                    issueReqDetailDAO.deleteIssueReqDetailOtherReady(issueReqDetailVO);
                }
            }
        }

        // 부품요청상세 Update Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            // 출고창고
            if(StringUtils.isEmpty(issueReqDetailVO.getGiStrgeCd())){
                lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale()); // 출고창고
                throw processException("par.info.issueCheckMsg", lblList);
            }

            //부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if("03".equals(otherIssueReqVO.getReadyStatCd())){//준비상태코드 예류:03일때만 수량 체크.
                //예류수량 < 가용수량
                if(issueReqDetailVO.getResvQty() > issueReqDetailVO.getAvlbStockQty()){
                    lblList = new String[2];
                    lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale());        //예류수량
                    lblList[1] = messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale());   //가용재고
                    throw processException("par.info.itemReqCntMsg", lblList);
                }
            }

            //예류수량 <= 0
            if(issueReqDetailVO.getResvQty() <= 0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.resvQty", null, LocaleContextHolder.getLocale()); //예류수량
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }

            //기타예류 고객정보 없을 때 BMP 업체 대체.
            VenderMasterVO bmpVenderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
            if(bmpVenderMasterVO == null){
                lblList[0] = "BMP";
                throw processException("par.info.itemInsertNotMsg", lblList);
            }

            //부품상세 준비상태코드 적용.
            issueReqDetailVO.setReadyStatCd(otherIssueReqVO.getReadyStatCd());

            /*
             *  1. 부품요청 헤더, 부품요청 상세.
             *
             *
             * */

            //부품요청 VO 생성.
            IssueReqVO issueReqVO = new IssueReqVO();

            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());

            //부품요청 추가/수정
            if(StringUtils.isEmpty(issueReqDetailVO.getParReqDocNo())){
                //기타예류처리 시 헤더정보가 없는 부분 처리.(Vin / CarNo / BpCd)
                issueReqVO.setCustCd(bmpVenderMasterVO.getBpCd());
                issueReqVO.setCustNm(bmpVenderMasterVO.getBpNm());
                issueReqVO.setVinNo(" ");

                if(otherIssueReqVO.getCarNo().equals("")){
                    issueReqVO.setCarNo(" ");
                }else{
                    issueReqVO.setCarNo(otherIssueReqVO.getCarNo());
                }

                issueReqVO.setCancYn("N");
                issueReqVO.setParGiTp("OT");
                issueReqVO.setParReqStatCd("01");
                issueReqVO.setReadyStatCd(otherIssueReqVO.getReadyStatCd());
                issueReqVO.setRegUsrId(LoginUtil.getUserId());
                //부품요청키 가져오기.
                String sParReqDocNo = parReqDocNoIdgenService.getNextStringId();
                //부품예류키 가져오기.
                String sReadyDocNo = parResvReadyDocNoIdgenService.getNextStringId();
                issueReqVO.setParReqDocNo(sParReqDocNo);
                issueReqVO.setReadyDocNo(sReadyDocNo);

                //부품요청 헤더 추가.
                issueReqService.insertIssueReq(issueReqVO);

                issueReqDetailVO.setParReqDocNo(sParReqDocNo);
                issueReqDetailVO.setParReqDocLineNo(1);
                issueReqDetailVO.setReadyDocNo(sReadyDocNo);
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());

                //부품요청 상세 추가.
                issueReqDetailDAO.insertIssueReqDetailReady(issueReqDetailVO);

            }else{

                issueReqVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
                issueReqVO.setReadyStatCd(otherIssueReqVO.getReadyStatCd());
                issueReqVO.setCarNo(otherIssueReqVO.getCarNo());

                //부품요청 상세 수정.
                issueReqService.updateIssueReq(issueReqVO);

                issueReqDetailVO.setParReqDocLineNo(1);
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setReadyStatCd(otherIssueReqVO.getReadyStatCd());

                //부품요청 상세 수정.
                issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
            }

            /*
             *  2. 수불처리.
             *
             *
             * */

            mvtVO = new MvtDocVO();                     // 수불 헤더 VO(판매예약)
            list = new ArrayList<MvtDocItemVO>();       // 수불 상세 VO 리스트(판매예약)
            //수불상세 VO 생성.
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            bMvtDocNoYn = false;

            //판매예약취소일때
            if("05".equals(issueReqDetailVO.getReadyStatCd()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && !StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){

                bMvtDocNoYn = true;
                //수불함수 헤더 정보 담기.
                mvtVO.setMvtTp("24"); //재고이동취소(예약=>가용) : 24
                mvtDocItemVO.setCancStmtYn("Y");// 취소구분
                mvtVO.setMvtDocNo(issueReqDetailVO.getMvtDocNo());
                mvtVO.setMvtDocYyMm(issueReqDetailVO.getMvtDocYyMm());

            }else if("03".equals(issueReqDetailVO.getReadyStatCd()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){//출고확정일때

                bMvtDocNoYn = true;
                //수불함수 헤더 정보 담기.
                mvtVO.setMvtTp("23");//재고이동(가용=>예약) : 23
                mvtDocItemVO.setCancStmtYn("N");// 취소구분

            }

            if(bMvtDocNoYn){

                // 고객정보
                mvtVO.setCustNo(issueReqDetailVO.getCustCd());
                // 수불상세 VO 데이타 담기.
                mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
                mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
                mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
                mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
                mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());
                mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());
                mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
                mvtDocItemVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
                mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getGiStrgeCd());
                mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getGiStrgeCd());
                mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
                mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");//통화코드

                list.add(mvtDocItemVO);

                //수불문서요청.
                //판매출고(가용 or 예약) 호출
                mvtDocService.multiSaveMvtDocs(mvtVO, list);
            }

            /*
             *  3. 부품출고 헤더, 부품출고 상세.
             *
             *
             * */

            //부품출고 헤더 VO
            IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
            issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
            //부품출고 상세 VO
            IssuePartsOutDetailVO issuePartsOutDetailVO = new IssuePartsOutDetailVO();
            issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());

            //부품출고 추가/수정
            if(StringUtils.isEmpty(issueReqDetailVO.getGiDocNo())){//출고문서번호 없을 때

                issuePartsOutVO.setGiDocTp("OT");
                issuePartsOutVO.setGiDocStatCd("01");
                issuePartsOutVO.setCancYn("N");

                issuePartsOutVO.setParReqDocNo(issueReqVO.getParReqDocNo());
                issuePartsOutVO.setParGiTp(issueReqVO.getParGiTp());
                issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
                issuePartsOutVO.setSerPrsnId(issueReqVO.getSerPrsnId());
                issuePartsOutVO.setCustCd(issueReqVO.getCustCd());
                issuePartsOutVO.setCustNm(issueReqVO.getCustNm());
                issuePartsOutVO.setVinNo(issueReqVO.getVinNo());
                issuePartsOutVO.setCarNo(issueReqVO.getCarNo());
                issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                issuePartsOutVO.setRegUsrId(LoginUtil.getUserId());

                issuePartsOutVO.setGiDocNo(giDocNoIdgenService.getNextStringId());

                //부품출고 헤더 추가.
                issuePartsOutService.insertIssuePartsOut(issuePartsOutVO);

                //부품출고 상세 VO
                issuePartsOutDetailVO.setGiDocNo(issuePartsOutVO.getGiDocNo());
                issuePartsOutDetailVO.setGiDocStatCd("01");
                issuePartsOutDetailVO.setGiDocLineNo(1);
                issuePartsOutDetailVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                issuePartsOutDetailVO.setParGiTp(issueReqVO.getParGiTp());
                issuePartsOutDetailVO.setParReqDocLineNo(1);
                issuePartsOutDetailVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                issuePartsOutDetailVO.setRoDocLineNo(1);
                issuePartsOutDetailVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                issuePartsOutDetailVO.setGiLocCd(issueReqDetailVO.getGiLocCd());
                issuePartsOutDetailVO.setItemCd(issueReqDetailVO.getItemCd());
                issuePartsOutDetailVO.setItemNm(issueReqDetailVO.getItemNm());
                issuePartsOutDetailVO.setGiQty(0.0);
                issuePartsOutDetailVO.setUnitCd(issueReqDetailVO.getUnitCd());
                issuePartsOutDetailVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                issuePartsOutDetailVO.setMvtDocNo(mvtVO.getMvtDocNo());
                issuePartsOutDetailVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                issuePartsOutDetailVO.setMvtDocLineNo(1);
                issuePartsOutDetailVO.setAbcInd("");
                issuePartsOutDetailVO.setCustCd(issueReqDetailVO.getCustCd());
                issuePartsOutDetailVO.setCustNm(issueReqDetailVO.getCustNm());
                issuePartsOutDetailVO.setSerPrsnId(issueReqDetailVO.getSerPrsnId());
                issuePartsOutDetailVO.setCarNo(issueReqDetailVO.getCarNo());
                issuePartsOutDetailVO.setVinNo(issueReqDetailVO.getVinNo());
                issuePartsOutDetailVO.setCarlineCd(issueReqDetailVO.getCarlineCd());
                issuePartsOutDetailVO.setCarlineNm(issueReqDetailVO.getCarlineNm());
                issuePartsOutDetailVO.setGiStatCd("01");
                issuePartsOutDetailVO.setReceiveId(issueReqDetailVO.getReceiveId());
                issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty());
                issuePartsOutDetailVO.setReturnId(issueReqDetailVO.getReturnId());
                issuePartsOutDetailVO.setCancId(issueReqDetailVO.getCancId());
                //부품출고 상세 추가.
                issuePartsOutDetailService.insertIssuePartsOutDetail(issuePartsOutDetailVO);

            }else{

                issuePartsOutVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                issuePartsOutVO.setGiDocNo(issueReqDetailVO.getGiDocNo());
                issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());

                if(bMvtDocNoYn){
                    issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());

                    issuePartsOutDetailVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutDetailVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                }

                //부품출고 헤더 수정.
                issuePartsOutService.updateIssuePartsOut(issuePartsOutVO);

                issuePartsOutDetailVO.setGiDocLineNo(1);
                issuePartsOutDetailVO.setGiDocNo(issueReqDetailVO.getGiDocNo());
                issuePartsOutDetailVO.setUpdtUsrId(LoginUtil.getUserId());

                //부품출고 상세 수정.
                issuePartsOutDetailService.updateIssuePartsOutDetail(issuePartsOutDetailVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#multiIssueReqBorrowDetails(chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO)
     */
    @Override
    public void multiIssueReqBorrowDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception {

        /*
         * 1. 추가 시 기 부품요청상세 데이타 존재유무 체크.
         *
         * */

        IssueReqVO issueReqVO = issueReqDetailSaveVO.getIssueReqVO();
        BaseSaveVO<IssueReqDetailVO> obj = (BaseSaveVO<IssueReqDetailVO>) issueReqDetailSaveVO.getIssueReqDetailVO();

        //부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        String[] lblList = new String[1];

        //RO상태에 따른 부품작업 진행 처리.
        RepairOrderSearchVO repairOrderVO = new RepairOrderSearchVO();
        repairOrderVO.setsDlrCd(LoginUtil.getDlrCd());
        repairOrderVO.setsRoDocNo(issueReqVO.getRoDocNo());
        RepairOrderVO repairOrderDbVO = repairOrderService.selectRepairOrderByKey(repairOrderVO);

        //RO상태 위탁확인:01, 수리서비스:02 외 작업진행 불가 처리.
        if(!"01".equals(repairOrderDbVO.getRoStatCd()) && !"02".equals(repairOrderDbVO.getRoStatCd())){
            throw processException("par.lbl.checkRoNotWorkMsg", lblList);
        }
        //RO 작업상태 확인 완료 : 05
        if("05".equals(repairOrderDbVO.getWrkStatCd())){
            throw processException("par.info.checkRoWrkNotWorkMsg", lblList);
        }

        //부품차용 키 생성.
        String parBorrowDocDocNo = "";

        if(StringUtils.isEmpty(issueReqVO.getBorrowDocNoDb())){//부품차용문서 없을 때
            synchronized (parBorrowDocNoIdgenService) {
                //부품차용키 가져오기.
                parBorrowDocDocNo = parBorrowDocNoIdgenService.getNextStringId();
            }

            issueReqVO.setBorrowDocNo(parBorrowDocDocNo);
            issueReqVO.setBorrowDocNoDb(parBorrowDocDocNo);
        }else{
            issueReqVO.setBorrowDocNo(issueReqVO.getBorrowDocNoDb());
        }

        // 부품요청상세 삭제 데이타
        for(IssueReqDetailVO issueReqDetailVO : obj.getDeleteList()){

            if("01".equals(issueReqDetailVO.getBorrowStatCd()) || "02".equals(issueReqDetailVO.getBorrowStatCd()) || "03".equals(issueReqDetailVO.getBorrowStatCd()) || "05".equals(issueReqDetailVO.getBorrowStatCd())){//입력, 차용완성, 반환, 차용대기 일때삭제 가능.
                searchVO.setsDlrCd(LoginUtil.getDlrCd());                               //딜러코드
                searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());            //부품요청번호
                searchVO.setsParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품요청라인번호
                searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());                    //RO번호

                searchVO.setsItemCd(issueReqDetailVO.getItemCd());                      //부품번호
                searchVO.setsReqStrgeCd(issueReqDetailVO.getReqStrgeCd());              //부품요청창고
                searchVO.setsBorrowStatCd(issueReqDetailVO.getBorrowStatCd());          //차용상태
                searchVO.setsCancYn("N");                                               //취소여부

                //부품요청상세 카운트 조회.
                if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                    if("01".equals(issueReqDetailVO.getParReqStatCd())){//부품요청상태 대기 : 01
                        issueReqDetailDAO.deleteIssueReqDetailBorrow(issueReqDetailVO);
                    }
                }
            }
        }

        // 부품요청상세 Insert Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getInsertList()){
            // 부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if("01".equals(issueReqDetailVO.getBorrowStatCd()) || "02".equals(issueReqDetailVO.getBorrowStatCd()) || "03".equals(issueReqDetailVO.getBorrowStatCd())){//입력, 차용완성, 반환일때 추가 가능.
                searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
                searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
                searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
                searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
                searchVO.setsCancYn("N");                                       //취소여부

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setBorrowDocNo(issueReqVO.getBorrowDocNo());
                //차용수량 기준 요청수량,종료수량 일치화.
                issueReqDetailVO.setReqQty(issueReqDetailVO.getBorrowQty());
                issueReqDetailVO.setEndQty(issueReqDetailVO.getBorrowQty());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());

                // 부품요청상세 카운트 조회.
                if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                    issueReqDetailVO.setRoLineNo(0);
                    issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                }
            }
        }

        // 부품요청상세 Update Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            // 부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if("01".equals(issueReqDetailVO.getBorrowStatCd()) || "02".equals(issueReqDetailVO.getBorrowStatCd()) || "03".equals(issueReqDetailVO.getBorrowStatCd())){//입력, 차용완성, 반환일때 수정 가능.

                searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
                searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
                searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
                searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
                searchVO.setsReqStrgeCd(issueReqDetailVO.getReqStrgeCd());      //부품요청창고
                searchVO.setsCancYn("N");                                       //취소여부

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setRoLineNo(0);                                //RO라인번호 0 부품출고이동 시 RO라인번호 가져옴.
                issueReqDetailVO.setBorrowDocNo(issueReqVO.getBorrowDocNo());

                //차용수량 기준 요청수량,종료수량 일치화.
                issueReqDetailVO.setReqQty(issueReqDetailVO.getBorrowQty());
                issueReqDetailVO.setEndQty(issueReqDetailVO.getBorrowQty());

                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());

                // 부품요청상세 카운트 조회.
                if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                    issueReqDetailVO.setBorrowStatCd(issueReqDetailVO.getBorrowUpdateStatCd());//변경할 차용상태코드
                    issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                }else{
                    //차용상태 차용대기(05) ,정비차용확정(04) 체크.
                    searchVO.setsBorrowStatCd(issueReqDetailVO.getBorrowStatCd());  //차용상태
                    if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                        issueReqDetailVO.setBorrowStatCd(issueReqDetailVO.getBorrowUpdateStatCd());//변경할 차용상태코드
                        issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                    }
                }
            }
        }

        /*
         * 부품요청 정비차용상태 수정.
         *
         * */
        updateBorrowStatCdIssueReqHeader(issueReqVO.getParReqDocNo());

        /*
         * 3. 부품요청상세 요청상태 체크 후 부품요청헤더 상태 수정.
         *
         * */
        issueReqService.updateIssueHeaderStatus(issueReqVO.getParReqDocNo());

    }



    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#updateBorrowStatCdIssueReqHeader(chn.bhmc.dms.par.ism.vo.IssueReqVO)
     */
    @Override
    public void updateBorrowStatCdIssueReqHeader(String parReqDocNo) throws Exception {

        //부품차용헤더 수정.
        IssueReqVO issueReqVO = new IssueReqVO();
        issueReqVO.setParReqDocNo(parReqDocNo);

        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsParReqDocNo(issueReqVO.getParReqDocNo());
        searchVO.setsBorrowDocNoUseYn("Y");//차용문서번호 있는 것
        //부품차용상세 리스트 카운트 가져오기.
        int borrowRowAllCnt = issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);

        if(borrowRowAllCnt == 0){
            issueReqVO.setBorrowStatCd("01");//차용문서상태 01 : 등록.
        }else{

            searchVO.setsBorrowStatCd("01");//차용문서상태 01 : 등록.
            int borrowRowReadyAllCnt = issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);

            searchVO.setsBorrowStatCd("02");//차용문서상태 02 : 차용.
            int borrowRowCompleteBeforeAllCnt = issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);

            searchVO.setsBorrowStatCd("03");//차용문서상태 03 : 반환.
            int borrowRowReturnAllCnt = issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);

            searchVO.setsBorrowStatCd("04");//차용문서상태 04 : 정비차용확정.
            int borrowRowCompleteAllCnt = issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);

            searchVO.setsBorrowStatCd("05");//차용문서상태 05 : 차용대기.
            int borrowRowCompleteReadyCnt = issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);

            //차용문서 부품 행수와 반환 행수 와 같은  때
            if(borrowRowAllCnt == borrowRowReturnAllCnt){//모두 반환
                issueReqVO.setBorrowStatCd("03");//정비차용상태 : 반환 : 03
            }else if(borrowRowAllCnt == borrowRowCompleteAllCnt){
                issueReqVO.setBorrowStatCd("04");//정비차용상태 : 정비차용확정 : 04
            }else{

                if(borrowRowCompleteBeforeAllCnt > 0){
                    issueReqVO.setBorrowStatCd("02");//정비차용 : 입력 : 02
                    if(borrowRowReturnAllCnt > 0 || borrowRowReadyAllCnt > 0){
                        issueReqVO.setBorrowStatCd("06");//정비차용상태 : 부분반환 : 06
                    }
                }else if(borrowRowReturnAllCnt > 0){
                    issueReqVO.setBorrowStatCd("06");//정비차용상태 : 부분반환 : 06
                    if(borrowRowCompleteBeforeAllCnt == 0 && borrowRowReadyAllCnt == 0){
                        issueReqVO.setBorrowStatCd("04");//정비차용상태 : 정비차용확정 : 04
                    }
                    //issueReqVO.setBorrowStatCd("01");//정비차용상태 : 입력 : 01
                }else if(borrowRowCompleteReadyCnt > 0){
                    issueReqVO.setBorrowStatCd("02");//정비차용 : 입력 : 02
                    if(borrowRowReturnAllCnt > 0 || borrowRowReadyAllCnt > 0){
                        issueReqVO.setBorrowStatCd("06");//정비차용상태 : 부분반환 : 06
                    }
                }else if(borrowRowReadyAllCnt > 0){
                    issueReqVO.setBorrowStatCd("01");//등록: 입력 : 01
                    if(borrowRowReturnAllCnt > 0 || borrowRowCompleteReadyCnt > 0){
                        issueReqVO.setBorrowStatCd("06");//정비차용상태 : 부분반환 : 06
                    }
                }
            }
        }

        issueReqService.updateIssueReq(issueReqVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#multiIssueReqInnerDetails(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public IssueReqSaveVO multiIssueReqInnerDetails(IssueReqDetailSaveVO issueReqDetailSaveVO)
            throws Exception {

        IssueReqSaveVO issueReqSaveVO = new IssueReqSaveVO();

        /*
         * 1. 추가 시 기 부품요청상세 데이타 존재유무 체크.
         *
         * */

        IssueReqVO issueReqVO = issueReqDetailSaveVO.getIssueReqVO();
        BaseSaveVO<IssueReqDetailVO> obj = (BaseSaveVO<IssueReqDetailVO>) issueReqDetailSaveVO.getIssueReqDetailVO();

        issueReqVO.setDlrCd(LoginUtil.getDlrCd());

        //부품요청 검색 VO
        IssueReqSearchVO searchVO = new IssueReqSearchVO();
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

        //부품요청헤더
        if(StringUtils.isEmpty(issueReqVO.getParReqDocNo())){
            //부품요청키 생성.
            synchronized (parReqDocNoIdgenService) {
                // 부품요청키 가져오기.
                issueReqVO.setParReqDocNo(parReqDocNoIdgenService.getNextStringId());
            }

            //부품요청헤더 추가.
            issueReqService.insertInKeyIssueReq(issueReqVO);

        }else{
            //부품요청헤더 수정.
            issueReqService.updateIssueReq(issueReqVO);
        }

        //부품요청상세 삭제데이타
        for(IssueReqDetailVO issueReqDetailVO : obj.getDeleteList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsParReqStatCd(issueReqDetailVO.getParReqStatCd());  //부품요청상태
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());          //RO라인번호
            searchVO.setsItemCd(issueReqDetailVO.getItemCd());              //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            issueReqDetailVO.setReadyStatCd(null);

            //부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                //부품요청상태 요청 : 01 그리고 DB저장유무 Y 일때
                if("01".equals(issueReqDetailVO.getParReqStatCd()) && "Y".equals(issueReqDetailVO.getDbYn())){

                    //출고예정정보 반환 추가.
                    createGrGiScheduleReturn(issueReqDetailVO);

                    //부품요청상세 삭제.
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);
                }
                //반품부품 및 출고상태 등록 01 인 부품만 삭제.
                if("03".equals(issueReqDetailVO.getParReqStatCd()) || "01".equals(issueReqDetailVO.getGiDocStatCd())){
                    //부품요청상세 삭제.
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);
                }
            }
        }

        //부품요청상세 Insert Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getInsertList()){
            //부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());//부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            issueReqDetailVO.setParReqDocNo(issueReqVO.getParReqDocNo());
            issueReqDetailVO.setRoDocNo(issueReqVO.getParReqDocNo());

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsParReqStatCd(issueReqDetailVO.getParReqStatCd());  //부품요청상태
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());          //RO라인번호
            searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
            issueReqDetailVO.setReqQty(issueReqDetailVO.getEndQty());       //저장시 출고수량 ==>요청수량 대체.

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                //부품요청상태 등록(01)
                if("01".equals(issueReqDetailVO.getParReqStatCd())){
                    //출고예정정보 요청 추가.
                    createGrGiScheduleRequest(issueReqDetailVO);
                    issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                }
            }
        }

        // 부품요청상세 Update Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            // 부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            issueReqDetailVO.setParReqDocNo(issueReqVO.getParReqDocNo());
            issueReqDetailVO.setRoDocNo(issueReqVO.getParReqDocNo());

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       //딜러코드
            searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());    //부품요청번호
            searchVO.setsParReqStatCd(issueReqDetailVO.getParReqStatCd());  //부품요청상태
            searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());            //RO번호
            searchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());          //RO라인번호
            searchVO.setsItemCd(issueReqDetailVO.getDbItemCd());            //부품번호
            searchVO.setsCancYn("N");                                       //취소여부

            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
            issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDetailVO.setReqQty(issueReqDetailVO.getEndQty());       //저장시 출고수량 ==>요청수량 대체.

            //부품요청상태 등록(01)
            if("01".equals(issueReqDetailVO.getParReqStatCd())){
                //출고예정정보 요청 추가.
                createGrGiScheduleRequest(issueReqDetailVO);

                //부품요청상세 카운트 조회.
                if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                    issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                }else{
                    issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                }
            }
        }

        /*
         * 3. 부품요청상세 요청상태 체크 후 부품요청헤더 상태 수정.
         *
         * */
        issueReqService.updateIssueHeaderStatus(issueReqVO.getParReqDocNo());

        //변경된 부품요청헤더VO 설정.
        issueReqSaveVO.setIssueReqVO(issueReqVO);

        return issueReqSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqByKey(java.lang.String)
     */
    @Override
    public IssueReqDetailVO selectIssueReqDetailByKey(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailByKey(LoginUtil.getDlrCd(), searchVO.getsItemCd(), searchVO.getsParReqDocNo(), searchVO.getsParReqDocLineNo(), searchVO.getsParReqStatCd(), searchVO.getsRoDocNo(), searchVO.getsRoLineNo(), searchVO.getsResvDocNo(), searchVO.getsResvDocLineNo(), searchVO.getsMinParReqDocLineNoYn());
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailSrSpItemList(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailSrSpItemList(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailSrSpItemList(LoginUtil.getDlrCd(), searchVO.getsItemCd(), searchVO.getsRoDocNo(), searchVO.getsRoLineNo(), searchVO.getsParGiTp());
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailRoByKey(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailRoItemList(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailRoItemList(LoginUtil.getDlrCd(), searchVO.getsItemCd(), searchVO.getsRoDocNo(), searchVO.getsRoLineNo(), searchVO.getsParGiTp());
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailStatusByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqDetailStatusByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailStatusByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailStatusByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailStatusByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailStatusByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqInnerDetailsByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqInnerDetailsByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqInnerDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsByConditionForItemDeleteCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqDetailsByConditionForItemDeleteCnt(IssueReqSearchVO searchVO) throws Exception {

        return issueReqDetailDAO.selectIssueReqDetailsByConditionForItemDeleteCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqItemsEndQtySumDetailsByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqRoItemDelVO> selectIssueReqItemsEndQtySumDetailsByCondition(IssueReqSearchVO searchVO)
            throws Exception {
        return issueReqDetailDAO.selectIssueReqItemsEndQtySumDetailsByCondition(searchVO);
    }


    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailMaxEndQty(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public IssueReqDetailVO selectIssueReqDetailMaxEndQty(IssueReqSearchVO searchVO) throws Exception {

        return issueReqDetailDAO.selectIssueReqDetailMaxEndQty(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectPrintIssueReqDetailsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectPrintIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectPrintIssueReqDetailsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectPrintIssueReqDetailsByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectPrintIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectPrintIssueReqDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#createGrGiSchedule(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public void createGrGiScheduleRequest(IssueReqDetailVO issueReqDetailVO) throws Exception {

        //출고예정정보 추가
        GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();
        purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
        purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
        purcOrdGrGiScheduleVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
        purcOrdGrGiScheduleVO.setItemCd(issueReqDetailVO.getItemCd());
        purcOrdGrGiScheduleVO.setGrGiDocNo(issueReqDetailVO.getRoDocNo());
        purcOrdGrGiScheduleVO.setGrGiDocLineNo(issueReqDetailVO.getRoLineNo());
        purcOrdGrGiScheduleVO.setGrGiTp("I");//출고예정구분자
        purcOrdGrGiScheduleVO.setProcQty(issueReqDetailVO.getReqQty());//출고예정정보 요청수량.
        purcOrdGrGiScheduleVO.setGrGiQty(issueReqDetailVO.getReqQty());
        VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
        purcOrdGrGiScheduleVO.setBpCd(bhmcVenderVO.getBpCd());
        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

        if(purcOrdGrGiScheduleVO.getGrGiQty() > 0){//입출고수량 0보다 클때만 실행.
            grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
        }

    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#createGrGiScheduleRetrun(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public void createGrGiScheduleReturn(IssueReqDetailVO issueReqDetailVO) throws Exception {

        //출고예정정보 반환 추가.
        GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();
        purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
        purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
        purcOrdGrGiScheduleVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
        purcOrdGrGiScheduleVO.setItemCd(issueReqDetailVO.getItemCd());
        purcOrdGrGiScheduleVO.setGrGiDocNo(issueReqDetailVO.getRoDocNo());
        purcOrdGrGiScheduleVO.setGrGiDocLineNo(issueReqDetailVO.getRoLineNo());
        purcOrdGrGiScheduleVO.setGrGiTp("I");//출고예정구분자
        purcOrdGrGiScheduleVO.setProcQty(issueReqDetailVO.getReqQty() * -1);//출고예정정보반환.
        purcOrdGrGiScheduleVO.setGrGiQty(issueReqDetailVO.getReqQty());
        VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
        purcOrdGrGiScheduleVO.setBpCd(bhmcVenderVO.getBpCd());
        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

        if(purcOrdGrGiScheduleVO.getGrGiQty() > 0){//입출고수량 0보다 클때만 실행.
            grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#createGrGiScheduleEnd(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public void createGrGiScheduleEnd(IssueReqDetailVO issueReqDetailVO) throws Exception {

        //출고예정정보 완료 추가.
        GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();
        purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
        purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
        purcOrdGrGiScheduleVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
        purcOrdGrGiScheduleVO.setItemCd(issueReqDetailVO.getItemCd());
        purcOrdGrGiScheduleVO.setGrGiDocNo(issueReqDetailVO.getRoDocNo());
        purcOrdGrGiScheduleVO.setGrGiDocLineNo(issueReqDetailVO.getRoLineNo());
        purcOrdGrGiScheduleVO.setGrGiTp("I");//출고예정구분자
        purcOrdGrGiScheduleVO.setProcQty(issueReqDetailVO.getEndQty());//출고예정수량.
        purcOrdGrGiScheduleVO.setGrGiQty(issueReqDetailVO.getEndQty());
        VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
        purcOrdGrGiScheduleVO.setBpCd(bhmcVenderVO.getBpCd());
        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

        if(purcOrdGrGiScheduleVO.getGrGiQty() > 0){//입출고수량 0보다 클때만 실행.
            grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#updateCancelIssueDetailBorrowStatus(java.lang.String, java.lang.String, int, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public int updateCancelIssueDetailBorrowStatus(String dlrCd, String parReqDocNo, int parReqDocLineNo,
            String itemCd, String borrowDocNo, String borrowStatCd) {
        return issueReqDetailDAO.updateCancelIssueDetailBorrowStatus(dlrCd, parReqDocNo, parReqDocLineNo, itemCd, borrowDocNo, borrowStatCd);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailItemPriceCheckList(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailItemPriceCheckList(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailItemPriceCheckList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        searchVO.setsParGiTp(params.get("sParGiTp").toString());
        searchVO.setsParReqStatCd(params.get("sParReqStatCd").toString());
        searchVO.setsRoDocNo(params.get("sRoDocNo").toString());
        searchVO.setsRoStatCd(params.get("sRoStatCd").toString());
        searchVO.setsGiDocNo(params.get("sGiDocNo").toString());
        searchVO.setsCustNm(params.get("sCustNm").toString());
        searchVO.setsSerPrsnId(params.get("sSerPrsnId").toString());
        searchVO.setsCarNo(params.get("sCarNo").toString());
        searchVO.setsVinNo(params.get("sVin").toString());
        searchVO.setsReceiveNm(params.get("sReceiveNm").toString());
        searchVO.setsItemCd(params.get("sItemCd").toString());

        if(!StringUtils.isBlank(params.get("sGiDocReqStartDt").toString())){
            String strGiDocReqStartDt = params.get("sGiDocReqStartDt").toString();
            Date sGiDocReqStartDt = Date.valueOf(strGiDocReqStartDt);
            searchVO.setsGiDocReqStartDt(sGiDocReqStartDt);
        }

        if(!StringUtils.isBlank(params.get("sGiDocReqEndDt").toString())){
            String strGiDocReqEndDt = params.get("sGiDocReqEndDt").toString();
            Date sGiDocReqEndDt = Date.valueOf(strGiDocReqEndDt);
            searchVO.setsGiDocReqEndDt(sGiDocReqEndDt);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        List<IssueReqDetailVO> list = selectIssueReqDetailStatusByCondition(searchVO);

        //RO유형
        List<CommonCodeVO> roTpCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd);

        // 공통코드 : 부품출고요청상태
        List<CommonCodeVO> partsParReqStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd);

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<StorageVO> strgeCdList = storageService.selectStoragesByCondition(storageSearchVO);

        //SA 리스트.
        IssueReqTechManSearchVO issueReqTechManSearchVO = new IssueReqTechManSearchVO();
        issueReqTechManSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<IssueReqTechManVO> tecCdList = issueReqTechManService.selectTechManFnMasterByCondition(issueReqTechManSearchVO);

        //공통코드 또는 코드 명칭  변환 처리.
        for(IssueReqDetailVO issueReqDetailVO : list){
            //roTp
            for(CommonCodeVO roTpVO : roTpCdList){
                if(roTpVO.getCmmCd().equals(issueReqDetailVO.getRoTp())){
                    issueReqDetailVO.setRoTp("["+issueReqDetailVO.getRoTp()+"]"+roTpVO.getCmmCdNm());
                    break;
                }
            }
            //parReqStatCd
            for(CommonCodeVO partsParReqStatCdVO : partsParReqStatCdList){
                if(partsParReqStatCdVO.getCmmCd().equals(issueReqDetailVO.getParReqStatCd())){
                    issueReqDetailVO.setParReqStatCd("["+issueReqDetailVO.getParReqStatCd()+"]"+partsParReqStatCdVO.getCmmCdNm());
                    break;
                }
            }

            //strgeCdList
            for(StorageVO storageVO : strgeCdList){
                if(storageVO.getStrgeCd().equals(issueReqDetailVO.getReqStrgeCd())){
                    issueReqDetailVO.setReqStrgeCd(storageVO.getStrgeNm());
                    break;
                }
            }

            //receiveId
            for(IssueReqTechManVO issueReqTechManVO : tecCdList){
                if(issueReqTechManVO.getTecId().equals(issueReqDetailVO.getReceiveId())){
                    issueReqDetailVO.setReceiveId(issueReqTechManVO.getTecNm());
                    break;
                }
            }

            String receiveDtString = "";
            String receiveTimeString = "";
            if(issueReqDetailVO.getReceiveDt() != null){
                receiveDtString = DateUtil.convertToString(issueReqDetailVO.getReceiveDt(), dateFormat);
                receiveTimeString = DateUtil.convertToString(issueReqDetailVO.getReceiveDt(), dateFormat + " HH:mm");
            }

            issueReqDetailVO.setReceiveDtString(receiveDtString);
            issueReqDetailVO.setReceiveTimeString(receiveTimeString);

        }

        context.putVar("items", list);
   }

}
