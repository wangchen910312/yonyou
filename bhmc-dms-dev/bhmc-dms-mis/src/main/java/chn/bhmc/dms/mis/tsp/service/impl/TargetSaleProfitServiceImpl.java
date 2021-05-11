package chn.bhmc.dms.mis.tsp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mis.tsp.service.TargetSaleProfitService;
import chn.bhmc.dms.mis.tsp.service.dao.TargetSaleProfitDAO;
import chn.bhmc.dms.mis.tsp.vo.TargetSaleProfitVO;

/**
 * <pre>
 * [딜러사] 판매이익
 * </pre>
 *
 * @ClassName   : TargetSaleProfitServiceImpl.java
 * @Description : [딜러사] 판매이익
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
@Service("targetSaleProfitService")
public class TargetSaleProfitServiceImpl extends HService implements TargetSaleProfitService {

    /**
     * [제조사] 동종업계 참조 DAO
     */
    @Resource(name="targetSaleProfitDAO")
    TargetSaleProfitDAO targetSaleProfitDAO;

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     */
    @Override
    public List<TargetSaleProfitVO> selectTargetSaleProfitByCondition(TargetSaleProfitVO searchVO) throws Exception {
        return targetSaleProfitDAO.selectTargetSaleProfitByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetSaleProfitByConditionCnt(TargetSaleProfitVO searchVO) throws Exception {
        return targetSaleProfitDAO.selectTargetSaleProfitByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     */
    @Override
    public List<TargetSaleProfitVO> selectCarlineProfitByCondition(TargetSaleProfitVO searchVO) throws Exception {
        return targetSaleProfitDAO.selectCarlineProfitByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     */
    @Override
    public int selectCarlineProfitByConditionCnt(TargetSaleProfitVO searchVO) throws Exception {
        return targetSaleProfitDAO.selectCarlineProfitByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     */
    @Override
    public List<TargetSaleProfitVO> selectProfitTargetSearchByCondition(TargetSaleProfitVO searchVO) throws Exception {
        return targetSaleProfitDAO.selectProfitTargetSearchByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     */
    @Override
    public int selectProfitTargetSearchByConditionCnt(TargetSaleProfitVO searchVO) throws Exception {
        return targetSaleProfitDAO.selectProfitTargetSearchByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertCarlineProfitByCondition(TargetSaleProfitVO searchVO) throws Exception {

        TargetSaleProfitVO obj = selectCarlineProfitByConditionByKey(searchVO.getsCarlineYyMm());

        String userId = LoginUtil.getUserId();
        searchVO.setRegUsrId(userId);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetSaleProfitDAO.insertCarlineProfitByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetSaleProfitVO selectCarlineProfitByConditionByKey(String sCarlineYyMm) throws Exception {
        return targetSaleProfitDAO.selectCarlineProfitByConditionByKey(sCarlineYyMm);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCarlineProfitSave(BaseSaveVO<TargetSaleProfitVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetSaleProfitVO targetSaleProfitVO : obj.getInsertList()){
            targetSaleProfitVO.setRegUsrId(userId);
            insertCarlineProfitSave(targetSaleProfitVO);
        }

        for(TargetSaleProfitVO targetSaleProfitVO : obj.getUpdateList()){
            targetSaleProfitVO.setUpdtUsrId(userId);
            updateCarlineProfitSave(targetSaleProfitVO);
        }

        for(TargetSaleProfitVO targetSaleProfitVO : obj.getDeleteList()){
            deleteCarlineProfitSave(targetSaleProfitVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertCarlineProfitSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception {

        TargetSaleProfitVO obj = selectCarlineProfitByKey(targetSaleProfitVO.getGoalYy(), targetSaleProfitVO.getGoalMm(), targetSaleProfitVO.getCarlineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetSaleProfitDAO.insertCarlineProfitSave(targetSaleProfitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateCarlineProfitSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception {

        return targetSaleProfitDAO.updateCarlineProfitSave(targetSaleProfitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteCarlineProfitSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception {

        return targetSaleProfitDAO.deleteCarlineProfitSave(targetSaleProfitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetSaleProfitVO selectCarlineProfitByKey(String goalYy, String goalMm, String carlineCd) throws Exception {
        return targetSaleProfitDAO.selectCarlineProfitByKey(goalYy, goalMm, carlineCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertProfitTargetByCondition(TargetSaleProfitVO searchVO) throws Exception {

        TargetSaleProfitVO obj = selectProfitTargetByConditionByKey(searchVO.getsProfitTargetYyMm());

        String userId = LoginUtil.getUserId();
        searchVO.setRegUsrId(userId);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetSaleProfitDAO.insertProfitTargetByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetSaleProfitVO selectProfitTargetByConditionByKey(String sProfitTargetYyMm) throws Exception {
        return targetSaleProfitDAO.selectProfitTargetByConditionByKey(sProfitTargetYyMm);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiProfitTargetSave(BaseSaveVO<TargetSaleProfitVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetSaleProfitVO targetSaleProfitVO : obj.getInsertList()){
            targetSaleProfitVO.setRegUsrId(userId);
            insertProfitTargetSave(targetSaleProfitVO);
        }

        for(TargetSaleProfitVO targetSaleProfitVO : obj.getUpdateList()){
            targetSaleProfitVO.setUpdtUsrId(userId);
            updateProfitTargetSave(targetSaleProfitVO);
        }

        for(TargetSaleProfitVO targetSaleProfitVO : obj.getDeleteList()){
            deleteProfitTargetSave(targetSaleProfitVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertProfitTargetSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception {

        TargetSaleProfitVO obj = selectProfitTargetByKey(targetSaleProfitVO.getGoalYy(), targetSaleProfitVO.getGoalMm(), targetSaleProfitVO.getCarlineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetSaleProfitDAO.insertProfitTargetSave(targetSaleProfitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateProfitTargetSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception {

        return targetSaleProfitDAO.updateProfitTargetSave(targetSaleProfitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteProfitTargetSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception {

        return targetSaleProfitDAO.deleteProfitTargetSave(targetSaleProfitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetSaleProfitVO selectProfitTargetByKey(String goalYy, String goalMm, String carlineCd) throws Exception {
        return targetSaleProfitDAO.selectProfitTargetByKey(goalYy, goalMm, carlineCd);
    }


}
