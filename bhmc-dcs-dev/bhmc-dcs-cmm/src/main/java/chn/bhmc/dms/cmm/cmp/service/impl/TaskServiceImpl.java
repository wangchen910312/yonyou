package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.service.dao.TaskDAO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 직무 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("taskService")
public class TaskServiceImpl extends HService implements TaskService {

    /**
     * 직무 관리 DAO
     */
    @Resource(name="taskDAO")
    TaskDAO taskDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertTask(TaskVO taskVO) throws Exception {

        TaskVO obj = selectTaskByKey(taskVO.getCmpTp(), taskVO.getTskCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return taskDAO.insertTask(taskVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateTask(TaskVO taskVO) throws Exception {
        return taskDAO.updateTask(taskVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteTask(TaskVO taskVO) throws Exception {
        return taskDAO.deleteTask(taskVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiTasks(TaskSaveVO taskSaveVO)  throws Exception {

        String usrId = LoginUtil.getUserId();

        for(TaskVO taskVO : taskSaveVO.getInsertList()){
            taskVO.setRegUsrId(usrId);
            insertTask(taskVO);
        }

        for(TaskVO taskVO : taskSaveVO.getUpdateList()){
            taskVO.setUpdtUsrId(usrId);
            updateTask(taskVO);
        }

        for(TaskVO taskVO : taskSaveVO.getDeleteList()){
            deleteTask(taskVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TaskVO selectTaskByKey(String cmpTp, String tskCd) throws Exception {
        return taskDAO.selectTaskByKey(cmpTp, tskCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<TaskVO> selectTasksByCondition(TaskSearchVO searchVO) throws Exception {
        return taskDAO.selectTasksByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTasksByConditionCnt(TaskSearchVO searchVO) throws Exception {
        return taskDAO.selectTasksByConditionCnt(searchVO);
    }


}
