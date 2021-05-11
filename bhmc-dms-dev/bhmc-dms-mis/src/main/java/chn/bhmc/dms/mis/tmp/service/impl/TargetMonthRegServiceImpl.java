package chn.bhmc.dms.mis.tmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mis.tmp.service.TargetMonthRegService;
import chn.bhmc.dms.mis.tmp.service.dao.TargetMonthRegDAO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegVO;
/**
 * <pre>
 * [제조사] 월간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetMonthRegServiceImpl.java
 * @Description : [제조사] 월간 목표 등록
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
@Service("targetMonthRegService")
public class TargetMonthRegServiceImpl extends HService implements TargetMonthRegService, JxlsSupport {

    /**
     * 단위 관리 DAO
     */
    @Resource(name="targetMonthRegDAO")
    TargetMonthRegDAO targetMonthRegDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<TargetMonthAllRegVO> selectTargetMonthAllRegByCondition(TargetMonthRegSearchVO searchVO) throws Exception {
        return targetMonthRegDAO.selectTargetMonthAllRegByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetMonthAllRegByConditionCnt(TargetMonthRegSearchVO searchVO) throws Exception {
        return targetMonthRegDAO.selectTargetMonthAllRegByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        TargetMonthRegSearchVO searchVO = new TargetMonthRegSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        //List<TargetMonthAllRegVO> list = selectTargetMonthAllRegByCondition(searchVO);
        //context.putVar("items", list);
    }

    /**
     * [제조사] 월간 목표 등록 엑셀 전체 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertTargetAllMonthRegUploadSave(List<TargetMonthAllRegVO> list, TargetMonthRegSearchVO targetMonthRegSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetMonthAllRegVO targetMonthAllRegVO : list){
            targetMonthAllRegVO.setRegUsrId(userId);
            targetMonthAllRegVO.setUpdtUsrId(userId);

            targetMonthAllRegVO.setGoalYyMm(targetMonthRegSearchVO.getGoalYyMm());

            TargetMonthAllRegVO obj = selectTargetMonthAllRegByKey(targetMonthAllRegVO.getGoalYyMm(), targetMonthAllRegVO.getGoalYy(), targetMonthAllRegVO.getGoalMm(), targetMonthAllRegVO.getSdptCd(), targetMonthAllRegVO.getOfficeCd(), targetMonthAllRegVO.getDlrCd(), targetMonthAllRegVO.getCarLineCd());


            if(obj == null) {
                targetMonthAllRegVO.setGoalYyMm(targetMonthAllRegVO.getGoalYyMm());
                insertTargetMonthAllReg(targetMonthAllRegVO);
            }else{
                targetMonthAllRegVO.setGoalYy(obj.getGoalYy());
                targetMonthAllRegVO.setGoalMm(obj.getGoalMm());
                targetMonthAllRegVO.setSdptCd(obj.getSdptCd());
                targetMonthAllRegVO.setOfficeCd(obj.getOfficeCd());
                targetMonthAllRegVO.setDlrCd(obj.getDlrCd());
                targetMonthAllRegVO.setCarLineCd(obj.getCarLineCd());

                updateTargetMonthAllReg(targetMonthAllRegVO);
            }
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception {

        TargetMonthAllRegVO obj = selectTargetMonthAllRegByKey(targetMonthAllRegVO.getGoalYyMm(), targetMonthAllRegVO.getGoalYy(), targetMonthAllRegVO.getGoalMm(), targetMonthAllRegVO.getSdptCd(), targetMonthAllRegVO.getOfficeCd(), targetMonthAllRegVO.getDlrCd(), targetMonthAllRegVO.getCarLineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetMonthRegDAO.insertTargetMonthAllReg(targetMonthAllRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetMonthRegDAO.updateTargetMonthAllReg(targetMonthAllRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetMonthRegDAO.deleteTargetMonthAllReg(targetMonthAllRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetMonthAllRegVO selectTargetMonthAllRegByKey(String goalYyMm, String goalYy, String goalMm, String sdptCd, String officeCd, String dlrCd, String carLineCd) throws Exception {
        return targetMonthRegDAO.selectTargetMonthAllRegByKey(goalYyMm, goalYy, goalMm, sdptCd, officeCd, dlrCd, carLineCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiTargetMonthRegTempSave(BaseSaveVO<TargetMonthAllRegVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetMonthAllRegVO targetMonthAllRegVO : obj.getInsertList()){
            targetMonthAllRegVO.setRegUsrId(userId);
            insertTargetMonthAllReg(targetMonthAllRegVO);
        }

        for(TargetMonthAllRegVO targetMonthAllRegVO : obj.getUpdateList()){
            targetMonthAllRegVO.setUpdtUsrId(userId);
            updateTargetMonthAllReg(targetMonthAllRegVO);
        }

        for(TargetMonthAllRegVO targetMonthAllRegVO : obj.getDeleteList()){
            deleteTargetMonthAllReg(targetMonthAllRegVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiTargetMonthRegCompleteSave(BaseSaveVO<TargetMonthAllRegVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetMonthAllRegVO targetMonthAllRegVO : obj.getUpdateList()){
            targetMonthAllRegVO.setUpdtUsrId(userId);
            multiTargetMonthRegCompleteSave(targetMonthAllRegVO);
        }
    }

    /**
     * {@inheritDoc}
     * @return
     */
    @Override
    public int multiTargetMonthRegCompleteSave(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetMonthAllRegVO.setUpdtUsrId(userId);

        return targetMonthRegDAO.multiTargetMonthRegCompleteSave(targetMonthAllRegVO);
    }

    /**
     * [제조사] 월간 목표 등록 엑셀 부분 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertTargetPartMonthRegUploadSave(List<TargetMonthPartRegVO> list) throws Exception {

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetMonthPartRegVO selectTargetMonthPartRegByKey(String goalYy, String goalMm, String dlrCd, String carLineCd) throws Exception {
        return targetMonthRegDAO.selectTargetMonthPartRegByKey(goalYy, goalMm, dlrCd, carLineCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertTargetMonthPartReg(TargetMonthPartRegVO targetMonthPartRegVO) throws Exception {

        TargetMonthPartRegVO obj = selectTargetMonthPartRegByKey(targetMonthPartRegVO.getGoalYy(), targetMonthPartRegVO.getGoalMm(), targetMonthPartRegVO.getDlrCd(), targetMonthPartRegVO.getCarLineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetMonthRegDAO.insertTargetMonthPartReg(targetMonthPartRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateTargetMonthPartReg(TargetMonthPartRegVO targetMonthPartRegVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetMonthRegDAO.updateTargetMonthPartReg(targetMonthPartRegVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetMonthRegVO> selectSdptList(TargetMonthRegSearchVO searchVO) {

        return targetMonthRegDAO.selectSdptList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetMonthRegVO> selectOfficeList(TargetMonthRegSearchVO searchVO) {

        return targetMonthRegDAO.selectOfficeList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetMonthRegVO> selectDealerList(TargetMonthRegSearchVO searchVO) {

        return targetMonthRegDAO.selectDealerList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOfficeListCnt(TargetMonthRegSearchVO searchVO) throws Exception {
        return targetMonthRegDAO.selectOfficeListCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetMonthRegVO> selectMonthOfficeList(TargetMonthRegSearchVO searchVO) {

        return targetMonthRegDAO.selectMonthOfficeList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDealerListCnt(TargetMonthRegSearchVO searchVO) throws Exception {
        return targetMonthRegDAO.selectDealerListCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetMonthRegVO> selectMonthDealerList(TargetMonthRegSearchVO searchVO) {

        return targetMonthRegDAO.selectMonthDealerList(searchVO);
    }

}
