package chn.bhmc.dms.crm.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.SmsTmplUserService;
import chn.bhmc.dms.crm.cmm.service.dao.SmsTmplUserDAO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserSearchVO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsTmplUserServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2016.06.27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.27.     In Moon Lee     최초 생성
 * </pre>
 */
@Service("smsTmplUserService")
public class SmsTmplUserServiceImpl extends HService implements SmsTmplUserService {

    /**
     * DAO
     */
    @Resource(name="smsTmplUserDAO")
    SmsTmplUserDAO smsTmplUserDAO;

    /**
     * SMS 발송 대상자 임시 저장
     *
     * @param List<SmsTmplUserVO>
     * @return Inserte SEQ
     */
    @Override
    public int insertSmsTmplUsers(List<SmsTmplUserVO> saveVO) throws Exception {

        String userId = LoginUtil.getUserId();

        int seq = smsTmplUserDAO.selectSmsTmplSeq();

        for (SmsTmplUserVO obj : saveVO) {
            obj.setSeq(seq);
            obj.setRegUsrId(userId);
            smsTmplUserDAO.insertSmsTmplUsers(obj);
        }

        return seq;
    }

    /**
     * SMS 발송 대상자 임시 목록 데이터 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SmsTmplUserSearchVO
     * @return
     */
    @Override
    public int selectSmsTmplUsersByConditionCnt(SmsTmplUserSearchVO searchVO) throws Exception {
        return smsTmplUserDAO.selectSmsTmplUsersByConditionCnt(searchVO);
    }

    /**
     * SMS 발송 대상자 임시 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SmsTmplUserSearchVO
     * @return
     */
    @Override
    public List<SmsTmplUserVO> selectSmsTmplUsersByCondition(SmsTmplUserSearchVO searchVO) throws Exception {
        return smsTmplUserDAO.selectSmsTmplUsersByCondition(searchVO);
    }

    /**
     * SMS 발송 대상자 임시 목록 삭제
     */
    @Override
    public int deleteSmsTmplUsers(SmsTmplUserSearchVO searchVO) throws Exception {
        return smsTmplUserDAO.deleteSmsTmplUsers(searchVO);
    }

}