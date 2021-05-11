package chn.bhmc.dms.crm.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CarLineInfoService;
import chn.bhmc.dms.crm.cmm.service.dao.CarLineInfoDAO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarLineInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 25.     Kyo Jin Lee     최초 생성
 * </pre>
 */
@Service("carLineInfoService")
public class CarLineInfoServiceImpl extends HService implements CarLineInfoService {

    /**
     * 리드 관리 DAO
     */
    @Resource(name="carLineInfoDAO")
    CarLineInfoDAO carLineInfoDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#selectCarLineInfoByConditionCnt(chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO)
     */
    @Override
    public int selectCarLineInfoByConditionCnt(CarLineInfoSearchVO searchVO) throws Exception {
        return carLineInfoDAO.selectCarLineInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#selectCarLineInfoByCondition(chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO)
     */
    @Override
    public List<CarLineInfoVO> selectCarLineInfoByCondition(CarLineInfoSearchVO searchVO) throws Exception {
        return carLineInfoDAO.selectCarLineInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#insertCarLine(chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO)
     */
    @Override
    public int insertCarLine(CarLineInfoVO carLineInfoVO) throws Exception {

        dataSourceMessageSource.clearCache();
        carLineInfoVO.setSeq(selectNextCarLine());
        return carLineInfoDAO.insertCarLine(carLineInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#updateCarLine(chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO)
     */
    @Override
    public int updateCarLine(CarLineInfoVO carLineInfoVO) throws Exception {
        return carLineInfoDAO.updateCarLine(carLineInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#deleteCarLine(chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO)
     */
    @Override
    public int deleteCarLine(CarLineInfoVO carLineInfoVO) throws Exception {
        return carLineInfoDAO.deleteCarLine(carLineInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#selectCarLineByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public CarLineInfoVO selectCarLineByKey(String dlrCd, String pltCd, String seq) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#selectNextCarLine()
     */
    @Override
    public String selectNextCarLine() throws Exception {
        return carLineInfoDAO.selectNextCarLine();
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CarLineInfoService#multiCarLine(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCarLine(BaseSaveVO<CarLineInfoVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        for(CarLineInfoVO carLineInfoVO : obj.getInsertList()){
            carLineInfoVO.setRegUsrId(userId);
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoVO.setPltCd(pltCd);

            insertCarLine(carLineInfoVO);
        }

        for(CarLineInfoVO carLineInfoVO : obj.getUpdateList()){
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoVO.setPltCd(pltCd);

            if (carLineInfoVO.getSeq() == ""){
                carLineInfoVO.setRegUsrId(userId);
                insertCarLine(carLineInfoVO);
            } else {
                carLineInfoVO.setUpdtUsrId(userId);
                updateCarLine(carLineInfoVO);
            }
        }

        for(CarLineInfoVO carLineInfoVO : obj.getDeleteList()){
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoVO.setPltCd(pltCd);

            deleteCarLine(carLineInfoVO);
        }

    }

    /*
     * 대표관심차 확인
     *
     */
    @Override
    public int carLineFlagYnChk(HMap hm) throws Exception {
        return carLineInfoDAO.carLineFlagYnChk(hm);
    }



}
