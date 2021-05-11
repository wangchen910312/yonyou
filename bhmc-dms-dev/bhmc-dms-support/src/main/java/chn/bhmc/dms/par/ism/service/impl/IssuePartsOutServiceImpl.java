package chn.bhmc.dms.par.ism.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqResvService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.dao.IssuePartsOutDAO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqRoItemDelVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.PartsPriceBwmsService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 부품출고 헤더 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 23.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issuePartsOutService")
public class IssuePartsOutServiceImpl extends HService implements IssuePartsOutService {

    /**
     * 부품출고 헤더 DAO
     */
    @Resource(name="issuePartsOutDAO")
    private IssuePartsOutDAO issuePartsOutDAO;

    /**
     * 부품출고 키젠 서비스
     */
    @Resource(name="giDocNoIdgenService")
    EgovIdGnrService giDocNoIdgenService;

    /**
     * 부품출고상세 서비스
     */
    @Resource(name="issuePartsOutDetailService")
    IssuePartsOutDetailService issuePartsOutDetailService;

    /**
     * 부품요청 키젠 서비스
     */
    @Resource(name="parReqDocNoIdgenService")
    TableIdGenService parReqDocNoIdgenService;

    /**
     * 부품요청 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 부품요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /**
     * 부품요청예약 서비스
     */
    @Resource(name="issueReqResvService")
    IssueReqResvService issueReqResvService;

