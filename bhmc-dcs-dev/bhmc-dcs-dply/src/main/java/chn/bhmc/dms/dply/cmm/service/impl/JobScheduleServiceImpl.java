package chn.bhmc.dms.dply.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.dply.cmm.service.JobScheduleService;
import chn.bhmc.dms.dply.cmm.service.dao.JobScheduleDAO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleExecHistVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleSaveVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleSearchVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JobScheduleServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Service("jobScheduleService")
public class JobScheduleServiceImpl extends HService implements JobScheduleService {

    /**
     * 메세지소스 관리 DAO
     */
    @Resource(name="jobScheduleDAO")
    JobScheduleDAO jobScheduleDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.dply.cmm.service.JobScheduleService#selectJobScheduleByCondition(chn.bhmc.dms.dply.cmm.vo.JobScheduleSearchVO)
     */
    @Override
    public List<JobScheduleVO> selectJobScheduleByCondition(JobScheduleSearchVO searchVO) throws Exception {
        return jobScheduleDAO.selectJobScheduleByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.JobScheduleService#selectJobScheduleByConditionCnt(chn.bhmc.dms.dply.cmm.vo.JobScheduleSearchVO)
     */
    @Override
    public int selectJobScheduleByConditionCnt(JobScheduleSearchVO searchVO) throws Exception {
        return jobScheduleDAO.selectJobScheduleByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.JobScheduleService#multiJobSchedule(chn.bhmc.dms.dply.cmm.vo.JobScheduleSaveVO)
     */
    @Override
    public String multiJobSchedule(JobScheduleSaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(JobScheduleVO jobScheduleVO : saveVO.getInsertList()) {
            jobScheduleVO.setRegUsrId(usrId);
            jobScheduleDAO.insertJobSchedule(jobScheduleVO);
        }

        for(JobScheduleVO jobScheduleVO : saveVO.getUpdateList()) {
            jobScheduleVO.setUpdtUsrId(usrId);
            jobScheduleDAO.updateJobSchedule(jobScheduleVO);
        }

        return "OK";
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.JobScheduleService#selectJobScheduleExecHistByCondition(chn.bhmc.dms.dply.cmm.vo.JobScheduleSearchVO)
     */
    @Override
    public List<JobScheduleExecHistVO> selectJobScheduleExecHistByCondition(JobScheduleSearchVO searchVO)
            throws Exception {
        return jobScheduleDAO.selectJobScheduleExecHistByCondition(searchVO);
    }

}
