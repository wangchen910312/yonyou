package chn.bhmc.dms.sal.ond.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ond.service.LogisticsTpAddrEvalService;
import chn.bhmc.dms.sal.ond.service.dao.LogisticsTpAddrEvalDAO;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalSaveVO;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalSearchVO;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrEvalServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 3. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 8.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Service("logisticsTpAddrEvalService")
public class LogisticsTpAddrEvalServiceImpl extends HService implements LogisticsTpAddrEvalService{

    /**
     * 물류운송주소  심사 DAO 선언
     */

    @Resource(name="logisticsTpAddrEvalDAO")
    LogisticsTpAddrEvalDAO logisticsTpAddrEvalDAO;

    @Override
    public List<LogisticsTpAddrEvalVO> selectLogisticsTpAddrEvalList(LogisticsTpAddrEvalSearchVO searchVO) throws Exception {
        return logisticsTpAddrEvalDAO.selectLogisticsTpAddrEvalList(searchVO);
    }

     /**
     * 비준
     **/
    @Override
    public int confirmLogisticsTpAddrEvalList(LogisticsTpAddrEvalSaveVO saveVO) throws Exception{

        String userId = LoginUtil.getUserId();

        for(LogisticsTpAddrEvalVO updateVO : saveVO.getUpdateList()){

            updateVO.setUsrId(userId);
            logisticsTpAddrEvalDAO.confirmLogisticsTpAddrEvalList(updateVO);

        }

        return 1;
    }

     /**
     * 거절
     **/
    @Override
    public int denyLogisticsTpAddrEvalList(LogisticsTpAddrEvalSaveVO saveVO) throws Exception{

        String userId = LoginUtil.getUserId();

        for(LogisticsTpAddrEvalVO updateVO : saveVO.getUpdateList()){

            updateVO.setUsrId(userId);
            logisticsTpAddrEvalDAO.denyLogisticsTpAddrEvalList(updateVO);

        }

        return 1;
    }

    /**
     * 폐기
     **/
    @Override
    public int terminateLogisticsTpAddrEvalList(LogisticsTpAddrEvalSaveVO saveVO) throws Exception{

        String userId = LoginUtil.getUserId();

        for(LogisticsTpAddrEvalVO updateVO : saveVO.getUpdateList()){

            updateVO.setUsrId(userId);
            logisticsTpAddrEvalDAO.terminateLogisticsTpAddrEvalList(updateVO);

        }

        return 1;
    }

}
