package chn.bhmc.dms.par.ism.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.dao.IssuePartsOutDetailDAO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailItemVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

/**
 * 부품출고 품목 구현 클래스
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
@Service("issuePartsOutDetailService")
public class IssuePartsOutDetailServiceImpl extends HService implements IssuePartsOutDetailService {

    @Resource(name="issuePartsOutDetailDAO")
    private IssuePartsOutDetailDAO issuePartsOutDetailDAO;

    /**
     * 부품출고 헤더 서비스
     */
    @Resource(name="issuePartsOutService")
    IssuePartsOutService issuePartsOutService;

    /**
     * 부품요청 헤더 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 부품요청상세 헤더 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /**
     * RO 헤더 서비스
     */
    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

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
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#insertIssuePartsOutDetail(chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO)
     */
    @Override
    public int insertIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO) throws Exception {
        issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsOutDetailVO.setRegUsrId(LoginUtil.getUserId());
        issuePartsOutDetailVO.setUpdtUsrId(LoginUtil.getUserId());
        return issuePartsOutDetailDAO.insertIssuePartsOutDetail(issuePartsOutDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#updateIssuePartsOutDetail(chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO)
     */
    @Override
    public int updateIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO) throws Exception {
        issuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsOutDetailVO.setUpdtUsrId(LoginUtil.getUserId());
        return issuePartsOutDetailDAO.updateIssuePartsOutDetail(issuePartsOutDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#deleteIssuePartsOutDetail(chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO)
     */
    @Override
    public int deleteIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO) throws Exception {
        return issuePartsOutDetailDAO.deleteIssuePartsOutDetail(issuePartsOutDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#selectIssuePartsOutDetailByKey(java.lang.String)
     */
    @Override
    public IssuePartsOutDetailVO selectIssuePartsOutDetailByKey(String dlrCd, String giDocNo, int giDocLineNo) throws Exception {
        return issuePartsOutDetailDAO.selectIssuePartsOutDetailByKey(dlrCd, giDocNo, giDocLineNo);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#selectIssuePartsOutDetailInfoByKey(java.lang.String, java.lang.String)
     */
    @Override
    public IssuePartsOutDetailItemVO selectIssuePartsOutDetailInfoByKey(String dlrCd, String itemCd) throws Exception {
        return issuePartsOutDetailDAO.selectIssuePartsOutDetailInfoByKey(dlrCd, itemCd);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#selectIssuePartsOutDetailsByCondition(chn.bhmc.dms.par.ism.vo.IssuePartsOutSearchVO)
     */
    @Override
    public List<IssuePartsOutDetailVO> selectIssuePartsOutDetailsByCondition(IssuePartsOutDetailSearchVO searchVO)
            throws Exception {
        return issuePartsOutDetailDAO.selectIssuePartsOutDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#selectIssuePartsOutDetailsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssuePartsOutSearchVO)
     */
    @Override
    public int selectIssuePartsOutDetailsByConditionCnt(IssuePartsOutDetailSearchVO searchVO) throws Exception {
        return issuePartsOutDetailDAO.selectIssuePartsOutDetailsByConditionCnt(searchVO);
    }

    public void checkMovingPriceInfo(IssuePartsOutDetailVO issuePartsOutDetailVO) throws Exception{

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

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
        searchItemMovingAvgPrcVO.setItemCd(issuePartsOutDetailVO.getItemCd()); //부품코드
        searchItemMovingAvgPrcVO.setStrgeCd(issuePartsOutDetailVO.getGiStrgeCd()); //창고코드
        searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

        //이동평균가격 정보가 존재하는 경우
        if(itemMovingAvgPrcVO != null){

            itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
            itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
            itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
            itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

            itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(issuePartsOutDetailVO.getGiQty()));
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

    public void checkMovingPriceInfo(IssueReqDetailVO issueReqDetailVO, boolean bPlusFlag) throws Exception{

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

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
        searchItemMovingAvgPrcVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd()); //창고코드
        searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

        itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

        //이동평균가격 정보가 존재하는 경우
        if(itemMovingAvgPrcVO != null){

            itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
            itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
            itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
            itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

            //이동평균수량 요청수량 계산
            if(bPlusFlag){//Plus
                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(issueReqDetailVO.getReqQty()));
            }else{//Minus
                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(issueReqDetailVO.getReqQty()));
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

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#multiIssuePartsOutDetails(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssuePartsOutDetails(BaseSaveVO<IssuePartsOutDetailVO> obj) throws Exception {


        /*
         * 정비수령 / 정비수령반품 처리 시
         *
         * 부품요청상세 1 / 출고문서헤더 1건 / 출고문서상세1건 / 수불정보 1 건 씩 추가 및 수정한다.
         *
         * */

        int rowCnt = 0;
        //수불처리 유/무
        boolean bMvtDocNoYn = false;

        MvtDocVO mvtVO = new MvtDocVO();                            // 수불 헤더 VO(판매출고)
        List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    // 수불 상세 VO 리스트(판매출고)

        // 유효성 Array
        String[] lblList = new String[1];
        // 부품출고 헤더 VO
        IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
        // 수불처리 헤더, 수불 상세 리스트 데이타 담기.
        for(IssuePartsOutDetailVO issuePartsOutDetailVO : obj.getUpdateList()){
            // 확정취소 아닐때 유효성 체크
            if(!"03".equals(issuePartsOutDetailVO.getGiDocStatCd())){
                //출고창고
                if(StringUtils.isEmpty(issuePartsOutDetailVO.getGiStrgeCd())){
                    lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale()); // 출고창고
                    throw processException("par.info.issueCheckMsg", lblList);
                }
                // 수불문서번호, 수불문서년월 정보 체크.
                if(rowCnt == 0 && StringUtils.isEmpty(issuePartsOutDetailVO.getMvtDocNo()) && StringUtils.isEmpty(issuePartsOutDetailVO.getMvtDocYyMm())){
                    bMvtDocNoYn = true;
                    //수불함수 헤더 정보 담기.
                    mvtVO.setMvtTp("11"); // 판매출고(가용) : 11, 판매출고취소(가용) : 12, 판매반품(가용) : 13, 판매출고예약 : 15
                    //고객정보.
                    mvtVO.setCustNo(issuePartsOutDetailVO.getCustCd());

                }
                // 수불상세 VO 생성.
                MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();
                // 수불상세 VO 데이타 담기.
                mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());

                if("03".equals(issuePartsOutDetailVO.getGiDocStatCd())){// 확정취소 일때
                    mvtDocItemVO.setCancStmtYn("Y");
                }else{// 확정 일때
                    mvtDocItemVO.setCancStmtYn("N");
                }

                /*
                 * 이동평균가 가격 확인.
                 * */
                checkMovingPriceInfo(issuePartsOutDetailVO);

                mvtDocItemVO.setLocCd(issuePartsOutDetailVO.getGiLocCd());
                mvtDocItemVO.setItemCd(issuePartsOutDetailVO.getItemCd());
                mvtDocItemVO.setItemNm(issuePartsOutDetailVO.getItemNm());
                mvtDocItemVO.setItemUnitCd(issuePartsOutDetailVO.getUnitCd());
                mvtDocItemVO.setItemQty(issuePartsOutDetailVO.getGiQty());
                mvtDocItemVO.setSalePrc(issuePartsOutDetailVO.getItemPrc());
                mvtDocItemVO.setSaleAmt(issuePartsOutDetailVO.getItemAmt());
                mvtDocItemVO.setStrgeCd(issuePartsOutDetailVO.getGiStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");

                list.add(mvtDocItemVO);

                rowCnt++;
            }
        }

        /*
         * 수불처리 시작
         */
        if(bMvtDocNoYn){
            //  판매출고(가용 or 예약) 호출
            mvtDocService.multiSaveMvtDocs(mvtVO, list);
        }
        /*
         * 수불처리 종료
         */

        // 줄번호 초기화
        rowCnt = 0;

        for(IssuePartsOutDetailVO baseIssuePartsOutDetailVO : obj.getUpdateList()){
            baseIssuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
            baseIssuePartsOutDetailVO.setRegUsrId(LoginUtil.getUserId());
            baseIssuePartsOutDetailVO.setUpdtUsrId(LoginUtil.getUserId());
            // 확정취소 일때
            if("03".equals(baseIssuePartsOutDetailVO.getGiDocStatCd())){
                issuePartsOutVO.setCancYn("Y");
            }else{// 확정 일때
                issuePartsOutVO.setCancYn("N");
            }

            if(rowCnt == 0){
                // 부품출고 헤더 VO 데이타 담기.
                issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
                issuePartsOutVO.setGiDocNo(baseIssuePartsOutDetailVO.getGiDocNo());
                issuePartsOutVO.setGiDocStatCd(baseIssuePartsOutDetailVO.getGiDocStatCd());
                issuePartsOutVO.setParReqDocNo(baseIssuePartsOutDetailVO.getParReqDocNo());
                issuePartsOutVO.setParGiTp(baseIssuePartsOutDetailVO.getParGiTp());
                issuePartsOutVO.setRoDocNo(baseIssuePartsOutDetailVO.getRoDocNo());
                issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());

                if(bMvtDocNoYn){
                    // 수불정보 데이타 담기.
                    issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                }
                else{
                    issuePartsOutVO.setMvtDocNo("");
                    issuePartsOutVO.setMvtDocYyMm("");
                }
            }

            if(bMvtDocNoYn){
                // 수불 상세 리스트
                for(MvtDocItemVO mvtDocItemVO : list){
                    // 수불 요청부품과 수불 처리부품과 같을 때
                    if(baseIssuePartsOutDetailVO.getItemCd().equals(mvtDocItemVO.getItemCd())){
                        baseIssuePartsOutDetailVO.setMvtDocNo(mvtDocItemVO.getMvtDocNo());
                        baseIssuePartsOutDetailVO.setMvtDocYyMm(mvtDocItemVO.getMvtDocYyMm());
                        baseIssuePartsOutDetailVO.setMvtDocLineNo(mvtDocItemVO.getMvtDocLineNo());
                    }
                }
            }
            else{
                baseIssuePartsOutDetailVO.setMvtDocNo("");
                baseIssuePartsOutDetailVO.setMvtDocYyMm("");
                baseIssuePartsOutDetailVO.setMvtDocLineNo(0);
            }

            /*
             *
             *  최종 구매요청 상세 수정 처리.
             *
             * */

            issuePartsOutDetailDAO.updateIssuePartsOutDetail(baseIssuePartsOutDetailVO);
            //  IssueReqDetail Update
            IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setParReqDocNo(baseIssuePartsOutDetailVO.getParReqDocNo());
            issueReqDetailVO.setParReqDocLineNo(baseIssuePartsOutDetailVO.getParReqDocLineNo());
            issueReqDetailVO.setParReqStatCd(baseIssuePartsOutDetailVO.getGiDocStatCd());
            issueReqDetailVO.setItemCd(baseIssuePartsOutDetailVO.getItemCd());
            issueReqDetailVO.setDbItemCd(baseIssuePartsOutDetailVO.getItemCd());
            issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);
            rowCnt++;
        }

        // 부품출고헤더,부품요청헤더,RO 상태 수정
        if(rowCnt > 0){
            // IssuePartsOut Header Update
            issuePartsOutService.updateIssuePartsOut(issuePartsOutVO);
            // IssueReqHeader Update
            IssueReqVO issueReqVO = new IssueReqVO();
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setParReqDocNo(issuePartsOutVO.getParReqDocNo());
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

            // giDocStatCd Cancel 03
            if("03".equals(issuePartsOutVO.getGiDocStatCd())){
                issueReqVO.setCancYn("Y");
                // RO Cancel Update
                RepairOrderVO repairOrderVO = new RepairOrderVO();
                repairOrderVO.setRoDocNo(issuePartsOutVO.getRoDocNo());
                repairOrderVO.setRoStatCd("10");// RO cancel : 10
                repairOrderVO.setCancReasonCd("");// code undefine
                repairOrderVO.setCancReasonCont(messageSource.getMessage("par.lbl.releaseComfCanc", null, LocaleContextHolder.getLocale()));    // message
                // RO Cancel Update
                repairOrderService.updateRepairOrder(repairOrderVO);

            }else{
                issueReqVO.setCancYn("N");
            }
            // IssueReqHeader Update action
            issueReqService.updateIssueReq(issueReqVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#multiIssueReqPartsOutDetails(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssueReqPartsOutDetails(BaseSaveVO<IssueReqDetailVO> obj) throws Exception {

        /*
         *  수불 출고확정 / 출고취소
         *
         * */

        int rowCnt = 0;                     //process Row Count
        boolean bMvtDocNoYn = false;        //MvtDocNoYn YN

        MvtDocVO mvtVO = new MvtDocVO();                            //MvtDoc Header VO
        List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    //MvtDocItemVO VO

        // validation message array
        String[] lblList = new String[1];
        // IssuePartsOutVO
        IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
        // 수불처리 헤더, 수불 상세 리스트 데이타 담기.
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            //수불상세 VO 생성.
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();
            //수불문서실행여부
            bMvtDocNoYn = true;

            //출고취소일때
            if(issueReqDetailVO.getParReqStatCd().equals("04") && !issueReqDetailVO.getMvtDocNo().equals("") && !issueReqDetailVO.getMvtDocYyMm().equals("")){
                /*
                 * 출고취소 시 판매출고(가용) 코드를 사용하고 취소구분을  'Y'로 처리한다.
                 * */
                mvtVO.setMvtTp("11"); // 판매출고(가용) : 11,
                mvtDocItemVO.setCancStmtYn("Y");// 취소구분

                /*
                 * 이동평균가 가격 확인.(Plus)
                 *
                 * */
                checkMovingPriceInfo(issueReqDetailVO, true);


            }else if(issueReqDetailVO.getParReqStatCd().equals("01") && issueReqDetailVO.getMvtDocNo().equals("") && issueReqDetailVO.getMvtDocYyMm().equals("")){//출고확정일때
                // 수불함수 헤더 정보 담기.
                mvtVO.setMvtTp("11"); // 판매출고(가용) : 11, 판매출고취소(가용) : 12
                mvtDocItemVO.setCancStmtYn("N");// 취소구분

                /*
                 * 이동평균가 가격 확인.(Minus)
                 *
                 * */
                checkMovingPriceInfo(issueReqDetailVO, false);
            }

            if(bMvtDocNoYn){
                // 출고창고
                if(StringUtils.isEmpty(issueReqDetailVO.getGiStrgeCd())){
                    lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale()); // 출고창고
                    throw processException("par.info.issueCheckMsg", lblList);
                }
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
                mvtDocItemVO.setItemQty(issueReqDetailVO.getReqQty());
                mvtDocItemVO.setStrgeCd(issueReqDetailVO.getGiStrgeCd());
                mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
                mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");

                list.add(mvtDocItemVO);

                rowCnt++;
            }

        }

        /*
         * 수불처리 시작
         */
        if(bMvtDocNoYn){
            //  판매출고(가용 or 예약) 호출
            mvtDocService.multiSaveMvtDocs(mvtVO, list);
        }
        /*
         * 수불처리 종료
         */

        // 줄번호 초기화
        rowCnt = 0;

        for(IssueReqDetailVO baseIssueReqDetailVO : obj.getUpdateList()){

            IssuePartsOutDetailVO baseIssuePartsOutDetailVO = new IssuePartsOutDetailVO();

            baseIssuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
            baseIssuePartsOutDetailVO.setGiDocNo(baseIssueReqDetailVO.getGiDocNo());
            baseIssuePartsOutDetailVO.setGiDocStatCd(baseIssueReqDetailVO.getGiDocStatCd());
            baseIssuePartsOutDetailVO.setGiDocLineNo(baseIssueReqDetailVO.getParReqDocLineNo());
            baseIssuePartsOutDetailVO.setParReqDocNo(baseIssueReqDetailVO.getParReqDocNo());
            baseIssuePartsOutDetailVO.setParGiTp(baseIssueReqDetailVO.getParGiTp());
            baseIssuePartsOutDetailVO.setParReqDocLineNo(baseIssueReqDetailVO.getParReqDocLineNo());
            baseIssuePartsOutDetailVO.setRoDocNo(baseIssueReqDetailVO.getRoDocNo());
            baseIssuePartsOutDetailVO.setRoDocLineNo(baseIssueReqDetailVO.getRoLineNo());
            baseIssuePartsOutDetailVO.setGiStrgeCd(baseIssueReqDetailVO.getGiStrgeCd());
            baseIssuePartsOutDetailVO.setGiLocCd(baseIssueReqDetailVO.getGiLocCd());
            baseIssuePartsOutDetailVO.setItemCd(baseIssueReqDetailVO.getItemCd());
            baseIssuePartsOutDetailVO.setItemNm(baseIssueReqDetailVO.getItemNm());
            baseIssuePartsOutDetailVO.setGiQty(baseIssueReqDetailVO.getReqQty());
            baseIssuePartsOutDetailVO.setUnitCd(baseIssueReqDetailVO.getUnitCd());
            baseIssuePartsOutDetailVO.setReqStrgeCd(baseIssueReqDetailVO.getReqStrgeCd());
            baseIssuePartsOutDetailVO.setMvtDocYyMm(baseIssueReqDetailVO.getMvtDocYyMm());
            baseIssuePartsOutDetailVO.setMvtDocNo(baseIssueReqDetailVO.getMvtDocNo());
            baseIssuePartsOutDetailVO.setMvtDocLineNo(baseIssueReqDetailVO.getMvtDocLineNo());
            baseIssuePartsOutDetailVO.setCustCd(baseIssueReqDetailVO.getCustCd());
            baseIssuePartsOutDetailVO.setCustNm(baseIssueReqDetailVO.getCustNm());
            baseIssuePartsOutDetailVO.setSerPrsnId(baseIssueReqDetailVO.getSerPrsnId());
            baseIssuePartsOutDetailVO.setCarNo(baseIssueReqDetailVO.getCarNo());
            baseIssuePartsOutDetailVO.setVinNo(baseIssueReqDetailVO.getVinNo());
            baseIssuePartsOutDetailVO.setCarlineCd(baseIssueReqDetailVO.getCarlineCd());
            baseIssuePartsOutDetailVO.setCarlineNm(baseIssueReqDetailVO.getCarlineNm());
            baseIssuePartsOutDetailVO.setRegUsrId(LoginUtil.getUserId());
            baseIssuePartsOutDetailVO.setUpdtUsrId(LoginUtil.getUserId());
            // 확정취소 일때
            if("03".equals(baseIssueReqDetailVO.getParReqStatCd())){
                issuePartsOutVO.setCancYn("Y");
            }else{// 확정 일때
                issuePartsOutVO.setCancYn("N");
            }

            if(rowCnt == 0){
                // 부품출고 헤더 VO 데이타 담기.
                issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
                issuePartsOutVO.setGiDocNo(baseIssuePartsOutDetailVO.getGiDocNo());
                issuePartsOutVO.setGiDocStatCd(baseIssuePartsOutDetailVO.getGiDocStatCd());
                issuePartsOutVO.setParReqDocNo(baseIssuePartsOutDetailVO.getParReqDocNo());
                issuePartsOutVO.setParGiTp(baseIssuePartsOutDetailVO.getParGiTp());
                issuePartsOutVO.setRoDocNo(baseIssuePartsOutDetailVO.getRoDocNo());
                issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());

                if(bMvtDocNoYn){
                    // 수불정보 데이타 담기.
                    issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                }
                else{
                    issuePartsOutVO.setMvtDocNo("");
                    issuePartsOutVO.setMvtDocYyMm("");
                }
            }

            if(bMvtDocNoYn){
                // 수불 상세 리스트
                for(MvtDocItemVO mvtDocItemVO : list){
                    // 수불 요청부품과 수불 처리부품과 같을 때
                    if(baseIssuePartsOutDetailVO.getItemCd().equals(mvtDocItemVO.getItemCd())){
                        baseIssuePartsOutDetailVO.setMvtDocNo(mvtDocItemVO.getMvtDocNo());
                        baseIssuePartsOutDetailVO.setMvtDocYyMm(mvtDocItemVO.getMvtDocYyMm());
                        baseIssuePartsOutDetailVO.setMvtDocLineNo(mvtDocItemVO.getMvtDocLineNo());
                    }
                }
            }
            else{

                baseIssuePartsOutDetailVO.setMvtDocNo("");
                baseIssuePartsOutDetailVO.setMvtDocYyMm("");
                baseIssuePartsOutDetailVO.setMvtDocLineNo(0);
            }

            // IssuePartsOutDetail Update
            issuePartsOutDetailDAO.updateIssuePartsOutDetail(baseIssuePartsOutDetailVO);
            //  IssueReqDetail Update
            issueReqDetailService.updateIssueReqDetail(baseIssueReqDetailVO);
            rowCnt++;
        }

        // 부품출고헤더,부품요청헤더,RO 상태 수정
        if(rowCnt > 0){
            // IssuePartsOut Header Update
            issuePartsOutService.updateIssuePartsOut(issuePartsOutVO);
            // IssueReqHeader Update
            IssueReqVO issueReqVO = new IssueReqVO();
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setParReqDocNo(issuePartsOutVO.getParReqDocNo());
            issueReqVO.setParReqStatCd(issuePartsOutVO.getGiDocStatCd());
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

            // giDocStatCd Cancel 03
            if("03".equals(issuePartsOutVO.getGiDocStatCd())){
                issueReqVO.setCancYn("Y");

                // RO Cancel Update
                RepairOrderVO repairOrderVO = new RepairOrderVO();
                repairOrderVO.setRoDocNo(issuePartsOutVO.getRoDocNo());
                repairOrderVO.setRoStatCd("10");        // RO cancel Status : 10
                repairOrderVO.setCancReasonCd("");      // RO 취소코드 미정의.
                repairOrderVO.setCancReasonCont(messageSource.getMessage("par.lbl.releaseComfCanc", null, LocaleContextHolder.getLocale()));    // message

                // RO Cancel Update
                repairOrderService.updateRepairOrder(repairOrderVO);

            }else{
                issueReqVO.setCancYn("N");
            }

            // IssueReqHeader Update action
            issueReqService.updateIssueReq(issueReqVO);
        }

    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#multiIssuePartsOutReturnDetails(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssuePartsOutReturnDetails(BaseSaveVO<IssuePartsOutDetailVO> obj) throws Exception {
        int rowCnt = 0;                     // 처리 행 수
        //int resultCnt = 0;
        boolean bMvtDocNoYn = false;        // 수불처리 유/무

        MvtDocVO mvtVO = new MvtDocVO();                            // 수불 헤더 VO(판매출고)
        List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    // 수불 상세 VO 리스트(판매출고)

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        //int    itemMovingAvgPrcSeq  = 0;

        // 유효성 Array
        String[] lblList = new String[1];
        // 부품출고 헤더 VO
        IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
        // 수불처리 헤더, 수불 상세 리스트 데이타 담기.
        for(IssuePartsOutDetailVO issuePartsOutDetailVO : obj.getUpdateList()){
            // 출고창고
            if(issuePartsOutDetailVO.getGiStrgeCd().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale()); // 출고창고
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 수불헤더문서 생성.
            if(rowCnt == 0){
                bMvtDocNoYn = true;
                // 수불함수 헤더 정보 담기.
                mvtVO.setMvtTp("13"); // 판매반품
                // 고객정보
                mvtVO.setCustNo(issuePartsOutDetailVO.getCustCd());

                /*
                 * 이동평균가 가격 확인.
                 * */
                //checkMovingPriceInfo(issuePartsOutDetailVO);
            }

            /********************************************************************
             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
             ********************************************************************/
            /*
            searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            searchItemMovingAvgPrcVO.setItemCd(issuePartsOutDetailVO.getItemCd()); //부품코드
            searchItemMovingAvgPrcVO.setStrgeCd(issuePartsOutDetailVO.getGiStrgeCd()); //창고코드
            searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

            //이동평균가격 정보가 존재하는 경우
            if(itemMovingAvgPrcVO != null){


                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(issuePartsOutDetailVO.getGiQty()));
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


            // 수불상세 VO 생성.
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();
            // 수불상세 VO 데이타 담기.
            mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());

            mvtDocItemVO.setLocCd(issuePartsOutDetailVO.getGiLocCd());
            mvtDocItemVO.setItemCd(issuePartsOutDetailVO.getItemCd());
            mvtDocItemVO.setItemNm(issuePartsOutDetailVO.getItemNm());
            mvtDocItemVO.setItemUnitCd(issuePartsOutDetailVO.getUnitCd());
            mvtDocItemVO.setItemQty(issuePartsOutDetailVO.getGiQty());
            mvtDocItemVO.setSalePrc(issuePartsOutDetailVO.getItemPrc());
            mvtDocItemVO.setSaleAmt(issuePartsOutDetailVO.getItemAmt());
            //mvtDocItemVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
            //mvtDocItemVO.setMovingAvgAmt(itemMovingAvgPrcVO.getMovingAvgPrc() * issuePartsOutDetailVO.getGiQty());
            mvtDocItemVO.setStrgeCd(issuePartsOutDetailVO.getGiStrgeCd());
            mvtDocItemVO.setRefDocNo(issuePartsOutDetailVO.getGiDocNo());
            mvtDocItemVO.setRefDocLineNo(issuePartsOutDetailVO.getGiDocLineNo());
            mvtDocItemVO.setDdlnYn("N");
            mvtDocItemVO.setCurrCd("");
            mvtDocItemVO.setMvtReasonCont("Retrun Parts");//반품사유
            mvtDocItemVO.setCancStmtYn("N");// 취소구분

            list.add(mvtDocItemVO);

            rowCnt++;

        }

        /*
         * 수불처리 시작
         */
        if(bMvtDocNoYn){
            //  판매반품 호출
            mvtDocService.multiSaveMvtDocs(mvtVO, list);
        }
        /*
         * 수불처리 종료
         */

        // 줄번호 초기화
        rowCnt = 0;

        for(IssuePartsOutDetailVO baseIssuePartsOutDetailVO : obj.getUpdateList()){
            baseIssuePartsOutDetailVO.setDlrCd(LoginUtil.getDlrCd());
            baseIssuePartsOutDetailVO.setRegUsrId(LoginUtil.getUserId());
            baseIssuePartsOutDetailVO.setUpdtUsrId(LoginUtil.getUserId());

            if(rowCnt == 0){
                // 부품출고 헤더 VO 데이타 담기.
                issuePartsOutVO.setDlrCd(LoginUtil.getDlrCd());
                issuePartsOutVO.setGiDocNo(baseIssuePartsOutDetailVO.getGiDocNo());
                issuePartsOutVO.setGiDocStatCd(baseIssuePartsOutDetailVO.getGiDocStatCd());
                issuePartsOutVO.setParReqDocNo(baseIssuePartsOutDetailVO.getParReqDocNo());
                issuePartsOutVO.setParGiTp(baseIssuePartsOutDetailVO.getParGiTp());
                issuePartsOutVO.setRoDocNo(baseIssuePartsOutDetailVO.getRoDocNo());
                issuePartsOutVO.setUpdtUsrId(LoginUtil.getUserId());

                if(bMvtDocNoYn){
                    // 수불정보 데이타 담기.
                    issuePartsOutVO.setMvtDocNo(mvtVO.getMvtDocNo());
                    issuePartsOutVO.setMvtDocYyMm(mvtVO.getMvtDocYyMm());
                }
                else{
                    issuePartsOutVO.setMvtDocNo("");
                    issuePartsOutVO.setMvtDocYyMm("");
                }
            }

            if(bMvtDocNoYn){
                // 수불 상세 리스트
                for(MvtDocItemVO mvtDocItemVO : list){
                    // 수불 요청부품과 수불 처리부품과 같을 때
                    if(baseIssuePartsOutDetailVO.getItemCd().equals(mvtDocItemVO.getItemCd())){
                        baseIssuePartsOutDetailVO.setMvtDocNo(mvtDocItemVO.getMvtDocNo());
                        baseIssuePartsOutDetailVO.setMvtDocYyMm(mvtDocItemVO.getMvtDocYyMm());
                        baseIssuePartsOutDetailVO.setMvtDocLineNo(mvtDocItemVO.getMvtDocLineNo());
                    }
                }
            }
            else{
                baseIssuePartsOutDetailVO.setMvtDocNo("");
                baseIssuePartsOutDetailVO.setMvtDocYyMm("");
                baseIssuePartsOutDetailVO.setMvtDocLineNo(0);
            }

            //  IssuePartsOutDetail Update
            issuePartsOutDetailDAO.updateIssuePartsOutDetail(baseIssuePartsOutDetailVO);
            //  IssueReqDetail Update
            IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setParReqDocNo(baseIssuePartsOutDetailVO.getParReqDocNo());
            issueReqDetailVO.setParReqDocLineNo(baseIssuePartsOutDetailVO.getParReqDocLineNo());
            issueReqDetailVO.setParReqStatCd(baseIssuePartsOutDetailVO.getGiDocStatCd());
            issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);
            rowCnt++;
        }

        // 부품출고헤더,부품요청헤더,RO 상태 수정
        if(rowCnt > 0){
            // IssuePartsOut Header Update
            issuePartsOutService.updateIssuePartsOut(issuePartsOutVO);
            // IssueReqHeader Update
            IssueReqVO issueReqVO = new IssueReqVO();
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setParReqDocNo(issuePartsOutVO.getParReqDocNo());
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

            // IssueReqHeader Update action
            issueReqService.updateIssueReq(issueReqVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService#selectIssuePartsOutDetailMaxGiDocNoByKey(chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO)
     */
    @Override
    public IssuePartsOutDetailVO selectIssuePartsOutDetailMaxGiDocNoByKey(IssuePartsOutDetailSearchVO searchVO)
            throws Exception {

        return issuePartsOutDetailDAO.selectIssuePartsOutDetailMaxGiDocNoByKey(searchVO);
    }


}
