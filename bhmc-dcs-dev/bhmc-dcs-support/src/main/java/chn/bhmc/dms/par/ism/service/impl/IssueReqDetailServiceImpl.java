package chn.bhmc.dms.par.ism.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.dao.IssueReqDetailDAO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderLaborService;
import chn.bhmc.dms.ser.ro.service.RepairOrderPartService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderLaborVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderPartVO;

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
public class IssueReqDetailServiceImpl extends HService implements IssueReqDetailService {

    @Resource(name="issueReqDetailDAO")
    private IssueReqDetailDAO issueReqDetailDAO;

    @Resource(name="repairOrderPartService")
    RepairOrderPartService repairOrderPartService;

    @Resource(name="repairOrderLaborService")
    RepairOrderLaborService repairOrderLaborService;

    /**
     * 부품요청 Service
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

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

        // 부품요청 검색 VO
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
                if(issueReqDetailVO.getParReqStatCd().equals("01")){
                    issueReqDetailVO.setRoLineNo(0);
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);

                    RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                    repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    repairOrderPartVO.setItemCd(issueReqDetailVO.getDbItemCd());
                    repairOrderPartService.deleteRepairOrderPart(repairOrderPartVO);
                }
            }
        }

        // 부품요청상세 Insert Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getInsertList()){
            // 부품번호
            if(issueReqDetailVO.getItemCd().equals("")){
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

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                // RO일때만
                if(issueReqDetailVO.getParGiTp().equals("RO")){
                    RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                    repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
                    repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    repairOrderPartVO.setRoTp("01"); // General
                    repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    repairOrderPartVO.setItemCd(issueReqDetailVO.getItemCd());
                    repairOrderPartVO.setItemNm(issueReqDetailVO.getItemNm());
                    repairOrderPartVO.setItemQty(issueReqDetailVO.getResvQty());    // 부품수량 =>출고수량 대체
                    repairOrderPartVO.setReqQty(issueReqDetailVO.getResvQty());     // 요청수량 =>출고수량 대체
                    repairOrderPartVO.setGiQty(issueReqDetailVO.getResvQty());      // 출고수량 =>출고수량 대체
                    repairOrderPartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                    repairOrderPartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    repairOrderPartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                    repairOrderPartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    repairOrderPartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                    repairOrderPartVO.setRegUsrId(LoginUtil.getUserId());

                    repairOrderPartService.insertRepairOrderPart(repairOrderPartVO);
                }
            }
        }

        // 부품요청상세 Update Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            // 부품번호
            if(issueReqDetailVO.getItemCd().equals("")){
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

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);

                if(issueReqDetailVO.getParGiTp().equals("RO")){
                    // 부품추가
                    RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                    repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
                    repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    repairOrderPartVO.setRoTp("01"); // General
                    repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    repairOrderPartVO.setItemCd(issueReqDetailVO.getItemCd());
                    repairOrderPartVO.setItemNm(issueReqDetailVO.getItemNm());
                    repairOrderPartVO.setItemQty(issueReqDetailVO.getResvQty());    // 부품수량 =>출고수량 대체
                    repairOrderPartVO.setReqQty(issueReqDetailVO.getResvQty());     // 요청수량 =>출고수량 대체
                    repairOrderPartVO.setGiQty(issueReqDetailVO.getResvQty());      // 출고수량 =>출고수량 대체
                    repairOrderPartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                    repairOrderPartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    repairOrderPartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                    repairOrderPartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    repairOrderPartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                    repairOrderPartVO.setRegUsrId(LoginUtil.getUserId());

                    repairOrderPartService.insertRepairOrderPart(repairOrderPartVO);
                }
            }else{
                if(issueReqDetailVO.getParReqStatCd().equals("01")){
                    issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                    // RO일때만
                    if(issueReqDetailVO.getParGiTp().equals("RO")){

                        RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                        repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
                        repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                        repairOrderPartVO.setRoTp("01"); // General
                        repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                        repairOrderPartVO.setItemCd(issueReqDetailVO.getItemCd());
                        repairOrderPartVO.setItemNm(issueReqDetailVO.getItemNm());
                        repairOrderPartVO.setItemQty(issueReqDetailVO.getResvQty());    // 부품수량 =>출고수량 대체
                        repairOrderPartVO.setReqQty(issueReqDetailVO.getResvQty());     // 요청수량 =>출고수량 대체
                        repairOrderPartVO.setGiQty(issueReqDetailVO.getResvQty());      // 출고수량 =>출고수량 대체
                        repairOrderPartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                        repairOrderPartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        repairOrderPartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                        repairOrderPartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        repairOrderPartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        repairOrderPartVO.setUpdtUsrId(LoginUtil.getUserId());

                        repairOrderPartService.updateRepairOrderPart(repairOrderPartVO);
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
        List<RepairOrderLaborVO> repairOrderLaborSaveVO = issueReqDetailSaveVO.getRepairOrderLaborVO();


        // 부품요청 검색 VO
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
                if(issueReqDetailVO.getParReqStatCd().equals("01")){
                    issueReqDetailVO.setRoLineNo(0);
                    issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                    issueReqDetailDAO.deleteIssueReqDetail(issueReqDetailVO);

                    RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                    repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    repairOrderPartVO.setItemCd(issueReqDetailVO.getDbItemCd());
                    repairOrderPartService.deleteRepairOrderPart(repairOrderPartVO);
                }
            }
        }

        // 부품요청상세 Insert Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getInsertList()){
            // 부품번호
            if(issueReqDetailVO.getItemCd().equals("")){
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

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);
                // RO일때만
                if(issueReqDetailVO.getParGiTp().equals("RO")){
                    RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                    repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
                    repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    repairOrderPartVO.setRoTp("01"); // General
                    repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    repairOrderPartVO.setItemCd(issueReqDetailVO.getItemCd());
                    repairOrderPartVO.setItemNm(issueReqDetailVO.getItemNm());
                    repairOrderPartVO.setItemQty(issueReqDetailVO.getResvQty());    // 부품수량 =>출고수량 대체
                    repairOrderPartVO.setReqQty(issueReqDetailVO.getResvQty());     // 요청수량 =>출고수량 대체
                    repairOrderPartVO.setGiQty(issueReqDetailVO.getResvQty());      // 출고수량 =>출고수량 대체
                    repairOrderPartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                    repairOrderPartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    repairOrderPartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                    repairOrderPartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    repairOrderPartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                    repairOrderPartVO.setRegUsrId(LoginUtil.getUserId());

                    repairOrderPartService.insertRepairOrderPart(repairOrderPartVO);
                }
            }
        }

        // 부품요청상세 Update Data
        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            // 부품번호
            if(issueReqDetailVO.getItemCd().equals("")){
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

            // 부품요청상세 카운트 조회.
            if(issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO) == 0){
                issueReqDetailDAO.insertIssueReqDetail(issueReqDetailVO);

                if(issueReqDetailVO.getParGiTp().equals("RO")){
                    // 부품추가
                    RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                    repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
                    repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                    repairOrderPartVO.setRoTp("01"); // General
                    repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                    repairOrderPartVO.setItemCd(issueReqDetailVO.getItemCd());
                    repairOrderPartVO.setItemNm(issueReqDetailVO.getItemNm());
                    repairOrderPartVO.setItemQty(issueReqDetailVO.getResvQty());    // 부품수량 =>출고수량 대체
                    repairOrderPartVO.setReqQty(issueReqDetailVO.getResvQty());     // 요청수량 =>출고수량 대체
                    repairOrderPartVO.setGiQty(issueReqDetailVO.getResvQty());      // 출고수량 =>출고수량 대체
                    repairOrderPartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                    repairOrderPartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                    repairOrderPartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                    repairOrderPartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                    repairOrderPartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                    repairOrderPartVO.setRegUsrId(LoginUtil.getUserId());

                    repairOrderPartService.insertRepairOrderPart(repairOrderPartVO);
                }
            }else{
                if(issueReqDetailVO.getParReqStatCd().equals("01")){
                    issueReqDetailDAO.updateIssueReqDetail(issueReqDetailVO);
                    // RO일때만
                    if(issueReqDetailVO.getParGiTp().equals("RO")){

                        RepairOrderPartVO repairOrderPartVO = new RepairOrderPartVO();
                        repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
                        repairOrderPartVO.setRoDocNo(issueReqDetailVO.getRoDocNo());
                        repairOrderPartVO.setRoTp("01"); // General
                        repairOrderPartVO.setLineNo(issueReqDetailVO.getRoLineNo());
                        repairOrderPartVO.setItemCd(issueReqDetailVO.getItemCd());
                        repairOrderPartVO.setItemNm(issueReqDetailVO.getItemNm());
                        repairOrderPartVO.setCalcUnitCd(issueReqDetailVO.getUnitCd());
                        repairOrderPartVO.setItemQty(issueReqDetailVO.getResvQty());    // 부품수량 =>출고수량 대체
                        repairOrderPartVO.setReqQty(issueReqDetailVO.getResvQty());     // 요청수량 =>출고수량 대체
                        repairOrderPartVO.setGiQty(issueReqDetailVO.getResvQty());      // 출고수량 =>출고수량 대체
                        repairOrderPartVO.setGiStrgeCd(issueReqDetailVO.getGiStrgeCd());
                        repairOrderPartVO.setGrStrgeCd(issueReqDetailVO.getGrStrgeCd());
                        repairOrderPartVO.setReqStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        repairOrderPartVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        repairOrderPartVO.setUpdtUsrId(LoginUtil.getUserId());

                        repairOrderPartService.updateRepairOrderPart(repairOrderPartVO);
                    }
                }
            }
        }

        //repairOrdetLabor CUD
        RepairOrderLaborVO repairOrderLaborVO = new RepairOrderLaborVO();
        repairOrderLaborVO.setDlrCd(LoginUtil.getDlrCd());
        // repairOrdetLabor All delete
        repairOrderLaborService.deleteRepairOrderLabor(repairOrderLaborVO);
        // repairOrdetLabor multiple insert
        repairOrderLaborService.multiRepairOrderLabor(repairOrderLaborSaveVO, issueReqVO.getRoDocNo());
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#multiIssueReqInnerDetails(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public IssueReqSaveVO multiIssueReqInnerDetails(IssueReqDetailSaveVO issueReqDetailSaveVO)
            throws Exception {

        IssueReqSaveVO issueReqSaveVO = new IssueReqSaveVO();

        IssueReqVO baseIssueReqVO = issueReqDetailSaveVO.getIssueReqVO();
        baseIssueReqVO.setDlrCd(LoginUtil.getDlrCd());
        baseIssueReqVO.setPltCd(LoginUtil.getPltCd());

        //IssueReqDetailVO insert
        issueReqSaveVO.setIssueReqVO(baseIssueReqVO);
        issueReqSaveVO.setIssueReqDetailVO(issueReqDetailSaveVO.getIssueReqDetailVO().getUpdateList());
        issueReqSaveVO = issueReqService.insertIssueInnerReq(issueReqSaveVO);

        return issueReqSaveVO;
    }


    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqByKey(java.lang.String)
     */
    @Override
    public IssueReqDetailVO selectIssueReqByKey(String dlrCd) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);
    }
}
