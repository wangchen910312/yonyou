package chn.bhmc.dms.sal.ro.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.sal.ro.service.RepairOrderSaleService;

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

@Service("repairOrderSaleService")
public class RepairOrderSaleServiceImpl extends HService implements RepairOrderSaleService {

    /**
     * RO접수 공임 DAO
     */
    //@Resource(name="repairOrderPartDAO")
    //RepairOrderPartDAO repairOrderPartDAO;

    /**
     * 부품요청 Service
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;


    /**
     * RO접수 공임을 등록/수정/삭제한다.
     * @param repairOrderPartSaveVO - 공임정보를 포함하는 RepairOrderPartVO
     * @return
     */
    /*public void multiRepairOrderSale(List<RepairOrderPartVO> repairOrderPartSaveVO, RepairOrderVO repairOrderVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        RepairOrderPartVO partVO = new RepairOrderPartVO();
        partVO.setRoDocNo(repairOrderVO.getRoDocNo());
        partVO.setDlrCd(dlrCd);
        repairOrderPartDAO.deleteRepairOrderPart(partVO);

        IssueReqSaveVO issueReqSaveVO = new IssueReqSaveVO();
        List<IssueReqDetailVO> issueReqDetailVOList = new ArrayList<IssueReqDetailVO>();

        IssueReqVO issueReqVO = new IssueReqVO();
        issueReqVO.setDlrCd(dlrCd);
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRoDocNo(repairOrderVO.getRoDocNo());
        issueReqVO.setParGiTp("GP");
        issueReqVO.setParReqStatCd("01");
        issueReqVO.setCancYn("N");
        issueReqVO.setCustCd(repairOrderVO.getDriverId());
        issueReqVO.setCustNm(repairOrderVO.getDriverNm());
        issueReqVO.setVinNo(repairOrderVO.getVinNo());
        issueReqVO.setCarNo(repairOrderVO.getCarRegNo());
        issueReqVO.setCarlineCd("");
        issueReqVO.setSerPrsnId(repairOrderVO.getSaId());
        issueReqVO.setResvDocNo(repairOrderVO.getResvDocNo());
        issueReqVO.setReadyStatCd("02");

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
            issueReqDetailVO.setResvDocNo(repairOrderVO.getResvDocNo());
            issueReqDetailVO.setRoDocNo(repairOrderPartVO.getRoDocNo());
            issueReqDetailVO.setParReqDocLineNo(lineNo);
            issueReqDetailVO.setRoLineNo(repairOrderPartVO.getLineNo());
            issueReqDetailVO.setReqQty(repairOrderPartVO.getItemQty());
            issueReqDetailVO.setReqStrgeCd(repairOrderPartVO.getGrStrgeCd());
            issueReqDetailVO.setGrStrgeCd(repairOrderPartVO.getGrStrgeCd());
            issueReqDetailVO.setGiStrgeCd(repairOrderPartVO.getGiStrgeCd());
            issueReqDetailVO.setCancYn("N");
            issueReqDetailVO.setParReqStatCd("01");
            issueReqDetailVO.setParGiTp("GP");
            issueReqDetailVO.setReadyStatCd("02");
            issueReqDetailVO.setUnitCd(repairOrderPartVO.getCalcUnitCd());
            issueReqDetailVO.setItemPrc(repairOrderPartVO.getItemPrc());
            issueReqDetailVO.setItemAmt(repairOrderPartVO.getItemPrc() * repairOrderPartVO.getItemQty());

            issueReqDetailVOList.add(issueReqDetailVO);
        }

        issueReqSaveVO.setIssueReqVO(issueReqVO);
        issueReqSaveVO.setIssueReqDetailVO(issueReqDetailVOList);
        issueReqSaveVO = issueReqService.insertIssueReq(issueReqSaveVO);

    }*/

}