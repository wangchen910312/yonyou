package chn.bhmc.dms.mis.tmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mis.tmp.service.TargetMarketStatusService;
import chn.bhmc.dms.mis.tmp.service.dao.TargetMarketStatusDAO;
import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusVO;
/**
 * <pre>
 * [제조사] 시장현황등록
 * </pre>
 *
 * @ClassName   : TargetMarketStatusServiceImpl.java
 * @Description : [제조사] 시장현황등록
 * @author chibeom.song
 * @since 2016. 9. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 9.    chibeom.song     최초 생성
 * </pre>
 */
@Service("targetMarketStatusService")
public class TargetMarketStatusServiceImpl  extends HService implements TargetMarketStatusService {

    /** TargetDcptMgmt DAO */
    @Resource(name = "targetMarketStatusDAO")
    private TargetMarketStatusDAO targetMarketStatusDAO;

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetMarketStatusVO> selectProvinceInfoList(TargetMarketStatusSearchVO searchVO) throws Exception {

        String provinceCd = searchVO.getsMarketStatusProvince();
        searchVO.setsMarketStatusProvince(provinceCd);
        return targetMarketStatusDAO.selectProvinceInfoList(searchVO);
    }

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetMarketStatusVO> selectProvinceInfoList(String provinceCd) throws Exception {

        TargetMarketStatusSearchVO searchVO = new TargetMarketStatusSearchVO();
        searchVO.setsMarketStatusProvince(provinceCd);

        return selectProvinceInfoList(searchVO);
    }

    /**
     * 시(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetMarketStatusVO> selectCityInfoList(TargetMarketStatusSearchVO searchVO) throws Exception {

        String provinceCd = searchVO.getsMarketStatusProvince();
        searchVO.setsMarketStatusProvince(provinceCd);
        return targetMarketStatusDAO.selectCityInfoList(searchVO);
    }

    /**
     * 시(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetMarketStatusVO> selectCityInfoList(String provinceCd) throws Exception {

        TargetMarketStatusSearchVO searchVO = new TargetMarketStatusSearchVO();
        searchVO.setsMarketStatusProvince(provinceCd);

        return selectCityInfoList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectManuMarketStatusCityCnt(TargetMarketStatusSearchVO searchVO) throws Exception {
        return targetMarketStatusDAO.selectManuMarketStatusCityCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusCityList(TargetMarketStatusSearchVO searchVO) {

        return targetMarketStatusDAO.selectManuMarketStatusCityList(searchVO);
    }

    /**
     * 시장현황자료를 조회한다.
     */
    @Override
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusByCondition(TargetMarketStatusSearchVO searchVO) throws Exception {

        return targetMarketStatusDAO.selectManuMarketStatusByCondition(searchVO);
    }

    /**
     * 시장현황자료 엑셀 일괄 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertManuMarketStatusDataRegUploadSave(List<TargetMarketStatusVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetMarketStatusVO targetMarketStatusVO : list){
            targetMarketStatusVO.setRegUsrId(userId);

            TargetMarketStatusVO obj = selectManuMarketStatusRegByKey(targetMarketStatusVO.getProvinceCd(), targetMarketStatusVO.getCityCd(),
                    targetMarketStatusVO.getRegYear(), targetMarketStatusVO.getRegMonth());


            if(obj == null) {
                insertManuMarketStatusReg(targetMarketStatusVO);
            }else{
                targetMarketStatusVO.setProvinceCd(targetMarketStatusVO.getProvinceCd());
                targetMarketStatusVO.setCityCd(targetMarketStatusVO.getCityCd());
                targetMarketStatusVO.setRegYear(targetMarketStatusVO.getRegYear());
                targetMarketStatusVO.setRegMonth(targetMarketStatusVO.getRegMonth());
                targetMarketStatusVO.setMarketRefVal(targetMarketStatusVO.getMarketRefVal());

                updateManuMarketStatusReg(targetMarketStatusVO);
            }
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertManuMarketStatusReg(TargetMarketStatusVO targetMarketStatusVO) throws Exception {

        TargetMarketStatusVO obj = selectManuMarketStatusRegByKey(targetMarketStatusVO.getProvinceCd(), targetMarketStatusVO.getCityCd(),
                targetMarketStatusVO.getRegYear(), targetMarketStatusVO.getRegMonth());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }


        return targetMarketStatusDAO.insertManuMarketStatusReg(targetMarketStatusVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateManuMarketStatusReg(TargetMarketStatusVO targetMarketStatusVO) throws Exception {

        return targetMarketStatusDAO.updateManuMarketStatusReg(targetMarketStatusVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetMarketStatusVO selectManuMarketStatusRegByKey(String provinceCd, String cityCd, String regYear, String regMonth) throws Exception {
        return targetMarketStatusDAO.selectManuMarketStatusRegByKey(provinceCd, cityCd, regYear, regMonth);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectManuMarketStatusByConditionCnt(TargetMarketStatusSearchVO searchVO) throws Exception {
        return targetMarketStatusDAO.selectManuMarketStatusByConditionCnt(searchVO);
    }

    /**
     * 시장현황자료를 조회한다.
     */
    @Override
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusRecentByCondition(TargetMarketStatusSearchVO searchVO) throws Exception {

        return targetMarketStatusDAO.selectManuMarketStatusRecentByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectManuMarketDetailByConditionCnt(TargetMarketStatusSearchVO searchVO) throws Exception {
        return targetMarketStatusDAO.selectManuMarketDetailByConditionCnt(searchVO);
    }

    /**
     * 시장현황자료를 조회한다.
     */
    @Override
    public List<TargetMarketStatusSearchVO> selectManuMarketDetailByCondition(TargetMarketStatusSearchVO searchVO) throws Exception {

        return targetMarketStatusDAO.selectManuMarketDetailByCondition(searchVO);
    }

}
