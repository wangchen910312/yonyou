package chn.bhmc.dms.sal.acc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdItemVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.sal.acc.service.AccessoryMngService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryMngDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngVO;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.vo.ContractReGoodsVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;

/**
 * <pre>
 * 경품정보관리 서비스
 * </pre>
 *
 * @ClassName   : AccessoryMngServiceImpl
 * @Description : 경품판매관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("accessoryMngService")
public class AccessoryMngServiceImpl extends HService implements AccessoryMngService {

    /**
     * 경품판매관리 DAO 선언
     */
    @Resource(name="accessoryMngDAO")
    AccessoryMngDAO accessoryMngDAO;

    /**
     * 경품 Key 생성 id gen
     */
    @Resource(name="accessoryItemSalesIdGenService")
    TableIdGenService accessoryItemSalesIdGenService;

    /**
     * Part 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 계약 서비스
     */
    @Resource(name="contractMntService")
    private ContractMntService contractMntService;

    /**
     * 부품이동평균가격 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;


    /**
     * 경품판매관리 내역을 조회한다.
     */
    @Override
    public int selectAccessoryMngsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngsByConditionCnt(searchVO);
    }
    @Override
    public List<AccessoryMngVO> selectAccessoryMngsByCondition(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngsByCondition(searchVO);
    }


    /**
     * 경품판매관리 내역을 조회한다.
     */
    @Override
    public int selectAccessoryMngItemsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngItemsByConditionCnt(searchVO);
    }
    @Override
    public List<AccessoryMngItemVO> selectAccessoryMngItemsByCondition(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngItemsByCondition(searchVO);
    }

    /**
     * 경품판매관리 생성/저장 한다.
     */
    @Override
    public String multiAccessoryMngs(AccessoryMngSaveVO saveVO) throws Exception{
        String goodsContractNo = "";                        //오더번호
        AccessoryMngVO cntVO = saveVO.getGoodsMainVO();
        cntVO.setRegUsrId(LoginUtil.getUserId());           //생성자
        cntVO.setUpdtUsrId(LoginUtil.getUserId());          //수정자

        if( "".equals(cntVO.getGoodsContractNo() ) ){
            goodsContractNo = accessoryItemSalesIdGenService.getNextStringId();
            cntVO.setGoodsContractNo(goodsContractNo);

            //SA_0261T : 경품관리 헤더 저장
            accessoryMngDAO.insertAccessoryMng(cntVO);
        }else{
            goodsContractNo = cntVO.getGoodsContractNo();

            //SA_0261T : 경품관리 헤더 저장
            accessoryMngDAO.updateAccessoryMng(cntVO);
        }

        // SA_0262T : item
        for(AccessoryMngItemVO itemVO : saveVO.getInsertList()){
            itemVO.setDlrCd(LoginUtil.getDlrCd());
            itemVO.setGoodsContractNo(goodsContractNo);
            itemVO.setRegUsrId(LoginUtil.getUserId());
            itemVO.setUpdtUsrId(LoginUtil.getUserId());

            accessoryMngDAO.insertAccessoryMngItem(itemVO);
        }
        for(AccessoryMngItemVO itemVO : saveVO.getUpdateList()){
            itemVO.setRegUsrId(LoginUtil.getUserId());
            itemVO.setUpdtUsrId(LoginUtil.getUserId());
            accessoryMngDAO.updateAccessoryMngItem(itemVO);
        }
        for(AccessoryMngItemVO itemVO : saveVO.getDeleteList()){
            accessoryMngDAO.deleteAccessoryMngItem(itemVO);
        }

        // SA_0201T 계약에 용품내역 반영.
        if( cntVO.getSaleContractNo() != null && !"".equals(cntVO.getSaleContractNo()) && !saveVO.isContract()){

            // SA_0201T : 계약 헤더
            ContractReVO saleVO = new ContractReVO();
            saleVO.setContractNo(cntVO.getSaleContractNo());
            saleVO.setDlrCd( cntVO.getDlrCd() );
            saleVO.setGoodsAmt( cntVO.getCustPayAmt() );

            // SA_0204T : 계약 용품
            List<ContractReGoodsVO> cGoodsList = new ArrayList<ContractReGoodsVO>();
            ContractReGoodsVO cGoodsVO = null;

            AccessoryMngSearchVO itemSearchVO = new AccessoryMngSearchVO();
            itemSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            itemSearchVO.setsGoodsContractNo(cntVO.getGoodsContractNo());
            for(AccessoryMngItemVO itemVO : accessoryMngDAO.selectAccessoryMngItemsByCondition(itemSearchVO)){
                cGoodsVO = new ContractReGoodsVO();
                cGoodsVO.setDlrCd( itemVO.getDlrCd() );
                cGoodsVO.setContractNo( cntVO.getSaleContractNo() );
                cGoodsVO.setSeq( itemVO.getSeq() );
                cGoodsVO.setGoodsCd( itemVO.getGoodsCd() );
                cGoodsVO.setGoodsNm( itemVO.getGoodsNm() );
                cGoodsVO.setGoodsPrc( itemVO.getRetlPrc() );
                cGoodsVO.setGoodsCnt( itemVO.getGoodsCnt() );
                cGoodsVO.setGoodsAmt( itemVO.getSaleAmt() );
                cGoodsVO.setDcAmt( itemVO.getDcAmt() );
                cGoodsVO.setRealGoodsAmt( itemVO.getTotAmt() );
                cGoodsVO.setServiceYn("N");
                cGoodsVO.setDcRate( itemVO.getDcRate() );
                cGoodsVO.setPkgItemCd( itemVO.getPkgItemCd() );
                cGoodsVO.setGrStrgeCd( itemVO.getGrStrgeCd() );
                cGoodsVO.setGiStrgeCd( itemVO.getGiStrgeCd() );
                cGoodsVO.setGoodsUnitCd( itemVO.getGoodsUnitCd() );
                cGoodsVO.setRegUsrId( LoginUtil.getUserId() );
                cGoodsVO.setUpdtUsrId( LoginUtil.getUserId() );
                cGoodsList.add(cGoodsVO);
            }
            contractMntService.contractGoodsApply(saleVO, cGoodsList);
        }
        return goodsContractNo;
    }

    /**
     * 용품 출고요청
     */
    @Override
    public String applyReq(AccessoryMngSaveVO saveVO) throws Exception{

        AccessoryMngVO cntVO = saveVO.getGoodsMainVO();
        cntVO.setRegUsrId(LoginUtil.getUserId());
        cntVO.setUpdtUsrId(LoginUtil.getUserId());

        AccessoryMngSearchVO itemSearchVO = new AccessoryMngSearchVO();
        itemSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        itemSearchVO.setsGoodsContractNo(cntVO.getGoodsContractNo());
        List<AccessoryMngItemVO>  aItemList = accessoryMngDAO.selectAccessoryMngItemsByCondition(itemSearchVO);

        List<PartsSaleOrdItemVO> partsItemList = new ArrayList<PartsSaleOrdItemVO>();
        PartsSaleOrdItemVO partsItemVO = null;

        for(AccessoryMngItemVO itemVO : aItemList){
            partsItemVO = new PartsSaleOrdItemVO();
            partsItemVO.setDlrCd( itemVO.getDlrCd() );
            partsItemVO.setParSaleOrdNo( itemVO.getGoodsContractNo() );
            partsItemVO.setParSaleOrdLineNo( itemVO.getSeq() );
            partsItemVO.setItemCd( itemVO.getGoodsCd() );
            partsItemVO.setUnitCd( itemVO.getGoodsUnitCd() );
            partsItemVO.setOrdQty( (double) itemVO.getGoodsCnt() );
            partsItemVO.setGiStrgeCd( itemVO.getGiStrgeCd() );
            partsItemVO.setPrc( itemVO.getRetlPrc() );
            partsItemVO.setAmt( itemVO.getTotAmt() );
            partsItemList.add(partsItemVO);
        }

        cnfmAccessorySaleOrd(partsItemList, saveVO.getGoodsMainVO());

        cntVO.setContractStatCd("20");      // 출고확정
        accessoryMngDAO.updateAccessoryMngStateCd(cntVO);

        return cntVO.getGoodsContractNo();
    }


    /**
     * 출고취소
     */
    @Override
    public String applyCancel(AccessoryMngSearchVO searchVO) throws Exception{

        if( StringUtils.isEmpty(searchVO.getsGoodsContractNo()) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        List<AccessoryMngVO> headList = accessoryMngDAO.selectAccessoryMngsByCondition(searchVO);

        if( headList == null || headList.size() == 0){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        // SA_0261T : 용품판매헤더 내역
        AccessoryMngVO cntVO = headList.get(0);

        if( !"20".equals(cntVO.getContractStatCd()) ){
            // [출고상태]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.giState", null, LocaleContextHolder.getLocale())});
        }

        if( cntVO.getSaleContractNo() != null && !"".equals(cntVO.getSaleContractNo())){
            ContractReSearchVO contSearchVO = new ContractReSearchVO();
            contSearchVO.setsContractNo( cntVO.getSaleContractNo() );
            contSearchVO.setsDlrCd( LoginUtil.getDlrCd() );
            List<ContractReVO>  contList = contractMntService.selectContractResByCondition(contSearchVO);

            if(contList !=null && contList.size() > 0 && "50".equals( contList.get(0).getContractStatCd() ) ){
                //고객인도처리가 완료된 계약건입니다.
                throw processException("sal.info.deliveryWarningMsg");
            }
        }

        // 수불 생성(기타출고 취소)
        MvtDocVO mvtDocVO = new MvtDocVO();
        MvtDocItemVO mvtDocItemVO = null;

        List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        //int    itemMovingAvgPrcSeq  = 0;
        //int    resultCnt            = 0;

        mvtDocVO.setMvtTp("71");  //판매출고

        if(cntVO.getContractCustTp().equals("01")){ //거래처 유형이 '01': 일반인경우
            mvtDocVO.setCustNo(cntVO.getContractCustNo());
            mvtDocVO.setBpCd(" ");
        }else if(cntVO.getContractCustTp().equals("02")){ //거래처 유형이 '02': 거래처인경우
            mvtDocVO.setBpCd(cntVO.getContractCustNo());
            mvtDocVO.setCustNo(" ");
        }


        // SA_0262T : 용품판매아이템 내역
        List<AccessoryMngItemVO> itemList = accessoryMngDAO.selectAccessoryMngItemsByCondition(searchVO);

        double qty             = 0;

        // 4. 기타출고 부품정보를 생성한다.
        for(int i = 0; i < itemList.size(); i++){
            mvtDocItemVO = new MvtDocItemVO();

            qty = itemList.get(i).getGoodsCnt();

            if( qty <= 0 ){
                //수량이 0보다 작거나 같을 수 없습니다
                throw processException("global.err.chkZeroQty");
            }

            /********************************************************************
             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
             ********************************************************************/
            /*
            searchItemMovingAvgPrcVO.setItemCd(itemList.get(i).getGoodsCd()); //부품코드
            searchItemMovingAvgPrcVO.setStrgeCd(itemList.get(i).getGiStrgeCd()); //창고코드
            searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

            //이동평균가격 정보가 존재하는 경우
            if(itemMovingAvgPrcVO != null){


                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(qty));
                itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                if(resultCnt != 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                }

              //이동평균가격 정보가 없는 경우
            }else{
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

            resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

            if(resultCnt != 1){
                //기타입고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
             }
             */


            /********************************************************************
             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
             * 끝
             ********************************************************************/

            if(i == 0){
                mvtDocVO.setMvtDocYyMm(itemList.get(i).getMvtDocYyMm());
                mvtDocVO.setMvtDocNo(itemList.get(i).getMvtDocNo());
            }

            mvtDocItemVO.setDlrCd(itemList.get(i).getDlrCd());
            mvtDocItemVO.setPltCd(LoginUtil.getPltCd());
            mvtDocItemVO.setCancStmtYn("Y");
            //mvtDocItemVO.setLocCd("");
            mvtDocItemVO.setItemCd(itemList.get(i).getGoodsCd());
            mvtDocItemVO.setItemUnitCd(itemList.get(i).getGoodsUnitCd());
            mvtDocItemVO.setItemQty(qty);
            mvtDocItemVO.setStrgeCd(itemList.get(i).getGiStrgeCd());
            mvtDocItemVO.setDdlnYn("N");
            mvtDocItemVO.setCurrCd("");
            mvtDocItemVO.setMvtReasonCont("精品取消");      // 용품취소
            mvtDocItemVO.setSalePrc(itemList.get(i).getRetlPrc());
            mvtDocItemVO.setSaleAmt(itemList.get(i).getTotAmt());
            mvtDocItemVO.setRefDocNo(itemList.get(i).getMvtDocNo());
            mvtDocItemVO.setRefDocLineNo(itemList.get(i).getMvtDocLineNo());

            mvtItemList.add(mvtDocItemVO);

        }

        List<MvtDocItemVO> mvtSaveItemList = mvtDocService.multiCnclMvtDocs(mvtDocVO, mvtItemList);

        if(mvtSaveItemList.size() < 1){
            //기타출고부품의 출고 확정이 처리되지 않았습니다.
           throw processException("par.err.failedEtcIssueMsg");
        }

        cntVO.setContractStatCd("10");                  // 저장상태
        cntVO.setUpdtUsrId( LoginUtil.getUserId() );
        accessoryMngDAO.updateAccessoryMngStateCd(cntVO);

        return searchVO.getsGoodsContractNo();
    }

    /**
     * 소매계약건의 경품내역을 삭제한다.
     */
    @Override
    public int deleteContractSaleAccessoryMngs(String contractNo)throws Exception{

        if( StringUtils.isEmpty(contractNo) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        AccessoryMngSearchVO searchVO = new AccessoryMngSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsSaleContractNo(contractNo);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<AccessoryMngVO> accList = accessoryMngDAO.selectAccessoryMngsByCondition(searchVO);

        for(AccessoryMngVO accVO : accList){
            accessoryMngDAO.deleteContractAccessoryMngItem(accVO);
            accessoryMngDAO.deleteContractAccessoryMngHeader(accVO);
        }
        return 1;
    }

    // 출고요청 : PartsSaleOrdService
    private void cnfmAccessorySaleOrd(List<PartsSaleOrdItemVO> list, AccessoryMngVO partsSaleOrdVO) throws Exception {
        int    resultCnt       = 0;
        String pltCd  = LoginUtil.getPltCd();
        String userId = LoginUtil.getUserId();
        String dlrCd  = LoginUtil.getDlrCd();

        // 수불 생성(판매출고)
        MvtDocVO mvtDocVO = new MvtDocVO();
        MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

        List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
        List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        //int    itemMovingAvgPrcSeq  = 0;

        mvtDocVO.setMvtTp("71");  //판매출고

        if(partsSaleOrdVO.getContractCustTp().equals("01")){ //거래처 유형이 '01': 일반인경우
            mvtDocVO.setCustNo(partsSaleOrdVO.getContractCustNo());
            mvtDocVO.setBpCd(" ");
        }else if(partsSaleOrdVO.getContractCustTp().equals("02")){ //거래처 유형이 '02': 거래처인경우
            mvtDocVO.setBpCd(partsSaleOrdVO.getContractCustNo());
            mvtDocVO.setCustNo(" ");
        }


        if( (partsSaleOrdVO.getContractCustTp() == null) || (partsSaleOrdVO.getContractCustTp().isEmpty())){
            //고객유형정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }

        if( (partsSaleOrdVO.getContractCustNm() == null) || (partsSaleOrdVO.getContractCustNm().isEmpty())){
            //고객정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale())});
        }

        if( (partsSaleOrdVO.getCarBrandCd() == null) || (partsSaleOrdVO.getCarBrandCd().isEmpty())){
            //브랜드가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.brand", null, LocaleContextHolder.getLocale())});
        }

        /*
        if( (partsSaleOrdVO.getSalePrsnId() == null) || (partsSaleOrdVO.getSalePrsnId().isEmpty())){
            //담당자정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prsNm", null, LocaleContextHolder.getLocale())});
        }
        */

        if( (partsSaleOrdVO.getGoodsAmt() == null) || (partsSaleOrdVO.getGoodsAmt() <= 0)){
            //할인전 총액이 0보다 작거나 같을 수 없습니다.
            throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.totAmtBefDc", null, LocaleContextHolder.getLocale())});
        }

        if( (partsSaleOrdVO.getPrenAmt() == null) || (partsSaleOrdVO.getAddPrenAmt() == null) || ( (partsSaleOrdVO.getPrenAmt() + partsSaleOrdVO.getAddPrenAmt())  < 0) ){
            //할인금액이 0보다 작을 수 없습니다.
            throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("sal.lbl.dcAmt", null, LocaleContextHolder.getLocale())});
        }

        if( (partsSaleOrdVO.getCustPayAmt() == null) || (partsSaleOrdVO.getCustPayAmt() <= 0)){
            //총금액이 0보다 작을 수 없습니다.
            throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.totAmt", null, LocaleContextHolder.getLocale())});
        }


        // 4. 부품판매 부품정보를 수정한다.(완료수량 셋팅)
        for(int i = 0; i < list.size(); i++){
            mvtDocItemVO = new MvtDocItemVO();

            /*  부품 상태 아직 사용안함(정의안됨)
            if( (list.get(i).getItemStatCd() == null) || (list.get(i).getItemStatCd().isEmpty())){
                //부품상태정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
            }*/

            if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                //부품정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
            }


            if( (list.get(i).getGiStrgeCd() == null) || (list.get(i).getGiStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }

            /********************************************************************
             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
             ********************************************************************/
            /*
            searchItemMovingAvgPrcVO.setItemCd(list.get(i).getItemCd()); //부품코드
            searchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getGiStrgeCd()); //창고코드
            searchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

            //이동평균가격 정보가 존재하는 경우
            if(itemMovingAvgPrcVO != null){


                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(list.get(i).getOrdQty()));
                itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                if(resultCnt != 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                }

              //이동평균가격 정보가 없는 경우
            }else{
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

            resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

            if(resultCnt != 1){
                //기타입고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
             }
             */

            /********************************************************************
             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
             * 끝
             ********************************************************************/



            /**********************************
             * 수불정보 생성 셋팅
             *********************************/
            mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
            mvtDocItemVO.setPltCd(pltCd);
            mvtDocItemVO.setCancStmtYn("N");
            mvtDocItemVO.setLocCd(list.get(i).getGiLocCd());
            mvtDocItemVO.setItemCd(list.get(i).getItemCd());
            mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
            mvtDocItemVO.setItemQty(list.get(i).getOrdQty());
            mvtDocItemVO.setStrgeCd(list.get(i).getGiStrgeCd());
            mvtDocItemVO.setDdlnYn("N");
            mvtDocItemVO.setCurrCd("");
            mvtDocItemVO.setSalePrc(list.get(i).getPrc());
            mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
            mvtDocItemVO.setRefDocNo(list.get(i).getParSaleOrdNo());
            mvtDocItemVO.setRefDocLineNo(list.get(i).getParSaleOrdLineNo());
            /**********************************
             * 수불정보 생성 셋팅
             *********************************/

            mvtItemList.add(mvtDocItemVO);
        }

        mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

        if(mvtSaveItemList.size() < 1){
            //출고 확정이 처리되지 않았습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
        }

        //생성된 수불 정보를 내역에 반영한다.
        PartsSaleOrdItemVO mvtPartsSaleOrdItemVO = null;
        for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
            mvtPartsSaleOrdItemVO = new PartsSaleOrdItemVO();

            mvtPartsSaleOrdItemVO.setDlrCd(dlrCd);
            mvtPartsSaleOrdItemVO.setRegUsrId(userId);
            mvtPartsSaleOrdItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
            mvtPartsSaleOrdItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
            mvtPartsSaleOrdItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

            //toolGiVO.getToolGiTp()

            mvtPartsSaleOrdItemVO.setParSaleOrdNo(mvtSaveItemList.get(i).getRefDocNo());
            mvtPartsSaleOrdItemVO.setParSaleOrdLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

            //resultCnt = partsSaleOrdDAO.updateParSaleOrdItemMvtInfo(mvtPartsSaleOrdItemVO);
            // 용품 출고확정 시 수불 정보를 반영한다.
            resultCnt = accessoryMngDAO.updateAccessorySaleOrdItemMvtInfo(mvtPartsSaleOrdItemVO);

            if(resultCnt < 1){
                //기타출고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }
        }
    }


    /**
     * 용품할인레벨을 조회한다.
     */
    @Override
    public List<AccessoryMngVO> selectDlrGoodsDcLevel(AccessoryMngSearchVO searchVO) throws Exception{

        ContractReSearchVO contSearch = new ContractReSearchVO();
        contSearch.setsDlrCd(LoginUtil.getDlrCd());
        contSearch.setsContractNo(searchVO.getsSaleContractNo());
        List<ContractReVO> contList = contractMntService.selectContractResByCondition(contSearch);

        if(contList == null || contList.size() == 0){
            //계약정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.contractInfo", null, LocaleContextHolder.getLocale())});
        }

        searchVO.setsPrenSumAmt( searchVO.getsPrenSumAmt() + (contList.get(0).getDlrPromotionAmt() == null ? 0 : contList.get(0).getDlrPromotionAmt()) );
        searchVO.setsCarlineCd(contList.get(0).getCarlineCd());
        searchVO.setsModelCd(contList.get(0).getModelCd());
        searchVO.setsOcnCd(contList.get(0).getOcnCd());

        return accessoryMngDAO.selectDlrGoodsDcLevel(searchVO);
    }

}
