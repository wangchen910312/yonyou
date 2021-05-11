package chn.bhmc.dms.ser.ro.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderLaborService;
import chn.bhmc.dms.ser.ro.service.dao.RepairOrderLaborDAO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderLaborVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderLaborServiceImpl.java
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

@Service("repairOrderLaborService")
public class RepairOrderLaborServiceImpl extends HService implements RepairOrderLaborService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="repairOrderLaborDAO")
    RepairOrderLaborDAO repairOrderLaborDAO;

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderLaborsByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return repairOrderLaborDAO.selectRepairOrderLaborsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderLaborVO> selectRepairOrderLaborsByCondition(RepairOrderSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return repairOrderLaborDAO.selectRepairOrderLaborsByCondition(searchVO);
    }

    /**
     * RO접수 공임을 등록/수정/삭제한다.
     * @param repairOrderLaborSaveVO - 공임정보를 포함하는 RepairOrderLaborVO
     * @return
     */
    public void multiRepairOrderLabor(List<RepairOrderLaborVO> repairOrderLaborSaveVO, String roDocNo) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        RepairOrderLaborVO laborVO = new RepairOrderLaborVO();
        laborVO.setRoDocNo(roDocNo);
        repairOrderLaborDAO.deleteRepairOrderLabor(laborVO);

        int lineNo = 1;

        for(RepairOrderLaborVO repairOrderLaborVO : repairOrderLaborSaveVO){
            repairOrderLaborVO.setRegUsrId(userId);
            repairOrderLaborVO.setDlrCd(dlrCd);
            repairOrderLaborVO.setRoDocNo(roDocNo);
            repairOrderLaborVO.setLineNo(lineNo++);
            repairOrderLaborDAO.insertRepairOrderLabor(repairOrderLaborVO);
        }
    }

    public void deleteRepairOrderLabor(RepairOrderLaborVO repairOrderLaborVO) throws Exception {
        
        if( StringUtil.nullConvert(repairOrderLaborVO.getDlrCd()).equals("")){
            repairOrderLaborVO.setDlrCd(LoginUtil.getDlrCd());
        }
        repairOrderLaborDAO.deleteRepairOrderLabor(repairOrderLaborVO);
    }

}