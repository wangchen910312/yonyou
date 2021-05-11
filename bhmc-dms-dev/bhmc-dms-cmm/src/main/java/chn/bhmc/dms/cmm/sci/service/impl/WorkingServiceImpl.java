package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.WorkingService;
import chn.bhmc.dms.cmm.sci.service.dao.WorkingDAO;
import chn.bhmc.dms.cmm.sci.vo.WorkingVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkingServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("workingService")
public class WorkingServiceImpl extends HService implements WorkingService {
    /**
     * 근무일 정보 DAO
     */
    @Resource(name = "workingDAO")
    WorkingDAO workingDAO;

    @Override
    public void insertWorking(WorkingVO workingVO) throws Exception {
        String userId = LoginUtil.getUserId();

        if (!"".equals(workingVO.getDayWeekList())) {
            for (String item : workingVO.getDayWeekList().split("\\|")) {
                workingVO.setDayweekCnt(Integer.parseInt(item));
                workingVO.setRegUsrId(userId);
                workingVO.setUpdtUsrId(userId);

                workingDAO.insertWorking(workingVO);
            }
        }
    }

    @Override
    public int deleteWorking(WorkingVO workingVO) throws Exception {
        return workingDAO.deleteWorking(workingVO);
    }

    @Override
    public List<WorkingVO> selectWorkingByCondition(WorkingVO workingVO) throws Exception {
        return workingDAO.selectWorkingByCondition(workingVO);
    }
}