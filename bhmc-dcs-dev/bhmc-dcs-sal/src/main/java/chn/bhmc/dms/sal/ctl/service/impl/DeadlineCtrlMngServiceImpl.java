package chn.bhmc.dms.sal.ctl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.service.dao.DeadlineCtrlMngDAO;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSaveVO;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeadlineCtrlMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 4. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 28.      Kim yewon              최초 생성
 * </pre>
 */

@Service("deadlineCtrlMngService")
public class DeadlineCtrlMngServiceImpl extends HService implements DeadlineCtrlMngService{

    /**
     * 마감시간통제 DAO 선언
     */
    @Resource(name="deadlineCtrlMngDAO")
    DeadlineCtrlMngDAO deadlineCtrlMngDAO;

    /**
     * 조회 조건에 해당하는 마감시간통제 정보를 조회한다.
     */
    @Override
    public List<DeadlineCtrlMngVO> selectDeadlineCtrlMngByCondition(DeadlineCtrlMngSearchVO searchVO) throws Exception {
        return deadlineCtrlMngDAO.selectDeadlineCtrlMngByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 마감시간통제 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectDeadlineCtrlMngByConditionCnt(DeadlineCtrlMngSearchVO searchVO) throws Exception {
        return deadlineCtrlMngDAO.selectDeadlineCtrlMngByConditionCnt(searchVO);
    }


    /**
     * 조회 조건에 해당하는 마감대상 정보를 조회한다.
     */
    @Override
    public List<DeadlineCtrlMngVO> selectTargetDealerByCondition(DeadlineCtrlMngSearchVO searchVO) throws Exception {
        return deadlineCtrlMngDAO.selectTargetDealerByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 마감대상 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDealerByConditionCnt(DeadlineCtrlMngSearchVO searchVO) throws Exception {
        return deadlineCtrlMngDAO.selectTargetDealerByConditionCnt(searchVO);
    }


    /**
     * 상단그리드 저장
     * @throws Exception
     */
    @Override
    public void multiDeadlineCtrlMng(DeadlineCtrlMngSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(DeadlineCtrlMngVO vo : obj.getInsertList()){
            vo.setRegUsrId(userId);
            insertDeadlineCtrlMng(vo);
            procDeadlineHeader(vo);
        }

        for(DeadlineCtrlMngVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(userId);
            updateDeadlineCtrlMng(vo);
            procDeadlineHeader(vo);
        }

    }



    /**
     * {@inheritDoc}
     */
    @Override
    public int insertDeadlineCtrlMng(DeadlineCtrlMngVO vo) throws Exception {

        DeadlineCtrlMngVO obj = selectDeadlineCtrlMngByKey(vo);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return deadlineCtrlMngDAO.insertDeadlineCtrlMng(vo);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public DeadlineCtrlMngVO selectDeadlineCtrlMngByKey(DeadlineCtrlMngVO vo) throws Exception {
        return deadlineCtrlMngDAO.selectDeadlineCtrlMngByKey(vo);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDeadlineCtrlMng(DeadlineCtrlMngVO vo) throws Exception {
        return deadlineCtrlMngDAO.updateDeadlineCtrlMng(vo);
    }


    /**
     * 하단그리드 저장
     * @throws Exception
     */
    @Override
    public void multiTargetDealer(DeadlineCtrlMngSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(DeadlineCtrlMngVO vo : obj.getInsertList()){
            vo.setRegUsrId(userId);
            insertTargetDealer(vo);
            procDeadlineDetail(vo);
        }

        for(DeadlineCtrlMngVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(userId);
            updateTargetDealer(vo);
            procDeadlineDetail(vo);
        }

        for(DeadlineCtrlMngVO vo : obj.getDeleteList()){
            deleteTargetDealer(vo);
            procDeadlineDetail(vo);
        }
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public int insertTargetDealer(DeadlineCtrlMngVO vo) throws Exception {

        DeadlineCtrlMngVO obj = selectTargetDealerByKey(vo);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return deadlineCtrlMngDAO.insertTargetDealer(vo);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public DeadlineCtrlMngVO selectTargetDealerByKey(DeadlineCtrlMngVO vo) throws Exception {
        return deadlineCtrlMngDAO.selectTargetDealerByKey(vo);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public int updateTargetDealer(DeadlineCtrlMngVO vo) throws Exception {
        return deadlineCtrlMngDAO.updateTargetDealer(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteTargetDealer(DeadlineCtrlMngVO vo) throws Exception {
        return deadlineCtrlMngDAO.deleteTargetDealer(vo);
    }


    /**
     * 마감시간 체크
     * ex) sCtrlGrpCd  :  통제그룹                 A:오더 , B : 소매
     *     sCtrlTargCd :  통제대상(필수)         AS:전략오더, B00:전략수량등록, C01:소매처리
     *     sCtrlDlrCd  :  해당 딜러코드 (필수)
     * @param vo
     * @return
     * @throws Exception
     */
    @Override
    public int selectDeadLineCheck(DeadlineCtrlMngSearchVO vo) throws Exception {
        return deadlineCtrlMngDAO.selectDeadLineCheck(vo);
    }

    /**
     * 마감시간통제-헤더 인터페이스 저장 프로시져.
     */
    @Override
    public int procDeadlineHeader(DeadlineCtrlMngVO vo) throws Exception {
        return deadlineCtrlMngDAO.procDeadlineHeader(vo);
    }

    /**
     * 마감시간통제-디테일 인터페이스 저장 프로시져.
     */
    @Override
    public int procDeadlineDetail(DeadlineCtrlMngVO vo) throws Exception {
        return deadlineCtrlMngDAO.procDeadlineDetail(vo);
    }
}
