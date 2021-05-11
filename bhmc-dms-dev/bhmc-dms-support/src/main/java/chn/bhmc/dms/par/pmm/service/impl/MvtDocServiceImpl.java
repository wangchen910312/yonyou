package chn.bhmc.dms.par.pmm.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.math.BigDecimal;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.par.stm.vo.StockInOutCalcVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.dao.ItemMasterDAO;
import chn.bhmc.dms.par.pmm.service.dao.MvtDocDAO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.service.dao.StockInOutDAO;
import chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


/**
 * 수불유형 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("mvtDocService")
public class MvtDocServiceImpl extends HService implements MvtDocService, JxlsSupport {

    @Resource(name="mvtDocDAO")
    private MvtDocDAO mvtDocDAO;

    @Autowired
    private MovementTypeService movementTypeService;

    /**
     * 품목마스터 관리 DAO
     */
    @Resource(name="itemMasterDAO")
    ItemMasterDAO itemMasterDAO;

    //@Autowired
    //private EndingStockService endingStockService;

    @Autowired
    private StockInOutService stockInOutService;

    @Resource(name="mvtDocNoIdgenService")
    EgovIdGnrService mvtDocNoIdgenService;

    /**
     * 부품이동평균가격 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     *  SystemConfigInfoService : 시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;
    

    @Resource(name="stockInOutDAO")
    private StockInOutDAO stockInOutDAO;


  //  @Autowired
  // @Qualifier("movementDocumentIdGnrService")
  //  IdGenServiceImpl movementDocumentIdGnrService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementDocumentService#multiSaveMovementDocuments(chn.bhmc.dms.core.datatype.BaseSaveVO)
     * [1]. 수불유형 점검. -MovementTypeService.selectMovementTypeByKey(딜러코드, 수불유형)-
     *   1) 존재하는 수불유형인가? 데이터 Row확인
     *   2) 사용여부가 'Y'인 수불유형인가? USE_YN = 'Y'
     *   3) 역방향여부가 'N'인 수불유형인가?  CANC_MVT_YN = 'N'
     *       (부분 역분개를 허용해야 하는 경우 해당 점검 로직 제거)
     *
     * [2]. 필수 값 점검
     *   1) 헤더 정보
     *      - 딜러코드(dlrCd), 수불유형(mvtTp), 전기일(postingDt) 필수
     *      - 수불유형의 프로세스 유형(mvtTp)이 '구매'인 경우 공급업체(bpCd) 필수
     *      - 수불유형의 프로세스 유형(mvtTp)이 '판매'인 경우 고객(custNo) 필수
     *
     *   2) 수불문서번호 채번
     *    - 수불번호 채번되었는지 체크(빈값, 값의 길이 체크)
     *   3) 품목정보
     *      - 센터(pltCd), 창고(strgeCd), 품목번호(itemCd), 수량(qty), 단위(ut)
     *        , 참조문서유형(refDocTp), 참조문서번호(refDocNo), 참조문서Line(refDocLineNo) 필수
     *      - 수불유형의 프로세스 유형(mvtTp)이 '구매'인 경우 구매단가(purcPrc), 구매금액(purcAmt) 필수
     *      - 수불유형의 프로세스 유형(mvtTp)이 '판매'인 경우 판매단가(salesPrc), 판매금액(salesAmt) 필수
     *      - 수불유형의 수불사유 필요유무(mvtReasonReqYn)가  'Y'인 경우 수불사유(mvtReason) 필수
     *
     * [3]. 문서품목정보 생성
     *    1) 차변대변구분: 재고 증가시 'S', 감소시 'H'를 등록
     *    2) 기말재고 테이블의 가장 최근 표준단가를 읽어오고 금액은 단가 * 수량
     *
     * [5]. 재고처리 함수 호출
     *
     * [6]. 수불문서 테이블 정보 Insert(수불헤더 PT_0311T, 수불품목 PT_0312T)
     *
     * *원수불정보 없이 취소유형관련하여 multiSaveMvtDocs를 태우는 경우 역분개.
     */
    @Override
    public List<MvtDocItemVO> multiSaveMvtDocs(MvtDocVO mvtVO, List<MvtDocItemVO> list) throws Exception {
        int listLen = list.size();//수불부품정보 리스트 수.
        int saveList = 0;
        int stockInOutResult = 0;
        int i = 0;
        int itemInsertCnt = 0;
        double stockAmt = 0.0;
        double stockTaxDdctAmt = 0.0;
        String rentType = "";//차입차출을 위한 변수
        String mvtYYmm = DateUtil.getDate("yyyyMM");
        String grtePrcChkYn = "Y";

        double movingAvgStockAmt = 0.0;
        double movingAvgPrc = 0.0;
        double movingAvgStockTaxDdctAmt = 0.0;
        double movingAvgTaxDdctPrc = 0.0;
        int    itemMovingAvgPrcSeq = 0;
        int    movingAvgResultCnt  = 0;
        double taxRate  = 0;

        //[이동평균가격]부품이동평균가격정보
        ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        ItemMovingAvgPrcVO itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();

        ItemMovingAvgPrcVO searchFrItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
        ItemMovingAvgPrcVO frItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

        ItemMovingAvgPrcVO searchToItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
        ItemMovingAvgPrcVO toItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

        StockInOutCalcVO stockInOutCalcVO             = new StockInOutCalcVO();  //재고프로세스 계산VO

        ItemMasterVO itemMasterVO = new ItemMasterVO();//부품마스터 VO(최종입출고일자 처리)

        String mvtDocNo = "";
        MvtDocItemVO itemInfoVO;
        MvtDocItemVO itemFrInfoVO;
        MvtDocItemVO itemToInfoVO;
        MvtDocItemVO refInfoVO;
        List<MvtDocItemVO> itemSaveList = new ArrayList<MvtDocItemVO>();

        /*********************************************
         * 수불헤더 정보 셋팅
         *********************************************/
        mvtVO.setDlrCd(LoginUtil.getDlrCd());
        //mvtVO.setCustNo("TESTCUSTNO");
        mvtVO.setMvtDocYyMm(mvtYYmm);
        mvtVO.setRegUsrId(LoginUtil.getUserId());
        /*********************************************
         * 수불헤더 정보 셋팅 종료
         *********************************************/

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


        /*********************************************
         * 수불유형 점검
         *********************************************/
        if( (mvtVO.getDlrCd() == null) || (mvtVO.getDlrCd().isEmpty())){
            //딜러정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
        }
        if( (mvtVO.getMvtTp() == null) || (mvtVO.getMvtTp().isEmpty())){
            //수불유형정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale())});
        }
        MovementTypeVO movementTypeVO = movementTypeService.selectMovementTypeByKey(mvtVO.getDlrCd(), mvtVO.getMvtTp());

        //존재하는 수불유형인 경우
        if(movementTypeVO != null){
            //사용 여부가 'Y'인경우
            if(movementTypeVO.getUseYn().equals("Y")){

                //역방향여부가 'N'인지
                if(!movementTypeVO.getCancMvtYn().equals("N")){
                    //역방향 수불유형입니다.
                   // throw processException("역방향 수불유형입니다.");
                }


                /*********************************************
                 * 헤더정보 필수값 점검
                 *********************************************/
                //수불의 프로세스유형이 구매('P')인 경우
                if(movementTypeVO.getProcessTp().equals("P")){
                    if( (mvtVO.getBpCd() == null) || (mvtVO.getBpCd().isEmpty())){
                        //공급업체정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.bpCd", null, LocaleContextHolder.getLocale())});
                    }
                //수불의 프로세스유형이 판매('S')인 경우
                }else if(movementTypeVO.getProcessTp().equals("S")){

                    if( (mvtVO.getCustNo() == null) || (mvtVO.getCustNo().isEmpty())){
                        if( (mvtVO.getBpCd() == null) || (mvtVO.getBpCd().isEmpty())){
                            //고객정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.customer", null, LocaleContextHolder.getLocale())});
                        }
                    }
                }else if(movementTypeVO.getProcessTp().equals("C")){
                    if( (mvtVO.getCustNo() == null) || (mvtVO.getCustNo().isEmpty())){
                        if( (mvtVO.getBpCd() == null) || (mvtVO.getBpCd().isEmpty())){
                            //고객정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.customer", null, LocaleContextHolder.getLocale())});
                        }
                    }

                }
                /*********************************************
                 * 헤더정보 필수값 점검 종료
                 *********************************************/

                /*********************************************
                 * 수불문서번호 채번
                 *********************************************/
                mvtDocNo = selectNextMvtDocNo();

                //채번이 안된 경우
                if( (mvtDocNo == null) || (mvtDocNo.isEmpty())){
                    //채번이 되지 않았습니다.
                    throw processException("global.err.emptyIdgenNo");
                }

                //채번정보가 이상할 경우
                if(mvtDocNo.length() < 5){
                    //채번이 되지 않았습니다.
                    throw processException("global.err.emptyIdgenNo");
                }

                mvtVO.setMvtDocNo(mvtDocNo);

                /*********************************************
                 * 수불문서번호 채번 종료
                 *********************************************/

                /*********************************************
                 * 보증가 체크여부를 위한 설정(기초재고입고및 취소인 경우 재고설정한는 부분에서 보증가 체크를 하지 않는다.)
                 * multiSaveStockInOut
                 *********************************************/
                if(movementTypeVO.getMvtTp().equals("31") || movementTypeVO.getMvtTp().equals("32")){
                    grtePrcChkYn = "N";
                }else{
                    grtePrcChkYn = "Y";
                }

                /*********************************************
                 * 품목정보 필수값 점검
                 *********************************************/
                for(i = 0; i < listLen; i = i+1){
                    //endingStockVO = null;
                    itemInfoVO   = new MvtDocItemVO();
                    itemMasterVO = new ItemMasterVO();

                    itemInfoVO   = list.get(i);
                    itemFrInfoVO = new MvtDocItemVO();
                    itemToInfoVO = new MvtDocItemVO();
                    refInfoVO    = new MvtDocItemVO();

                    searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    //재고이동 시 Fr, To 창고가 각각 다르기 때문에 재계산
                    searchFrItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    frItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    searchToItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    toItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    itemInfoVO.setPltCd(LoginUtil.getPltCd());

                    movingAvgStockAmt = 0;
                    movingAvgStockTaxDdctAmt = 0;
                    movingAvgPrc = 0;
                    movingAvgTaxDdctPrc = 0;
                    itemMovingAvgPrcSeq = 0;
                    movingAvgResultCnt  = 0;

                    if( (itemInfoVO.getDlrCd() == null) || (itemInfoVO.getDlrCd().isEmpty())){
                        //딜러정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemInfoVO.getPltCd() == null) || (itemInfoVO.getPltCd().isEmpty())){
                        //센터정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
                    }
                    if(!movementTypeVO.getProcessTp().equals("T")){
                        if( (itemInfoVO.getStrgeCd() == null) || (itemInfoVO.getStrgeCd().isEmpty())){
                            //창고정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
                        }
                    }else{
                        if( (itemInfoVO.getFrStrgeCd() == null) || (itemInfoVO.getFrStrgeCd().isEmpty())){
                            //출고창고정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale())});
                        }

                        if( (itemInfoVO.getToStrgeCd() == null) || (itemInfoVO.getToStrgeCd().isEmpty())){
                            //입고창고정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grStrgeCd", null, LocaleContextHolder.getLocale())});
                        }
                    }
                    if( (itemInfoVO.getItemCd() == null) || (itemInfoVO.getItemCd().isEmpty())){
                        //품목정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                    }
                    if(itemInfoVO.getItemQty() == null || itemInfoVO.getItemQty().equals("")){
                        //수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
                    }
                    /*if( (itemInfoVO.getItemUnitCd() == null) || (itemInfoVO.getItemUnitCd().isEmpty())){
                        //단위정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("ser.lbl.unitCd", null, LocaleContextHolder.getLocale())});
                    }*/
                   // if( (itemInfoVO.getRefDocTp() == null) || (itemInfoVO.getRefDocTp().isEmpty())){
                   //     참조유형정보가 존재하지 않습니다.
                    //    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                   // }
                    if( (itemInfoVO.getRefDocNo() == null) || (itemInfoVO.getRefDocNo().isEmpty())){
                        //참조정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.refDocNo", null, LocaleContextHolder.getLocale())});
                    }
                    if(itemInfoVO.getRefDocLineNo() < 1){
                        //참조라인번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.refDocLineNo", null, LocaleContextHolder.getLocale())});
                    }

                    if(itemInfoVO.getTaxRate() == null || itemInfoVO.getTaxRate() == 0){
                        taxRate =  vatInfoVO.getVatApplyRate();
                    }else{
                        taxRate = itemInfoVO.getTaxRate();
                    }

                    //수불유형이 구매(P)인 경우
                    if(movementTypeVO.getProcessTp().equals("P")){
                        if(itemInfoVO.getPurcPrc() == null || itemInfoVO.getPurcPrc().equals("")){
                            //구매단가정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                        }
                        if(itemInfoVO.getPurcAmt() == null || itemInfoVO.getPurcAmt().equals("")){
                            //구매금액정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcAmt", null, LocaleContextHolder.getLocale())});
                        }

                        /********************************************************************
                         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                         ********************************************************************/
                        searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                        searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                        searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                        if(movementTypeVO.getStockCalcTp().equals("+")){
                            //이동평균가격 정보가 존재하는 경우
                            if(itemMovingAvgPrcVO != null){
                            	//2018-11-04 update by weiyongjie 计算成本金额 应查询库存的成本金额 
                            	StockInOutVO stockInOutVO2  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                //获取库存成本金额
                                double samt = stockInOutVO2.getStockAmt();
                                
                               //update by weiyongjie 外采购件税率 0 start
                                if(itemInfoVO.getTaxRate() != null) {
                                	
                                    double oTaxRate = itemInfoVO.getTaxRate();
                                    if( oTaxRate != taxRate ) {
                                    	taxRate = oTaxRate;
                                    }
                                }
                            
                                //成本金额 成本金额不含税
                                movingAvgStockAmt = getBigDecimal( samt  + Math.abs(itemInfoVO.getPurcAmt()));
                                movingAvgStockTaxDdctAmt = getBigDecimal(movingAvgStockAmt/ (1 + taxRate));
                                
                                //成本单价 成本单价不含税
                                movingAvgPrc = getBigDecimal(movingAvgStockAmt / (itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty())));
								movingAvgTaxDdctPrc = movingAvgPrc/(1 + taxRate);

                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                itemMovingAvgPrcVO.setMovingAvgPrc(movingAvgPrc);
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(movingAvgTaxDdctPrc);

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                   //송장부품의 입고 확정이 처리되지 않았습니다.
                                    throw processException("par.err.failedReceiveCnfmMsg");
                                }
                            }else{
                                itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                                itemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //부품코드
                                itemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드
                                itemMovingAvgPrcVO.setTotQty(itemInfoVO.getItemQty()); //입고수량
                                if(itemInfoVO.getPurcAmt() > 0){
                                    itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(itemInfoVO.getPurcAmt()/itemInfoVO.getItemQty()));
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal((itemInfoVO.getPurcPrc()/(1 + taxRate))));
                                }else{
                                    itemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //송장부품의 입고 확정이 처리되지 않았습니다.
                                     throw processException("par.err.failedReceiveCnfmMsg");
                                 }
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                            itemMovingAvgPrcVO.setTaxRate(taxRate);

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //송장부품의 입고 확정이 처리되지 않았습니다.
                                 throw processException("par.err.failedReceiveCnfmMsg");
                             }

                            itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                            itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            itemInfoVO.setPurcTaxDdctPrc(Math.round(itemInfoVO.getPurcPrc() / (1 + taxRate) * 100.0)/100.0);
                            itemInfoVO.setPurcTaxDdctAmt(Math.round((itemInfoVO.getPurcPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                        }else{
                            if(itemMovingAvgPrcVO != null){
                            	
                            	  if(itemInfoVO.getTaxRate() == null || itemInfoVO.getTaxRate() == 0){
                            		  taxRate = 0;
                            	  }
                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                //2018-11-04 update by weiyongjie 计算成本价 （成本金额 - 出库成本金额）/账面库存 start
                                StockInOutVO stockInOutVO2  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                //获取库存成本金额
                                double samt = getBigDecimal(stockInOutVO2.getStockAmt() -itemInfoVO.getPurcAmt());
                                double scount = itemMovingAvgPrcVO.getTotQty() ==  0 ? 0 : itemMovingAvgPrcVO.getTotQty() ;
                                //2018-11-04 update by weiyongjie 计算成本价 （成本金额 - 出库成本金额）/账面库存 end
                                if( scount > 0 ) {
                                	itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt/scount));
                                }else {
                                	itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                                }
                                if(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                                }else{
                                    //itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                                	itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/ (1 + taxRate)));
                                }
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/ (1 + taxRate)));

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                            itemMovingAvgPrcVO.setTaxRate(taxRate);

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //기타입고 확정 실패.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                             }

                            refInfoVO = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGrDocNo(), itemInfoVO.getGrDocLineNo(), "", "S");

                            //반품 시 수불 이동평균 관련내용은 원 수불문서의 정보를 불러온다.
                            if(refInfoVO.getMovingAvgPrc() == null || refInfoVO.getMovingAvgPrc().equals("")){
                                itemInfoVO.setMovingAvgPrc(0.0);
                                itemInfoVO.setMovingAvgTaxDdctAmt(0.0);
                            }else{
                                itemInfoVO.setMovingAvgPrc(refInfoVO.getMovingAvgPrc());
                                itemInfoVO.setMovingAvgAmt(Math.round(refInfoVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            }

                            if(refInfoVO.getMovingAvgTaxDdctPrc() == null || refInfoVO.getMovingAvgTaxDdctPrc().equals("")){
                                itemInfoVO.setMovingAvgTaxDdctPrc(Math.round((refInfoVO.getMovingAvgPrc() / (1 + taxRate)) * 100.0)/100.0);
                                itemInfoVO.setMovingAvgTaxDdctAmt(Math.round((refInfoVO.getMovingAvgPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                            }else{
                                itemInfoVO.setMovingAvgTaxDdctPrc(refInfoVO.getMovingAvgTaxDdctPrc());
                                itemInfoVO.setMovingAvgTaxDdctAmt(getBigDecimal(itemInfoVO.getMovingAvgAmt()/(1+taxRate) ));
                            }
                        }

                        itemInfoVO.setPurcTaxDdctPrc(Math.round(itemInfoVO.getPurcPrc() / (1 + taxRate) * 100.0)/100.0);
                        itemInfoVO.setPurcTaxDdctAmt(Math.round((itemInfoVO.getPurcPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);


                        /********************************************************************
                         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                         * 끝
                         ********************************************************************/

                        //수불유형이 구매(P)인 경우 마스터 정보에 최신입고가를 적용한다.
                        itemMasterVO.setDlrCd(itemInfoVO.getDlrCd());
                        itemMasterVO.setItemCd(itemInfoVO.getItemCd());
                        itemMasterVO.setRegUsrId(LoginUtil.getUserId());
                        itemMasterVO.setLastGrAmt(itemInfoVO.getPurcPrc());
                        //입고 반품인 경우 최신입고가 반영안함.
                        if(!(movementTypeVO.getMvtTp().equals("03")||movementTypeVO.getMvtTp().equals("04"))){
                            itemMasterDAO.updateLastGrAmt(itemMasterVO);
                        }

                        if(movementTypeVO.getStockCalcTp().equals("+")){

                            stockAmt = itemInfoVO.getPurcAmt();
                            stockTaxDdctAmt = Math.round((itemInfoVO.getPurcPrc()/(1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0;
                        }else{
                        	//2018-11-03 update by weiyongjie 根据入库单 查询出要退返的成本金额 而不能取成本价*数量 start
                           //退还的库存金额
                        	stockAmt = Math.round(itemInfoVO.getPurcPrc()* itemInfoVO.getItemQty() * 100.0)/100.0;
                          //2018-11-03 update by weiyongjie 根据入库单 查询出要退返的成本金额 而不能取成本价*数量 end
                        	stockTaxDdctAmt = getBigDecimal(stockAmt/( 1 + taxRate ));
                        }
                    //수불유형이 판매(S)인 경우
                    }else if(movementTypeVO.getProcessTp().equals("S")){
                    	
                        searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                        searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                        searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                        //출고발생한 경우
                        if(movementTypeVO.getStockCalcTp().equals("-")){
                            //이동평균가격 정보가 존재하는 경우
                            if(itemMovingAvgPrcVO != null){

                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)
                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                          	    
                          	    itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());//出库不重新计算成本价
                    			itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc( itemMovingAvgPrcVO.getMovingAvgPrc() / (1+taxRate) );
                          	
                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                   //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }
                            }else{
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            itemMovingAvgPrcVO.setTaxRate(taxRate);
                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //출고 확정이 처리되지 않았습니다.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                             }
                        }else{
                            if(itemMovingAvgPrcVO != null){//销售出库取消预约  销售出库取消 销售退回 售后销售出库取消(预约) 售后销售出库取消 售后销售退回

                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                
                                //查找销售出库成本金额 
                                MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                                //获取库存成本金额
                                double samt = getBigDecimal( stockInOutVO3.getStockAmt() + getBigDecimal( mm.getMovingAvgPrc()*itemInfoVO.getItemQty() ) );
                                double scount = itemMovingAvgPrcVO.getTotQty() ==  0 ? 0 : itemMovingAvgPrcVO.getTotQty() ;
                                
                                itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt/scount));
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate)));

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                   //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }
                            }else{
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            itemMovingAvgPrcVO.setTaxRate(taxRate);

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //출고 확정이 처리되지 않았습니다.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                             }
                        }

                      itemInfoVO.setSaleTaxDdctPrc(Math.round(itemInfoVO.getSalePrc() / (1 + taxRate) * 100.0)/100.0);
                      itemInfoVO.setSaleTaxDdctAmt(Math.round((itemInfoVO.getSalePrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);

                    
                      if( "71".equals(movementTypeVO.getMvtTp()) || "11".equals(movementTypeVO.getMvtTp()) ) {//销售出库 售后销售出库
                    	  //获取库存成本金额
                          stockAmt = getBigDecimal( itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                          stockTaxDdctAmt = getBigDecimal(getBigDecimal((itemMovingAvgPrcVO.getMovingAvgPrc())/(1+taxRate)) * itemInfoVO.getItemQty());
                          
                          itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                          itemInfoVO.setMovingAvgTaxDdctPrc(getBigDecimal( itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate) ));
                          itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                          itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(getBigDecimal( itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate) ) * itemInfoVO.getItemQty() * 100.0)/100.0);
                          
                      }else if( "73".equals(movementTypeVO.getMvtTp()) || "13".equals(movementTypeVO.getMvtTp()) ) { //销售出库退回 售后销售出库退回
                    	  MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                    	  stockAmt = getBigDecimal( mm.getMovingAvgPrc() * itemInfoVO.getItemQty() );
                    	  stockTaxDdctAmt = getBigDecimal(getBigDecimal((mm.getMovingAvgPrc())/(1+taxRate))*itemInfoVO.getItemQty());
                    	  
                          itemInfoVO.setMovingAvgPrc(mm.getMovingAvgPrc());
                          itemInfoVO.setMovingAvgTaxDdctPrc(getBigDecimal( mm.getMovingAvgPrc()/(1+taxRate) ));
                          itemInfoVO.setMovingAvgAmt(Math.round(mm.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                          itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(getBigDecimal( mm.getMovingAvgPrc()/(1+taxRate) ) * itemInfoVO.getItemQty() * 100.0)/100.0);
                      }
                     
                

                    }else if(movementTypeVO.getProcessTp().equals("C")){
                        if(movementTypeVO.getMvtGrGiTp().equals("R")){
                            if(itemInfoVO.getPurcPrc() == null || itemInfoVO.getPurcPrc().equals("")){
                                //구매단가정보가 존재하지 않습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                            }
                            if(itemInfoVO.getPurcAmt() == null || itemInfoVO.getPurcAmt().equals("")){
                                //구매금액정보가 존재하지 않습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcAmt", null, LocaleContextHolder.getLocale())});
                            }

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                             ********************************************************************/
                            searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                            searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                            if(movementTypeVO.getStockCalcTp().equals("+")){
                                //이동평균가격 정보가 존재하는 경우
                                if(itemMovingAvgPrcVO != null){
                                	//2018-11-04 update by weiyongjie 计算成本金额 应查询库存的成本金额 start 
                                	StockInOutVO stockInOutVO2  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                    //获取库存成本金额
                                    double samt = stockInOutVO2.getStockAmt();
                                    movingAvgStockAmt =getBigDecimal( samt + Math.abs(itemInfoVO.getPurcAmt()) );
                                    movingAvgStockTaxDdctAmt = getBigDecimal( movingAvgStockAmt  / (1 + taxRate) );
                                   //2018-11-04 update by weiyongjie 计算成本金额 应查询库存的成本金额 end 
                                    
                                    movingAvgPrc = getBigDecimal(movingAvgStockAmt / (itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty())));
                                    movingAvgTaxDdctPrc = getBigDecimal(movingAvgPrc / (1 + taxRate));

                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                    itemMovingAvgPrcVO.setMovingAvgPrc(movingAvgPrc);
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(movingAvgTaxDdctPrc);

                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);
                                    if(movingAvgResultCnt != 1){
                                       //송장부품의 입고 확정이 처리되지 않았습니다.
                                        throw processException("par.err.failedReceiveCnfmMsg");
                                    }
                                }else{
                                    itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                                    itemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //부품코드
                                    itemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드
                                    itemMovingAvgPrcVO.setTotQty(itemInfoVO.getItemQty()); //입고수량
                                    if(itemInfoVO.getPurcAmt() > 0){
                                        itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(itemInfoVO.getPurcAmt()/itemInfoVO.getItemQty()));
                                        itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal((itemInfoVO.getPurcPrc()/(1 + taxRate))));
                                    }else{
                                        itemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                        itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                    }

                                    itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);


                                    movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                        //송장부품의 입고 확정이 처리되지 않았습니다.
                                         throw processException("par.err.failedReceiveCnfmMsg");
                                     }
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //송장부품의 입고 확정이 처리되지 않았습니다.
                                     throw processException("par.err.failedReceiveCnfmMsg");
                                 }

                                itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                                itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                                itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            }else{
                                if(itemMovingAvgPrcVO != null){
                                	/**
                              		50 盘盈报溢入库取消 -
                              		34 其他入库取消
                              		38 內部領用分配
                              		64 调拨入库取消
                              		60 报溢入库取消
                              		32 基礎库存入库取消
                              	  **/
                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)


                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                    StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                    //获取库存成本金额 + 取消的库存成本金额
                              	    double samt  = getBigDecimal( stockInOutVO3.getStockAmt() - Math.abs(itemInfoVO.getPurcAmt()));
                              	    if( itemMovingAvgPrcVO.getTotQty() == 0 ) {
                              	    	itemMovingAvgPrcVO.setMovingAvgPrc(0d);
                              	    }else {
                              	      itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt / itemMovingAvgPrcVO.getTotQty()));
                              	    }
                              	    
                              	  itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));


                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                        //기타입고 확정 실패.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                    }

                                  //이동평균가격 정보가 없는 경우
                                }else{
                                        //기타입고 확정 실패.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                 }

                                refInfoVO = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGrDocNo(), itemInfoVO.getGrDocLineNo(), "", "S");

                                //반품 시 수불 이동평균 관련내용은 원 수불문서의 정보를 불러온다.
                                if(refInfoVO.getMovingAvgPrc() == null || refInfoVO.getMovingAvgPrc().equals("")){
                                    itemInfoVO.setMovingAvgPrc(0.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(0.0);
                                }else{
                                    itemInfoVO.setMovingAvgPrc(refInfoVO.getMovingAvgPrc());
                                    itemInfoVO.setMovingAvgAmt(Math.round(refInfoVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }

                                if(refInfoVO.getMovingAvgTaxDdctPrc() == null || refInfoVO.getMovingAvgTaxDdctPrc().equals("")){
                                    itemInfoVO.setMovingAvgTaxDdctPrc(Math.round((refInfoVO.getMovingAvgPrc() / (1 + taxRate)) * 100.0)/100.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round((refInfoVO.getMovingAvgPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }else{
                                    itemInfoVO.setMovingAvgTaxDdctPrc(refInfoVO.getMovingAvgTaxDdctPrc());
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(refInfoVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }
                            }

                            if( movementTypeVO != null &&  movementTypeVO.getStockCalcTp().equals("-")) {
                     	        itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getBefMovingAvgPrc());
                                itemInfoVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getBefMovingAvgPrc()/(1+taxRate)));
                                itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getBefMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                itemInfoVO.setMovingAvgTaxDdctAmt(getBigDecimal(itemInfoVO.getMovingAvgAmt()/(1+taxRate)));
		                    }else {
		                     		  itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
		                              itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
		                              itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
		                              itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
		                   }
                           
                            itemInfoVO.setPurcTaxDdctPrc(Math.round(itemInfoVO.getPurcPrc() / (1 + taxRate) * 100.0)/100.0);
                            itemInfoVO.setPurcTaxDdctAmt(Math.round((itemInfoVO.getPurcPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);

                            stockAmt = itemInfoVO.getPurcAmt();
                            stockTaxDdctAmt = getBigDecimal(stockAmt/(1+taxRate));

                        }else if(movementTypeVO.getMvtGrGiTp().equals("I")){


                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             ********************************************************************/
                            searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                            searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                            //출고발생한 경우
                            if(movementTypeVO.getStockCalcTp().equals("-")){//出库不计算成本价
                                //이동평균가격 정보가 존재하는 경우
                                if(itemMovingAvgPrcVO != null){

                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)
                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty()-itemInfoVO.getItemQty());
	                                
                               	    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate)));

                               	    //如果是借进归还出库 需要计算成本价
                               	    if( "48" .equals(movementTypeVO.getMvtTp()) ) {
                               	      StockInOutVO stockInOutVO4  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                  
                                        double samt = getBigDecimal( stockInOutVO4.getStockAmt() -itemInfoVO.getSaleAmt());
                                        
                                        itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getTotQty()==0?0:getBigDecimal(samt / itemMovingAvgPrcVO.getTotQty()));
                                        itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate)));
                               	    }else {
                               	    	itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                               	    }
                               	 
                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                       //출고 확정이 처리되지 않았습니다.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                    }
	                                }else{
	                                  //기타입고 확정 실패.
	                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
	                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                 }
                                if( "48" .equals(movementTypeVO.getMvtTp()) ) {
                                    //查找销售出库成本金额 
                                    MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "S");
                                    //获取库存成本金额 + 取消的库存成本金额
                                    itemInfoVO.setMovingAvgPrc(mm.getMovingAvgPrc());
                                    itemInfoVO.setMovingAvgTaxDdctPrc(mm.getMovingAvgTaxDdctPrc());
                                    itemInfoVO.setMovingAvgAmt(Math.round(itemInfoVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(itemInfoVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }else {
                                    itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                                    itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                                    itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }
                        

                            }else{
                                if(itemMovingAvgPrcVO != null){

                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                    
                                    StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                  //查找销售出库成本金额 
                                    MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                                    //获取库存成本金额 + 取消的库存成本金额
                                    double samt = getBigDecimal( stockInOutVO3.getStockAmt() + mm.getMovingAvgPrc()*itemInfoVO.getItemQty());
                                    
                                    itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt / itemMovingAvgPrcVO.getTotQty()));
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate)));
                                    
                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                       //출고 확정이 처리되지 않았습니다.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                    }

                                  //이동평균가격 정보가 없는 경우
                                }else{

                                  //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                 }

                                refInfoVO = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");

                                //반품 시 수불 이동평균 관련내용은 원 수불문서의 정보를 불러온다.
                                if(refInfoVO.getMovingAvgPrc() == null || refInfoVO.getMovingAvgPrc().equals("")){
                                    itemInfoVO.setMovingAvgPrc(0.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(0.0);
                                }else{
                                    itemInfoVO.setMovingAvgPrc(refInfoVO.getMovingAvgPrc());
                                    itemInfoVO.setMovingAvgAmt(Math.round(refInfoVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }

                                if(refInfoVO.getMovingAvgTaxDdctPrc() == null || refInfoVO.getMovingAvgTaxDdctPrc().equals("")){
                                    itemInfoVO.setMovingAvgTaxDdctPrc(Math.round((refInfoVO.getMovingAvgPrc() / (1 + taxRate)) * 100.0)/100.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round((refInfoVO.getMovingAvgPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }else{
                                    itemInfoVO.setMovingAvgTaxDdctPrc(refInfoVO.getMovingAvgTaxDdctPrc());
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(refInfoVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }
                            }
                            itemInfoVO.setSaleTaxDdctPrc(itemInfoVO.getSalePrc() / (1 + taxRate));
                            itemInfoVO.setSaleTaxDdctAmt((itemInfoVO.getSalePrc() / (1 + taxRate)) * itemInfoVO.getItemQty());


                            if( "41".equals(movementTypeVO.getMvtTp()) || "43".equals(movementTypeVO.getMvtTp()) || "45".equals(movementTypeVO.getMvtTp())  || "47".equals(movementTypeVO.getMvtTp()) ||
                            		"65".equals(movementTypeVO.getMvtTp()) || "61".equals(movementTypeVO.getMvtTp())) {//销售出库
                          	  //获取库存成本金额
                                stockAmt = itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty();
                                stockTaxDdctAmt = itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty();
                            }else if("48".equals(movementTypeVO.getMvtTp())) {
                            	  stockAmt = itemInfoVO.getSaleAmt();
                            	  stockTaxDdctAmt = itemInfoVO.getSaleTaxDdctAmt();
                            }
                            else {
                          	  MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                          	  stockAmt = mm.getMovingAvgPrc() * itemInfoVO.getItemQty();
                          	  stockTaxDdctAmt = getBigDecimal(mm.getMovingAvgPrc()/(1+taxRate))*itemInfoVO.getItemQty();
                            }
                            
                        }
                    }else{

                        if(movementTypeVO.getProcessTp().equals("T")){

                            //출고창고 이평가
                            searchFrItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchFrItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getFrStrgeCd()); //창고코드
                            searchFrItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            frItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchFrItemMovingAvgPrcVO);

                            //이동평균가격 정보가 존재하는 경우
                            if(frItemMovingAvgPrcVO != null){//原厂库


                                frItemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                frItemMovingAvgPrcVO.setBefGenDt(frItemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                frItemMovingAvgPrcVO.setBefTotQty(frItemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                frItemMovingAvgPrcVO.setBefMovingAvgPrc(frItemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                frItemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                //재고이동 중 예류 및 보류는 재고의 상태이동이기 때문에 tot_qty는 변함이 없다.(tot_qty === 가용 + 예류 + 보류)
                                if(movementTypeVO.getMvtTp().equals("23") || movementTypeVO.getMvtTp().equals("24") || movementTypeVO.getMvtTp().equals("25") || movementTypeVO.getMvtTp().equals("26")){
                                    frItemMovingAvgPrcVO.setTotQty(frItemMovingAvgPrcVO.getTotQty());
                                }else{
                                    frItemMovingAvgPrcVO.setTotQty(frItemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                }
                                
                                frItemMovingAvgPrcVO.setMovingAvgPrc(frItemMovingAvgPrcVO.getMovingAvgPrc());//移库相当于出库 不在计算成本价
                                frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate));

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(frItemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                            }else{
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(frItemMovingAvgPrcVO);

                            frItemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            frItemMovingAvgPrcVO.setTaxRate(vatInfoVO.getVatApplyRate());

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(frItemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //기타입고 확정 실패.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                             }

                            itemFrInfoVO.setMovingAvgPrc(frItemMovingAvgPrcVO.getMovingAvgPrc());
                            itemFrInfoVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemFrInfoVO.setMovingAvgAmt(frItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemFrInfoVO.setMovingAvgTaxDdctAmt(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());
                            itemFrInfoVO.setSalePrc(frItemMovingAvgPrcVO.getMovingAvgPrc());
                            itemFrInfoVO.setSaleTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemFrInfoVO.setSaleAmt(frItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemFrInfoVO.setSaleTaxDdctAmt(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());

                            itemToInfoVO.setPurcPrc(frItemMovingAvgPrcVO.getMovingAvgPrc());
                            itemToInfoVO.setPurcTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemToInfoVO.setPurcAmt(frItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemToInfoVO.setPurcTaxDdctAmt(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());


                            //입고창고 이평가
                            searchToItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchToItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getToStrgeCd()); //창고코드
                            searchToItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            toItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchToItemMovingAvgPrcVO);

                            //이동평균가격 정보가 존재하는 경우
                            if(toItemMovingAvgPrcVO != null){//目的仓库
                            	StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getToStrgeCd(), itemInfoVO.getItemCd());
                            	stockAmt  = stockInOutVO3.getStockAmt() + Math.abs(itemInfoVO.getSaleAmt());
                            	
                            	movingAvgPrc = getBigDecimal(stockAmt / (toItemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty())));
                            	toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                                stockTaxDdctAmt = getBigDecimal( stockAmt / (1+taxRate) );
                                
                                movingAvgTaxDdctPrc = toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc();
                                
                                toItemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                toItemMovingAvgPrcVO.setBefGenDt(toItemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                toItemMovingAvgPrcVO.setBefTotQty(toItemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                toItemMovingAvgPrcVO.setBefMovingAvgPrc(toItemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                toItemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                //재고이동 중 예류 및 보류는 재고의 상태이동이기 때문에 tot_qty는 변함이 없다.(tot_qty === 가용 + 예류 + 보류)
                                if(movementTypeVO.getMvtTp().equals("23") || movementTypeVO.getMvtTp().equals("24") || movementTypeVO.getMvtTp().equals("25") || movementTypeVO.getMvtTp().equals("26")){
                                    toItemMovingAvgPrcVO.setTotQty(toItemMovingAvgPrcVO.getTotQty());
                                    toItemMovingAvgPrcVO.setMovingAvgPrc(toItemMovingAvgPrcVO.getMovingAvgPrc());

                                    if(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                        toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + vatInfoVO.getVatApplyRate()));
                                    }else{
                                        toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                                    }
                                }else{
                                    toItemMovingAvgPrcVO.setTotQty(toItemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                    toItemMovingAvgPrcVO.setMovingAvgPrc(movingAvgPrc);
                                    toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(movingAvgTaxDdctPrc);
                                }




                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(toItemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{
                                toItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                toItemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                toItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                                toItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getToStrgeCd()); //창고코드
                                toItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드
                                toItemMovingAvgPrcVO.setTotQty(itemInfoVO.getItemQty()); //입고수량

                                if(itemInfoVO.getSalePrc() > 0){
                                    toItemMovingAvgPrcVO.setMovingAvgPrc(itemInfoVO.getSaleAmt()/itemInfoVO.getItemQty());
                                    toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc((itemInfoVO.getSalePrc()/(1 + taxRate)));
                                }else{
                                    toItemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                    toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(toItemMovingAvgPrcVO);


                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrc(toItemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(toItemMovingAvgPrcVO);

                            toItemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            toItemMovingAvgPrcVO.setTaxRate(vatInfoVO.getVatApplyRate());

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(toItemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //기타입고 확정 실패.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                             }

                            itemToInfoVO.setMovingAvgPrc(frItemMovingAvgPrcVO.getMovingAvgPrc());//移库到目的仓库 出入库记录应是原
                            itemToInfoVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemToInfoVO.setMovingAvgAmt(frItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemToInfoVO.setMovingAvgTaxDdctAmt(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());

                            stockAmt = itemInfoVO.getSaleAmt();
                            stockTaxDdctAmt = getBigDecimal(stockAmt/(1+frItemMovingAvgPrcVO.getTaxRate())); //itemInfoVO.getSaleTaxDdctAmt();
                        }else{
                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             ********************************************************************/
                            searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                            searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                            //이동평균가격 정보가 존재하지 않는 경우
                            if(itemMovingAvgPrcVO == null){
                                itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                itemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                            }

                            itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                            if(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                            }else{
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            }

                            itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemInfoVO.setMovingAvgAmt(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemInfoVO.setMovingAvgTaxDdctAmt(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 끝(수불테이블의 STD_PRC는 사용하지 않는다. 2016-09-06기준)
                             ********************************************************************/
                        }

                    }

                    //수불유형에 수불사유 필요유무가 'Y'인 경우
                    if(movementTypeVO.getMvtReasonReqsYn().equals("Y")){
                        if( (itemInfoVO.getMvtReasonCont() == null) || (itemInfoVO.getMvtReasonCont().isEmpty())){
                            //수불사유가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtReasonCont", null, LocaleContextHolder.getLocale())});
                        }
                    }

                    //수불유형의 프로세스 유형이 '이동'일 경우('이동'에 대한 코드 안정해짐. 아님 스페이스)
                    /*if(movementTypeVO.getProcessTp().equals("T")){
                       //아직 '이동'일 경우에 대한 체크로직 없음.

                        stockAmt = itemInfoVO.getMovingAvgAmt();
                        stockTaxDdctAmt = itemInfoVO.getMovingAvgTaxDdctAmt();
                    }*/

                    /*********************************************
                     * 품목정보 필수값 점검 종료
                     *********************************************/

                    /*********************************************
                     * 문서 품목정보 생성
                     *********************************************/

                        if(itemInfoVO.getItemQty() == null || itemInfoVO.getItemQty().equals("")){
                            //수량 정보가 없습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
                        }

                        /****************************************
                         * 단가 및 금액 셋팅
                         ***************************************/

                        /******************************
                         *
                         * 재고 테이블이 존재하지 않아 테이블 생성시 까지 막음.
                         *****************************/
                        //endingStockVO = endingStockService.selectEndingStockByKey(itemInfoVO.getDlrCd(), itemInfoVO.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());

                      //존재하는 기말재고인 경우
                       // if(endingStockVO != null){
                       //     itemInfoVO.setStdPrc(endingStockVO.getStdPrc());
                       //     itemInfoVO.setStdAmt(endingStockVO.getStdPrc() * itemInfoVO.getItemQty());
                       // }else{
                          itemInfoVO.setStdPrc((double) 0);

                          itemFrInfoVO.setStdPrc((double) 0);
                          itemToInfoVO.setStdPrc((double) 0);

                          itemInfoVO.setStdAmt((double) 0);

                          itemFrInfoVO.setStdAmt((double) 0);
                          itemToInfoVO.setStdAmt((double) 0);
                          //From 창고가 출고창고 To창고가 입고창고


                       // }
                        //itemInfoVO.setStdPrc(stdPrc);
                        //itemInfoVO.setStdAmt(stdAmt);

                          /******************************
                           *
                           * 재고 테이블이 존재하지 않아 테이블 생성시 까지 막음.
                           *****************************/

                        /****************************************
                         * 단가 및 금액 셋팅 종료
                         ***************************************/


                        if(!movementTypeVO.getProcessTp().equals("T")){

                            /****************************************
                             * 차변대변구분 셋팅
                             ***************************************/
                            //재고가 증가하면 'S'
                            if(movementTypeVO.getStockCalcTp().equals("+")){
                                itemInfoVO.setDebitCreditDstinCd("S");

                            //재고가 감소하면 'H'
                            }else if(movementTypeVO.getStockCalcTp().equals("-")){
                                itemInfoVO.setDebitCreditDstinCd("H");
                            }else{
                                //차대변구분자가 없습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.debitCreditDstinCd", null, LocaleContextHolder.getLocale())});
                            }
                            /****************************************
                             * 차변대변구분 셋팅 종료
                             ***************************************/

                             /****************************************
                             * 수불유형의 프로세스 유형이 '이동'이 아닐 경우 셋팅 종료
                             ***************************************/
                             itemInfoVO.setAutoCreYn("N");

                            /*********************************************
                             * 재고처리 함수 호출
                             *********************************************/

                             if(movementTypeVO.getMvtTp().equals("35")){//차입등기입고
                                 rentType = "B";
                             }else if(movementTypeVO.getMvtTp().equals("36")){//차출반환 입고
                                 rentType = "R";
                             }else if(movementTypeVO.getMvtTp().equals("47")){//차출등기 출고
                                 rentType = "R";
                             }else if(movementTypeVO.getMvtTp().equals("48")){//차입반환 출고
                                 rentType = "B";
                             }else{
                                 rentType = "";
                             }
                            // 재고처리 함수 이상 주석처리.
                             /*itemInfoVO.getDlrCd(),
                             itemInfoVO.getPltCd(),
                             itemInfoVO.getStrgeCd(),
                             itemInfoVO.getItemCd(),
                             movementTypeVO.getRectGrGiDtUpdtYn(),
                             movementTypeVO.getMvtGrGiTp(),
                             movementTypeVO.getCancMvtYn(),
                             movementTypeVO.getStockStatCd(),
                             itemInfoVO.getItemQty(),
                             stockAmt,
                             movementTypeVO.getStockCalcTp(),
                             rentType,
                             grtePrcChkYn*/

                            stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                            stockInOutCalcVO.setDlrCd(itemInfoVO.getDlrCd());
                            stockInOutCalcVO.setPltCd(itemInfoVO.getPltCd());
                            stockInOutCalcVO.setStrgeCd(itemInfoVO.getStrgeCd());
                            stockInOutCalcVO.setItemCd(itemInfoVO.getItemCd());
                            stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                            stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                            stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                            stockInOutCalcVO.setStockSt(movementTypeVO.getStockStatCd());
                            stockInOutCalcVO.setQty(itemInfoVO.getItemQty());
                            stockInOutCalcVO.setStockAmt(getBigDecimal(stockAmt));
                            stockInOutCalcVO.setStockTaxDdctAmt(getBigDecimal(stockAmt/(1+taxRate)));
                            stockInOutCalcVO.setCalcTp(movementTypeVO.getStockCalcTp());
                            stockInOutCalcVO.setRentType(rentType);
                            stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);

                            stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                            //stockInOutResult = stockInOutService.multiSaveStockInOut(itemInfoVO.getDlrCd(), itemInfoVO.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), movementTypeVO.getStockStatCd(), itemInfoVO.getItemQty(),stockAmt, movementTypeVO.getStockCalcTp(), rentType,grtePrcChkYn);

                            if(stockInOutResult < 1){
                                 //재고 처리 중 오류 발생
                                throw processException("par.err.chkStockUpdate");
                            }


                            /*********************************************
                             * 재고처리 함수 호출 종료
                             *********************************************/

                            itemInsertCnt = itemInsertCnt + 1;
                            itemInfoVO.setMvtDocLineNo(itemInsertCnt);

                            //수불문서번호 셋팅
                            itemInfoVO.setMvtDocYyMm(mvtYYmm);
                            itemInfoVO.setMvtDocNo(mvtDocNo);
                            itemInfoVO.setRegUsrId(LoginUtil.getUserId());


                            itemSaveList.add(itemInfoVO);

                         //재고이동인 경우
                        }else{

                            /*
                            itemFrInfoVO.setSalePrc(0.0);
                            itemFrInfoVO.setSaleTaxDdctPrc(0.0);
                            itemFrInfoVO.setMovingAvgPrc(0.0);
                            itemFrInfoVO.setMovingAvgTaxDdctPrc(0.0);
                            itemToInfoVO.setPurcPrc(0.0);
                            itemToInfoVO.setPurcTaxDdctPrc(0.0);
                            itemToInfoVO.setMovingAvgPrc(0.0);
                            itemToInfoVO.setMovingAvgTaxDdctPrc(0.0);
                            itemFrInfoVO.setSaleAmt(0.0);
                            itemFrInfoVO.setSaleTaxDdctAmt(0.0);
                            itemFrInfoVO.setMovingAvgAmt(0.0);
                            itemFrInfoVO.setMovingAvgTaxDdctAmt(0.0);
                            itemToInfoVO.setPurcAmt(0.0);
                            itemToInfoVO.setPurcTaxDdctAmt(0.0);
                            itemToInfoVO.setMovingAvgAmt(0.0);
                            itemToInfoVO.setMovingAvgTaxDdctAmt(0.0);
                            */

                            //재고이동(가용 - 가용), 재고이동취소(가용 - 가용)이면서 입출고 창고가 같은 경우
                            if(movementTypeVO.getMvtTp().equals("21") ||movementTypeVO.getMvtTp().equals("22")){
                                if(itemInfoVO.getFrStrgeCd().equals(itemInfoVO.getToStrgeCd())){
                                    throw processException("par.err.chkStockMoveSameStrgeCd");
                                }
                            }

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             ********************************************************************/
                            /*
                            searchFrItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchFrItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getFrStrgeCd()); //출고창고코드
                            searchFrItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            frItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchFrItemMovingAvgPrcVO);

                            //이동평균가격 정보가 존재하지 않는 경우
                            if(frItemMovingAvgPrcVO == null){
                                frItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                frItemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                            }

                            if(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                if(frItemMovingAvgPrcVO.getMovingAvgPrc() > 0){
                                    frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                                }else{
                                    frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                }
                            }

                            searchToItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchToItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getToStrgeCd()); //입고창고코드
                            searchToItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            toItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchToItemMovingAvgPrcVO);

                            //이동평균가격 정보가 존재하지 않는 경우
                            if(toItemMovingAvgPrcVO == null){
                                toItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                toItemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                            }

                            if(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                if(toItemMovingAvgPrcVO.getMovingAvgPrc() > 0){
                                    toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                                }else{
                                    toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                }
                            }

                            itemFrInfoVO.setMovingAvgPrc(frItemMovingAvgPrcVO.getMovingAvgPrc());
                            itemFrInfoVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemFrInfoVO.setMovingAvgAmt(frItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemFrInfoVO.setMovingAvgTaxDdctAmt(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());
                            itemFrInfoVO.setSalePrc(itemInfoVO.getSalePrc());
                            itemFrInfoVO.setSaleTaxDdctPrc(itemInfoVO.getSalePrc()/(1 + taxRate));
                            itemFrInfoVO.setSaleAmt(itemInfoVO.getSaleAmt());
                            itemFrInfoVO.setSaleTaxDdctAmt((itemInfoVO.getSalePrc()/(1 + taxRate)) * itemInfoVO.getItemQty());

                            itemToInfoVO.setMovingAvgPrc(toItemMovingAvgPrcVO.getMovingAvgPrc());
                            itemToInfoVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemToInfoVO.setMovingAvgAmt(toItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemToInfoVO.setMovingAvgTaxDdctAmt(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());
                            itemToInfoVO.setPurcPrc(itemInfoVO.getSalePrc());
                            itemToInfoVO.setPurcTaxDdctPrc(itemInfoVO.getSalePrc()/(1 + taxRate));
                            itemToInfoVO.setPurcAmt(itemInfoVO.getSaleAmt());
                            itemToInfoVO.setPurcTaxDdctAmt((itemInfoVO.getSalePrc()/(1 + taxRate)) * itemInfoVO.getItemQty());
                            */
                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 끝(수불테이블의 STD_PRC는 사용하지 않는다. 2016-09-06기준)
                             ********************************************************************/

                            itemInsertCnt = itemInsertCnt + 1;
                            itemFrInfoVO.setMvtDocLineNo(itemInsertCnt);

                            //수불문서번호 셋팅
                            itemFrInfoVO.setMvtDocYyMm(mvtYYmm);
                            itemFrInfoVO.setMvtDocNo(mvtDocNo);
                            itemFrInfoVO.setRegUsrId(LoginUtil.getUserId());

                            itemInsertCnt = itemInsertCnt + 1;
                            itemToInfoVO.setMvtDocLineNo(itemInsertCnt);

                            //수불문서번호 셋팅
                            itemToInfoVO.setMvtDocYyMm(mvtYYmm);
                            itemToInfoVO.setMvtDocNo(mvtDocNo);
                            itemToInfoVO.setRegUsrId(LoginUtil.getUserId());

                            itemFrInfoVO.setPltCd(itemInfoVO.getPltCd());
                            itemToInfoVO.setPltCd(itemInfoVO.getPltCd());

                            itemFrInfoVO.setDlrCd(itemInfoVO.getDlrCd());
                            itemToInfoVO.setDlrCd(itemInfoVO.getDlrCd());

                            itemFrInfoVO.setStrgeCd(itemInfoVO.getFrStrgeCd());
                            itemToInfoVO.setStrgeCd(itemInfoVO.getToStrgeCd());

                            itemFrInfoVO.setLocCd(itemInfoVO.getLocCd());
                            itemToInfoVO.setLocCd(itemInfoVO.getLocCd());

                            itemFrInfoVO.setCancStmtYn("N");
                            itemToInfoVO.setCancStmtYn("N");

                            itemFrInfoVO.setItemCd(itemInfoVO.getItemCd());
                            itemToInfoVO.setItemCd(itemInfoVO.getItemCd());

                            itemFrInfoVO.setItemQty(itemInfoVO.getItemQty());
                            itemToInfoVO.setItemQty(itemInfoVO.getItemQty());

                            itemFrInfoVO.setItemUnitCd(itemInfoVO.getItemUnitCd());
                            itemToInfoVO.setItemUnitCd(itemInfoVO.getItemUnitCd());

                            itemFrInfoVO.setRefDocNo(itemInfoVO.getRefDocNo());
                            itemToInfoVO.setRefDocNo(itemInfoVO.getRefDocNo());

                            itemFrInfoVO.setRefDocLineNo(itemInfoVO.getRefDocLineNo());
                            itemToInfoVO.setRefDocLineNo(itemInfoVO.getRefDocLineNo());

                            itemFrInfoVO.setCurrCd(itemInfoVO.getCurrCd());
                            itemToInfoVO.setCurrCd(itemInfoVO.getCurrCd());

                            if(movementTypeVO.getMvtReasonReqsYn().equals("Y")){
                                itemFrInfoVO.setMvtReasonCont(itemInfoVO.getMvtReasonCont());
                                itemToInfoVO.setMvtReasonCont(itemInfoVO.getMvtReasonCont());
                            }

                            itemFrInfoVO.setDdlnYn("N");
                            itemToInfoVO.setDdlnYn("N");

                            /****************************************
                             * 차변대변구분 셋팅
                             ***************************************/
                            if(movementTypeVO.getCancMvtYn().equals("N")){
                                //출고창고가 (-)
                                itemFrInfoVO.setDebitCreditDstinCd("H");
                                //입고창고가 (+)
                                itemToInfoVO.setDebitCreditDstinCd("S");
                            }else if(movementTypeVO.getCancMvtYn().equals("Y")){
                                //출고창고가 (+)
                                itemFrInfoVO.setDebitCreditDstinCd("S");
                                //입고창고가 (-)
                                itemToInfoVO.setDebitCreditDstinCd("H");
                            }
                            /****************************************
                             * 차변대변구분 셋팅 종료
                             ***************************************/


                            /****************************************
                             * 수불유형의 프로세스 유형이 '이동'일 경우 셋팅 종료
                             ***************************************/
                            itemFrInfoVO.setAutoCreYn("N");

                            /*********************************************
                             * 재고처리 함수 호출
                             *********************************************/

                            // 재고처리 함수 이상 주석처리.
                            if(movementTypeVO.getCancMvtYn().equals("N")){

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemFrInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemFrInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemFrInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemFrInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setStockSt("01");
                                stockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("-");

                                if(movementTypeVO.getMvtTp().equals("21")){

                                    stockInOutCalcVO.setStockAmt(itemFrInfoVO.getSaleAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt((itemFrInfoVO.getSalePrc()/(1 + taxRate)) * itemFrInfoVO.getItemQty());
                                    stockInOutCalcVO.setRentType("");

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), itemFrInfoVO.getSaleAmt(), "-", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("23")){//예류인 경우 가용재고 '0'될 때 재고금액이 '0'처리되지 않도록 rentType항목에 'X'값전달

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);
                                    stockInOutCalcVO.setRentType("X");

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "-", "X",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("25")){//보류인 경우 가용재고 '0'될 때 재고금액이 '0'처리되지 않도록 rentType항목에 'X'값전달

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);
                                    stockInOutCalcVO.setRentType("X");

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "-", "X",grtePrcChkYn);
                                }

                            }else{

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemFrInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemFrInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemFrInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemFrInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setStockSt("01");
                                stockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("+");
                                stockInOutCalcVO.setRentType(" ");

                                if(movementTypeVO.getMvtTp().equals("22")){

                                    stockInOutCalcVO.setStockAmt(itemFrInfoVO.getSaleAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt((itemFrInfoVO.getSalePrc()/(1 + taxRate)) * itemFrInfoVO.getItemQty());



                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), itemFrInfoVO.getSaleAmt(), "+", " ",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("24")){

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "+", " ",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("26")){

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "+", " ",grtePrcChkYn);
                                }

                            }

                            if(stockInOutResult < 1){
                                //재고 처리 중 오류 발생
                                throw processException("par.err.chkStockUpdate");
                            }

                           /****************************************
                            * 수불유형의 프로세스 유형이 '이동'일 경우 셋팅 종료
                            ***************************************/
                            itemToInfoVO.setAutoCreYn("Y");

                            /*********************************************
                             * 재고처리 함수 호출
                             *********************************************/

                            // 재고처리 함수 이상 주석처리.
                            if(movementTypeVO.getCancMvtYn().equals("N")){

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemToInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemToInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemToInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemToInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setQty(itemToInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("+");
                                stockInOutCalcVO.setRentType("");

                                if(movementTypeVO.getMvtTp().equals("21")){

                                    stockInOutCalcVO.setStockSt("01");
                                    stockInOutCalcVO.setStockAmt(itemToInfoVO.getPurcAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt((itemToInfoVO.getPurcPrc() / (1 + taxRate)) * itemToInfoVO.getItemQty());

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemToInfoVO.getItemQty(), itemToInfoVO.getPurcAmt(), "+", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("23")){

                                    stockInOutCalcVO.setStockSt("02");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);


                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "02", itemToInfoVO.getItemQty(), 0, "+", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("25")){

                                    stockInOutCalcVO.setStockSt("03");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "03", itemToInfoVO.getItemQty(), 0, "+", "",grtePrcChkYn);
                                }
                            }else{

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemToInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemToInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemToInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemToInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setQty(itemToInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("-");
                                stockInOutCalcVO.setRentType("");

                                if(movementTypeVO.getMvtTp().equals("22")){

                                    stockInOutCalcVO.setStockSt("01");
                                    stockInOutCalcVO.setStockAmt(itemToInfoVO.getPurcAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt((itemToInfoVO.getPurcPrc() / (1 + taxRate)) * itemToInfoVO.getItemQty());

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemToInfoVO.getItemQty(), itemToInfoVO.getPurcAmt(), "-", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("24")){

                                    stockInOutCalcVO.setStockSt("02");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "02", itemToInfoVO.getItemQty(), 0, "-", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("26")){

                                    stockInOutCalcVO.setStockSt("03");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);


                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "03", itemToInfoVO.getItemQty(), 0, "-", "",grtePrcChkYn);
                                }
                            }


                            if(stockInOutResult < 1){
                                 //재고 처리 중 오류 발생
                                throw processException("par.err.chkStockUpdate");

                            }

                            itemSaveList.add(itemFrInfoVO);
                            itemSaveList.add(itemToInfoVO);
                        }

                    /*********************************************
                     * 문서 품목정보 생성 종료
                     *********************************************/

                }

                /*********************************************
                 * 수불문서 테이블 Insert
                 *********************************************/
                mvtDocDAO.insertMvtDoc(mvtVO);

                saveList = itemSaveList.size();
                for(i = 0; i < saveList; i = i+1){
                    mvtDocDAO.insertMvtDocItem(itemSaveList.get(i));
                }

                /*********************************************
                 * 수불문서 테이블 Insert 종료
                 *********************************************/


            //사용 안하는 수불유형인 경우
            }else{
                //수불 유형이 존재하지만 사용하지 않는 수불유형입니다.
                throw processException("par.err.chkMvtTypeUseYn");
            }

        //존재하지 않는 수불유형인 경우
        }else{
            //수불 유형이 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale())});
        }

        /*********************************************
         * 처리결과 Return
         *********************************************/
        return itemSaveList;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementDocumentService#multiCancelMovementDocuments(chn.bhmc.dms.core.datatype.BaseSaveVO)
     * [1]. 취소가능여부 점검. -MovementTypeService.selectMovementTypeByKey(딜러코드, 수불유형)-
     *   1) 존재하는 수불유형인가? 데이터 Row확인
     *   2) 사용여부가 'Y'인 수불유형인가? USE_YN = 'Y'
     *   3) 역방향여부가 'N'인 수불유형인가?  CANC_MVT_YN = 'N'
     *       ->취소수불문서는 취소 대상이 아님
     *   4) 이미 취소된 수불문서는 아닌가?
     *
     * [2]. 수불문서번호 채번
     *    1) 수불번호 채번되었는지 체크(빈값, 값의 길이 체크)
     *
     * [3] 문서헤더정보 생성
     *    1) 수불유형
     *       - 원 수불문서의 수불유형에 해당하는 상대 수불유형을 읽어옴.(COMBI_MVT_TP)
     *    2) 전기일
     *       - 취소 시점의 시스템 일자
     *    3) 수불문서년월
     *       - 취소 시점 시스템일자의 년월
     *    4) 수불문서번호
     *       - 새로이 채번된 번호
     *    5) 기타 나머지 정보
     *       - 원문서와 동일
     *
     * [4]. 문서품목정보 생성
     *    1) 차변대변구분: 재고 증가시 'S', 감소시 'H'를 등록
     *    2) 수불유형의 프로세스 유형이 '이동'일 경우 자동생성품목 필드에 'X'값 셋팅
     *    3) 나머지 정보는 원문서와 동일
     *
     * [5]. 재고처리 함수 호출
     *
     * [6]. 수불문서 테이블 정보 Insert(수불헤더 PT_0311T, 수불품목 PT_0312T)
     */
    @Override
    public List<MvtDocItemVO> multiCnclMvtDocs(MvtDocVO mvtVO, List<MvtDocItemVO> list) throws Exception {
        int listLen          = list.size();
        int saveList         = 0;
        int stockInOutResult = 0;
        int i                = 0;
        int  itemInsertCnt   = 0;
        double stockAmt      = 0.0;
        double stockTaxDdctAmt = 0.0;
        String mvtYYmm       = DateUtil.getDate("yyyyMM");
        String grtePrcChkYn = "Y";

        double movingAvgStockAmt = 0.0;
        double movingAvgStockTaxDdctAmt = 0.0;
        double movingAvgPrc = 0.0;
        double movingAvgTaxDdctPrc = 0.0;
        int    itemMovingAvgPrcSeq = 0;
        int    movingAvgResultCnt  = 0;
       // 유효성 Array
        String[] lblList = new String[1];

        double taxRate = 0.0;

        String mvtDocNo = "";
        MvtDocItemVO itemInfoVO         = new MvtDocItemVO();
        MvtDocItemVO itemFrInfoVO       = new MvtDocItemVO();
        MvtDocItemVO itemToInfoVO       = new MvtDocItemVO();
        MvtDocItemVO refInfoVO          = new MvtDocItemVO();
        MvtDocItemVO refOrgVO           = new MvtDocItemVO();
        List<MvtDocItemVO> itemSaveList = new ArrayList<MvtDocItemVO>();
        //EndingStockVO endingStockVO = null;

        //[이동평균가격]부품이동평균가격정보
        ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        ItemMovingAvgPrcVO searchFrItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
        ItemMovingAvgPrcVO frItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

        ItemMovingAvgPrcVO searchToItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
        ItemMovingAvgPrcVO toItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

        StockInOutCalcVO stockInOutCalcVO             = new StockInOutCalcVO();  //재고프로세스 계산VO

        /*********************************************
         * 수불헤더 정보 셋팅
         *********************************************/
        mvtVO.setDlrCd(LoginUtil.getDlrCd());
        //mvtVO.setCustNo("TESTCUSTNO");
        mvtVO.setMvtDocYyMm(mvtYYmm);
        mvtVO.setRegUsrId(LoginUtil.getUserId());
        /*********************************************
         * 수불헤더 정보 셋팅 종료
         *********************************************/

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


        /*********************************************
         * 수불유형 점검
         *********************************************/
        if( (mvtVO.getDlrCd() == null) || (mvtVO.getDlrCd().isEmpty())){
            //딜러정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
        }
        if( (mvtVO.getMvtTp() == null) || (mvtVO.getMvtTp().isEmpty())){
            //수불유형정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale())});
        }
        MovementTypeVO movementTypeVO = movementTypeService.selectCombiMovementTypeByKey(mvtVO.getDlrCd(), mvtVO.getMvtTp());

        //존재하는 수불유형인 경우
        if(movementTypeVO != null){
            //사용 여부가 'Y'인경우
            if(movementTypeVO.getUseYn().equals("Y")){

                // 역방향여부가 'Y'인지
                if(movementTypeVO.getCancMvtYn().equals("Y")){

                    //역방향여부가 'N'가 아닌지
                }else{
                     //취소수불문서는 취소 대상이 아닙니다.
                    throw processException("par.err.chkCnclForCnclMvtDoc");
                }

                if(itemInfoVO.getTaxRate() == null){
                    taxRate =  vatInfoVO.getVatApplyRate();
                }else{
                    taxRate = itemInfoVO.getTaxRate();
                }

                /*********************************************
                 * 헤더정보 필수값 점검
                 *********************************************/
                //수불의 프로세스유형이 구매('P')인 경우
                if(movementTypeVO.getProcessTp().equals("P")){
                    if( (mvtVO.getBpCd() == null) || (mvtVO.getBpCd().isEmpty())){
                        //공급업체정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.bpCd", null, LocaleContextHolder.getLocale())});
                    }
                //수불의 프로세스유형이 판매('S')인 경우
                }else if(movementTypeVO.getProcessTp().equals("S")){

                    if( (mvtVO.getCustNo() == null) || (mvtVO.getCustNo().isEmpty())){
                        if( (mvtVO.getBpCd() == null) || (mvtVO.getBpCd().isEmpty())){
                            //고객정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.customer", null, LocaleContextHolder.getLocale())});
                        }
                    }
                }else if(movementTypeVO.getProcessTp().equals("C")){
                    if( (mvtVO.getCustNo() == null) || (mvtVO.getCustNo().isEmpty())){
                        if( (mvtVO.getBpCd() == null) || (mvtVO.getBpCd().isEmpty())){
                            //고객정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.customer", null, LocaleContextHolder.getLocale())});
                        }
                    }

                }
                /*********************************************
                 * 헤더정보 필수값 점검 종료
                 *********************************************/

                /*********************************************
                 * 수불문서번호 채번
                 *********************************************/
                mvtDocNo = selectNextMvtDocNo();

                //채번이 안된 경우
                if( (mvtDocNo == null) || (mvtDocNo.isEmpty())){
                    //채번이 되지 않았습니다.
                    throw processException("global.err.emptyIdgenNo");
                }

                //채번정보가 이상할 경우
                if(mvtDocNo.length() < 5){
                    //채번이 되지 않았습니다.
                    throw processException("global.err.emptyIdgenNo");
                }

                mvtVO.setMvtDocNo(mvtDocNo);

                /*********************************************
                 * 수불문서번호 채번 종료
                 *********************************************/

                /*********************************************
                 * 보증가 체크여부를 위한 설정(기초재고입고및 취소인 경우 재고설정한는 부분에서 보증가 체크를 하지 않는다.)
                 * multiSaveStockInOut
                 *********************************************/
                if(movementTypeVO.getMvtTp().equals("31") || movementTypeVO.getMvtTp().equals("32")){
                    grtePrcChkYn = "N";
                }else{
                    grtePrcChkYn = "Y";
                }

                /*********************************************
                 * 품목정보 필수값 점검
                 *********************************************/
                for(i = 0; i < listLen; i = i+1){
                    //endingStockVO = null;
                    itemInfoVO   = new MvtDocItemVO();

                    itemInfoVO   = list.get(i);
                    itemFrInfoVO = new MvtDocItemVO();  //취소 시 출고창고(이동 시의 입고창고가 취소시의 출고창고가 됨)
                    itemToInfoVO = new MvtDocItemVO();  //취소 시 입고창고(이동 시의 출고창고가 취소시의 입고창고가 됨)
                    refInfoVO    = new MvtDocItemVO();
                    refOrgVO     = new MvtDocItemVO();

                    searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    //재고이동 시 Fr, To 창고가 각각 다르기 때문에 재계산
                    searchFrItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    frItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    searchToItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    toItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    itemInfoVO.setPltCd(LoginUtil.getPltCd());

                    movingAvgStockAmt   = 0;
                    movingAvgStockTaxDdctAmt = 0;
                    movingAvgPrc        = 0;
                    movingAvgTaxDdctPrc = 0;
                    itemMovingAvgPrcSeq = 0;
                    movingAvgResultCnt  = 0;

                    if( (itemInfoVO.getDlrCd() == null) || (itemInfoVO.getDlrCd().isEmpty())){
                        //딜러정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemInfoVO.getPltCd() == null) || (itemInfoVO.getPltCd().isEmpty())){
                        //센터정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemInfoVO.getRefDocNo() == null) || (itemInfoVO.getRefDocNo().isEmpty())){
                        //참조정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.refDocNo", null, LocaleContextHolder.getLocale())});
                    }
                    if(itemInfoVO.getRefDocLineNo() < 1){
                        //참조라인번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.refDocLineNo", null, LocaleContextHolder.getLocale())});
                    }


                    refInfoVO = mvtDocDAO.selectMvtDocItemByRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getRefDocNo(), itemInfoVO.getRefDocLineNo());

                    /*
                    if( (itemInfoVO.getCancMvtDocYyMm() == null) || (itemInfoVO.getCancMvtDocYyMm().isEmpty())){
                        //센터정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
                    }
                     */
                    /*
                    if( (itemInfoVO.getCancMvtDocYyMm() == null) || (itemInfoVO.getCancMvtDocYyMm().isEmpty())){
                        //센터정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
                    }
                    */

                    if(!movementTypeVO.getProcessTp().equals("T")){
                        if( (itemInfoVO.getStrgeCd() == null) || (itemInfoVO.getStrgeCd().isEmpty())){
                            //창고정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
                        }
                    }else{
                        if( (itemInfoVO.getFrStrgeCd() == null) || (itemInfoVO.getFrStrgeCd().isEmpty())){
                            //출고창고정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale())});
                        }

                        if( (itemInfoVO.getToStrgeCd() == null) || (itemInfoVO.getToStrgeCd().isEmpty())){
                            //입고창고정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grStrgeCd", null, LocaleContextHolder.getLocale())});
                        }
                    }
                    if( (itemInfoVO.getItemCd() == null) || (itemInfoVO.getItemCd().isEmpty())){
                        //품목정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                    }
                    if(itemInfoVO.getItemQty() == null || itemInfoVO.getItemQty().equals("")){
                        //수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
                    }
                    /*if( (itemInfoVO.getItemUnitCd() == null) || (itemInfoVO.getItemUnitCd().isEmpty())){
                        //단위정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("ser.lbl.unitCd", null, LocaleContextHolder.getLocale())});
                    }*/
                   // if( (itemInfoVO.getRefDocTp() == null) || (itemInfoVO.getRefDocTp().isEmpty())){
                   //     참조유형정보가 존재하지 않습니다.
                    //    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                   // }


                    //수불유형이 구매(P)인 경우
                    if(movementTypeVO.getProcessTp().equals("P")){
                        if(itemInfoVO.getPurcPrc() == null || itemInfoVO.getPurcPrc().equals("")){
                            //구매단가정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                        }
                        if(itemInfoVO.getPurcAmt() == null || itemInfoVO.getPurcAmt().equals("")){
                            //구매금액정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcAmt", null, LocaleContextHolder.getLocale())});
                        }

                        /********************************************************************
                         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                         ********************************************************************/
                        searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                        searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                        searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                        if(movementTypeVO.getStockCalcTp().equals("+")){
                            //이동평균가격 정보가 존재하는 경우
                            if(itemMovingAvgPrcVO != null){
                            	//调拨出库取消 成本价不能取最新的 需要找到原来的单价
                            	  StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                            	  //获取库存成本金额
                                  double samt = stockInOutVO3.getStockAmt();
                                  //成本金额 成本金额不含税
                                  movingAvgStockAmt = getBigDecimal( samt  + Math.abs(itemInfoVO.getPurcAmt()));
                                  movingAvgStockTaxDdctAmt = getBigDecimal(movingAvgStockAmt/ (1 + taxRate));

                                  //成本单价 成本单价不含税
                                  movingAvgPrc = getBigDecimal(movingAvgStockAmt / (itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty())));
  								  movingAvgTaxDdctPrc = movingAvgPrc/(1 + taxRate);


                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                itemMovingAvgPrcVO.setMovingAvgPrc(movingAvgPrc);
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(movingAvgTaxDdctPrc);

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                   //송장부품의 입고 확정이 처리되지 않았습니다.
                                    throw processException("par.err.failedReceiveCnfmMsg");
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{

                                itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                                itemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //부품코드
                                itemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드
                                itemMovingAvgPrcVO.setTotQty(itemInfoVO.getItemQty()); //입고수량

                                if(itemInfoVO.getPurcAmt() > 0){
                                    itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(itemInfoVO.getPurcAmt()/itemInfoVO.getItemQty()));
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc((getBigDecimal(itemInfoVO.getPurcPrc()/(1 + taxRate))));
                                }else{
                                    itemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                }


                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);


                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //송장부품의 입고 확정이 처리되지 않았습니다.
                                     throw processException("par.err.failedReceiveCnfmMsg");
                                 }
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            itemMovingAvgPrcVO.setTaxRate(taxRate);

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //송장부품의 입고 확정이 처리되지 않았습니다.
                                 throw processException("par.err.failedReceiveCnfmMsg");
                             }

                            itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                            itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                        }else{
                          //이동평균가격 정보가 존재하는 경우
                            if(itemMovingAvgPrcVO != null){
                              
                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                //2018-11-04 update by weiyongjie 计算成本价 （成本金额 - 出库成本金额）/账面库存 start
                                StockInOutVO stockInOutVO2  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());                                
                              //获取库存成本金额
                                double samt = getBigDecimal(stockInOutVO2.getStockAmt() -itemInfoVO.getPurcAmt());
                                double scount = itemMovingAvgPrcVO.getTotQty() ==  0 ? 0 : itemMovingAvgPrcVO.getTotQty() ;
                                //2018-11-04 update by weiyongjie 计算成本价 （成本金额 - 出库成本金额）/账面库存 end
                                if( scount > 0 ) {
                                	itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt/scount));
                                }else {
                                	itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                                }
                                
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/ (1 + taxRate)));

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                }

                                refOrgVO = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGrDocNo(), itemInfoVO.getGrDocLineNo(), "", "S");

                                //반품 시 수불 이동평균 관련내용은 원 수불문서의 정보를 불러온다.
                                if(refOrgVO.getMovingAvgPrc() == null || refOrgVO.getMovingAvgPrc().equals("")){
                                    itemInfoVO.setMovingAvgPrc(0.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(0.0);
                                }else{
                                    itemInfoVO.setMovingAvgPrc(refOrgVO.getMovingAvgPrc());
                                    itemInfoVO.setMovingAvgAmt(Math.round(refOrgVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }

                                if(refOrgVO.getMovingAvgTaxDdctPrc() == null || refOrgVO.getMovingAvgTaxDdctPrc().equals("")){
                                    itemInfoVO.setMovingAvgTaxDdctPrc(Math.round((refOrgVO.getMovingAvgPrc() / (1 + taxRate)) * 100.0)/100.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round((refOrgVO.getMovingAvgPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }else{
                                    itemInfoVO.setMovingAvgTaxDdctPrc(refOrgVO.getMovingAvgTaxDdctPrc());
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(refOrgVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            itemMovingAvgPrcVO.setTaxRate(taxRate);

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //기타입고 확정 실패.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                             }
                        }

                    
                        itemInfoVO.setPurcTaxDdctPrc(Math.round(itemInfoVO.getPurcPrc() / (1 + taxRate) * 100.0)/100.0);
                        itemInfoVO.setPurcTaxDdctAmt(Math.round((itemInfoVO.getPurcPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);

                        /********************************************************************
                         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                         * 끝
                         ********************************************************************/

                        if(movementTypeVO.getStockCalcTp().equals("+")){

                            stockAmt = itemInfoVO.getPurcAmt();
                            stockTaxDdctAmt = Math.round((itemInfoVO.getPurcPrc()/(1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0;
                        }else{
                        	//2018-11-03 update by weiyongjie 根据入库单 查询出要退返的成本金额 而不能取成本价*数量 start
                            //退还的库存金额
                         	stockAmt = Math.round(itemInfoVO.getPurcPrc()* itemInfoVO.getItemQty() * 100.0)/100.0;
                           //2018-11-03 update by weiyongjie 根据入库单 查询出要退返的成本金额 而不能取成本价*数量 end
                         	stockTaxDdctAmt = getBigDecimal(stockAmt/( 1 + taxRate ));
                        }
                        //stockAmt = itemInfoVO.getPurcAmt();
                    //수불유형이 판매(S)인 경우
                    }else if(movementTypeVO.getProcessTp().equals("S")){

                        /********************************************************************
                         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                         ********************************************************************/
                        searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                        searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                        searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                        //출고발생한 경우
                        if(movementTypeVO.getStockCalcTp().equals("-")){
                            //이동평균가격 정보가 존재하는 경우
                            if(itemMovingAvgPrcVO != null){

                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());//出库不重新计算成本价
                    			itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc( itemMovingAvgPrcVO.getMovingAvgPrc() / (1+taxRate) );

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                   //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{

                              //기타입고 확정 실패.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            itemMovingAvgPrcVO.setTaxRate(taxRate);

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //출고 확정이 처리되지 않았습니다.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                             }
                        //출고취소 혹은 출고 반품 발생한 경우
                        }else{
                          //이동평균가격 정보가 존재하는 경우
                            if(itemMovingAvgPrcVO != null){

                                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금 미포함)

                                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                              //查找销售出库成本金额 
                                MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                                //获取库存成本金额
                                double samt = getBigDecimal( stockInOutVO3.getStockAmt() + getBigDecimal( mm.getMovingAvgPrc()*itemInfoVO.getItemQty() ) );
                                double scount = itemMovingAvgPrcVO.getTotQty() ==  0 ? 0 : itemMovingAvgPrcVO.getTotQty() ;
                                
                                itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt/scount));
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate)));

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                   //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{

                              //기타입고 확정 실패.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            itemMovingAvgPrcVO.setTaxRate(taxRate);

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                //출고 확정이 처리되지 않았습니다.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                             }
                        }
                       

                        if( "71".equals(movementTypeVO.getMvtTp()) || "11".equals(movementTypeVO.getMvtTp()) ) {//销售出库 售后销售出库
                      	  //获取库存成本金额
                            stockAmt = getBigDecimal( itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            stockTaxDdctAmt = getBigDecimal(getBigDecimal((itemMovingAvgPrcVO.getMovingAvgPrc())/(1+taxRate)) * itemInfoVO.getItemQty());
                            
                            itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                            itemInfoVO.setMovingAvgTaxDdctPrc(getBigDecimal( itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate) ));
                            itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(getBigDecimal( itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate) ) * itemInfoVO.getItemQty() * 100.0)/100.0);
                            
                        }else if( "73".equals(movementTypeVO.getMvtTp()) || "13".equals(movementTypeVO.getMvtTp()) ) { //销售出库退回 售后销售出库退回
                      	  MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                      	  stockAmt = getBigDecimal( mm.getMovingAvgPrc() * itemInfoVO.getItemQty() );
                      	  stockTaxDdctAmt = getBigDecimal(getBigDecimal((mm.getMovingAvgPrc())/(1+taxRate))*itemInfoVO.getItemQty());
                      	  
                            itemInfoVO.setMovingAvgPrc(mm.getMovingAvgPrc());
                            itemInfoVO.setMovingAvgTaxDdctPrc(getBigDecimal( mm.getMovingAvgPrc()/(1+taxRate) ));
                            itemInfoVO.setMovingAvgAmt(Math.round(mm.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(getBigDecimal( mm.getMovingAvgPrc()/(1+taxRate) ) * itemInfoVO.getItemQty() * 100.0)/100.0);
                        }
                        itemInfoVO.setSaleTaxDdctPrc(Math.round(itemInfoVO.getSalePrc() / (1 + taxRate) * 100.0)/100.0);
                        itemInfoVO.setSaleTaxDdctAmt(Math.round((itemInfoVO.getSalePrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);

                    }else if(movementTypeVO.getProcessTp().equals("C")){
                        if(movementTypeVO.getMvtGrGiTp().equals("R")){
                            if(itemInfoVO.getPurcPrc() == null || itemInfoVO.getPurcPrc().equals("")){
                                //구매단가정보가 존재하지 않습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                            }
                            if(itemInfoVO.getPurcAmt() == null || itemInfoVO.getPurcAmt().equals("")){
                                //구매금액정보가 존재하지 않습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcAmt", null, LocaleContextHolder.getLocale())});
                            }

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                             ********************************************************************/
                            searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                            searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                            if(movementTypeVO.getStockCalcTp().equals("+")){
                                //이동평균가격 정보가 존재하는 경우
                                if(itemMovingAvgPrcVO != null){
                                   
                                	  StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                	//获取库存成本金额
                                      double samt = stockInOutVO3.getStockAmt();
                                      movingAvgStockAmt =getBigDecimal( samt + Math.abs(itemInfoVO.getPurcAmt()) );
                                      movingAvgStockTaxDdctAmt = getBigDecimal( movingAvgStockAmt  / (1 + taxRate) );
                                     //2018-11-04 update by weiyongjie 计算成本金额 应查询库存的成本金额 end 

                                      movingAvgPrc = getBigDecimal(movingAvgStockAmt / (itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty())));
                                      movingAvgTaxDdctPrc = getBigDecimal(movingAvgPrc / (1 + taxRate));
                                      
                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                    itemMovingAvgPrcVO.setMovingAvgPrc(movingAvgPrc);
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(movingAvgTaxDdctPrc);

                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                       //송장부품의 입고 확정이 처리되지 않았습니다.
                                        throw processException("par.err.failedReceiveCnfmMsg");
                                    }

                                  //이동평균가격 정보가 없는 경우
                                }else{

                                    itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                                    itemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //부품코드
                                    itemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드
                                    itemMovingAvgPrcVO.setTotQty(itemInfoVO.getItemQty()); //입고수량

                                    if(itemInfoVO.getPurcAmt() > 0){
                                        itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(itemInfoVO.getPurcAmt()/itemInfoVO.getItemQty()));
                                        itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal((itemInfoVO.getPurcPrc()/(1 + taxRate))));
                                    }else{
                                        itemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                        itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                    }

                                    itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);


                                    movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                        //송장부품의 입고 확정이 처리되지 않았습니다.
                                         throw processException("par.err.failedReceiveCnfmMsg");
                                     }
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //송장부품의 입고 확정이 처리되지 않았습니다.
                                     throw processException("par.err.failedReceiveCnfmMsg");
                                 }

                                itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                                itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                                itemInfoVO.setMovingAvgAmt(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                                itemInfoVO.setMovingAvgTaxDdctAmt(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());
                            }else{
                              //이동평균가격 정보가 존재하는 경우
                                if(itemMovingAvgPrcVO != null){
                                  

                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                    //2018-11-04 update by weiyongjie 需要重新计算 成本价  start
                                    StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                    //获取库存成本金额 + 取消的库存成本金额
                              	    double samt  = getBigDecimal( stockInOutVO3.getStockAmt() - Math.abs(itemInfoVO.getPurcAmt()));
                              	    if( itemMovingAvgPrcVO.getTotQty() == 0 ) {
                              	    	itemMovingAvgPrcVO.setMovingAvgPrc(0d);
                              	    }else {
                              	      itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt / itemMovingAvgPrcVO.getTotQty()));
                              	    }
                              	    
                              	  itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));


                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                        //기타입고 확정 실패.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                    }

                                  //이동평균가격 정보가 없는 경우
                                }else{
                                        //기타입고 확정 실패.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                                 }

                                refOrgVO = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGrDocNo(), itemInfoVO.getGrDocLineNo(), "", "S");

                                //반품 시 수불 이동평균 관련내용은 원 수불문서의 정보를 불러온다.
                                if(refOrgVO.getMovingAvgPrc() == null || refOrgVO.getMovingAvgPrc().equals("")){
                                    itemInfoVO.setMovingAvgPrc(0.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(0.0);
                                }else{
                                    itemInfoVO.setMovingAvgPrc(refOrgVO.getMovingAvgPrc());
                                    itemInfoVO.setMovingAvgAmt(Math.round(refOrgVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }

                                if(refOrgVO.getMovingAvgTaxDdctPrc() == null || refOrgVO.getMovingAvgTaxDdctPrc().equals("")){
                                    itemInfoVO.setMovingAvgTaxDdctPrc(Math.round((refOrgVO.getMovingAvgPrc() / (1 + taxRate)) * 100.0)/100.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round((refOrgVO.getMovingAvgPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }else{
                                    itemInfoVO.setMovingAvgTaxDdctPrc(refOrgVO.getMovingAvgTaxDdctPrc());
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(refOrgVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }
                            }

                            //itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                            //itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            //itemInfoVO.setMovingAvgAmt(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            //itemInfoVO.setMovingAvgTaxDdctAmt(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());
                            itemInfoVO.setPurcTaxDdctPrc(Math.round(itemInfoVO.getPurcPrc() / (1 + taxRate) * 100.0)/100.0);
                            itemInfoVO.setPurcTaxDdctAmt(Math.round((itemInfoVO.getPurcPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                             * 끝
                             ********************************************************************/

                            stockAmt = itemInfoVO.getPurcAmt();
                            stockTaxDdctAmt = getBigDecimal(stockAmt/(1+taxRate));
                        }else if(movementTypeVO.getMvtGrGiTp().equals("I")){

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             ********************************************************************/
                            searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                            searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             ********************************************************************/
                            searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                            searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                            //출고발생한 경우
                            if(movementTypeVO.getStockCalcTp().equals("-")){
                                //이동평균가격 정보가 존재하는 경우
                                if(itemMovingAvgPrcVO != null){

                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                    itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                               	    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate)));

                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                       //출고 확정이 처리되지 않았습니다.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                    }

                                  //이동평균가격 정보가 없는 경우
                                }else{

                                  //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                 }

                                itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                                itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                                itemInfoVO.setMovingAvgAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            //출고취소 혹은 출고 반품 발생한 경우
                            }else{
                              //이동평균가격 정보가 존재하는 경우
                                if(itemMovingAvgPrcVO != null){

                                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                   
                                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                    itemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                    //这里需要重新计算成本价
                                    //计算成本价 （成本金额 - 出库成本金额）/账面库存
                                    StockInOutVO stockInOutVO2  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());
                                    MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getRefDocNo(), itemInfoVO.getRefDocLineNo());
                                    //获取库存成本金额
                                    double samt = getBigDecimal( stockInOutVO2.getStockAmt() + mm.getMovingAvgPrc()*itemInfoVO.getItemQty()); 
                                    double scount = itemMovingAvgPrcVO.getTotQty() ==  0 ? 0 : itemMovingAvgPrcVO.getTotQty() ;
                                    
                                    itemMovingAvgPrcVO.setMovingAvgPrc(getBigDecimal(samt / itemMovingAvgPrcVO.getTotQty()));
                                    itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(getBigDecimal(itemMovingAvgPrcVO.getMovingAvgPrc()/(1+taxRate)));

                                    movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                                    if(movingAvgResultCnt != 1){
                                       //출고 확정이 처리되지 않았습니다.
                                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                    }

                                  //이동평균가격 정보가 없는 경우
                                }else{

                                  //기타입고 확정 실패.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                                itemMovingAvgPrcVO.setTaxRate(taxRate);

                                movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    //출고 확정이 처리되지 않았습니다.
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                 }

                                refOrgVO = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");

                                //반품 시 수불 이동평균 관련내용은 원 수불문서의 정보를 불러온다.
                                if(refOrgVO.getMovingAvgPrc() == null || refOrgVO.getMovingAvgPrc().equals("")){
                                    itemInfoVO.setMovingAvgPrc(0.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(0.0);
                                }else{
                                    itemInfoVO.setMovingAvgPrc(refOrgVO.getMovingAvgPrc());
                                    itemInfoVO.setMovingAvgAmt(Math.round(refOrgVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }

                                if(refOrgVO.getMovingAvgTaxDdctPrc() == null || refOrgVO.getMovingAvgTaxDdctPrc().equals("")){
                                    itemInfoVO.setMovingAvgTaxDdctPrc(Math.round((refOrgVO.getMovingAvgPrc() / (1 + taxRate)) * 100.0)/100.0);
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round((refOrgVO.getMovingAvgPrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }else{
                                    itemInfoVO.setMovingAvgTaxDdctPrc(refOrgVO.getMovingAvgTaxDdctPrc());
                                    itemInfoVO.setMovingAvgTaxDdctAmt(Math.round(refOrgVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                                }
                            }
                        
                           
                            itemInfoVO.setSaleTaxDdctPrc(Math.round(itemInfoVO.getSalePrc() / (1 + taxRate) * 100.0)/100.0);
                            itemInfoVO.setSaleTaxDdctAmt(Math.round((itemInfoVO.getSalePrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 끝(수불테이블의 STD_PRC는 사용하지 않는다. 2016-09-06기준)
                             ********************************************************************/

                            if( "41".equals(movementTypeVO.getMvtTp()) || "43".equals(movementTypeVO.getMvtTp()) || "45".equals(movementTypeVO.getMvtTp())  || "47".equals(movementTypeVO.getMvtTp()) ||
                            		"65".equals(movementTypeVO.getMvtTp()) || "61".equals(movementTypeVO.getMvtTp())) {//销售出库
                          	  //获取库存成本金额
                                stockAmt = itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty();
                                stockTaxDdctAmt = itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty();
                            }else if("48".equals(movementTypeVO.getMvtTp())) {
                            	  stockAmt = itemInfoVO.getSaleAmt();
                            	  stockTaxDdctAmt = itemInfoVO.getSaleTaxDdctAmt();
                            }
                            else {
                          	  MvtDocItemVO mm = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                          	  stockAmt = mm.getMovingAvgPrc() * itemInfoVO.getItemQty();
                          	  stockTaxDdctAmt = getBigDecimal(mm.getMovingAvgPrc()/(1+taxRate))*itemInfoVO.getItemQty();
                            }
                        }
                    }else{

                        if(movementTypeVO.getProcessTp().equals("T")){
                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                             * [searchFrItemMovingAvgPrcVO]: 출고되는 창고 . 총수량 감소한다.(이평가로)
                             * [searchToItemMovingAvgPrcVO]: 입고되는 창고 . 총수량 증가한다.(이평가로)
                             ********************************************************************/
                            //취소 시 출고 창고 이평가()
                            searchFrItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchFrItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getFrStrgeCd()); //창고코드
                            searchFrItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            frItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchFrItemMovingAvgPrcVO);

                            //이동평균가격 정보가 존재하는 경우
                            if(frItemMovingAvgPrcVO != null){

                                frItemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                frItemMovingAvgPrcVO.setBefGenDt(frItemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                frItemMovingAvgPrcVO.setBefTotQty(frItemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                frItemMovingAvgPrcVO.setBefMovingAvgPrc(frItemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                frItemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                if(movementTypeVO.getMvtTp().equals("23") || movementTypeVO.getMvtTp().equals("24") || movementTypeVO.getMvtTp().equals("25") || movementTypeVO.getMvtTp().equals("26")){
                                    frItemMovingAvgPrcVO.setTotQty(frItemMovingAvgPrcVO.getTotQty());
                                }else{
                                    frItemMovingAvgPrcVO.setTotQty(frItemMovingAvgPrcVO.getTotQty() - Math.abs(itemInfoVO.getItemQty()));
                                }
                                refOrgVO = mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), itemInfoVO.getGiDocNo(), itemInfoVO.getGiDocLineNo(), "", "H");
                                StockInOutVO stockInOutVO3  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getFrStrgeCd(), itemInfoVO.getItemCd());
                                //获取库存成本金额
                                double samt = stockInOutVO3.getStockAmt();
                                stockAmt = samt - Math.abs(refOrgVO.getMovingAvgAmt());
                                if(movementTypeVO.getMvtTp().equals("22")) {
                                	frItemMovingAvgPrcVO.setMovingAvgPrc(frItemMovingAvgPrcVO.getTotQty() == 0 ? 0 : stockAmt/frItemMovingAvgPrcVO.getTotQty());//取消 需要计算成本价
                                }else {
                                	frItemMovingAvgPrcVO.setMovingAvgPrc(frItemMovingAvgPrcVO.getMovingAvgPrc());//取消 需要计算成本价
                                }
                                
                                if(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                    frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + vatInfoVO.getVatApplyRate()));
                                }else{
                                    frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                                }

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(frItemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
                                    throw processException("par.info.issueCheckMsg", lblList);
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{
                              //기타입고 확정 실패.
                                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(frItemMovingAvgPrcVO);

                            frItemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            frItemMovingAvgPrcVO.setTaxRate(vatInfoVO.getVatApplyRate());

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(frItemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
                                throw processException("par.info.issueCheckMsg", lblList);
                             }

                          

                            //移库取消 生成出入库单据 应是原来单价
                            itemFrInfoVO.setMovingAvgPrc(refOrgVO.getMovingAvgPrc());
                            itemFrInfoVO.setMovingAvgTaxDdctPrc(refOrgVO.getMovingAvgTaxDdctPrc());
                            itemFrInfoVO.setMovingAvgAmt(Math.round(refOrgVO.getMovingAvgPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            itemFrInfoVO.setMovingAvgTaxDdctAmt(Math.round(refOrgVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);

                            itemFrInfoVO.setSalePrc(refOrgVO.getSalePrc());
                            itemFrInfoVO.setSaleAmt(Math.round(refOrgVO.getSalePrc() * itemInfoVO.getItemQty() * 100.0)/100.0);


                            if(refOrgVO.getSaleTaxDdctPrc() == null || refOrgVO.getSaleTaxDdctPrc().equals("")){
                                itemFrInfoVO.setSaleTaxDdctPrc(Math.round((refOrgVO.getSalePrc() / (1 + taxRate)) * 100.0)/100.0);
                                itemFrInfoVO.setSaleTaxDdctAmt(Math.round((refOrgVO.getSalePrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                            }else{
                                itemFrInfoVO.setSaleTaxDdctPrc(Math.round(refOrgVO.getSaleTaxDdctPrc() * 100.0)/100.0);
                                itemFrInfoVO.setSaleTaxDdctAmt(Math.round(refOrgVO.getSaleTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            }
                            //itemFrInfoVO.setSalePrc(frItemMovingAvgPrcVO.getMovingAvgPrc());
                            //itemFrInfoVO.setSaleTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            //itemFrInfoVO.setSaleAmt(frItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            //itemFrInfoVO.setSaleTaxDdctAmt(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());

                            itemToInfoVO.setPurcPrc(refOrgVO.getSalePrc());
                            itemToInfoVO.setPurcAmt(Math.round(refOrgVO.getSalePrc() * itemInfoVO.getItemQty() * 100.0)/100.0);


                            if(refOrgVO.getSaleTaxDdctPrc() == null || refOrgVO.getSaleTaxDdctPrc().equals("")){
                                itemToInfoVO.setPurcTaxDdctPrc(Math.round((refOrgVO.getSalePrc() / (1 + taxRate)) * 100.0)/100.0);
                                itemToInfoVO.setPurcTaxDdctAmt(Math.round((refOrgVO.getSalePrc() / (1 + taxRate)) * itemInfoVO.getItemQty() * 100.0)/100.0);
                            }else{
                                itemToInfoVO.setPurcTaxDdctPrc(Math.round(refOrgVO.getSaleTaxDdctPrc() * 100.0)/100.0);
                                itemToInfoVO.setPurcTaxDdctAmt(Math.round(refOrgVO.getSaleTaxDdctPrc() * itemInfoVO.getItemQty() * 100.0)/100.0);
                            }
                            //itemToInfoVO.setPurcPrc(frItemMovingAvgPrcVO.getMovingAvgPrc());
                            //itemToInfoVO.setPurcTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            //itemToInfoVO.setPurcAmt(frItemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            //itemToInfoVO.setPurcTaxDdctAmt(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());



                            //취소 시 입고창고 이평가
                            searchToItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchToItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getToStrgeCd()); //창고코드
                            searchToItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            toItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchToItemMovingAvgPrcVO);
                            //此处是移库取消入库到旧仓库
                            //이동평균가격 정보가 존재하는 경우
                            if(toItemMovingAvgPrcVO != null){
                            	
                            	if( "22".equals(movementTypeVO.getMvtTp()) ) {//移库取消 入库到 旧仓库
                            		StockInOutVO stockInOutVO2  = stockInOutDAO.selectStockAmtByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), itemInfoVO.getToStrgeCd(), itemInfoVO.getItemCd());
                                    //获取库存成本金额
                                    double samt = stockInOutVO2.getStockAmt();
                                    stockAmt = samt + Math.abs(refOrgVO.getMovingAvgAmt());

                            	}else {
                                    stockAmt = (toItemMovingAvgPrcVO.getTotQty() * toItemMovingAvgPrcVO.getMovingAvgPrc()) + Math.abs(itemToInfoVO.getPurcAmt());

                            	}
                                if(stockAmt > 0){
                                    movingAvgPrc = stockAmt / (toItemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                }else{
                                    movingAvgPrc = toItemMovingAvgPrcVO.getMovingAvgPrc();
                                }

                                toItemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                                toItemMovingAvgPrcVO.setBefGenDt(toItemMovingAvgPrcVO.getGenDt()); //이전발생일자
                                toItemMovingAvgPrcVO.setBefTotQty(toItemMovingAvgPrcVO.getTotQty()); //이전 총수량
                                toItemMovingAvgPrcVO.setBefMovingAvgPrc(toItemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격
                                toItemMovingAvgPrcVO.setBefMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()); //이전이동평균가격(세금미포함)

                                if(movementTypeVO.getMvtTp().equals("23") || movementTypeVO.getMvtTp().equals("24") || movementTypeVO.getMvtTp().equals("25") || movementTypeVO.getMvtTp().equals("26")){
                                    toItemMovingAvgPrcVO.setTotQty(toItemMovingAvgPrcVO.getTotQty());
                                    toItemMovingAvgPrcVO.setMovingAvgPrc(toItemMovingAvgPrcVO.getMovingAvgPrc());
                                    if(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                        toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + vatInfoVO.getVatApplyRate()));
                                    }
                                }else{
                                    toItemMovingAvgPrcVO.setTotQty(toItemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                    toItemMovingAvgPrcVO.setMovingAvgPrc(movingAvgPrc);
                                    if(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                        toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + vatInfoVO.getVatApplyRate()));
                                    }
                                }

                                stockTaxDdctAmt = (toItemMovingAvgPrcVO.getTotQty() * toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc()) + Math.abs(itemToInfoVO.getPurcTaxDdctAmt());

                                if(stockTaxDdctAmt > 0){
                                    movingAvgTaxDdctPrc = stockTaxDdctAmt / (toItemMovingAvgPrcVO.getTotQty() + Math.abs(itemInfoVO.getItemQty()));
                                }else{
                                    movingAvgTaxDdctPrc = toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc();
                                }

                                movingAvgResultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(toItemMovingAvgPrcVO);

                                if(movingAvgResultCnt != 1){
                                    lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
                                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                                }

                              //이동평균가격 정보가 없는 경우
                            }else{
                                lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
                                throw processException("par.info.issueCheckMsg", lblList);
                            }

                            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(toItemMovingAvgPrcVO);

                            toItemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);
                            toItemMovingAvgPrcVO.setTaxRate(vatInfoVO.getVatApplyRate());

                            movingAvgResultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(toItemMovingAvgPrcVO);

                            if(movingAvgResultCnt != 1){
                                lblList[0] = messageSource.getMessage("par.lbl.movingAvgPrc", null, LocaleContextHolder.getLocale()); // 이동평균가
                                throw processException("par.info.issueCheckMsg", lblList);
                             }

                            itemToInfoVO.setMovingAvgPrc(refOrgVO.getMovingAvgPrc());
                            itemToInfoVO.setMovingAvgTaxDdctPrc(refOrgVO.getMovingAvgTaxDdctPrc());
                            itemToInfoVO.setMovingAvgAmt(refOrgVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemToInfoVO.setMovingAvgTaxDdctAmt(refOrgVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                             * 끝
                             ********************************************************************/
                        }else{
                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             ********************************************************************/
                            searchItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                            searchItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getStrgeCd()); //창고코드
                            searchItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                            //이동평균가격 정보가 존재하지 않는 경우
                            if(itemMovingAvgPrcVO == null){
                                itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                itemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                            }

                            itemInfoVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                            if(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                            }else{
                                itemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            }
                            itemInfoVO.setMovingAvgTaxDdctPrc(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc());
                            itemInfoVO.setMovingAvgAmt(itemMovingAvgPrcVO.getMovingAvgPrc() * itemInfoVO.getItemQty());
                            itemInfoVO.setMovingAvgTaxDdctAmt(itemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() * itemInfoVO.getItemQty());

                            /********************************************************************
                             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                             * 끝(수불테이블의 STD_PRC는 사용하지 않는다. 2016-09-06기준)
                             ********************************************************************/
                        }
                    }

                    //수불유형에 수불사유 필요유무가 'Y'인 경우
                    if(movementTypeVO.getMvtReasonReqsYn().equals("Y")){
                        if( (itemInfoVO.getMvtReasonCont() == null) || (itemInfoVO.getMvtReasonCont().isEmpty())){
                            //수불사유가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtReasonCont", null, LocaleContextHolder.getLocale())});
                        }
                    }

                    //수불유형의 프로세스 유형이 '이동'일 경우('이동'에 대한 코드 안정해짐. 아님 스페이스)
                    /*if(movementTypeVO.getProcessTp().equals("T")){
                       //아직 '이동'일 경우에 대한 체크로직 없음.

                        stockAmt = refInfoVO.getMovingAvgAmt();
                        stockTaxDdctAmt = (refInfoVO.getMovingAvgPrc() / (1 + taxRate)) * refInfoVO.getItemQty();
                    }*/

                    /*********************************************
                     * 품목정보 필수값 점검 종료
                     *********************************************/

                    /*********************************************
                     * 문서 품목정보 생성
                     *********************************************/

                        if(itemInfoVO.getItemQty() == null || itemInfoVO.getItemQty().equals("")){
                            //수량 정보가 없습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
                        }

                        /****************************************
                         * 단가 및 금액 셋팅
                         ***************************************/

                        /******************************
                         *
                         * 재고 테이블이 존재하지 않아 테이블 생성시 까지 막음.
                         *****************************/
                        //endingStockVO = endingStockService.selectEndingStockByKey(itemInfoVO.getDlrCd(), itemInfoVO.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd());

                      //존재하는 기말재고인 경우
                       // if(endingStockVO != null){
                       //     itemInfoVO.setStdPrc(endingStockVO.getStdPrc());
                       //     itemInfoVO.setStdAmt(endingStockVO.getStdPrc() * itemInfoVO.getItemQty());
                       // }else{
                          itemInfoVO.setStdPrc((double) 0);
                          itemFrInfoVO.setStdPrc((double) 0);
                          itemToInfoVO.setStdPrc((double) 0);

                          itemInfoVO.setStdAmt((double) 0);
                          itemFrInfoVO.setStdAmt((double) 0);
                          itemToInfoVO.setStdAmt((double) 0);
                          //From 창고가 출고창고 To창고가 입고창고

                       // }
                        //itemInfoVO.setStdPrc(stdPrc);
                        //itemInfoVO.setStdAmt(stdAmt);

                          /******************************
                           *
                           * 재고 테이블이 존재하지 않아 테이블 생성시 까지 막음.
                           *****************************/

                        /****************************************
                         * 단가 및 금액 셋팅 종료
                         ***************************************/


                        if(!movementTypeVO.getProcessTp().equals("T")){

                            /****************************************
                             * 차변대변구분 셋팅
                             ***************************************/
                            //재고가 증가하면 'S'
                            if(movementTypeVO.getStockCalcTp().equals("+")){
                                itemInfoVO.setDebitCreditDstinCd("S");

                            //재고가 감소하면 'H'
                            }else if(movementTypeVO.getStockCalcTp().equals("-")){
                                itemInfoVO.setDebitCreditDstinCd("H");
                            }else{
                                //차대변구분자가 없습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.debitCreditDstinCd", null, LocaleContextHolder.getLocale())});
                            }
                            /****************************************
                             * 차변대변구분 셋팅 종료
                             ***************************************/

                             /****************************************
                             * 수불유형의 프로세스 유형이 '이동'이 아닐 경우 셋팅 종료
                             ***************************************/
                             itemInfoVO.setAutoCreYn("N");

                            /*********************************************
                             * 재고처리 함수 호출
                             *********************************************/

                            // 재고처리 함수 이상 주석처리.

                             stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                             stockInOutCalcVO.setDlrCd(itemInfoVO.getDlrCd());
                             stockInOutCalcVO.setPltCd(itemInfoVO.getPltCd());
                             stockInOutCalcVO.setStrgeCd(itemInfoVO.getStrgeCd());
                             stockInOutCalcVO.setItemCd(itemInfoVO.getItemCd());
                             stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                             stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                             stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                             stockInOutCalcVO.setStockSt(movementTypeVO.getStockStatCd());
                             stockInOutCalcVO.setQty(itemInfoVO.getItemQty());
                             stockInOutCalcVO.setStockAmt(stockAmt);
                             stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                             stockInOutCalcVO.setCalcTp(movementTypeVO.getStockCalcTp());
                             stockInOutCalcVO.setRentType("");
                             stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);

                             stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                             //stockInOutResult = stockInOutService.multiSaveStockInOut(itemInfoVO.getDlrCd(), itemInfoVO.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), movementTypeVO.getStockStatCd(), itemInfoVO.getItemQty(), stockAmt, movementTypeVO.getStockCalcTp(), "",grtePrcChkYn);

                            if(stockInOutResult < 1){
                                 //재고 처리 중 오류 발생
                                throw processException("par.err.chkStockUpdate");
                            }


                            /*********************************************
                             * 재고처리 함수 호출 종료
                             *********************************************/

                            itemInsertCnt = itemInsertCnt + 1;
                            itemInfoVO.setMvtDocLineNo(itemInsertCnt);

                            //수불문서번호 셋팅
                            itemInfoVO.setMvtDocYyMm(mvtYYmm);
                            itemInfoVO.setMvtDocNo(mvtDocNo);
                            itemInfoVO.setRegUsrId(LoginUtil.getUserId());

                            //존재하는 수불인 경우
                            if(refInfoVO != null){
                                refInfoVO.setCancMvtDocYyMm(mvtYYmm);
                                refInfoVO.setCancMvtDocNo(mvtDocNo);
                                refInfoVO.setCancMvtDocLineNo(itemInsertCnt);
                                //기존 수불정보에 취소 수불정보를 반영한다.
                                mvtDocDAO.updateMvtDocInfoByCancel(refInfoVO);
                            }else{
                                // 참조정보가 존재하지 않습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.refDocNo", null, LocaleContextHolder.getLocale())});
                            }


                            itemSaveList.add(itemInfoVO);

                         //재고이동인 경우
                        }else{
                            //재고이동(가용 - 가용), 재고이동취소(가용 - 가용)이면서 입출고 창고가 같은 경우
                            if(movementTypeVO.getMvtTp().equals("21") ||movementTypeVO.getMvtTp().equals("22")){
                                if(itemInfoVO.getFrStrgeCd().equals(itemInfoVO.getToStrgeCd())){
                                    throw processException("par.err.chkStockMoveSameStrgeCd");
                                }

                                /********************************************************************
                                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                                 ********************************************************************/
                                /*
                                searchFrItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                                searchFrItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getFrStrgeCd()); //출고창고코드
                                searchFrItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                                frItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchFrItemMovingAvgPrcVO);

                                //이동평균가격 정보가 존재하지 않는 경우
                                if(frItemMovingAvgPrcVO == null){
                                    frItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                    frItemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                    frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                }

                                if(frItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                    if(frItemMovingAvgPrcVO.getMovingAvgPrc() > 0){
                                        frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(frItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                                    }else{
                                        frItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                    }
                                }*/


                                /*
                                searchToItemMovingAvgPrcVO.setItemCd(itemInfoVO.getItemCd()); //부품코드
                                searchToItemMovingAvgPrcVO.setStrgeCd(itemInfoVO.getToStrgeCd()); //입고창고코드
                                searchToItemMovingAvgPrcVO.setDlrCd(itemInfoVO.getDlrCd()); //딜러코드

                                toItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchToItemMovingAvgPrcVO);

                                //이동평균가격 정보가 존재하지 않는 경우
                                if(toItemMovingAvgPrcVO == null){
                                    toItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                                    toItemMovingAvgPrcVO.setMovingAvgPrc(0.0);
                                    toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                }

                                if(toItemMovingAvgPrcVO.getMovingAvgTaxDdctPrc() == 0){
                                    if(toItemMovingAvgPrcVO.getMovingAvgPrc() > 0){
                                        toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(toItemMovingAvgPrcVO.getMovingAvgPrc() / (1 + taxRate));
                                    }else{
                                        toItemMovingAvgPrcVO.setMovingAvgTaxDdctPrc(0.0);
                                    }
                                }*/


                                /********************************************************************
                                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                                 * 끝(수불테이블의 STD_PRC는 사용하지 않는다. 2016-09-06기준)
                                 ********************************************************************/

                            }else{
                                /*
                                itemFrInfoVO.setSalePrc(0.0);
                                itemFrInfoVO.setSaleTaxDdctPrc(0.0);
                                itemFrInfoVO.setMovingAvgPrc(0.0);
                                itemFrInfoVO.setMovingAvgTaxDdctPrc(0.0);
                                itemToInfoVO.setPurcPrc(0.0);
                                itemToInfoVO.setPurcTaxDdctPrc(0.0);
                                itemToInfoVO.setMovingAvgPrc(0.0);
                                itemToInfoVO.setMovingAvgTaxDdctPrc(0.0);
                                itemFrInfoVO.setSaleAmt(0.0);
                                itemFrInfoVO.setSaleTaxDdctAmt(0.0);
                                itemFrInfoVO.setMovingAvgAmt(0.0);
                                itemFrInfoVO.setMovingAvgTaxDdctAmt(0.0);
                                itemToInfoVO.setPurcAmt(0.0);
                                itemToInfoVO.setPurcTaxDdctAmt(0.0);
                                itemToInfoVO.setMovingAvgAmt(0.0);
                                itemToInfoVO.setMovingAvgTaxDdctAmt(0.0);
                                */
                            }

                            itemInsertCnt = itemInsertCnt + 1;
                            itemFrInfoVO.setMvtDocLineNo(itemInsertCnt);

                            //수불문서번호 셋팅
                            itemFrInfoVO.setMvtDocYyMm(mvtYYmm);
                            itemFrInfoVO.setMvtDocNo(mvtDocNo);
                            itemFrInfoVO.setRegUsrId(LoginUtil.getUserId());

                            itemInsertCnt = itemInsertCnt + 1;
                            itemToInfoVO.setMvtDocLineNo(itemInsertCnt);

                            //수불문서번호 셋팅
                            itemToInfoVO.setMvtDocYyMm(mvtYYmm);
                            itemToInfoVO.setMvtDocNo(mvtDocNo);
                            itemToInfoVO.setRegUsrId(LoginUtil.getUserId());

                            itemFrInfoVO.setPltCd(itemInfoVO.getPltCd());
                            itemToInfoVO.setPltCd(itemInfoVO.getPltCd());

                            itemFrInfoVO.setDlrCd(itemInfoVO.getDlrCd());
                            itemToInfoVO.setDlrCd(itemInfoVO.getDlrCd());

                            itemFrInfoVO.setStrgeCd(itemInfoVO.getFrStrgeCd());
                            itemToInfoVO.setStrgeCd(itemInfoVO.getToStrgeCd());

                            itemFrInfoVO.setLocCd(itemInfoVO.getLocCd());
                            itemToInfoVO.setLocCd(itemInfoVO.getLocCd());

                            itemFrInfoVO.setCancStmtYn("N");
                            itemToInfoVO.setCancStmtYn("N");

                            itemFrInfoVO.setItemCd(itemInfoVO.getItemCd());
                            itemToInfoVO.setItemCd(itemInfoVO.getItemCd());

                            itemFrInfoVO.setItemQty(itemInfoVO.getItemQty());
                            itemToInfoVO.setItemQty(itemInfoVO.getItemQty());

                            itemFrInfoVO.setItemUnitCd(itemInfoVO.getItemUnitCd());
                            itemToInfoVO.setItemUnitCd(itemInfoVO.getItemUnitCd());

                            itemFrInfoVO.setRefDocNo(itemInfoVO.getRefDocNo());
                            itemToInfoVO.setRefDocNo(itemInfoVO.getRefDocNo());

                            itemFrInfoVO.setRefDocLineNo(itemInfoVO.getRefDocLineNo());
                            itemToInfoVO.setRefDocLineNo(itemInfoVO.getRefDocLineNo());

                            itemFrInfoVO.setCurrCd(itemInfoVO.getCurrCd());
                            itemToInfoVO.setCurrCd(itemInfoVO.getCurrCd());

                            if(movementTypeVO.getMvtReasonReqsYn().equals("Y")){
                                itemFrInfoVO.setMvtReasonCont(itemInfoVO.getMvtReasonCont());
                                itemToInfoVO.setMvtReasonCont(itemInfoVO.getMvtReasonCont());
                            }

                            itemFrInfoVO.setDdlnYn("N");
                            itemToInfoVO.setDdlnYn("N");

                            /****************************************
                             * 차변대변구분 셋팅
                             ***************************************/
                            if(!movementTypeVO.getMvtTp().equals("22")){
                                if(movementTypeVO.getCancMvtYn().equals("N")){
                                    //출고창고가 (-)
                                    itemFrInfoVO.setDebitCreditDstinCd("H");
                                    //입고창고가 (+)
                                    itemToInfoVO.setDebitCreditDstinCd("S");
                                }else if(movementTypeVO.getCancMvtYn().equals("Y")){
                                    //출고창고가 (+)
                                    itemFrInfoVO.setDebitCreditDstinCd("S");
                                    //입고창고가 (-)
                                    itemToInfoVO.setDebitCreditDstinCd("H");
                                }
                            }else{
                                //재고이동인 경우 +- 개념이 아닌 취소 시 반대로 입출고가 일어나는 방식임
                                if(movementTypeVO.getCancMvtYn().equals("Y")){
                                    //출고창고(-)
                                    itemFrInfoVO.setDebitCreditDstinCd("H");
                                    //입고창고가(+)
                                    itemToInfoVO.setDebitCreditDstinCd("S");
                                }
                            }

                            /****************************************
                             * 차변대변구분 셋팅 종료
                             ***************************************/


                            /****************************************
                             * 수불유형의 프로세스 유형이 '이동'일 경우 셋팅 종료
                             ***************************************/
                            itemFrInfoVO.setAutoCreYn("N");

                            /*********************************************
                             * 재고처리 함수 호출
                             *********************************************/


                            // 재고처리 함수 이상 주석처리.
                            if(movementTypeVO.getCancMvtYn().equals("N")){

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemFrInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemFrInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemFrInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemFrInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setStockSt("01");
                                stockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("-");

                                if(movementTypeVO.getMvtTp().equals("21")){

                                    stockInOutCalcVO.setStockAmt(itemToInfoVO.getMovingAvgAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt(itemToInfoVO.getMovingAvgTaxDdctAmt());
                                    stockInOutCalcVO.setRentType("");

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), itemFrInfoVO.getSaleAmt(), "-", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("23")){//예류인 경우 가용재고 '0'될 때 재고금액이 '0'처리되지 않도록 rentType항목에 'X'값전달

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);
                                    stockInOutCalcVO.setRentType("X");

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "-", "X",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("25")){//보류인 경우 가용재고 '0'될 때 재고금액이 '0'처리되지 않도록 rentType항목에 'X'값전달

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);
                                    stockInOutCalcVO.setRentType("X");


                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "-", "X",grtePrcChkYn);
                                }

                            }else{

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemFrInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemFrInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemFrInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemFrInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setStockSt("01");
                                stockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("-");
                                stockInOutCalcVO.setRentType("");

                                if(movementTypeVO.getMvtTp().equals("22")){

                                    stockInOutCalcVO.setStockAmt(itemFrInfoVO.getMovingAvgAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt(itemFrInfoVO.getMovingAvgTaxDdctAmt());


                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), itemFrInfoVO.getSaleAmt(), "+", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("24")){

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "+", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("26")){

                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "+", "",grtePrcChkYn);
                                }

                            }

                            if(stockInOutResult < 1){
                                //재고 처리 중 오류 발생
                                throw processException("par.err.chkStockUpdate");
                            }

                           /****************************************
                            * 수불유형의 프로세스 유형이 '이동'일 경우 셋팅 종료
                            ***************************************/
                            itemToInfoVO.setAutoCreYn("Y");

                            /*********************************************
                             * 재고처리 함수 호출
                             *********************************************/

                            // _start 재고처리 함수 이상 주석처리.
                            if(movementTypeVO.getCancMvtYn().equals("N")){

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemToInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemToInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemToInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemToInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setQty(itemToInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("+");
                                stockInOutCalcVO.setRentType("");

                                if(movementTypeVO.getMvtTp().equals("21")){

                                    stockInOutCalcVO.setStockSt("01");
                                    stockInOutCalcVO.setStockAmt(itemToInfoVO.getMovingAvgAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt(itemToInfoVO.getMovingAvgAmt());

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemToInfoVO.getItemQty(), itemToInfoVO.getPurcAmt(), "+", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("23")){

                                    stockInOutCalcVO.setStockSt("02");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "02", itemToInfoVO.getItemQty(), 0, "+", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("25")){

                                    stockInOutCalcVO.setStockSt("03");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "03", itemToInfoVO.getItemQty(), 0, "+", "",grtePrcChkYn);
                                }
                            }
                            //_end
                            else{

                                stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                                stockInOutCalcVO.setDlrCd(itemToInfoVO.getDlrCd());
                                stockInOutCalcVO.setPltCd(itemToInfoVO.getPltCd());
                                stockInOutCalcVO.setStrgeCd(itemToInfoVO.getStrgeCd());
                                stockInOutCalcVO.setItemCd(itemToInfoVO.getItemCd());
                                stockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                                stockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                                stockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                                stockInOutCalcVO.setQty(itemToInfoVO.getItemQty());
                                stockInOutCalcVO.setGrtePrcChkYn(grtePrcChkYn);
                                stockInOutCalcVO.setCalcTp("+");
                                stockInOutCalcVO.setRentType("");

                                if(movementTypeVO.getMvtTp().equals("22")){

                                    stockInOutCalcVO.setStockSt("01");
                                    stockInOutCalcVO.setStockAmt(itemFrInfoVO.getMovingAvgAmt());
                                    stockInOutCalcVO.setStockTaxDdctAmt(itemFrInfoVO.getMovingAvgTaxDdctAmt());


                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemToInfoVO.getItemQty(), itemToInfoVO.getMovingAvgAmt(), "-", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("24")){

                                    stockInOutCalcVO.setStockSt("02");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "02", itemToInfoVO.getItemQty(), 0, "-", "",grtePrcChkYn);
                                }else if(movementTypeVO.getMvtTp().equals("26")){

                                    stockInOutCalcVO.setStockSt("03");
                                    stockInOutCalcVO.setStockAmt(0);
                                    stockInOutCalcVO.setStockTaxDdctAmt(0);

                                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "03", itemToInfoVO.getItemQty(), 0, "-", "",grtePrcChkYn);
                                }
                            }


                            if(stockInOutResult < 1){
                                 //재고 처리 중 오류 발생
                                throw processException("par.err.chkStockUpdate");

                            }

                            itemSaveList.add(itemFrInfoVO);
                            itemSaveList.add(itemToInfoVO);
                        }

                    /*********************************************
                     * 문서 품목정보 생성 종료
                     *********************************************/

                }

                /*********************************************
                 * 수불문서 테이블 Insert
                 *********************************************/
                mvtVO.setMvtTp(movementTypeVO.getMvtTp());
                mvtDocDAO.insertMvtDoc(mvtVO);

                saveList = itemSaveList.size();
                for(i = 0; i < saveList; i = i+1){
                    mvtDocDAO.insertMvtDocItem(itemSaveList.get(i));
                }

                /*********************************************
                 * 수불문서 테이블 Insert 종료
                 *********************************************/


            //사용 안하는 수불유형인 경우
            }else{
                //수불 유형이 존재하지만 사용하지 않는 수불유형입니다.
                throw processException("par.err.chkMvtTypeUseYn");
            }

        //존재하지 않는 수불유형인 경우
        }else{
            //수불 유형이 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale())});
        }

        /*********************************************
         * 처리결과 Return
         *********************************************/
        return itemSaveList;
    }


    /*
    @Override
    public List<MvtDocItemVO> multiCnclMvtDocs(MvtDocVO mvtVO, List<MvtDocItemVO> list) throws Exception {
        int listLen          = list.size();
        int saveList         = 0;
        int stockInOutResult = 0;
        int i                = 0;

        String mvtDocNo = "";
        MvtDocItemVO itemInfoVO = new MvtDocItemVO();
        MvtDocItemVO refMovementItemInfoVO = new MvtDocItemVO();
        List<MvtDocItemVO> itemSaveList = new ArrayList<MvtDocItemVO>();



        //*********************************************
         * 수불유형 점검
        // *********************************************
        if( (mvtVO.getDlrCd() == null) || (mvtVO.getDlrCd().isEmpty())){
             //딜러정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
        }
        if( (mvtVO.getMvtTp() == null) || (mvtVO.getMvtTp().isEmpty())){
             //수불유형정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale())});
        }

        MovementTypeVO movementTypeVO = movementTypeService.selectMovementTypeByKey(mvtVO.getDlrCd(), mvtVO.getMvtTp());

        //존재하는 수불유형인 경우
        if(movementTypeVO != null){
            //사용 여부가 'Y'인경우
            if(movementTypeVO.getUseYn().equals("Y")){
                //역방향여부가 'N'인지
                if(movementTypeVO.getCancMvtYn().equals("N")){

                    //역방향여부가 'N'가 아닌지
                }else{
                     //취소수불문서는 취소 대상이 아닙니다.
                    throw processException("par.err.chkCnclForCnclMvtDoc");
                }

                //*********************************************
                 * 원 수불문서 점검
                // *********************************************
                for(i = 0; i < listLen; i = i+1){
                    itemInfoVO = list.get(i);

                    if( (itemInfoVO.getDlrCd() == null) || (itemInfoVO.getDlrCd().isEmpty())){
                         //딜러정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }
                    if( (itemInfoVO.getMvtDocYyMm() == null) || (itemInfoVO.getMvtDocYyMm().isEmpty())){
                         //수불년월 정보가 없습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtYm", null, LocaleContextHolder.getLocale())});
                    }
                    if( (itemInfoVO.getMvtDocNo() == null) || (itemInfoVO.getMvtDocNo().isEmpty())){
                         //수불문서번호가 없습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtNo", null, LocaleContextHolder.getLocale())});
                    }
                    if(itemInfoVO.getMvtDocLineNo() < 1){
                         //수불문서 라인번호 정보가 없습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtLineNo", null, LocaleContextHolder.getLocale())});
                    }

                    refMovementItemInfoVO = mvtDocDAO.selectMvtDocItem(itemInfoVO.getDlrCd(),itemInfoVO.getMvtDocYyMm(),itemInfoVO.getMvtDocNo(),itemInfoVO.getMvtDocLineNo());

                    if(refMovementItemInfoVO != null){
                        //이미 취소된 수불문서 정보인 경우
                        if(refMovementItemInfoVO.getCancStmtYn() == "Y"){
                             //이미 취소된 수불문서 정보입니다.
                            throw processException("par.err.alreadyCnclInfo", new String[]{messageSource.getMessage("par.lbl.mvtNo", null, LocaleContextHolder.getLocale())});
                        }
                        //이미 취소된 수불문서 정보인 경우
                        if(!((refMovementItemInfoVO.getCancMvtDocYyMm() == null) || (refMovementItemInfoVO.getCancMvtDocYyMm().isEmpty()))){
                             //이미 취소된 수불문서 정보입니다.
                            throw processException("par.err.alreadyCnclInfo", new String[]{messageSource.getMessage("par.lbl.mvtNo", null, LocaleContextHolder.getLocale())});
                        }
                        //이미 취소된 수불문서 정보인 경우
                        if(!((refMovementItemInfoVO.getCancMvtDocNo() == null) || (refMovementItemInfoVO.getCancMvtDocNo().isEmpty()))){
                             //이미 취소된 수불문서 정보입니다.
                            throw processException("par.err.alreadyCnclInfo", new String[]{messageSource.getMessage("par.lbl.mvtNo", null, LocaleContextHolder.getLocale())});
                        }
                        //이미 취소된 수불문서 정보인 경우
                        if(refMovementItemInfoVO.getCancMvtDocLineNo() > 0){
                             //이미 취소된 수불문서 정보입니다.
                            throw processException("par.err.alreadyCnclInfo", new String[]{messageSource.getMessage("par.lbl.mvtNo", null, LocaleContextHolder.getLocale())});
                        }
                    }else{
                         //원 수불 정보가 없습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.originMvtInfo", null, LocaleContextHolder.getLocale())});
                    }

                    //*********************************************
                     * 원 수불문서 점검 종료
                    // *********************************************

                    //*********************************************
                     * 문서 품목정보 생성
                    // *********************************************
                    /****************************************
                     * 차변대변구분 셋팅
                    // ***************************************
                    //재고가 증가하면 'S'
                    if(movementTypeVO.getStockCalcTp().equals("+")){
                        itemInfoVO.setDebitCreditDstinCd("S");

                        //재고가 감소하면 'H'
                    }else if(movementTypeVO.getStockCalcTp().equals("-")){
                        itemInfoVO.setDebitCreditDstinCd("H");
                    }else{
                         //차대변구분자가 없습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.debitCreditDstinCd", null, LocaleContextHolder.getLocale())});
                    }
                    //****************************************
                     * 차변대변구분 셋팅 종료
                    // ***************************************

                    //****************************************
                     * 수불유형의 프로세스 유형이 '이동'일 경우 셋팅
                     //***************************************
                    if(movementTypeVO.getProcessTp().equals("T")){
                        itemInfoVO.setAutoCreYn("Y");
                    }else{
                        itemInfoVO.setAutoCreYn("N");
                    }
                    /****************************************
                     * 수불유형의 프로세스 유형이 '이동'일 경우 셋팅 종료
                    // ***************************************

                    //*********************************************
                     * 재고처리 함수 호출
                    // *********************************************

                    // 재고처리함수 이상 주석처리
                    stockInOutResult = stockInOutService.multiSaveStockInOut(itemInfoVO.getDlrCd(), itemInfoVO.getPltCd(), itemInfoVO.getStrgeCd(), itemInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), movementTypeVO.getStockStatCd(), itemInfoVO.getItemQty(), movementTypeVO.getStockCalcTp());

                    if(stockInOutResult < 1){
                         //재고 처리 중 오류 발생
                        throw processException("par.err.chkStockUpdate");
                    }

                    //*********************************************
                     * 재고처리 함수 호출 종료
                    // *********************************************

                    itemSaveList.add(itemInfoVO);
                    //*********************************************
                     * 문서 품목정보 생성 종료
                     //*********************************************

                }

                //*********************************************
                 * 수불문서번호 채번
                 //*********************************************
                mvtDocNo = "1";//movementDocumentIdGnrService.makeId(null);

                //채번이 안된 경우
                if(mvtDocNo == null || mvtDocNo.isEmpty()){
                     //채번이 되지 않았습니다.
                    throw processException("global.err.emptyIdgenNo");
                }

                //채번정보가 이상할 경우
                if(mvtDocNo.length() < 5){
                    throw processException("global.err.emptyIdgenNo");
                }

                //*********************************************
                 * 수불문서번호 채번 종료
                // *********************************************


                //*********************************************
                 * 수불문서 테이블 Insert
                 //*********************************************
                mvtDocDAO.insertMvtDoc(mvtVO);

                saveList = itemSaveList.size();
                for(i = 0; i < saveList; i = i+1){
                    mvtDocDAO.insertMvtDocItem(itemSaveList.get(i));
                }

                //*********************************************
                 * 수불문서 테이블 Insert 종료
                 //*********************************************


                //사용 안하는 수불유형인 경우
            }else{
                 //수불 유형이 존재하지만 사용하지 않는 수불유형입니다.
                throw processException("par.err.chkMvtTypeUseYn");
            }

            //존재하지 않는 수불유형인 경우
        }else{
             //수불 유형이 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale())});
        }

        //*********************************************
         * 처리결과 Return
        // *********************************************
        return itemSaveList;
    }
    */


    @Override
    public int updateMvtDocInfoByCancel(MvtDocItemVO mvtDocItemVO) throws Exception {

        return mvtDocDAO.updateMvtDocInfoByCancel(mvtDocItemVO);
    }

    /*
    public MvtDocItemVO selectMvtDocItemByRefInfo(String dlrCd, String refDocNo, int refDocLineNo) throws Exception {

        return mvtDocDAO.selectMvtDocItemByRefInfo(dlrCd, refDocNo, refDocLineNo);
    };
    */


    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectMvtDocItemByDocRefInfo(java.lang.String, java.lang.String, int)
     */
    /*@Override
    public MvtDocItemVO selectMvtDocItemByDocRefInfo(String dlrCd, String refDocNo, int refDocLineNo, String mvtDocNo) throws Exception {

        return mvtDocDAO.selectMvtDocItemByDocRefInfo(dlrCd, refDocNo, refDocLineNo, mvtDocNo);
    }*/

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGrList(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */





    @Override
    public List<MvtDocItemVO> selectGrList(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGrList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectMvtDocItemByRefInfo(java.lang.String, java.lang.String, int, java.lang.String)
     */
    @Override
    public MvtDocItemVO selectMvtDocItemByRefInfo(String dlrCd, String refDocNo, int refDocLineNo, String mvtDocNo, String debitCreditDstinCd)
            throws Exception {
        return mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), refDocNo, refDocLineNo, mvtDocNo, debitCreditDstinCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectMvtDocItemByDocRefInfo(java.lang.String, java.lang.String, int, java.lang.String)
     */
    @Override
    public MvtDocItemVO selectMvtDocItemByDocRefInfo(String dlrCd, String refDocNo, int refDocLineNo, String mvtDocNo, String debitCreditDstinCd)
            throws Exception {
        return mvtDocDAO.selectMvtDocItemByDocRefInfo(LoginUtil.getDlrCd(), refDocNo, refDocLineNo, mvtDocNo, debitCreditDstinCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGrListCnt(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public int selectGrListCnt(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGrListCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGrListForDeleteCnt(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public int selectGrListForDeleteCnt(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGrListForDeleteCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGiList(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public List<MvtDocItemVO> selectGiList(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGiList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGiListCnt(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public int selectGiListCnt(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGiListCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGiListForDeleteCnt(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public int selectGiListForDeleteCnt(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGiListForDeleteCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGrGiSummaryByItemCd(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public List<MvtDocItemVO> selectGrGiSummaryByItemCd(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGrGiSummaryByItemCd(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGrGiSummary(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public MvtDocVO selectGrGiSummary(MvtDocSearchVO searchVO) throws Exception {

        return mvtDocDAO.selectGrGiSummary(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGrCostSummary(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public MvtDocVO selectPartsGrCostSummary(MvtDocSearchVO searchVO) throws Exception {
        return mvtDocDAO.selectPartsGrCostSummary(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectGiCostSummary(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public MvtDocVO selectPartsGiCostSummary(MvtDocSearchVO searchVO) throws Exception {
        return mvtDocDAO.selectPartsGiCostSummary(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectPartsSaleSummary(chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO)
     */
    @Override
    public MvtDocVO selectPartsSaleCostSummary(MvtDocSearchVO searchVO) throws Exception {
        return mvtDocDAO.selectPartsSaleCostSummary(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextMvtDocNo() throws Exception {
        try {
            return mvtDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.mvtNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        String jobType = "";
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        MvtDocSearchVO searchVO = new MvtDocSearchVO();

        List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();
        ArrayList<MvtDocItemVO> rsltList = new ArrayList<MvtDocItemVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        List<String> mvtTpLst = new ArrayList<String>();
        String sMvtTp;
        String[] arrayMvtPtStr;

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        searchVO.setsItemCd((String)params.get("sItemCd"));
        searchVO.setsItemNm((String)params.get("sItemNm"));
        searchVO.setsItemDstinCd((String)params.get("sItemDstinCd"));



        if (StringUtils.isNotEmpty((String)params.get("sMvtTpLst"))) {
            sMvtTp = (String)params.get("sMvtTpLst");
            arrayMvtPtStr = sMvtTp.split(",");
            mvtTpLst = Arrays.asList(arrayMvtPtStr);

            searchVO.setsMvtTpLst(mvtTpLst);
        }

        jobType = params.get("jobType").toString();
        List<CommonCodeVO> itemDstinList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd);
        HashMap<String, String> itemDstinMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : itemDstinList ){
            itemDstinMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        HashMap<String, String> storageMap = new HashMap<String, String>();
        for( StorageVO storageVO : storageList ){
            storageMap.put(storageVO.getStrgeCd(), storageVO.getStrgeNm());
        }

        searchVO.setsDlrCd(LoginUtil.getDlrCd());


        context.putVar("dlrCd",LoginUtil.getDlrCd());
        context.putVar("dlrNm",LoginUtil.getDlrNm());
        if(jobType.equals("grStatusListDownload")){
            searchVO.setsGrDocNo((String)params.get("sGrDocNo"));
            if (StringUtils.isNotEmpty((String)params.get("sGrDtFr"))) {
                searchVO.setsGrDtFr(DateUtil.convertToDate((String)params.get("sGrDtFr")));
            }
            if (StringUtils.isNotEmpty((String)params.get("sGrDtTo"))) {
                searchVO.setsGrDtTo(DateUtil.convertToDate((String)params.get("sGrDtTo")));
            }
             //list = mvtDocDAO.selectGrExcelList(searchVO);
             list = mvtDocDAO.selectGrList(searchVO);

        }else if(jobType.equals("giStatusListDownload")){
            searchVO.setsGiDocNo((String)params.get("sGiDocNo"));
            if (StringUtils.isNotEmpty((String)params.get("sGiDtFr"))) {
                searchVO.setsGiDtFr(DateUtil.convertToDate((String)params.get("sGiDtFr")));
            }
            if (StringUtils.isNotEmpty((String)params.get("sGiDtTo"))) {
                searchVO.setsGiDtTo(DateUtil.convertToDate((String)params.get("sGiDtTo")));
            }

            //list = mvtDocDAO.selectGiExcelList(searchVO);
            list = mvtDocDAO.selectGiList(searchVO);

        }

        for( MvtDocItemVO sResultVO : list ){

            sResultVO.setStrgeCd( storageMap.get(String.valueOf(sResultVO.getStrgeCd())));

            if(jobType.equals("grStatusListDownload")){
                String grDtString = DateUtil.convertToString(sResultVO.getGrDt(), dateFormat);
                sResultVO.setGrDtString(grDtString);
            }else if(jobType.equals("giStatusListDownload")){
                String giDtString = DateUtil.convertToString(sResultVO.getGiDt(), dateFormat);
                sResultVO.setGiDtString(giDtString);
            }

            rsltList.add(sResultVO);
        }

        context.putVar("items", rsltList);

    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MvtDocService#selectMvtDocItem(java.lang.String, java.lang.String, java.lang.String, int)
     */
    @Override
    public MvtDocItemVO selectMvtDocItem(String dlrCd, String mdocYm, String mdocNo, int mdocLineNo) {
        // TODO Auto-generated method stub
        return mvtDocDAO.selectMvtDocItem(dlrCd, mdocYm, mdocNo, mdocLineNo);
    }
    
    private double getBigDecimal(double amt) {
    	
    	return new BigDecimal(amt+"").setScale(2, java.math.BigDecimal.ROUND_HALF_UP).doubleValue();
    }
}
