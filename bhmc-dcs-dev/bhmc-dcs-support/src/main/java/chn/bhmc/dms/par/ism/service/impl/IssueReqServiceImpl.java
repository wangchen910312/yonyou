package chn.bhmc.dms.par.ism.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

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
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;

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

    @Resource(name="parReqDocNoIdgenService")
    TableIdGenService parReqDocNoIdgenService;

    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;


    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqService#insertIssueReq(chn.bhmc.dms.par.ism.vo.IssueReqVO)
     */
    @Override
    public int insertIssueReq(IssueReqVO issueReqVO) throws Exception {
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
        if(issueReqVO.getDlrCd() == null || LoginUtil.getDlrCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 부품요청상태코드
        if(issueReqVO.getParReqStatCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.parReqStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        // 부품요청상태코드 RO일때만(예약접수:SR,서비스RO:RO,부품판매:미정)
        if(issueReqVO.getParReqDocNo() == null || issueReqVO.getParReqStatCd().equals("RO")){
            // RO일련번호
            if(issueReqVO.getRoDocNo() == null || issueReqVO.getRoDocNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 차대번호
            if(issueReqVO.getVinNo() == null || issueReqVO.getVinNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.vinNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 차량번호
            if(issueReqVO.getCarNo() == null || issueReqVO.getCarNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.carNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }

            IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
            issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
            issueReqSearchVO.setsParReqStatCd("02"); // 완료
            // 출고요청상세 작업 진행 체크. -  정비에서 처리함
            /*if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO) > 0){
                lblList[0] = messageSource.getMessage("par.lbl.releaseReq", null, LocaleContextHolder.getLocale()); //출고요청
                throw processException("global.info.isWorkRun", lblList);// 진행 중 입니다.
            }*/
        }

        if(issueReqVO.getParReqStatCd() == null || issueReqVO.getParReqStatCd().equals("SR")){
            // 예약문서번호
            if(issueReqVO.getResvDocNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.resvDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
        }
        // 센터코드
        if(issueReqVO.getPltCd() == null || issueReqVO.getPltCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객코드
        if(issueReqVO.getCustCd() == null || issueReqVO.getCustCd().equals("") ){
            lblList[0] = messageSource.getMessage("par.lbl.custCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객명
        if(issueReqVO.getCustNm() == null || issueReqVO.getCustNm().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
        if(issueReqDAO.selectIssueReqsByConditionCnt(issueReqSearchVO) > 0 )
        {
            // 부품요청헤더 가져오기.
            IssueReqVO issueReqByKeyVO = issueReqDAO.selectIssueReqByKey(LoginUtil.getDlrCd(), null, issueReqVO.getRoDocNo(), issueReqVO.getParGiTp());

            // 부품요청헤더 수정.
            issueReqVO.setParReqDocNo(issueReqByKeyVO.getParReqDocNo());
            issueReqDAO.updateIssueReq(issueReqVO);

            // 부품요청상세 삭제.
            IssueReqDetailVO delIssueReqDetailVO = new IssueReqDetailVO();
            delIssueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
            delIssueReqDetailVO.setRoDocNo(issueReqVO.getRoDocNo());
            issueReqDetailService.deleteIssueReqDetail(delIssueReqDetailVO);

            for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                if(issueReqVO.getParReqStatCd() == null || issueReqVO.getParReqStatCd().equals("RO")){
                    //RO번호
                    if(issueReqDetailVO.getRoDocNo().equals("")){
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
                if(issueReqDetailVO.getItemCd() == null || issueReqDetailVO.getItemCd().equals("")){
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

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setParReqDocNo(issueReqByKeyVO.getParReqDocNo());
                // 부품요청번호 RO번호 일치화.
                issueReqDetailVO.setParReqDocLineNo(issueReqDetailVO.getRoLineNo());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
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
            }

            // 부품요청헤더 추가.
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setPltCd(LoginUtil.getPltCd());
            issueReqVO.setRegUsrId(LoginUtil.getUserId());
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDAO.insertIssueReq(issueReqVO);

            for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                if(issueReqVO.getParReqStatCd().equals("RO")){
                    //RO번호
                    if(issueReqDetailVO.getRoDocNo() == null || issueReqDetailVO.getRoDocNo().equals("")){
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
                if(issueReqDetailVO.getItemCd() == null || issueReqDetailVO.getItemCd().equals("")){
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

                // 부품요청번호 RO번호 일치화.
                issueReqDetailVO.setParReqDocLineNo(issueReqDetailVO.getRoLineNo());
                issueReqDetailVO.setParReqDocNo(parReqDocNo);
                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                issueReqDetailService.insertIssueReqDetail(issueReqDetailVO);
            }
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
        if(issueReqVO.getDlrCd() == null || LoginUtil.getDlrCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 부품요청상태코드
        if(issueReqVO.getParReqStatCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.parReqStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        // 부품요청상태코드 RO일때만(예약접수:SR,서비스RO:RO,부품판매:미정)
        if(issueReqVO.getParReqDocNo() == null || issueReqVO.getParReqStatCd().equals("RO")){
            // RO일련번호
            if(issueReqVO.getRoDocNo() == null || issueReqVO.getRoDocNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }

            IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
            issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
            issueReqSearchVO.setsParReqStatCd("02"); // 완료
            // 출고요청상세 작업 진행 체크.
            if(issueReqDetailService.selectIssueReqDetailsByConditionCnt(issueReqSearchVO) > 0){
                lblList[0] = messageSource.getMessage("par.lbl.releaseReq", null, LocaleContextHolder.getLocale()); //출고요청
                throw processException("global.info.isWorkRun", lblList);// 진행 중 입니다.
            }
        }
        // 센터코드
        if(issueReqVO.getPltCd() == null || issueReqVO.getPltCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsRoDocNo(issueReqVO.getRoDocNo());
        if(issueReqDAO.selectIssueReqsByConditionCnt(issueReqSearchVO) > 0 ){
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

            for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                if(issueReqVO.getParReqStatCd() == null || issueReqVO.getParReqStatCd().equals("RO")){
                    //RO번호
                    if(issueReqDetailVO.getRoDocNo().equals("")){
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

                    //서비스 RO번호 존재유무 확인.
                    RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
                    repairOrderSearchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());
                    if(repairOrderService.selectRepairOrderByConditionCnt(repairOrderSearchVO) == 0){
                        lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                        throw processException("par.info.issueCheckMsg", lblList);
                    }

                }
                //부품번호
                if(issueReqDetailVO.getItemCd() == null || issueReqDetailVO.getItemCd().equals("")){
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

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setParReqDocNo(issueReqByKeyVO.getParReqDocNo());
                // 부품요청번호 RO번호 일치화.
                issueReqDetailVO.setParReqDocLineNo(issueReqDetailVO.getRoLineNo());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                // 부품단위코드 없을 때
                if(issueReqDetailVO.getUnitCd() == ""){
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
            }

            // 부품요청헤더 추가.
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setPltCd(LoginUtil.getPltCd());
            issueReqVO.setRegUsrId(LoginUtil.getUserId());
            issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
            issueReqDAO.insertIssueReq(issueReqVO);

            for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVOList){
                if(issueReqVO.getParReqStatCd().equals("RO")){
                    //RO번호
                    if(issueReqDetailVO.getRoDocNo() == null || issueReqDetailVO.getRoDocNo().equals("")){
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
                    //서비스 RO번호 존재유무 확인.
                    RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
                    repairOrderSearchVO.setsRoDocNo(issueReqDetailVO.getRoDocNo());
                    if(repairOrderService.selectRepairOrderByConditionCnt(repairOrderSearchVO) == 0){
                        lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                        throw processException("par.info.issueCheckMsg", lblList);
                    }
                }
                //부품번호
                if(issueReqDetailVO.getItemCd() == null || issueReqDetailVO.getItemCd().equals("")){
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

                // 부품요청번호 RO번호 일치화.
                issueReqDetailVO.setParReqDocLineNo(issueReqDetailVO.getRoLineNo());
                issueReqDetailVO.setParReqDocNo(parReqDocNo);
                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());

                // 부품단위코드 없을 때
                if(issueReqDetailVO.getUnitCd() == ""){
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
        if(LoginUtil.getDlrCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 부품요청상태코드
        if(issueReqVO.getParReqStatCd() == null || issueReqVO.getParReqStatCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.parReqStatCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        // 부품요청상태코드 RO일때만(예약접수:SR,서비스RO:RO,부품판매:미정)
        if(issueReqVO.getParReqStatCd().equals("RO")){
            // RO일련번호
            if(issueReqVO.getRoDocNo() == null || issueReqVO.getRoDocNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.roDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 차대번호
            if(issueReqVO.getVinNo() == null || issueReqVO.getVinNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.vinNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 차량번호
            if(issueReqVO.getCarNo() == null || issueReqVO.getCarNo().equals("")){
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

        if(issueReqVO.getParReqStatCd() == null || issueReqVO.getParReqStatCd().equals("SR")){
            // 예약문서번호
            if(issueReqVO.getResvDocNo().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.resvDocNo", null, LocaleContextHolder.getLocale());
                throw processException("par.info.issueCheckMsg", lblList);
            }
        }
        // 센터코드
        if(issueReqVO.getPltCd() == null || issueReqVO.getPltCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객코드
        if(issueReqVO.getCustCd() == null || issueReqVO.getCustCd().equals("")){
            lblList[0] = messageSource.getMessage("par.lbl.custCd", null, LocaleContextHolder.getLocale());
            throw processException("par.info.issueCheckMsg", lblList);
        }
        // 고객명
        if(issueReqVO.getCustNm() == null || issueReqVO.getCustNm().equals("")){
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
                if(issueReqVO.getParReqStatCd() == null || issueReqVO.getParReqStatCd().equals("RO")){
                    //RO번호
                    if(issueReqDetailVO.getRoDocNo().equals("")){
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
                if(issueReqDetailVO.getItemCd() == null || issueReqDetailVO.getItemCd().equals("")){
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




}
