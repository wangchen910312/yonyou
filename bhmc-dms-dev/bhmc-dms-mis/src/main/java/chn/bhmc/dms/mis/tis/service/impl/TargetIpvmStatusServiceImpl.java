package chn.bhmc.dms.mis.tis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mis.tis.service.TargetIpvmStatusService;
import chn.bhmc.dms.mis.tis.service.dao.TargetIpvmStatusDAO;
import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusSearchVO;
import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusVO;

/**
 * <pre>
 * [딜러사] 목표 개선 현황
 * </pre>
 *
 * @ClassName   : TargetIpvmStatusServiceImpl.java
 * @Description : [딜러사] 목표 개선 현황
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetIpvmStatusService")
public class TargetIpvmStatusServiceImpl extends HService implements TargetIpvmStatusService {

    /**
     * [딜러사] 목표 개선 현황  DAO
     */
    @Resource(name="targetIpvmStatusDAO")
    TargetIpvmStatusDAO targetIpvmStatusDAO;

    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<TargetIpvmStatusVO> selectTargetIpvmStatusByCondition(TargetIpvmStatusSearchVO searchVO) throws Exception {
        return targetIpvmStatusDAO.selectTargetIpvmStatusByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetIpvmStatusByConditionCnt(TargetIpvmStatusSearchVO searchVO) throws Exception {
        return targetIpvmStatusDAO.selectTargetIpvmStatusByConditionCnt(searchVO);
    }

    @Override
    public int insertTargetIpvmStatus(TargetIpvmStatusVO targetIpvmStatusVO) throws Exception {
        String userId = LoginUtil.getUserId();

        targetIpvmStatusVO.setRegUsrId(userId);
        targetIpvmStatusVO.setUpdtUsrId(userId);

        FileDocVO fileDocVO = new FileDocVO();
        fileDocVO.setFileDocNo(targetIpvmStatusVO.getFileDocNo());
        fileMgrService.updateFileDocEnabled(fileDocVO);

        return targetIpvmStatusDAO.insertTargetIpvmStatus(targetIpvmStatusVO);
    }

    @Override
    public TargetIpvmStatusVO selectTargetIpvmStatusByKey(TargetIpvmStatusSearchVO searchVO) throws Exception {
        return targetIpvmStatusDAO.selectTargetIpvmStatusByKey(searchVO);
    }
}
