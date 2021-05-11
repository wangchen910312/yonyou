package chn.bhmc.dms.ser.ro.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderPartService;
import chn.bhmc.dms.ser.ro.service.dao.RepairOrderPartDAO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderPartVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderPartServiceImpl.java
 * @Description : RO접수 공임 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("repairOrderPartService")
public class RepairOrderPartServiceImpl extends HService implements RepairOrderPartService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="repairOrderPartDAO")
    RepairOrderPartDAO repairOrderPartDAO;

    /**
     * 부품요청 Service
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderPartsByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return repairOrderPartDAO.selectRepairOrderPartsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderPartVO> selectRepairOrderPartsByCondition(RepairOrderSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return repairOrderPartDAO.selectRepairOrderPartsByCondition(searchVO);
    }

    /**
     * RO접수 공임을 등록/수정/삭제한다.
     * @param repairOrderPartSaveVO - 공임정보를 포함하는 RepairOrderPartVO
     * @return
     */
    public void multiRepairOrderPart(List<RepairOrderPartVO> repairOrderPartSaveVO, RepairOrderVO repairOrderVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        RepairOrderPartVO partVO = new RepairOrderPartVO();
        partVO.setRoDocNo(repairOrderVO.getRoDocNo());
        repairOrderPartDAO.deleteRepairOrderPart(partVO);

        IssueReqSaveVO issueReqSaveVO = new IssueReqSaveVO();
        List<IssueReqDetailVO> issueReqDetailVOList = new ArrayList<IssueReqDetailVO>();

        IssueReqVO issueReqVO = new IssueReqVO();
        issueReqVO.setDlrCd(dlrCd);
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRoDocNo(repairOrderVO.getRoDocNo());
        issueReqVO.setParGiTp("RO");
        issueReqVO.setParReqStatCd("01");
        issueReqVO.setCancYn("N");
        issueReqVO.setCustCd(repairOrderVO.getDriverId());
        issueReqVO.setCustNm(repairOrderVO.getDriverNm());
        issueReqVO.setVinNo(repairOrderVO.getVinNo());
        issueReqVO.setCarNo(repairOrderVO.getCarRegNo());
        issueReqVO.setCarlineCd("");
        issueReqVO.setSerPrsnId(repairOrderVO.getSaId());
        if(StringUtil.nullConvert(repairOrderVO.getResvDocNo()).equals("")){
            issueReqVO.setResvDocNo(repairOrderVO.getRoDocNo());
        } else {
            issueReqVO.setResvDocNo(repairOrderVO.getResvDocNo());
        }

        int lineNo = 1;

        for(RepairOrderPartVO repairOrderPartVO : repairOrderPartSaveVO){
            repairOrderPartVO.setRegUsrId(userId);
            repairOrderPartVO.setDlrCd(dlrCd);
            repairOrderPartVO.setRoDocNo(repairOrderVO.getRoDocNo());
            repairOrderPartVO.setLineNo(lineNo++);
            repairOrderPartDAO.insertRepairOrderPart(repairOrderPartVO);

            // 부품요청
            IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
            issueReqDetailVO.setDlrCd(dlrCd);
            issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
            issueReqDetailVO.setItemCd(repairOrderPartVO.getItemCd());
            issueReqDetailVO.setItemNm(repairOrderPartVO.getItemNm());

            if(StringUtil.nullConvert(repairOrderVO.getResvDocNo()).equals("")){
                issueReqDetailVO.setResvDocNo(repairOrderVO.getRoDocNo());
            } else {
                issueReqDetailVO.setResvDocNo(repairOrderVO.getResvDocNo());
            }

            issueReqDetailVO.setRoDocNo(repairOrderPartVO.getRoDocNo());
            issueReqDetailVO.setParReqDocLineNo(lineNo);
            issueReqDetailVO.setRoLineNo(repairOrderPartVO.getLineNo());
            issueReqDetailVO.setReqQty(repairOrderPartVO.getItemQty());
            issueReqDetailVO.setReqStrgeCd(repairOrderPartVO.getGrStrgeCd());
            issueReqDetailVO.setGrStrgeCd(repairOrderPartVO.getGrStrgeCd());
            issueReqDetailVO.setGiStrgeCd(repairOrderPartVO.getGiStrgeCd());
            issueReqDetailVO.setCancYn("N");
            issueReqDetailVO.setParReqStatCd("01");
            issueReqDetailVO.setParGiTp("RO");
            issueReqDetailVO.setUnitCd(repairOrderPartVO.getCalcUnitCd());

            issueReqDetailVOList.add(issueReqDetailVO);
        }

        issueReqSaveVO.setIssueReqVO(issueReqVO);
        issueReqSaveVO.setIssueReqDetailVO(issueReqDetailVOList);
        issueReqSaveVO = issueReqService.insertIssueReq(issueReqSaveVO);


    }

    public void deleteRepairOrderPart(RepairOrderPartVO repairOrderPartVO) throws Exception {
        if( StringUtil.nullConvert(repairOrderPartVO.getDlrCd()).equals("")){
            repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        repairOrderPartDAO.deleteRepairOrderPart(repairOrderPartVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.RepairOrderPartService#insertRepairOrderPart(chn.bhmc.dms.ser.ro.vo.RepairOrderPartVO)
     */
    @Override
    public void insertRepairOrderPart(RepairOrderPartVO repairOrderPartVO) throws Exception {
        
        if( StringUtil.nullConvert(repairOrderPartVO.getDlrCd()).equals("")){
            repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        repairOrderPartDAO.insertRepairOrderPart(repairOrderPartVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.RepairOrderPartService#updateRepairOrderPart(chn.bhmc.dms.ser.ro.vo.RepairOrderPartVO)
     */
    @Override
    public void updateRepairOrderPart(RepairOrderPartVO repairOrderPartVO) throws Exception {
        
        if( StringUtil.nullConvert(repairOrderPartVO.getDlrCd()).equals("")){
            repairOrderPartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        repairOrderPartDAO.updateRepairOrderPart(repairOrderPartVO);
    }

}