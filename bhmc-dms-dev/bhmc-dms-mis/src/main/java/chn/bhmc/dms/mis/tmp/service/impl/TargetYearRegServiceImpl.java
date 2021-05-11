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
import chn.bhmc.dms.mis.tmp.service.TargetYearRegService;
import chn.bhmc.dms.mis.tmp.service.dao.TargetYearRegDAO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegVO;
/**
 * <pre>
 * [제조사] 년간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetYearRegServiceImpl.java
 * @Description : [제조사] 년간 목표 등록
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
@Service("targetYearRegService")
public class TargetYearRegServiceImpl extends HService implements TargetYearRegService, JxlsSupport {

    /**
     * 단위 관리 DAO
     */
    @Resource(name="targetYearRegDAO")
    TargetYearRegDAO targetYearRegDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception {

        TargetYearAllRegVO obj = selectTargetYearAllRegByKey(targetYearAllRegVO.getGoalYy(), targetYearAllRegVO.getSdptCd(), targetYearAllRegVO.getOfficeCd(), targetYearAllRegVO.getDlrCd(), targetYearAllRegVO.getCarLineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetYearRegDAO.insertTargetYearAllReg(targetYearAllRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetYearRegDAO.updateTargetYearAllReg(targetYearAllRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetYearRegDAO.deleteTargetYearAllReg(targetYearAllRegVO);
    }

    /**
     * [제조사] 년간 목표 등록 엑셀 전체 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertTargetAllYearRegUploadSave(List<TargetYearAllRegVO> list, TargetYearRegSearchVO targetYearRegSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetYearAllRegVO targetYearAllRegVO : list){
            targetYearAllRegVO.setRegUsrId(userId);
            targetYearAllRegVO.setUpdtUsrId(userId);

            targetYearAllRegVO.setGoalYy(targetYearRegSearchVO.getGoalYy());

            TargetYearAllRegVO obj = selectTargetYearAllRegByKey(targetYearAllRegVO.getGoalYy(), targetYearAllRegVO.getSdptCd(), targetYearAllRegVO.getOfficeCd(), targetYearAllRegVO.getDlrCd(), targetYearAllRegVO.getCarLineCd());


            if(obj == null) {
                targetYearAllRegVO.setGoalYy(targetYearAllRegVO.getGoalYy());
                insertTargetYearAllReg(targetYearAllRegVO);
            }else{
                targetYearAllRegVO.setGoalYy(obj.getGoalYy());
                targetYearAllRegVO.setSdptCd(obj.getSdptCd());
                targetYearAllRegVO.setOfficeCd(obj.getOfficeCd());
                targetYearAllRegVO.setDlrCd(obj.getDlrCd());
                targetYearAllRegVO.setCarLineCd(obj.getCarLineCd());

                updateTargetYearAllReg(targetYearAllRegVO);
            }
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetYearAllRegVO selectTargetYearAllRegByKey(String goalYy, String sdptCd, String officeCd, String dlrCd, String carLineCd) throws Exception {
        return targetYearRegDAO.selectTargetYearAllRegByKey(goalYy, sdptCd, officeCd, dlrCd, carLineCd);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        TargetYearRegSearchVO searchVO = new TargetYearRegSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<TargetYearAllRegVO> list = selectTargetYearAllRegByCondition(searchVO);
        context.putVar("items", list);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<TargetYearAllRegVO> selectTargetYearAllRegByCondition(TargetYearRegSearchVO searchVO) throws Exception {
        return targetYearRegDAO.selectTargetYearAllRegByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetYearAllRegByConditionCnt(TargetYearRegSearchVO searchVO) throws Exception {
        return targetYearRegDAO.selectTargetYearAllRegByConditionCnt(searchVO);
    }

    /**
     * [제조사] 년간 목표 등록 엑셀 부분 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertTargetPartYearRegUploadSave(List<TargetYearPartRegVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetYearPartRegVO targetYearPartRegVO : list){
            targetYearPartRegVO.setRegUsrId(userId);

            TargetYearPartRegVO obj = selectTargetYearPartRegByKey(targetYearPartRegVO.getGoalYy(), targetYearPartRegVO.getDlrCd(), targetYearPartRegVO.getCarLineCd());

            if(obj == null) {
                insertTargetYearPartReg(targetYearPartRegVO);
            }else{
                targetYearPartRegVO.setGoalYy(obj.getGoalYy());
                targetYearPartRegVO.setDlrCd(obj.getDlrCd());
                targetYearPartRegVO.setCarLineCd(obj.getCarLineCd());

                updateTargetYearPartReg(targetYearPartRegVO);
            }
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetYearPartRegVO selectTargetYearPartRegByKey(String goalYy, String dlrCd, String carLineCd) throws Exception {
        return targetYearRegDAO.selectTargetYearPartRegByKey(goalYy, dlrCd, carLineCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertTargetYearPartReg(TargetYearPartRegVO targetYearPartRegVO) throws Exception {

        TargetYearPartRegVO obj = selectTargetYearPartRegByKey(targetYearPartRegVO.getGoalYy(), targetYearPartRegVO.getDlrCd(), targetYearPartRegVO.getCarLineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetYearRegDAO.insertTargetYearPartReg(targetYearPartRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateTargetYearPartReg(TargetYearPartRegVO targetYearPartRegVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetYearRegDAO.updateTargetYearPartReg(targetYearPartRegVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiTargetYearRegTempSave(BaseSaveVO<TargetYearAllRegVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetYearAllRegVO targetYearAllRegVO : obj.getInsertList()){
            targetYearAllRegVO.setRegUsrId(userId);
            insertTargetYearAllReg(targetYearAllRegVO);
        }

        for(TargetYearAllRegVO targetYearAllRegVO : obj.getUpdateList()){
            targetYearAllRegVO.setUpdtUsrId(userId);
            updateTargetYearAllReg(targetYearAllRegVO);
        }

        for(TargetYearAllRegVO targetYearAllRegVO : obj.getDeleteList()){
            deleteTargetYearAllReg(targetYearAllRegVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiTargetYearRegCompleteSave(BaseSaveVO<TargetYearAllRegVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetYearAllRegVO targetYearAllRegVO : obj.getUpdateList()){
            targetYearAllRegVO.setUpdtUsrId(userId);
            multiTargetYearRegCompleteSave(targetYearAllRegVO);
        }
    }

    /**
     * {@inheritDoc}
     * @return
     */
    @Override
    public int multiTargetYearRegCompleteSave(TargetYearAllRegVO targetYearAllRegVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetYearAllRegVO.setUpdtUsrId(userId);

        return targetYearRegDAO.multiTargetYearRegCompleteSave(targetYearAllRegVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetYearRegVO> selectSdptList(TargetYearRegSearchVO searchVO) {

        return targetYearRegDAO.selectYearSdptList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetYearRegVO> selectOfficeList(TargetYearRegSearchVO searchVO) {

        return targetYearRegDAO.selectYearOfficeList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOfficeListCnt(TargetYearRegSearchVO searchVO) throws Exception {
        return targetYearRegDAO.selectOfficeListCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetYearRegVO> selectYearOfficeList(TargetYearRegSearchVO searchVO) {

        return targetYearRegDAO.selectYearOfficeList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int multiTargetYearRegCompleteSaveCnt(TargetYearAllRegVO targetYearAllRegVO) throws Exception {
        return targetYearRegDAO.multiTargetYearRegCompleteSaveCnt(targetYearAllRegVO);
    }



}
