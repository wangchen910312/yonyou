package chn.bhmc.dms.par.ism.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsResvService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.dao.IssuePartsResvDAO;
import chn.bhmc.dms.par.ism.vo.IssuePartsResvSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsResvVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;

/**
 * 부품예약 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 18.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issuePartsResvService")
public class IssuePartsResvServiceImpl extends HService implements IssuePartsResvService {

    @Resource(name="issuePartsResvDAO")
    private IssuePartsResvDAO issuePartsResvDAO;

    /**
     * 부품요청헤더 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 부품요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#insertIssuePartsResv(chn.bhmc.dms.par.ism.vo.IssuePartsResvVO)
     */
    @Override
    public int insertIssuePartsResv(IssuePartsResvVO issuePartsResvVO) throws Exception {
        issuePartsResvVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsResvVO.setPltCd(LoginUtil.getPltCd());
        issuePartsResvVO.setRegUsrId(LoginUtil.getUserId());
        issuePartsResvVO.setUpdtUsrId(LoginUtil.getUserId());
        return issuePartsResvDAO.insertIssuePartsResv(issuePartsResvVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#updateIssuePartsResv(chn.bhmc.dms.par.ism.vo.IssuePartsResvVO)
     */
    @Override
    public int updateIssuePartsResv(IssuePartsResvVO issuePartsResvVO) throws Exception {
        issuePartsResvVO.setDlrCd(LoginUtil.getDlrCd());
        issuePartsResvVO.setPltCd(LoginUtil.getPltCd());
        issuePartsResvVO.setUpdtUsrId(LoginUtil.getUserId());
        return issuePartsResvDAO.updateIssuePartsResv(issuePartsResvVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#deleteIssuePartsResv(chn.bhmc.dms.par.ism.vo.IssuePartsResvVO)
     */
    @Override
    public int deleteIssuePartsResv(IssuePartsResvVO issuePartsResvVO) throws Exception {
        return issuePartsResvDAO.deleteIssuePartsResv(issuePartsResvVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#multiIssuePartsResv(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssuePartsResves(BaseSaveVO<IssuePartsResvVO> obj) throws Exception {

        // 부품요청문서번호
        String sParReqDocNo = "";

        for(IssuePartsResvVO issuePartsResvVO : obj.getInsertList()){
            issuePartsResvVO.setDlrCd(LoginUtil.getDlrCd());
            issuePartsResvVO.setPltCd(LoginUtil.getPltCd());
            issuePartsResvVO.setRegUsrId(LoginUtil.getUserId());
            issuePartsResvVO.setUpdtUsrId(LoginUtil.getUserId());

            sParReqDocNo = issuePartsResvVO.getParReqDocNo();

            // 예약수량 추가
            issuePartsResvDAO.insertIssuePartsResv(issuePartsResvVO);

            // 부품요청상태 상태값 수정.
            IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setItemCd(issuePartsResvVO.getItemCd());
            issueReqDetailVO.setResvDocNo(issuePartsResvVO.getResvDocNo());
            issueReqDetailVO.setResvDocLineNo(issuePartsResvVO.getResvDocLineNo());
            issueReqDetailVO.setParReqDocNo(issuePartsResvVO.getParReqDocNo());
            issueReqDetailVO.setParReqStatCd("02"); // 상태 : 완료
            issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);

        }

        for(IssuePartsResvVO issuePartsResvVO : obj.getUpdateList()){

            IssuePartsResvSearchVO searchVO = new IssuePartsResvSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsPltCd(LoginUtil.getPltCd());
            searchVO.setsStrgeCd(issuePartsResvVO.getStrgeCd());
            searchVO.setsItemCd(issuePartsResvVO.getItemCd());
            searchVO.setsResvDocNo(issuePartsResvVO.getResvDocNo());
            searchVO.setsResvDocLineNo(issuePartsResvVO.getResvDocLineNo());

            String[] lblList = new String[2];

            // 구매요청수량 체크.
            if(issuePartsResvVO.getResvQty() > issuePartsResvVO.getReqQty()){//구매요청수량(예약수량) > 요청수량
                lblList[0] = messageSource.getMessage("par.lbl.purcReqQty", null, LocaleContextHolder.getLocale());     //구매요청수량
                lblList[1] = messageSource.getMessage("par.lbl.reqQty", null, LocaleContextHolder.getLocale());         //요청수량
                // 구매요청수량이 요청수량보다 큽니다.
                throw processException("par.info.itemReqCntMsg", lblList);
            }

            if(issuePartsResvVO.getResvQty() == 0){
                lblList[0] = messageSource.getMessage("par.lbl.purcReqQty", null, LocaleContextHolder.getLocale());     //구매요청수량
                lblList[1] = "0";
                //구매요청수량은  0보다 커야 합니다.
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }

            issuePartsResvVO.setDlrCd(LoginUtil.getDlrCd());
            issuePartsResvVO.setPltCd(LoginUtil.getPltCd());
            issuePartsResvVO.setRegUsrId(LoginUtil.getUserId());
            issuePartsResvVO.setUpdtUsrId(LoginUtil.getUserId());

            if(issuePartsResvDAO.selectIssuePartsResvesByConditionCnt(searchVO) > 0){
                issuePartsResvDAO.updateIssuePartsResv(issuePartsResvVO);
            }else{
                issuePartsResvDAO.insertIssuePartsResv(issuePartsResvVO);
            }

            // 부품요청상태 상태값 수정.
            IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
            issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqDetailVO.setItemCd(issuePartsResvVO.getItemCd());
            issueReqDetailVO.setResvDocNo(issuePartsResvVO.getResvDocNo());
            issueReqDetailVO.setResvDocLineNo(issuePartsResvVO.getResvDocLineNo());
            issueReqDetailVO.setParReqDocNo(issuePartsResvVO.getParReqDocNo());
            issueReqDetailVO.setParReqStatCd("02"); // 상태 : 완료
            issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);

            sParReqDocNo = issueReqDetailVO.getParReqDocNo();
        }

        for(IssuePartsResvVO issuePartsResvVO : obj.getDeleteList()){
            issuePartsResvDAO.deleteIssuePartsResv(issuePartsResvVO);

            sParReqDocNo = issuePartsResvVO.getParReqDocNo();
        }

        // 구매요청 상세 요청상태 체크.
        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsParReqDocNo(sParReqDocNo);
        issueReqSearchVO.setsParReqStatCd("01");    //상태 : 요청
        // 부품요청상태 요청 카운트 조회
        if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO) == 0){
            // 모든 부품상세 요청상태 완료 시 부품헤더 요청상태 완료 처리.
            IssueReqVO issueReqVO = new IssueReqVO();
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setParReqDocNo(sParReqDocNo);
            issueReqVO.setParReqStatCd("02");
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqService.updateIssueReq(issueReqVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#multiIssueReqDetailPartsResves(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssueReqDetailPartsResves(BaseSaveVO<IssueReqDetailVO> obj) throws Exception {

        int rowCnt = 0;                     // 처리 행 수
        boolean bMvtDocNoYn = false;        // 수불처리 유/무

        MvtDocVO mvtVO = new MvtDocVO();    // 수불 헤더 VO
        List<MvtDocItemVO> list = new ArrayList<MvtDocItemVO>();    // 수불 상세 VO 리스트

        // 부품요청문서번호
        String sParReqDocNo = "";

        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){

            String[] lblList = new String[2];

            //장면재고 유효성 체크.
            if(issueReqDetailVO.getTotStockQty() < issueReqDetailVO.getResvQty()){//장면재고 > 구매요청수량
                lblList[0] = messageSource.getMessage("par.lbl.purcReqQty", null, LocaleContextHolder.getLocale());     //구매요청수량
                lblList[1] = messageSource.getMessage("par.lbl.docStockQty", null, LocaleContextHolder.getLocale());    //장면재고
                // 구매요청수량이 장면재고보다 큽니다.
                throw processException("par.info.itemReqCntMsg", lblList);
            }

            //구매요청수량 체크.
            if(issueReqDetailVO.getResvQty() > issueReqDetailVO.getReqQty()){//구매요청수량 > 요청수량
                lblList[0] = messageSource.getMessage("par.lbl.purcReqQty", null, LocaleContextHolder.getLocale());     //구매요청수량
                lblList[1] = messageSource.getMessage("par.lbl.reqQty", null, LocaleContextHolder.getLocale());         //요청수량
                // 구매요청수량이 요청수량보다 큽니다.
                throw processException("par.info.itemReqCntMsg", lblList);
            }

            if(issueReqDetailVO.getResvQty() == 0){
                lblList[0] = messageSource.getMessage("par.lbl.purcReqQty", null, LocaleContextHolder.getLocale());    // 구매요청수량
                lblList[1] = "0";
                // 구매요청수량은  0보다 커야 합니다.
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }

            // 수불문서번호, 수불문서년월 정보 체크.
            if(rowCnt == 0){
                bMvtDocNoYn = true;

                //수불함수 헤더 정보 담기. 재고이동(가용=>예약) : 23, 재고이동취소(가용=>) : 24
                if("Y".equals(issueReqDetailVO.getCancYn())){
                    mvtVO.setMvtTp("24");
                }
                else{
                    mvtVO.setMvtTp("23");
                }

                if(StringUtils.isEmpty(mvtVO.getCustNo())){
                    //BMP 거래처 VO
                    VenderMasterVO venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

                    if(venderMasterVO != null){
                        //BMP 거래처 코드
                        mvtVO.setCustNo(venderMasterVO.getBpCd());
                    }else{
                        // BMP 거래처 코드
                        mvtVO.setCustNo("A10AA001");
                    }
                }
            }

            // 수불상세 VO 생성.
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();
            // 수불상세 VO 데이타 담기.
            mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
            mvtDocItemVO.setCancStmtYn(issueReqDetailVO.getCancYn());

            mvtDocItemVO.setLocCd(issueReqDetailVO.getGiStrgeCd());
            mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
            mvtDocItemVO.setItemNm(issueReqDetailVO.getItemNm());
            mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
            mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
            mvtDocItemVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
            mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getGiStrgeCd());             // 출고창고(필수)
            mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getGiStrgeCd());             // 입고창고(필수)
            mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
            mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
            mvtDocItemVO.setDdlnYn("N");
            mvtDocItemVO.setCurrCd("");

            list.add(mvtDocItemVO);

            rowCnt++;
        }

        // 수불처리
        if(bMvtDocNoYn)
        {
            mvtDocService.multiSaveMvtDocs(mvtVO, list);
        }

        for(IssueReqDetailVO baseIssueReqDetailVO : obj.getUpdateList()){

            /*
             * 부품예약 처리.
             * */

            // 부품예약 검색 VO 생성.
            IssuePartsResvSearchVO searchVO = new IssuePartsResvSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsPltCd(LoginUtil.getPltCd());
            searchVO.setsStrgeCd(baseIssueReqDetailVO.getGiStrgeCd());
            searchVO.setsItemCd(baseIssueReqDetailVO.getItemCd());
            searchVO.setsResvDocNo(baseIssueReqDetailVO.getResvDocNo());
            searchVO.setsResvDocLineNo(baseIssueReqDetailVO.getResvDocLineNo());

            // 부품예약 VO 생성.
            IssuePartsResvVO issuePartsResvVO = new IssuePartsResvVO();
            issuePartsResvVO.setDlrCd(LoginUtil.getDlrCd());
            issuePartsResvVO.setPltCd(LoginUtil.getPltCd());
            issuePartsResvVO.setStrgeCd(baseIssueReqDetailVO.getGiStrgeCd());
            issuePartsResvVO.setItemCd(baseIssueReqDetailVO.getItemCd());
            issuePartsResvVO.setResvDocNo(baseIssueReqDetailVO.getResvDocNo());
            issuePartsResvVO.setResvDocLineNo(baseIssueReqDetailVO.getResvDocLineNo());
            // 구매소요수량을 예약수량으로 대체.
            issuePartsResvVO.setResvQty(baseIssueReqDetailVO.getResvQty());
            issuePartsResvVO.setRegUsrId(LoginUtil.getUserId());
            issuePartsResvVO.setUpdtUsrId(LoginUtil.getUserId());

            if(issuePartsResvDAO.selectIssuePartsResvesByConditionCnt(searchVO) > 0)
                issuePartsResvDAO.updateIssuePartsResv(issuePartsResvVO);   // 수정
            else
                issuePartsResvDAO.insertIssuePartsResv(issuePartsResvVO);   // 추가

            // 구매상세 부품요청상태:요청완료(02)
            baseIssueReqDetailVO.setParReqStatCd("02");
            issueReqDetailService.updateIssueReqDetail(baseIssueReqDetailVO);

            sParReqDocNo = baseIssueReqDetailVO.getParReqDocNo();
        }

        // 구매요청 상세 요청상태 체크.
        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsParReqDocNo(sParReqDocNo);
        issueReqSearchVO.setsParReqStatCd("01"); // 상태 : 요청
        // 부품요청상태 요청 카운트 조회
        int parReqStatCdCnt = 0;
        parReqStatCdCnt = issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO);

        if(parReqStatCdCnt == 0){
            //모든 부품상세 요청상태 완료 시 부품헤더 요청상태 완료 처리.
            IssueReqVO issueReqVO = new IssueReqVO();
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setParReqDocNo(sParReqDocNo);
            issueReqVO.setParReqStatCd("02");
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqService.updateIssueReq(issueReqVO);
        }

    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#selectIssuePartsResvByKey(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, int)
     */
    @Override
    public IssuePartsResvVO selectIssuePartsResvByKey(String dlrCd, String pltCd, String strgeCd, String itemCd,
            String resvDocNo, int resvDocLineNo) throws Exception {
        return issuePartsResvDAO.selectIssuePartsResvByKey(dlrCd, pltCd, strgeCd, itemCd, resvDocNo, resvDocLineNo);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#selectIssuePartsResvsByCondition(chn.bhmc.dms.par.ism.vo.IssuePartsResvSearchVO)
     */
    @Override
    public List<IssuePartsResvVO> selectIssuePartsResvesByCondition(IssuePartsResvSearchVO searchVO) throws Exception {
        return issuePartsResvDAO.selectIssuePartsResvesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsResvService#selectIssuePartsResvsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssuePartsResvSearchVO)
     */
    @Override
    public int selectIssuePartsResvesByConditionCnt(IssuePartsResvSearchVO searchVO) throws Exception {
        return issuePartsResvDAO.selectIssuePartsResvesByConditionCnt(searchVO);
    }

}