    /**
     * 정비통합 부품 서비스
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 부품이동평균가격 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;

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
     * RO관리 서비스
     */
    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     * 부품가격확인 서비스
     */
    @Resource(name="partsPriceBwmsService")
    PartsPriceBwmsService partsPriceBwmsService;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#insertIssuePartsOut(chn.bhmc.dms.par.ism.vo.IssuePartsOutVO)
     */
    @Override
    public int insertIssuePartsOut(IssuePartsOutVO issuePartsOutVO) throws Exception {
        issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
        issuePartsOutVO.setRegUsrId(LoginUtil.getUserId());
        issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());
        return issuePartsOutDAO.insertIssuePartsOut(issuePartsOutVO);
    }


    public void checkMovingPriceInfo(IssueReqDetailVO issueReqDetailVO, boolean bPlusFlag) throws Exception{

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();

        //int itemMovingAvgPrcSeq = 0;
        //int resultCnt = 0;

        //String[] lblList = new String[1];

        /********************************************************************
         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
         ********************************************************************/
        /*
        searchItemMovingAvgPrcVO.setItemCd(issueReqDetailVO.getItemCd()); //부품코드
        searchItemMovingAvgPrcVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd()); //창고코드
        searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

        //이동평균가격 정보가 존재하는 경우
        if(itemMovingAvgPrcVO != null){

            itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
            itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
            itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
            itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

            if(bPlusFlag){
                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(issueReqDetailVO.getReturnPartsQty() * -1));
            }else{
                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(issueReqDetailVO.getResvQty()));
            }

            itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

            resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

            if(resultCnt != 1){
                lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
                throw processException("par.info.issueCheckMsg", lblList);
            }

          //이동평균가격 정보가 없는 경우
        }else{
            lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
            throw processException("par.info.issueCheckMsg", lblList);
        }

        itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

        itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

        resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

        if(resultCnt != 1){
            lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
            throw processException("par.info.issueCheckMsg", lblList);
        }
        */


        /********************************************************************
         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
         * 끝
         ********************************************************************/
    }

    public IssueReqDetailVO checkMovingPriceInfoRetObj(IssueReqDetailVO issueReqDetailVO, boolean bPlusFlag) throws Exception{

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();

        //int itemMovingAvgPrcSeq = 0;
        //int resultCnt = 0;

        //String[] lblList = new String[1];

        /********************************************************************
         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
         ********************************************************************/
        /*
        searchItemMovingAvgPrcVO.setItemCd(issueReqDetailVO.getItemCd()); //부품코드
        searchItemMovingAvgPrcVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd()); //창고코드
        searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

        //이동평균가격 정보가 존재하는 경우
        if(itemMovingAvgPrcVO != null){

            //부품요청정보 최신부품이동단가금액 적용.
            issueReqDetailVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

            itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
            itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
            itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
            itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

            if(bPlusFlag){
                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(issueReqDetailVO.getReturnPartsQty() * -1));
            }else{
                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(issueReqDetailVO.getResvQty()));
            }

            itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

            resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

            if(resultCnt != 1){
                lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
                throw processException("par.info.issueCheckMsg", lblList);
            }

          //이동평균가격 정보가 없는 경우
        }else{
            lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
            throw processException("par.info.issueCheckMsg", lblList);
        }

        itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

        itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

        resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

        if(resultCnt != 1){
            lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
            throw processException("par.info.issueCheckMsg", lblList);
        }
        */


        /********************************************************************
         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
         * 끝
         ********************************************************************/

        return issueReqDetailVO;
    }




    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#insertIssuePartsOut(chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO)
     */
    @Override
    public IssuePartsOutSaveVO insertIssuePartsOut(IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception {

        /*
         * 정비수령/반품 처리 시
         *
         * 부품요청상세 1 / 출고문서헤더 1건 / 출고문서상세1건 / 수불정보 1 건 씩 추가 및 수정한다.
         *
         * */

        IssuePartsOutVO issuePartsOutVO;
        List<IssueReqDetailVO> issueReqDetailVOList;

        String[] lblList = new String[1];
        ItemMovingAvgPrcVO itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();

        /*
         * 출고문서헤더 정보 가져오기.
         * */
        issuePartsOutVO = issuePartsOutSaveVO.getIssuePartsOutVO();
        issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
        issuePartsOutVO.setRegUsrId(LoginUtil.getUserId());
        issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());

        /*
         * RO상태 확인 후 부품작업 진행 처리.
         * */
        RepairOrderVO repairOrderDbVO = new RepairOrderVO();
        if("RO".equals(issuePartsOutVO.getParGiTp())){//정비수령일때만 체크.
            RepairOrderSearchVO repairOrderVO = new RepairOrderSearchVO();
            repairOrderVO.setsDlrCd(LoginUtil.getDlrCd());
            repairOrderVO.setsRoDocNo(issuePartsOutVO.getRoDocNo());
            repairOrderDbVO = repairOrderService.selectRepairOrderByKey(repairOrderVO);

            /*
             * RO상태 위탁확인:01, 수리서비스:02 외 작업진행 불가 처리.
             * */
            if(!"01".equals(repairOrderDbVO.getRoStatCd()) && !"02".equals(repairOrderDbVO.getRoStatCd())){
                throw processException("par.lbl.checkRoNotWorkMsg", lblList);
            }

            /*
             * RO유형 변경 확인 체크. 부품요청상태코드 : 02 출고완료일때만 실행.
             * */
            if("02".equals(issuePartsOutVO.getGiDocStatCd())){
                if(!repairOrderDbVO.getRoTp().equals(issuePartsOutVO.getRoTp())){
                    //RO RO유형& 부품요청상세 RO유형 비교 재조회 메시지 호출 처리.
                    throw processException("par.info.changedInfoMsg", lblList);
                }
            }

        }

        //출고문서 상세 목록 정보 가져오기.
        issueReqDetailVOList = issuePartsOutSaveVO.getIssueReqDetailVO();

        //딜러코드
        if(StringUtils.isEmpty(LoginUtil.getDlrCd())){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 출고문서유형
        if(StringUtils.isEmpty(issuePartsOutVO.getGiDocTp())){
            lblList[0] = messageSource.getMessage("par.lbl.giDocTp", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 출고문서상태코드
        if(StringUtils.isEmpty(issuePartsOutVO.getGiDocStatCd())){
            lblList[0] = messageSource.getMessage("par.lbl.giDocStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 센터코드
        if(StringUtils.isEmpty(issuePartsOutVO.getPltCd())){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        boolean bMvtDocNoYn = false;// 수불처리 유/무

        //부품출고헤더 생성 카운트.
        int partsOutCreateCnt = 0;
        //부품출고헤더 VO
        IssuePartsOutVO issuePartsOutDbVO = null;

        // 출고문서상세 추가.
        for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
            //정비 예약수량 가져오기.
            TabInfoSearchVO tabInfoSearchDbVO = new TabInfoSearchVO();
            tabInfoSearchDbVO.setsDlrCd(LoginUtil.getDlrCd());

            tabInfoSearchDbVO.setsPreFixId("RO");

            tabInfoSearchDbVO.setsDocNo(issueReqDetailVO.getRoDocNo());
            tabInfoSearchDbVO.setsLineNo(issueReqDetailVO.getRoLineNo());
            tabInfoSearchDbVO.setsItemCd(issueReqDetailVO.getItemCd());

            List<ServicePartVO> servicePartVOList = servicePartService.selectServicePartsByCondition(tabInfoSearchDbVO);

            if(servicePartVOList.size() <= 0){
                //RO부품 없을 때 재조회 메시지 호출.
                throw processException("par.info.changedInfoMsg", lblList);
            }

            //부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());// 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }
            //출고창고
            if(StringUtils.isEmpty(issueReqDetailVO.getGiStrgeCd())){
                lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale());// 출고창고
                throw processException("par.info.issueCheckMsg", lblList);
            }

            MvtDocVO mvtVO = new MvtDocVO();                            //수불 헤더 VO
            List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불 상세 VO 리스트
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();             //수불상세아이템 VO 생성.

            bMvtDocNoYn = false;

            //변경 된 부품요청상태/부품출고유형/부품출고상태코드 적용.
            issueReqDetailVO.setParReqStatCd(issuePartsOutVO.getGiDocStatCd());
            issueReqDetailVO.setGiDocTp(issuePartsOutVO.getGiDocTp());
            issueReqDetailVO.setGiDocStatCd(issuePartsOutVO.getGiDocStatCd());

            IssueReqSearchVO issueReqSearchDbVO = new IssueReqSearchVO();
            issueReqSearchDbVO.setsDlrCd(LoginUtil.getDlrCd());
            issueReqSearchDbVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());
            issueReqSearchDbVO.setsParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());

            boolean bActYn = false;
            if("02".equals(issuePartsOutVO.getGiDocStatCd())){
                issueReqSearchDbVO.setsParReqStatCd("02");
                if(issueReqDetailService.selectPrintIssueReqDetailsByConditionCnt(issueReqSearchDbVO) == 0){
                    bActYn = true;
                }
            }else if("03".equals(issuePartsOutVO.getGiDocStatCd())){
                issueReqSearchDbVO.setsParReqStatCd("03");
                if(issueReqDetailService.selectPrintIssueReqDetailsByConditionCnt(issueReqSearchDbVO) == 0){
                    //출고수량/반품수량보다 작을 때 실행
                    issueReqSearchDbVO.setsParReqDocLineNo(issueReqDetailVO.getParReqDocStockLineNo());
                    IssueReqDetailVO issueReqDetailMaxEndQtyVO = issueReqDetailService.selectIssueReqDetailMaxEndQty(issueReqSearchDbVO);

                    if(issueReqDetailMaxEndQtyVO != null && issueReqDetailMaxEndQtyVO.getEndQty() > 0 && issueReqDetailVO.getReturnPartsQty() <= issueReqDetailMaxEndQtyVO.getEndQty()){
                        bActYn = true;
                    }
                }
            }

            if(bActYn){//정비수령 및 정비반환 DB 실행여부

                    if("03".equals(issueReqDetailVO.getParReqStatCd())){

                        //반품수량 0 체크.
                        if(issueReqDetailVO.getReturnPartsQty() >= 0){ //반품수량  >= 0
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.returnPartsQty", null, LocaleContextHolder.getLocale());         //반품수량
                            lblList[1] = "0";
                            //반품수량이 이 0 입니다.
                            throw processException("par.info.itemReqZeroCntMsg", lblList);
                        }

                        //출고반품
                        bMvtDocNoYn = true;
                        //수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("13"); // 판매출고(가용) : 11, 판매출고취소(가용) : 12, 판매출고반품(가용) : 13
                        mvtVO.setCustNo(issuePartsOutVO.getCustCd());                           //고객코드
                        mvtVO.setBpCd(issuePartsOutVO.getCustCd());                             //거래처코드

                        mvtDocItemVO.setCancStmtYn("N");// 취소구분
                        mvtDocItemVO.setGiDocNo(issueReqDetailVO.getParReqDocNo());             //원 부품상세요청번호
                        mvtDocItemVO.setGiDocLineNo(issueReqDetailVO.getParReqDocLineNo());            //원 부품상세RO번호
                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getMvtDocNo());               //원 수불문서
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());           //원 부품상세RO번호

                        /*
                         * 수불헤더 및 상세 테이블은 양수 정보만 허용하므로 반품 시 마이너스 수량/금액을 마이너스를 곱하여 처리함.
                         *
                         * */
                        double retPartQty = Math.abs(issueReqDetailVO.getReturnPartsQty());//반품수량 절대값처리.(양수로변환)
                        double retItemPrc = issueReqDetailVO.getItemPrc();//부품금액(양수)
                        double retItemAmt = Math.round(issueReqDetailVO.getItemPrc() * Math.abs(retPartQty) * 100.0)/100.0;

                        /*
                         * 이동평균가 정보 체크. 반품수량(+) 처리
                         * */
                        //checkMovingPriceInfoRetObj(issueReqDetailVO, true); //안쓰임.

                        mvtDocItemVO.setItemQty(Math.abs(retPartQty));                                  //부품반품수량(절대값)
                        mvtDocItemVO.setSalePrc(Math.abs(retItemPrc));                                  //정비수령 반품 출고가격(절대값)
                        mvtDocItemVO.setSaleAmt(Math.abs(retItemAmt));                                  //정비수령 반품 출고금액(절대값)
                        mvtDocItemVO.setMovingAvgPrc(Math.abs(issueReqDetailVO.getMovingAvgPrc()));     //정비수령 반품 출고금액(절대값)
                        mvtDocItemVO.setMovingAvgAmt(Math.round(Math.abs(issueReqDetailVO.getMovingAvgPrc()) * Math.abs(retPartQty) * 100.0)/100.0);  //정비수령 반품 출고금액(절대값)

                        mvtDocItemVO.setMvtReasonCont("Parts Retrun");                          //부품반품사유.


                    }else if("02".equals(issueReqDetailVO.getParReqStatCd()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){
                        //가용재고+예류수량 < 출고수량(완료수량)
                        if((issueReqDetailVO.getAvlbStockQty() + issueReqDetailVO.getResvStockQty()) < issueReqDetailVO.getEndQty()){
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.giQty", null, LocaleContextHolder.getLocale());          //출고수량(완료수량)
                            lblList[1] = messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale());   //가용재고
                            // 출고수량이 가용재고보다 큽니다.
                            throw processException("par.info.itemReqCntMsg", lblList);
                        }
                        //가격,금액 확인
                        if(!"02".equals(issueReqDetailVO.getRoTp())){//RO유형 보증가가 아닐때만 체크.
                            /*
                            if(issueReqDetailVO.getItemPrc() == 0 || issueReqDetailVO.getItemAmt() == 0){
                                throw processException("par.info.salePriceZeroMsg");
                            }
                            */
                        }

                        //출고확정일때
                        bMvtDocNoYn = true;
                        //수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("11"); // 판매출고(가용) : 11, 판매출고취소(가용) : 12, 판매출고반품(가용) : 13
                        mvtVO.setCustNo(issuePartsOutVO.getCustCd());                           //고객코드
                        mvtVO.setBpCd(issuePartsOutVO.getCustCd());                             //거래처코드
                        mvtDocItemVO.setCancStmtYn("N");                                        //취소구분

                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());            //부품상세요청번호
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품상세라인번호
                        mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());                 //부품요청수량

                        mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());         //정비수령 출고가격
                        mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());         //정비수령 출고금액

                        /*
                         * 이동평균가 정보 체크. 예약수량(-) 처리
                         * */
                        checkMovingPriceInfo(issueReqDetailVO, false);
                    }

                    if(bMvtDocNoYn){

                        //출고부품완료 후  및 예류부품일때 부품예약(재고이동)취소 수불처리.
                        if("02".equals(issueReqDetailVO.getParReqStatCd()) && "06".equals(issueReqDetailVO.getReadyStatCd())){//준비수령상태 : 정비예약[완성대기]

                            IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
                            issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                            issueReqSearchVO.setsReadyDocNo(issueReqDetailVO.getReadyDocNo());
                            issueReqSearchVO.setsParReqStatCd("01");
                            List<IssueReqDetailVO> readyDetailVOList = issueReqResvService.selectIssueReqDetailResvesByCondition(issueReqSearchVO);

                            for(IssueReqDetailVO issueReqDetailReadyVO :readyDetailVOList){
                                if(!StringUtils.isEmpty(issueReqDetailReadyVO.getMvtDocNo())){
                                    //재고이동 수불취소 처리.
                                    issueReqDetailService.cancelIssueReqDetailResv(issueReqDetailReadyVO);
                                    //부품예류부품 상태 변경.(완성)
                                    issueReqDetailReadyVO.setUpdtUsrId(LoginUtil.getUserId());
                                    issueReqDetailReadyVO.setReadyStatCd("07");//준비상태 완성(정비출고) : 07
                                    issueReqResvService.updateIssuePartsReadyStatus(issueReqDetailReadyVO);
                                }
                            }
                        }

                        //고객정보
                        mvtVO.setCustNo(issueReqDetailVO.getCustCd());
                        //수불상세 VO 데이타 담기.
                        mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                        mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
                        mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
                        mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());

                        mvtDocItemVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setCustNo(issuePartsOutVO.getCustCd());            //고객코드
                        mvtDocItemVO.setCustNm(issuePartsOutVO.getCustNm());            //고객명
                        mvtDocItemVO.setBpCd(issuePartsOutVO.getCustCd());              //고객코드
                        mvtDocItemVO.setBpNm(issuePartsOutVO.getCustNm());              //고객명

                        mvtDocItemVO.setDdlnYn("N");
                        mvtDocItemVO.setCurrCd("");//통화코드

                        list.add(mvtDocItemVO);

                        //수불문서요청.
                        //판매출고(가용 및 가용취소) 호출
                        mvtDocService.multiSaveMvtDocs(mvtVO, list);

                    }

                    IssuePartsOutDetailVO issuePartsOutDetailVO = new IssuePartsOutDetailVO();

                    /*
                     * 출고문서상세
                     *
                     * */
                    //부품요청상세 최대 라인수 가져오기.(반품일때만)
                    if("03".equals(issuePartsOutVO.getGiDocStatCd())){
                        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
                        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                        issueReqSearchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());
                        int iMaxParReqDocNo = issueReqDetailService.selectIssueReqDetailsMaxNumByConditionCnt(issueReqSearchVO);
                        issueReqDetailVO.setParReqDocLineNo(iMaxParReqDocNo);                               //부품요청라인번호 : RO라인 최대번호 대체
                        //부품출고상세
                        issuePartsOutDetailVO.setParReqDocLineNo(iMaxParReqDocNo);                          //부품요청라인번호 : RO라인 최대번호 대체
                        issuePartsOutDetailVO.setGiDocLineNo(iMaxParReqDocNo);                              //부품출고라인번호 : RO라인 최대번호 대체
                    }else{
                        issuePartsOutDetailVO.setParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품출고 부품요청라인번호 : 부품요청라인번호 대체
                        issuePartsOutDetailVO.setGiDocLineNo(issueReqDetailVO.getParReqDocLineNo());        //부품출고 부품출고라인번호 : 부품요청라인번호 대체
                    }

                    //부품출고 VO 생성 및 데이타 매핑.
                    issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());                               //딜러코드
                    issuePartsOutDetailVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());            //부품요청번호

                    issuePartsOutDetailVO.setRoDocNo(issueReqDetailVO.getRoDocNo());                    //RO번호
                    issuePartsOutDetailVO.setRoDocLineNo(issueReqDetailVO.getRoLineNo());               //RO라인번호
                    issuePartsOutDetailVO.setItemCd(issueReqDetailVO.getItemCd());                      //부품코드
                    issuePartsOutDetailVO.setGiQty(issueReqDetailVO.getResvQty());                      //출고수량
                    issuePartsOutDetailVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());              //요청창고
                    issuePartsOutDetailVO.setUnitCd(issueReqDetailVO.getUnitCd());                      //단위코드

                    //생성 수불 정보 설정.
                    issuePartsOutDetailVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutDetailVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                    issuePartsOutDetailVO.setMvtDocLineNo(1);

                    issuePartsOutDetailVO.setGiDocStatCd(issueReqDetailVO.getParReqStatCd());
                    issuePartsOutDetailVO.setGiStatCd(issueReqDetailVO.getGiStatCd());
                    issuePartsOutDetailVO.setReceiveId(issueReqDetailVO.getReceiveId());
                    issuePartsOutDetailVO.setReturnId(issueReqDetailVO.getReturnId());                  //반품ID.
                    issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty());      //반품수량.
                    issuePartsOutDetailVO.setGiCauNm(issueReqDetailVO.getGiCauNm());
                    issuePartsOutDetailVO.setEtcGiTp(issueReqDetailVO.getEtcGiTp());
                    issuePartsOutDetailVO.setTaxDdctAmt(issueReqDetailVO.getTaxDdctAmt());
                    issuePartsOutDetailVO.setTaxAmt(issueReqDetailVO.getTaxAmt());

                    issuePartsOutDetailVO.setRegUsrId(LoginUtil.getUserId());                           //사용자아이디.(딜러코드)

                    /*
                     * 부품요청상세 추가 / 수정.
                     *
                     * */

                    issueReqDetailVO.setEndQty(issueReqDetailVO.getResvQty()); // 완료수량

                    IssueReqSearchVO searchVO = new IssueReqSearchVO();
                    searchVO.setsDlrCd(LoginUtil.getDlrCd());                               //딜러코드
                    searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());            //부품요청상세번호
                    searchVO.setsParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품요청상세라인번호

                    if("02".equals(issueReqDetailVO.getParReqStatCd())){
                        searchVO.setsParReqStatCd("01"); //부품요청상태 02 출고요청일때 출고대기상태 01 설정 후 조회.
                        issueReqDetailVO.setParReqStatCd("01");
                        issueReqDetailVO.setParReqStatCdYn("Y"); //부품요청상태 변경 구분자.

                    }else{
                        searchVO.setsParReqStatCd(issueReqDetailVO.getParReqStatCd()); //반품일때
                    }

                    searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());                    //RO번호
                    searchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());                  //RO라인번호

                    //출고 시점에 요청정보 수정을 할때, 최신 이동평균단가, 금액을 다시 검색하여 UPDATE, INSERT 시점에 재세팅 해준다. 2018.07.06
                    if(!"03".equals(issueReqDetailVO.getParReqStatCd())){
                        itemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd());
                        itemMovingAvgPrcVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        itemMovingAvgPrcVO.setItemCd(issueReqDetailVO.getItemCd());
                        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(itemMovingAvgPrcVO);

                        issueReqDetailVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc() == 0 ? itemMovingAvgPrcVO.getBefMovingAvgPrc() : itemMovingAvgPrcVO.getMovingAvgPrc() );
                        issueReqDetailVO.setMovingAvgAmt(Math.round(issueReqDetailVO.getMovingAvgPrc() * issueReqDetailVO.getEndQty()*100.0)/100.0);
                    }

                    if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                        issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);
                    }else{
                        if("03".equals(issueReqDetailVO.getParReqStatCd())){
                            issueReqDetailVO.setReqQty(Math.abs(issueReqDetailVO.getReqQty()));
                            issueReqDetailVO.setMovingAvgAmt(Math.abs(issueReqDetailVO.getMovingAvgAmt()) * -1);
                        }
                        issueReqDetailService.insertIssueReqDetail(issueReqDetailVO);
                    }

                    //부품출고
                    if("01".equals(issueReqDetailVO.getParReqStatCd()) && "RO".equals(issueReqDetailVO.getParGiTp())){
                        //출고예정정보 반환 추가.
                        issueReqDetailService.createGrGiScheduleReturn(issueReqDetailVO);
                    }

                    /*
                     * RO 수정.
                     * */
                    if("RO".equals(issueReqDetailVO.getParGiTp())){

                        Double giQty = 0.0;

                        TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
                        tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                        tabInfoSearchVO.setsPreFixId(issueReqDetailVO.getParGiTp());//정비구분자 : RO
                        tabInfoSearchVO.setsDocNo(issueReqDetailVO.getRoDocNo());
                        tabInfoSearchVO.setsItemCd(issueReqDetailVO.getItemCd());

                        ServicePartVO servicePartByKeyVO = servicePartService.selectServicePartByKey(tabInfoSearchVO);
                        ServicePartVO servicePartVO = new ServicePartVO();

                        if(servicePartByKeyVO != null){
                            giQty = servicePartByKeyVO.getGiQty();
                            servicePartVO.setLineNo(0);
                        }else{
                            servicePartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                        }

                        servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                        servicePartVO.setDocNo(issueReqDetailVO.getRoDocNo());
                        servicePartVO.setRoTp(issueReqDetailVO.getRoTp());                                          //RO유형
                        servicePartVO.setPreFixId(issueReqDetailVO.getParGiTp());                                   //정비구분자 : RO

                        servicePartVO.setItemCd(issueReqDetailVO.getItemCd());
                        servicePartVO.setItemNm(issueReqDetailVO.getItemNm());

                        if("01".equals(issueReqDetailVO.getParReqStatCd())){//출고요청
                            giQty += issueReqDetailVO.getEndQty();

                        }else if("03".equals(issueReqDetailVO.getParReqStatCd())){//반품
                            giQty += issueReqDetailVO.getEndQty();
                        }

                        //정비부품 요청/출고/부품수량 일치화.
                        servicePartVO.setReqQty(giQty);                                                             //요청수량
                        servicePartVO.setGiQty(giQty);                                                              //출고수량
                        servicePartVO.setItemQty(giQty);                                                            //부품수량

                        servicePartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                        servicePartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        servicePartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                        servicePartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        servicePartVO.setLocCd(issueReqDetailVO.getGiLocCd());

                        servicePartVO.setPkgDocNo(issueReqDetailVO.getPkgDocNo());
                        servicePartVO.setPkgItemCd(issueReqDetailVO.getPkgItemCd());

                        servicePartVO.setPaymTp(issueReqDetailVO.getPaymTp());                  //결제자유형
                        servicePartVO.setPaymUsrNm(issueReqDetailVO.getPaymUsrNm());            //결제자명
                        servicePartVO.setPaymCd(issueReqDetailVO.getPaymCd());                  //지불자코드

                        servicePartVO.setMovingAvgPrc(issueReqDetailVO.getMovingAvgPrc());      //이동단가.
                        servicePartVO.setMovingAvgAmt(issueReqDetailVO.getMovingAvgPrc() * Math.abs(issueReqDetailVO.getEndQty()));      //이동금액.

                        servicePartVO.setRegUsrId(LoginUtil.getUserId());
                        servicePartVO.setUpdtUsrId(LoginUtil.getUserId());

                        if(servicePartByKeyVO != null){
                            servicePartService.updateServicePartItemWork(servicePartVO);
                        }else{

                            //정비 RO쪽 라인번호 사용 시 삭제 후 추가.
                            tabInfoSearchVO = new TabInfoSearchVO();
                            tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                            tabInfoSearchVO.setsPreFixId(issueReqDetailVO.getParGiTp());//정비구분자 : RO
                            tabInfoSearchVO.setsDocNo(issueReqDetailVO.getRoDocNo());
                            tabInfoSearchVO.setsItemCd(null);
                            tabInfoSearchVO.setsLineNo(issueReqDetailVO.getRoLineNo());

                            if(servicePartService.selectServicePartsByConditionCnt(tabInfoSearchVO) > 0){
                                servicePartService.deleteServicePart(servicePartVO);
                            }

                            servicePartService.insertServicePart(servicePartVO);
                        }

                    }


                    /*
                     * 부출출고번호 일치화로 인한 헤더.
                     * */
                    if(partsOutCreateCnt == 0){

                        //부품출고헤더 VO
                        issuePartsOutDbVO = new IssuePartsOutVO();
                        issuePartsOutDbVO.setDlrCd(LoginUtil.getDlrCd());
                        issuePartsOutDbVO.setGiDocTp("RO");
                        issuePartsOutDbVO.setGiDocStatCd(issuePartsOutDbVO.getGiDocStatCd());

                        if("03".equals(issueReqDetailVO.getParReqStatCd())){
                            issuePartsOutDbVO.setCancYn("N");
                        }else{
                            issuePartsOutDbVO.setCancYn("Y");
                        }
                        issuePartsOutDbVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                        issuePartsOutDbVO.setParGiTp(issuePartsOutVO.getParGiTp());
                        issuePartsOutDbVO.setPltCd(LoginUtil.getPltCd());
                        issuePartsOutDbVO.setSerPrsnId(issuePartsOutVO.getSerPrsnId());
                        issuePartsOutDbVO.setCustCd(issuePartsOutVO.getCustCd());
                        issuePartsOutDbVO.setCustNm(issuePartsOutVO.getCustNm());
                        issuePartsOutDbVO.setVinNo(issuePartsOutVO.getVinNo());
                        issuePartsOutDbVO.setCarNo(issuePartsOutVO.getCarNo());
                        issuePartsOutDbVO.setMvtDocNo(mvtVO.getMvtDocNo());
                        issuePartsOutDbVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());

                        issuePartsOutDbVO.setRegUsrId(LoginUtil.getUserId());
                        issuePartsOutDbVO.setUpdtUsrId(LoginUtil.getUserId());

                        //부품출고헤더추가
                        issuePartsOutDbVO.setGiDocNo(giDocNoIdgenService.getNextStringId());
                        issuePartsOutDAO.insertIssuePartsOut(issuePartsOutDbVO);

                        partsOutCreateCnt++;
                    }

                    /*
                     * 정비수령 열 ==>행 기능 변경으로 인한 부품출고헤더 / 상세 각각 추가만 가능.
                     *
                     * */

                    //부품출고상세추가
                    issuePartsOutDetailVO.setGiDocNo(issuePartsOutDbVO.getGiDocNo());
                    issuePartsOutDetailService.insertIssuePartsOutDetail(issuePartsOutDetailVO);

                    /*
                     * 부품요청상세 부품출고 시  부품예류부품일때 부품예류 상태값 수정 처리.
                     * 부품예류상태 : 06 ==> 07
                     * */
                    if("06".equals(issueReqDetailVO.getReadyStatCd())){//준비상태 06 : 완성대기
                        issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                        issueReqDetailVO.setReadyStatCd("07");//준비상태 07 : 완성
                        issueReqResvService.updateIssuePartsReadyStatus(issueReqDetailVO);
                    }

                    /*
                     * 부품요청상세 부품출고 시  부품차용부품일때 차용 상태값 수정 처리.
                     * 차용상태 : 05(차용대기) ==> 04(정비차용확정)
                     * 반품상태 아닐때 실행.
                     * */
                    if(!"03".equals(issueReqDetailVO.getParReqStatCd()) && !StringUtils.isEmpty(issueReqDetailVO.getBorrowDocNo()) && !StringUtils.isEmpty(issueReqDetailVO.getBorrowStatCd())){
                        //차용문서번호, 차용상태정보 있을 때 차용상태 차용 변경.
                        issueReqDetailService.updateCancelIssueDetailBorrowStatus(LoginUtil.getDlrCd(), issueReqDetailVO.getParReqDocNo(), issueReqDetailVO.getParReqDocLineNo(), issueReqDetailVO.getItemCd(), issueReqDetailVO.getBorrowDocNo(), "04");
                    }

            }//DB item Check

        }//end FOREACH

        /*
         * 부품요청 정비차용상태 수정.
         *
         * */
        issueReqDetailService.updateBorrowStatCdIssueReqHeader(issuePartsOutVO.getParReqDocNo());

        /*
         * 3. 부품요청상세 요청상태 체크 후 부품요청헤더 상태 수정.
         *
         * */

        issueReqService.updateIssueHeaderStatus(issuePartsOutVO.getParReqDocNo());

        /*
         * 4. 출고/반품  후 수량 0인 항목 정비RO 부품삭제 처리.
         *
         * */

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();

        if("RO".equals(issuePartsOutVO.getParGiTp())){
            issueReqSearchVO = new IssueReqSearchVO();
            issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            issueReqSearchVO.setsRoDocNo(issuePartsOutVO.getRoDocNo());
            List<IssueReqRoItemDelVO> issueReqDetailEndQtySumList = issueReqDetailService.selectIssueReqItemsEndQtySumDetailsByCondition(issueReqSearchVO);

            for(IssueReqRoItemDelVO issueReqRoItemDelVO: issueReqDetailEndQtySumList){
                ServicePartVO servicePartVO = new ServicePartVO();
                servicePartVO.setDlrCd(LoginUtil.getDlrCd());
                servicePartVO.setPreFixId(issuePartsOutVO.getParGiTp());
                servicePartVO.setDocNo(issueReqRoItemDelVO.getRoDocNo());
                servicePartVO.setItemCd(issueReqRoItemDelVO.getItemCd());
                servicePartService.deleteServicePart(servicePartVO);
            }
        }

        /*
         * 부품출고헤더 RO번호 가격계산.
         *
         * */
        issueReqDetailService.calculateIssueReqDetailsPriceInfo(issuePartsOutVO, repairOrderDbVO);

        return issuePartsOutSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#insertIssuePartsOutInner(chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO)
     */
    @Override
    public IssuePartsOutSaveVO insertIssuePartsOutInner(IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception {
        /*
         * 내부수령/반품 처리 시
         *
         * 부품요청상세 1 / 출고문서헤더 1건 / 출고문서상세1건 / 수불정보 1 건 씩 추가 및 수정한다.
         *
         * */

        IssuePartsOutVO issuePartsOutVO;
        List<IssueReqDetailVO> issueReqDetailVOList;

        String[] lblList = new String[1];

        /*
         * 출고문서헤더 정보 가져오기.
         * */
        issuePartsOutVO = issuePartsOutSaveVO.getIssuePartsOutVO();
        issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
        issuePartsOutVO.setRegUsrId(LoginUtil.getUserId());
        issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());

        //출고문서 상세 목록 정보 가져오기.
        issueReqDetailVOList = issuePartsOutSaveVO.getIssueReqDetailVO();

        //딜러코드
        if(StringUtils.isEmpty(LoginUtil.getDlrCd())){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 출고문서유형
        if(StringUtils.isEmpty(issuePartsOutVO.getGiDocTp())){
            lblList[0] = messageSource.getMessage("par.lbl.giDocTp", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 출고문서상태코드
        if(StringUtils.isEmpty(issuePartsOutVO.getGiDocStatCd())){
            lblList[0] = messageSource.getMessage("par.lbl.giDocStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 센터코드
        if(StringUtils.isEmpty(issuePartsOutVO.getPltCd())){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        boolean bMvtDocNoYn = false;// 수불처리 유/무

        //부품출고헤더 생성 카운트.
        int partsOutCreateCnt = 0;
        //부품출고헤더 VO
        IssuePartsOutVO issuePartsOutDbVO = null;

        // 출고문서상세 추가.
        for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){

            //부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());// 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }
            //출고창고
            if(StringUtils.isEmpty(issueReqDetailVO.getGiStrgeCd())){
                lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale());// 출고창고
                throw processException("par.info.issueCheckMsg", lblList);
            }

            MvtDocVO mvtVO = new MvtDocVO();                            //수불 헤더 VO
            List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //수불 상세 VO 리스트
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();             //수불상세아이템 VO 생성.

            bMvtDocNoYn = false;

            //변경 된 부품요청상태/부품출고유형/부품출고상태코드 적용.
            issueReqDetailVO.setParReqStatCd(issuePartsOutVO.getGiDocStatCd());
            issueReqDetailVO.setGiDocTp(issuePartsOutVO.getGiDocTp());
            issueReqDetailVO.setGiDocStatCd(issuePartsOutVO.getGiDocStatCd());

            //정비수령상세 부품 출고확인 체크.
            IssueReqSearchVO issueReqSearchDbVO = new IssueReqSearchVO();
            issueReqSearchDbVO.setsDlrCd(LoginUtil.getDlrCd());
            issueReqSearchDbVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());
            issueReqSearchDbVO.setsParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());

            boolean bActYn = false;
            if("02".equals(issuePartsOutVO.getGiDocStatCd())){
                issueReqSearchDbVO.setsParReqStatCd("02");
                if(issueReqDetailService.selectPrintIssueReqDetailsByConditionCnt(issueReqSearchDbVO) == 0){
                    bActYn = true;
                }
            }else if("03".equals(issuePartsOutVO.getGiDocStatCd())){
                issueReqSearchDbVO.setsParReqStatCd("03");
                if(issueReqDetailService.selectPrintIssueReqDetailsByConditionCnt(issueReqSearchDbVO) == 0){
                   //출고수량/반품수량보다 작을 때 실행
                    issueReqSearchDbVO.setsParReqDocLineNo(issueReqDetailVO.getParReqDocStockLineNo());
                    IssueReqDetailVO issueReqDetailMaxEndQtyVO = issueReqDetailService.selectIssueReqDetailMaxEndQty(issueReqSearchDbVO);

                    if(issueReqDetailMaxEndQtyVO != null && issueReqDetailMaxEndQtyVO.getEndQty() > 0 && issueReqDetailVO.getReturnPartsQty() <= issueReqDetailMaxEndQtyVO.getEndQty()){
                        bActYn = true;
                    }
                }
            }

            if(bActYn){//정비수령 및 정비반환 DB 실행여부

                    if("03".equals(issueReqDetailVO.getParReqStatCd())){

                        //반품수량 0 체크.
                        if(issueReqDetailVO.getReturnPartsQty() >= 0){ //반품수량  >= 0
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.returnPartsQty", null, LocaleContextHolder.getLocale());//반품수량
                            lblList[1] = "0";
                            //반품수량이 이 0 입니다.
                            throw processException("par.info.itemReqZeroCntMsg", lblList);
                        }

                        //출고반품
                        bMvtDocNoYn = true;
                        //수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("42");//내부출고취소(42)
                        mvtVO.setCustNo(issuePartsOutVO.getCustCd());                           //고객코드
                        mvtVO.setBpCd(issuePartsOutVO.getCustCd());                             //거래처코드

                        mvtDocItemVO.setCancStmtYn("N");// 취소구분
                        mvtDocItemVO.setGiDocNo(issueReqDetailVO.getParReqDocNo());             //원 부품상세요청번호
                        mvtDocItemVO.setGiDocLineNo(issueReqDetailVO.getRoLineNo());            //원 부품상세RO번호
                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getMvtDocNo());               //원 수불문서
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getRoLineNo());           //원 부품상세RO번호

                        /*
                         * 수불헤더 및 상세 테이블은 양수 정보만 허용하므로 반품 시 마이너스 수량/금액을 마이너스를 곱하여 처리함.
                         *
                         * */
                        double retPartQty = issueReqDetailVO.getReturnPartsQty() * -1;//반품수량 마이너스 * -1(양수로변환)
                        double retItemPrc = issueReqDetailVO.getItemPrc();//부품금액(양수)
                        double retItemAmt = (issueReqDetailVO.getItemPrc() * retPartQty);
                        mvtDocItemVO.setItemQty(retPartQty);//부품반품수량(수불처리 시 -1 수량 못해서 -1을 곱함.)
                        mvtDocItemVO.setSalePrc(retItemPrc);         //정비수령 반품 출고가격
                        mvtDocItemVO.setSaleAmt(retItemAmt);         //정비수령 반품 출고금액

                        mvtDocItemVO.setMvtReasonCont("Parts Inner Retrun");                          //부품반품사유.

                        /*
                         * 이동평균가 정보 체크. 반품수량(+) 처리
                         * */
                        checkMovingPriceInfo(issueReqDetailVO, true);

                    }else if("02".equals(issueReqDetailVO.getParReqStatCd()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocNo()) && StringUtils.isEmpty(issueReqDetailVO.getMvtDocYyMm())){
                        //가용재고 < 출고수량(완료수량)
                        if(issueReqDetailVO.getAvlbStockQty() < issueReqDetailVO.getEndQty()){
                            lblList = new String[2];
                            lblList[0] = messageSource.getMessage("par.lbl.giQty", null, LocaleContextHolder.getLocale());          //출고수량(완료수량)
                            lblList[1] = messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale());   //가용재고
                            // 출고수량이 가용재고보다 큽니다.
                            throw processException("par.info.itemReqCntMsg", lblList);
                        }
                        /*
                        //가격,금액 확인
                        if(issueReqDetailVO.getItemPrc() == 0 || issueReqDetailVO.getItemAmt() == 0){
                            throw processException("par.info.salePriceZeroMsg");
                        }
                        */
                        //출고확정일때
                        bMvtDocNoYn = true;
                        //수불함수 헤더 정보 담기.
                        mvtVO.setMvtTp("41"); // 내부출고(41)
                        mvtVO.setCustNo(issuePartsOutVO.getCustCd());                           //고객코드
                        mvtVO.setBpCd(issuePartsOutVO.getCustCd());                             //거래처코드
                        mvtDocItemVO.setCancStmtYn("N");                                        //취소구분

                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());            //부품상세요청번호
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품상세라인번호
                        mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());                 //부품요청수량

                        mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());         //정비수령 출고가격
                        mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());         //정비수령 출고금액

                        /*
                         * 이동평균가 정보 체크. 예약수량(-) 처리
                         * */
                        checkMovingPriceInfo(issueReqDetailVO, false);
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

                        mvtDocItemVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setCustNo(issuePartsOutVO.getCustCd());            //고객코드
                        mvtDocItemVO.setCustNm(issuePartsOutVO.getCustNm());            //고객명
                        mvtDocItemVO.setBpCd(issuePartsOutVO.getCustCd());              //고객코드
                        mvtDocItemVO.setBpNm(issuePartsOutVO.getCustNm());              //고객명

                        mvtDocItemVO.setDdlnYn("N");
                        mvtDocItemVO.setCurrCd("");//통화코드

                        //내부수령 출고원인 없을 때 공백값 처리.
                        if(StringUtils.isEmpty(issueReqDetailVO.getGiCauNm())){
                            issueReqDetailVO.setGiCauNm(" ");
                        }
                        mvtDocItemVO.setMvtReasonCont(issueReqDetailVO.getGiCauNm());//내부수령 수불사유

                        list.add(mvtDocItemVO);

                        //수불문서요청.
                        //판매출고(가용 및 가용취소) 호출
                        mvtDocService.multiSaveMvtDocs(mvtVO, list);

                    }

                    IssuePartsOutDetailVO issuePartsOutDetailVO = new IssuePartsOutDetailVO();

                    /*
                     * 출고문서상세
                     *
                     * */
                    //부품요청상세 최대 라인수 가져오기.(반품일때만)
                    if("03".equals(issuePartsOutVO.getGiDocStatCd())){
                        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
                        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                        issueReqSearchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());
                        int iMaxParReqDocNo = issueReqDetailService.selectIssueReqDetailsMaxNumByConditionCnt(issueReqSearchVO);
                        issueReqDetailVO.setParReqDocLineNo(iMaxParReqDocNo);                               //부품요청라인번호 : RO라인 최대번호 대체
                        //부품출고상세
                        issuePartsOutDetailVO.setParReqDocLineNo(iMaxParReqDocNo);                          //부품요청라인번호 : RO라인 최대번호 대체
                        issuePartsOutDetailVO.setGiDocLineNo(iMaxParReqDocNo);                              //부품출고라인번호 : RO라인 최대번호 대체
                    }else{
                        issuePartsOutDetailVO.setParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품출고 부품요청라인번호 : 부품요청라인번호 대체
                        issuePartsOutDetailVO.setGiDocLineNo(issueReqDetailVO.getParReqDocLineNo());        //부품출고 부품출고라인번호 : 부품요청라인번호 대체
                    }

                    //부품출고 VO 생성 및 데이타 매핑.
                    issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());                               //딜러코드
                    issuePartsOutDetailVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());            //부품요청번호

                    issuePartsOutDetailVO.setRoDocNo(issueReqDetailVO.getRoDocNo());                    //RO번호
                    issuePartsOutDetailVO.setRoDocLineNo(issueReqDetailVO.getRoLineNo());               //RO라인번호
                    issuePartsOutDetailVO.setItemCd(issueReqDetailVO.getItemCd());                      //부품코드
                    issuePartsOutDetailVO.setGiQty(issueReqDetailVO.getResvQty());                      //출고수량
                    issuePartsOutDetailVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());              //요청창고
                    issuePartsOutDetailVO.setUnitCd(issueReqDetailVO.getUnitCd());                      //단위코드

                    //생성 수불 정보 설정.
                    issuePartsOutDetailVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutDetailVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                    issuePartsOutDetailVO.setMvtDocLineNo(1);

                    issuePartsOutDetailVO.setGiDocStatCd(issueReqDetailVO.getParReqStatCd());
                    issuePartsOutDetailVO.setGiStatCd(issueReqDetailVO.getGiStatCd());
                    issuePartsOutDetailVO.setReceiveId(issueReqDetailVO.getReceiveId());
                    issuePartsOutDetailVO.setReturnId(issueReqDetailVO.getReturnId());                  //반품ID.
                    issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty());      //반품수량.
                    issuePartsOutDetailVO.setGiCauNm(issueReqDetailVO.getGiCauNm());
                    issuePartsOutDetailVO.setEtcGiTp(issueReqDetailVO.getEtcGiTp());
                    issuePartsOutDetailVO.setTaxDdctAmt(issueReqDetailVO.getTaxDdctAmt());
                    issuePartsOutDetailVO.setTaxAmt(issueReqDetailVO.getTaxAmt());

                    issuePartsOutDetailVO.setRegUsrId(LoginUtil.getUserId());                           //사용자아이디.(딜러코드)

                    /*
                     * 부품요청상세 추가 / 수정.
                     *
                     * */

                    issueReqDetailVO.setEndQty(issueReqDetailVO.getResvQty()); // 완료수량

                    IssueReqSearchVO searchVO = new IssueReqSearchVO();
                    searchVO.setsDlrCd(LoginUtil.getDlrCd());                               //딜러코드
                    searchVO.setsParReqDocNo(issueReqDetailVO.getParReqDocNo());            //부품요청상세번호
                    searchVO.setsParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품요청상세라인번호

                    if("02".equals(issueReqDetailVO.getParReqStatCd())){
                        searchVO.setsParReqStatCd("01"); //부품요청상태 02 출고요청일때 출고대기상태 01 설정 후 조회.
                        issueReqDetailVO.setParReqStatCd("01");
                        issueReqDetailVO.setParReqStatCdYn("Y"); //부품요청상태 변경 구분자.

                    }else{
                        searchVO.setsParReqStatCd(issueReqDetailVO.getParReqStatCd()); //반품일때
                    }

                    searchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());                    //RO번호
                    searchVO.setsRoLineNo(issueReqDetailVO.getRoLineNo());                  //RO라인번호

                    if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(searchVO) > 0){
                        issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);
                    }else{
                        issueReqDetailService.insertIssueReqDetail(issueReqDetailVO);
                    }

                    /*
                     * 부출출고번호 일치화로 인한 헤더.
                     * */
                    if(partsOutCreateCnt == 0){

                        //부품출고헤더 VO
                        issuePartsOutDbVO = new IssuePartsOutVO();
                        issuePartsOutDbVO.setDlrCd(LoginUtil.getDlrCd());
                        issuePartsOutDbVO.setGiDocTp("RO");
                        issuePartsOutDbVO.setGiDocStatCd(issuePartsOutDbVO.getGiDocStatCd());

                        if("03".equals(issueReqDetailVO.getParReqStatCd())){
                            issuePartsOutDbVO.setCancYn("N");
                        }else{
                            issuePartsOutDbVO.setCancYn("Y");
                        }
                        issuePartsOutDbVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                        issuePartsOutDbVO.setParGiTp(issuePartsOutVO.getParGiTp());
                        issuePartsOutDbVO.setPltCd(LoginUtil.getPltCd());
                        issuePartsOutDbVO.setSerPrsnId(issuePartsOutVO.getSerPrsnId());
                        issuePartsOutDbVO.setCustCd(issuePartsOutVO.getCustCd());
                        issuePartsOutDbVO.setCustNm(issuePartsOutVO.getCustNm());
                        issuePartsOutDbVO.setVinNo(issuePartsOutVO.getVinNo());
                        issuePartsOutDbVO.setCarNo(issuePartsOutVO.getCarNo());
                        issuePartsOutDbVO.setMvtDocNo(mvtVO.getMvtDocNo());
                        issuePartsOutDbVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());

                        issuePartsOutDbVO.setRegUsrId(LoginUtil.getUserId());
                        issuePartsOutDbVO.setUpdtUsrId(LoginUtil.getUserId());

                        //부품출고헤더추가
                        issuePartsOutDbVO.setGiDocNo(giDocNoIdgenService.getNextStringId());
                        issuePartsOutDAO.insertIssuePartsOut(issuePartsOutDbVO);

                        partsOutCreateCnt++;
                    }

                    /*
                     * 정비수령 열 ==>행 기능 변경으로 인한 부품출고헤더 / 상세 각각 추가만 가능.
                     *
                     * */

                    //부품출고상세추가
                    issuePartsOutDetailVO.setGiDocNo(issuePartsOutDbVO.getGiDocNo());
                    issuePartsOutDetailService.insertIssuePartsOutDetail(issuePartsOutDetailVO);

            }//DB item Check

        }//end FOREACH

        /*
         * 3. 부품요청상세 요청상태 체크 후 부품요청헤더 상태 수정.
         *
         * */

        issueReqService.updateIssueHeaderStatus(issuePartsOutVO.getParReqDocNo());

        return issuePartsOutSaveVO;
    }


    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#insertIssuePartsOutReturn(chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO)
     */
    @Override
    public IssuePartsOutSaveVO insertIssuePartsOutReturn(IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception {

        IssuePartsOutVO issuePartsOutVO;
        List<IssueReqDetailVO> issueReqDetailVOList;

        // 출고문서 헤더 정보 가져오기.
        issuePartsOutVO = issuePartsOutSaveVO.getIssuePartsOutVO();
        issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
        issuePartsOutVO.setRegUsrId(LoginUtil.getUserId());
        issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());

        // 출고문서 상세 목록 정보 가져오기.
        issueReqDetailVOList = issuePartsOutSaveVO.getIssueReqDetailVO();

        String[] lblList = new String[1];

        //딜러코드
        if(StringUtils.isEmpty(LoginUtil.getDlrCd())){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 출고문서유형
        if(StringUtils.isEmpty(issuePartsOutVO.getGiDocTp())){
            lblList[0] = messageSource.getMessage("par.lbl.giDocTp", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 출고문서상태코드
        if(StringUtils.isEmpty(issuePartsOutVO.getGiDocStatCd())){
            lblList[0] = messageSource.getMessage("par.lbl.giDocStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 센터코드
        if(StringUtils.isEmpty(issuePartsOutVO.getPltCd())){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        // 출고확정리스트.
        BaseSaveVO<IssuePartsOutDetailVO> issuePartsOutDetailVOList = new BaseSaveVO<IssuePartsOutDetailVO>();

        // 출고문서헤더 수정.
        issuePartsOutDAO.updateIssuePartsOut(issuePartsOutVO);

        // 출고문서상세 추가.
        for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
            // 반품수량 유형성 체크.
            if(issueReqDetailVO.getEndQty() < issueReqDetailVO.getReturnPartsQty()){// 출고수량 < 반품수량
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.returnPartsQty", null, LocaleContextHolder.getLocale()); // 반품수량
                lblList[1] = messageSource.getMessage("par.lbl.giQty", null, LocaleContextHolder.getLocale());   // 출고수량
                // 반품수량이 출고수량보다 큽니다.
                throw processException("par.info.itemReqCntMsg", lblList);
            }

            // 부품번호
            if(StringUtils.isEmpty(issueReqDetailVO.getItemCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            IssuePartsOutDetailVO issuePartsOutDetailVO = new IssuePartsOutDetailVO();

            // 부품출고 VO 생성 및 데이타 매핑.
            issuePartsOutDetailVO.setGiDocNo(issueReqDetailVO.getGiDocNo());                    //출고문서번호
            issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());                               //딜러코드
            issuePartsOutDetailVO.setGiDocLineNo(issueReqDetailVO.getParReqDocLineNo());        //출고문서라인번호 : 부품요청라인번호 대체
            issuePartsOutDetailVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());            //부품요청번호
            issuePartsOutDetailVO.setParReqDocLineNo(issueReqDetailVO.getParReqDocLineNo());    //부품요청라인번호
            issuePartsOutDetailVO.setRoDocNo(issueReqDetailVO.getRoDocNo());                    //RO번호
            issuePartsOutDetailVO.setRoDocLineNo(issueReqDetailVO.getRoLineNo());               //RO라인번호
            issuePartsOutDetailVO.setItemCd(issueReqDetailVO.getItemCd());                      //부품코드
            issuePartsOutDetailVO.setUnitCd(issueReqDetailVO.getUnitCd());                      //단위

            issuePartsOutDetailVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());                //출고창고
            issuePartsOutDetailVO.setGiLocCd(issueReqDetailVO.getGiLocCd());                    //출고위치
            issuePartsOutDetailVO.setGiQty(issueReqDetailVO.getEndQty());                       //출고완료수량
            issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty());      //부품반품수량

            issuePartsOutDetailVO.setCustCd(issueReqDetailVO.getCustCd());                      //고객코드
            issuePartsOutDetailVO.setCustNm(issueReqDetailVO.getCustNm());                      //고객명

            issuePartsOutDetailVO.setGiDocStatCd(issueReqDetailVO.getGiDocStatCd());
            issuePartsOutDetailVO.setGiStatCd(issueReqDetailVO.getGiStatCd());
            issuePartsOutDetailVO.setReturnId(issueReqDetailVO.getReturnId());
            issuePartsOutDetailVO.setReturnPartsQty(issueReqDetailVO.getEndQty());              //반품수량 : 출고수량
            issuePartsOutDetailVO.setGiCauNm(issueReqDetailVO.getGiCauNm());                    //출고원인
            issuePartsOutDetailVO.setEtcGiTp(issueReqDetailVO.getEtcGiTp());                    //기타출고유형.

            issuePartsOutDetailVO.setRegUsrId(LoginUtil.getUserId());                           //사용자아이디.(딜러코드)
            issuePartsOutDetailVO.setUpdtUsrId(LoginUtil.getUserId());                          //수정자아이디.(딜러코드)

            IssuePartsOutDetailSearchVO searchVO = new IssuePartsOutDetailSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsGiDocNo(issuePartsOutDetailVO.getGiDocNo());
            searchVO.setsGiDocLineNo(issuePartsOutDetailVO.getGiDocLineNo());

            if(issuePartsOutDetailService.selectIssuePartsOutDetailsByConditionCnt(searchVO) > 0){
                // 출고문서상세 수정.
                issuePartsOutDetailService.updateIssuePartsOutDetail(issuePartsOutDetailVO);
            }
            else{
                // 출고문서상세 추가.
                issuePartsOutDetailService.insertIssuePartsOutDetail(issuePartsOutDetailVO);
            }

            //부품요청상세 부품요청상태:요청(01)완료(02)반품(03)
            issueReqDetailVO.setReturnPartsQty(issueReqDetailVO.getReturnPartsQty()); // 반품수량

            issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);

            // 출고확정리스트 담기.
            issuePartsOutDetailVO.setGiDocStatCd("03");
            issuePartsOutDetailVOList.getUpdateList().add(issuePartsOutDetailVO);
        }

        // 출고확정반품, 수불문서처리.
        if(issuePartsOutDetailVOList.getUpdateList().size() > 0){
           issuePartsOutDetailService.multiIssuePartsOutReturnDetails(issuePartsOutDetailVOList);
        }

        /*
         * 3. 구매요청 상세 요청상태 체크.
         *
         * */
        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsParReqDocNo(issuePartsOutVO.getParReqDocNo());
        issueReqSearchVO.setsParReqStatCd("01");//PAR_REQ_STAT_CD:REQ
        // 부품요청상태 요청 카운트 조회
        if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO) == 0){
            // 모든 부품상세 요청상태 완료 시 부품헤더 요청상태 완료 처리.
            IssueReqVO issueReqVO = new IssueReqVO();
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setParReqDocNo(issuePartsOutVO.getParReqDocNo());

            issueReqSearchVO.setsParReqStatCd("03");//PAR_REQ_STAT_CD:RETURN
            if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO) == 0){
                issueReqVO.setParReqStatCd("02");
            }else{
                issueReqVO.setParReqStatCd("03");
            }

            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqService.updateIssueReq(issueReqVO);
        }

        return issuePartsOutSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#updateIssuePartsOut(chn.bhmc.dms.par.ism.vo.IssuePartsOutVO)
     */
    @Override
    public int updateIssuePartsOut(IssuePartsOutVO issuePartsOutVO) throws Exception {
        issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsOutVO.setPltCd(LoginUtil.getPltCd());
        issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());
        return issuePartsOutDAO.updateIssuePartsOut(issuePartsOutVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#deleteIssuePartsOut(chn.bhmc.dms.par.ism.vo.IssuePartsOutVO)
     */
    @Override
    public int deleteIssuePartsOut(IssuePartsOutVO issuePartsOutVO) throws Exception {
        return issuePartsOutDAO.deleteIssuePartsOut(issuePartsOutVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#selectIssuePartsOutByKey(java.lang.String, java.lang.String)
     */
    @Override
    public IssuePartsOutVO selectIssuePartsOutByKey(String dlrCd, String giDocNo) throws Exception {
        return issuePartsOutDAO.selectIssuePartsOutByKey(dlrCd, giDocNo);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#selectIssuePartsOutsByCondition(chn.bhmc.dms.par.ism.vo.IssuePartsOutSearchVO)
     */
    @Override
    public List<IssuePartsOutVO> selectIssuePartsOutsByCondition(IssuePartsOutSearchVO searchVO) throws Exception {
        return issuePartsOutDAO.selectIssuePartsOutsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutService#selectIssuePartsOutsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssuePartsOutSearchVO)
     */
    @Override
    public int selectIssuePartsOutsByConditionCnt(IssuePartsOutSearchVO searchVO) throws Exception {
        return issuePartsOutDAO.selectIssuePartsOutsByConditionCnt(searchVO);
    }
}