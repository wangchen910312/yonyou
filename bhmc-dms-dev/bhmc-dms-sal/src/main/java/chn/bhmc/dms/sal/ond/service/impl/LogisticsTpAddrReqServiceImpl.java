package chn.bhmc.dms.sal.ond.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSpVO;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSaveVO;

import chn.bhmc.dms.sal.ond.service.dao.LogisticsTpAddrReqDAO;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqVO;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSearchVO;

import chn.bhmc.dms.sal.ond.service.LogisticsTpAddrReqService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrReqServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Service("logisticsTpAddrReqService")
public class LogisticsTpAddrReqServiceImpl extends HService implements LogisticsTpAddrReqService{

     /**
     * 물류운송주소  DAO 선언
     */
    @Resource(name="logisticsTpAddrReqDAO")
    LogisticsTpAddrReqDAO logisticsTpAddrReqDAO;

    @Override
    public List<LogisticsTpAddrReqVO> selectLogisticsTpAddrReqList(LogisticsTpAddrReqSearchVO searchVO) throws Exception {
        return logisticsTpAddrReqDAO.selectLogisticsTpAddrReqList(searchVO);
    }

    public int insertLogisticsTpAddrReqList(LogisticsTpAddrReqVO logisticsTpAddrReqVO) throws Exception {
        return logisticsTpAddrReqDAO.insertLogisticsTpAddrReqList(logisticsTpAddrReqVO);
    }

    public int updateLogisticsTpAddrReqList(LogisticsTpAddrReqVO logisticsTpAddrReqVO) throws Exception {
        return logisticsTpAddrReqDAO.updateLogisticsTpAddrReqList(logisticsTpAddrReqVO);
    }

    public int deleteLogisticsTpAddrReqList(LogisticsTpAddrReqVO logisticsTpAddrReqVO) throws Exception {
        return logisticsTpAddrReqDAO.deleteLogisticsTpAddrReqList(logisticsTpAddrReqVO);
    }

    public int callProcedureLogisticsTpAddrReqList(LogisticsTpAddrReqSpVO procVO) throws Exception {
        return logisticsTpAddrReqDAO.callProcedureLogisticsTpAddrReqList(procVO);
    }

    @Override
    public void saveLogisticsTpAddrReqList(LogisticsTpAddrReqSaveVO saveVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for (LogisticsTpAddrReqVO obj : saveVO.getInsertList()) {
            obj.setUsrId(userId);
            obj.setRegUsrId(userId);
            obj.setUpdtUsrId(userId);
            obj.setDlrCd(dlrCd);

            insertLogisticsTpAddrReqList(obj);

            LogisticsTpAddrReqSpVO logisticsTpAddrReqSpVO1 = new LogisticsTpAddrReqSpVO();

            logisticsTpAddrReqSpVO1.setEaiId("SAL155");
            logisticsTpAddrReqSpVO1.setDlrCd(obj.getDlrCd());
            logisticsTpAddrReqSpVO1.setUsrId(obj.getUsrId());
            logisticsTpAddrReqSpVO1.setReqNo(obj.getReqNo());
            logisticsTpAddrReqSpVO1.setReqDt(obj.getReqDt());

            callProcedureLogisticsTpAddrReqList(logisticsTpAddrReqSpVO1);
        }

        for (LogisticsTpAddrReqVO obj : saveVO.getUpdateList()) {
            obj.setUsrId(userId);
            obj.setRegUsrId(userId);
            obj.setUpdtUsrId(userId);
            obj.setDlrCd(dlrCd);

            updateLogisticsTpAddrReqList(obj);

            LogisticsTpAddrReqSpVO logisticsTpAddrReqSpVO2 = new LogisticsTpAddrReqSpVO();

            logisticsTpAddrReqSpVO2.setEaiId("SAL155");
            logisticsTpAddrReqSpVO2.setDlrCd(obj.getDlrCd());
            logisticsTpAddrReqSpVO2.setUsrId(obj.getUsrId());
            logisticsTpAddrReqSpVO2.setReqNo(obj.getReqNo());
            logisticsTpAddrReqSpVO2.setReqDt(obj.getReqDt());

            callProcedureLogisticsTpAddrReqList(logisticsTpAddrReqSpVO2);

        }

        for (LogisticsTpAddrReqVO obj : saveVO.getDeleteList()) {
            obj.setUsrId(userId);
            obj.setRegUsrId(userId);
            obj.setUpdtUsrId(userId);
            obj.setDlrCd(dlrCd);

            deleteLogisticsTpAddrReqList(obj);

            LogisticsTpAddrReqSpVO logisticsTpAddrReqSpVO3 = new LogisticsTpAddrReqSpVO();

            logisticsTpAddrReqSpVO3.setEaiId("SAL155");
            logisticsTpAddrReqSpVO3.setDlrCd(obj.getDlrCd());
            logisticsTpAddrReqSpVO3.setUsrId(obj.getUsrId());
            logisticsTpAddrReqSpVO3.setReqNo(obj.getReqNo());
            logisticsTpAddrReqSpVO3.setReqDt(obj.getReqDt());

            callProcedureLogisticsTpAddrReqList(logisticsTpAddrReqSpVO3);
        }

    }

}
