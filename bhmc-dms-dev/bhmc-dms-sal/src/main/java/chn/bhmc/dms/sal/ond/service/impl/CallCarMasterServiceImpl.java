package chn.bhmc.dms.sal.ond.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.ond.vo.GradeInfoVO;
import chn.bhmc.dms.sal.ond.vo.GradeSearchVO;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

import chn.bhmc.dms.sal.ond.service.dao.CallCarMasterDAO;

import chn.bhmc.dms.sal.ond.vo.CallCarMasterSearchVO;
import chn.bhmc.dms.sal.ond.vo.CallCarMasterVO;

import chn.bhmc.dms.sal.ond.service.CallCarMasterService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallCarMasterServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 6.     Choi Kyung Yong     최초 생성
 * </pre>
 */

@Service("callCarMasterService")
public class CallCarMasterServiceImpl extends HService implements CallCarMasterService {

    @Resource(name="callCarMasterDAO")
    CallCarMasterDAO callCarMasterDAO;

    /*
     * @see chn.bhmc.dms.sal.ond.service.CallCarMasterService#selectCallCarMasterByConditionCnt(chn.bhmc.dms.sal.ond.vo.CallCarMasterSearchVO)
     */
    @Override
    public int selectCallCarMasterByConditionCnt(CallCarMasterSearchVO searchVO) throws Exception {
        return callCarMasterDAO.selectCallCarMasterByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.sal.ond.service.CallCarMasterService#selectCallCarMasterByCondition(chn.bhmc.dms.sal.ond.vo.CallCarMasterSearchVO)
     */
    @Override
    public List<CallCarMasterVO> selectCallCarMasterByCondition(CallCarMasterSearchVO searchVO) throws Exception {
        return callCarMasterDAO.selectCallCarMasterByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.sal.ond.service.CallCarMasterService#multiCallCarMAster(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCallCarMaster(BaseSaveVO<CallCarMasterVO> saveVO) throws Exception {

        String userId = LoginUtil.getUserId();

        for (CallCarMasterVO callCarMasterVO: saveVO.getInsertList()) {
            callCarMasterVO.setRegUsrId(userId);
            callCarMasterVO.setUpdtUsrId(userId);
            insertCallCarMaster(callCarMasterVO);
        }

        for (CallCarMasterVO callCarMasterVO: saveVO.getUpdateList()) {
            callCarMasterVO.setRegUsrId(userId);
            callCarMasterVO.setUpdtUsrId(userId);
            updateCallCarMaster(callCarMasterVO);
        }

        for (CallCarMasterVO callCarMasterVO: saveVO.getDeleteList()) {
            callCarMasterVO.setRegUsrId(userId);
            callCarMasterVO.setUpdtUsrId(userId);
            deleteCallCarMaster(callCarMasterVO);
        }

    }

    /*
     * @see chn.bhmc.dms.sal.ond.service.CallCarMasterService#insertCallCarMaster(chn.bhmc.dms.sal.ond.vo.CallCarMasterVO)
     */
    @Override
    public int insertCallCarMaster(CallCarMasterVO calCarMasterVO) throws Exception {
        return callCarMasterDAO.insertCallCarMaster(calCarMasterVO);
    }

    /*
     * @see chn.bhmc.dms.sal.ond.service.CallCarMasterService#updateCallCarMaster(chn.bhmc.dms.sal.ond.vo.CallCarMasterVO)
     */
    @Override
    public int updateCallCarMaster(CallCarMasterVO calCarMasterVO) throws Exception {
        return callCarMasterDAO.updateCallCarMaster(calCarMasterVO);
    }

    /*
     * @see chn.bhmc.dms.sal.ond.service.CallCarMasterService#deleteCallCarMaster(chn.bhmc.dms.sal.ond.vo.CallCarMasterVO)
     */
    @Override
    public int deleteCallCarMaster(CallCarMasterVO calCarMasterVO) throws Exception {
        return callCarMasterDAO.deleteCallCarMaster(calCarMasterVO);
    }

    /*
     * @see chn.bhmc.dms.sal.ond.service.CallCarMasterService#selectGradeByCondition(chn.bhmc.dms.sal.ond.vo.GradeSearchVO)
     */
    @Override
    public List<GradeInfoVO> selectGradeByCondition(GradeSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return callCarMasterDAO.selectGradeByCondition(searchVO);
    }

}
