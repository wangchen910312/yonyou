package chn.bhmc.dms.mis.tdm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mis.tdm.service.TargetDcptMgmtService;
import chn.bhmc.dms.mis.tdm.service.dao.TargetDcptMgmtDAO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtBaseVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSalemanVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSearchVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusVO;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtServiceImpl.java
 * @Description : [딜러사] 목표분해도
 * @author chibeom.song
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetDcptMgmtService")
public class TargetDcptMgmtServiceImpl extends HService implements TargetDcptMgmtService {

    /** TargetDcptMgmt DAO */
    @Resource(name = "targetDcptMgmtDAO")
    private TargetDcptMgmtDAO targetDcptMgmtDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetDcptMgmtVO> selectProvinceInfoList(TargetDcptMgmtSearchVO searchVO) throws Exception {

        String provinceCd = searchVO.getsMarketStatusProvince();
        searchVO.setsMarketStatusProvince(provinceCd);
        return targetDcptMgmtDAO.selectProvinceInfoList(searchVO);
    }

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetDcptMgmtVO> selectProvinceInfoList(String provinceCd) throws Exception {

        TargetDcptMgmtSearchVO searchVO = new TargetDcptMgmtSearchVO();
        searchVO.setsMarketStatusProvince(provinceCd);

        return selectProvinceInfoList(searchVO);
    }

    /**
     * 시(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetDcptMgmtVO> selectCityInfoList(TargetDcptMgmtSearchVO searchVO) throws Exception {

        String provinceCd = searchVO.getsMarketStatusProvince();
        searchVO.setsMarketStatusProvince(provinceCd);
        return targetDcptMgmtDAO.selectCityInfoList(searchVO);
    }

    /**
     * 시(우편번호) 목록을 조회한다.
     */
    @Override
    public List<TargetDcptMgmtVO> selectCityInfoList(String provinceCd) throws Exception {

        TargetDcptMgmtSearchVO searchVO = new TargetDcptMgmtSearchVO();
        searchVO.setsMarketStatusProvince(provinceCd);

        return selectCityInfoList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectMarketStatusCityCnt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectMarketStatusCityCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectMarketStatusCityList(TargetDcptMgmtSearchVO searchVO) {

        return targetDcptMgmtDAO.selectMarketStatusCityList(searchVO);
    }

    /**
     * 시장현황자료 엑셀 일괄 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertTargetDcptMgmtRegUploadSave(List<TargetMarketStatusVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetMarketStatusVO targetDcptMgmtVO : list){
            targetDcptMgmtVO.setRegUsrId(userId);

            TargetDcptMgmtVO obj = selectTargetDcptMgmtRegByKey(targetDcptMgmtVO.getProvinceCd(), targetDcptMgmtVO.getCityCd(),
                    targetDcptMgmtVO.getRegYear(), targetDcptMgmtVO.getRegMonth());


            if(obj == null) {
                insertTargetDcptMgmtReg(targetDcptMgmtVO);
            }else{
                targetDcptMgmtVO.setProvinceCd(targetDcptMgmtVO.getProvinceCd());
                targetDcptMgmtVO.setCityCd(targetDcptMgmtVO.getCityCd());
                targetDcptMgmtVO.setRegYear(targetDcptMgmtVO.getRegYear());
                targetDcptMgmtVO.setRegMonth(targetDcptMgmtVO.getRegMonth());
                targetDcptMgmtVO.setMarketRefVal(targetDcptMgmtVO.getMarketRefVal());

                updateTargetDcptMgmtReg(targetDcptMgmtVO);
            }
        }
    }


    @Override
    public void insertTargetDcptMgmtRegUploadSaveI(List<TargetMarketStatusVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetMarketStatusVO targetDcptMgmtVO : list){
            targetDcptMgmtVO.setRegUsrId(userId);

            TargetDcptMgmtVO obj = selectTargetDcptMgmtRegByKeyI(targetDcptMgmtVO.getProvinceCd(), targetDcptMgmtVO.getCityCd(),
                    targetDcptMgmtVO.getRegYear(), targetDcptMgmtVO.getRegMonth());


            if(obj == null) {
                insertTargetDcptMgmtRegI(targetDcptMgmtVO);
            }else{
                targetDcptMgmtVO.setProvinceCd(targetDcptMgmtVO.getProvinceCd());
                targetDcptMgmtVO.setCityCd(targetDcptMgmtVO.getCityCd());
                targetDcptMgmtVO.setRegYear(targetDcptMgmtVO.getRegYear());
                targetDcptMgmtVO.setRegMonth(targetDcptMgmtVO.getRegMonth());
                targetDcptMgmtVO.setMarketRefVal(targetDcptMgmtVO.getMarketRefVal());

                updateTargetDcptMgmtRegI(targetDcptMgmtVO);
            }
        }

    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int insertTargetDcptMgmtReg(TargetMarketStatusVO targetDcptMgmtVO) throws Exception {

        TargetDcptMgmtVO obj = selectTargetDcptMgmtRegByKey(targetDcptMgmtVO.getProvinceCd(), targetDcptMgmtVO.getCityCd(),
                targetDcptMgmtVO.getRegYear(), targetDcptMgmtVO.getRegMonth());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetDcptMgmtDAO.insertTargetDcptMgmtReg(targetDcptMgmtVO);
    }

    @Override
    public int insertTargetDcptMgmtRegI(TargetMarketStatusVO targetDcptMgmtVO) throws Exception {

        TargetDcptMgmtVO obj = selectTargetDcptMgmtRegByKeyI(targetDcptMgmtVO.getProvinceCd(), targetDcptMgmtVO.getCityCd(),
                targetDcptMgmtVO.getRegYear(), targetDcptMgmtVO.getRegMonth());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetDcptMgmtDAO.insertTargetDcptMgmtRegI(targetDcptMgmtVO);

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateTargetDcptMgmtReg(TargetMarketStatusVO targetDcptMgmtVO) throws Exception {

        dataSourceMessageSource.clearCache();
        return targetDcptMgmtDAO.updateTargetDcptMgmtReg(targetDcptMgmtVO);
    }

    // MS0107 I 테이블 전용
    @Override
    public int updateTargetDcptMgmtRegI(TargetMarketStatusVO targetDcptMgmtVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetDcptMgmtDAO.updateTargetDcptMgmtRegI(targetDcptMgmtVO);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteTargetDcptMgmtReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception {

        dataSourceMessageSource.clearCache();
        return targetDcptMgmtDAO.deleteTargetDcptMgmtReg(targetDcptMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetDcptMgmtVO selectTargetDcptMgmtRegByKey(String provinceCd, String cityCd, String regYear, String regMonth) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtRegByKey(provinceCd, cityCd, regYear, regMonth);
    }

    /**  MS0107 T 테이블 전용으로 하나 더 생성함
     * {@inheritDoc}
     */
    @Override
    public TargetDcptMgmtVO selectTargetDcptMgmtRegByKeyI(String provinceCd, String cityCd, String regYear, String regMonth) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtRegByKeyI(provinceCd, cityCd, regYear, regMonth);
    }

    /**
     * 시장현황자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetDcptMgmtByConditionCnt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtByConditionCnt(searchVO);
    }


    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerStatusBasicGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerStatusBasicGrid(searchVO);
    }

    /**
     * 딜러현황자료(채널별 정보)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerStatusDetailGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerStatusDetailGrid(searchVO);
    }

    /**
     * 제조사 당월 차종별 목표를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetGridByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtManuTargetGridByCondition(searchVO);
    }

    /**
     * 제조사 당월 차종별 목표 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDcptMgmtManuTargetGridCnt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtManuTargetGridCnt(searchVO);
    }

    /**
     * 제조사 당월 총목표를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetSearch(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtManuTargetSearch(targetDcptMgmtSearchVO);
    }

    /**
     * 제조사 당월 총목표를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetAllGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtManuTargetAllGrid(searchVO);
    }

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(당월 총목표 그리드)
     */
    @Override
    public int selectTargetDcptMgmtDealerSaleDcptTotalCnt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSaleDcptTotalCnt(searchVO);
    }

    /**
     * 딜러분해 자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptTotalResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSaleDcptTotalResult(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtVO> selectTargetDcptMgmtDealerSaleDcptTotalBasic(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSaleDcptTotalBasic(searchVO);
    }

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(차종별 목표 그리드)
     */
    @Override
    public int selectTargetDcptMgmtDealerSaleDcptCarCnt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSaleDcptCarCnt(searchVO);
    }

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSaleDcptCarResult(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptShopResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSaleDcptShopResult(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtVO> selectTargetDcptMgmtDealerSaleDcptCarBasic(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSaleDcptCarBasic(searchVO);
    }

    /**
     * 딜러분해 차종별 목표자료 총 내역수 조회
     */
    @Override
    public int selectTargetDcptMgmtDealerDcptCarViewByConditionCnt(TargetDcptMgmtSearchVO searchVO) throws Exception{ // selectStrOrdOcnBlockingsByConditionCnt
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptCarViewByConditionCnt(searchVO); // selectStrOrdOcnBlockingsByConditionCnt
    }

    /**
     * 딜러분해 차종별 목표자료를 등록한다.
     */
    @Override
    public int insertTargetDcptMgmtDealerSaleDcptTotalResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptMgmtSearchVO.setDealerRegUsrId(userId);
        return targetDcptMgmtDAO.insertTargetDcptMgmtDealerSaleDcptTotalResult(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 차종별 목표자료 헤더 & 내역 조회
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDcptMgmtDealerDcptCarViewByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception{ // selectStrOrdOcnBlockingsByCondition
        Map<String, List> map = new HashMap<String, List>();

        // 딜러분해 차종별 목표자료 - 헤더 조회
        List<TargetDcptMgmtBaseVO> columnList = targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptCarHeadersByCondition(searchVO); // StrOrdOcnBlockingVO, selectStrOrdOcnBlockingHeadersByCondition
        map.put("columnList", columnList);

        int maxSize = columnList.size();
        // 딜러분해 차종별 목표자료 - 내역 조회
        List<TargetDcptMgmtBaseVO> voList = targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptCarViewByCondition(searchVO); // StrOrdOcnBlockingVO, selectStrOrdOcnBlockingsByCondition

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptMgmtBaseVO vo : voList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("dealerDlrCd") ){
                hMap.put("dealerDlrCd", vo.getDealerDlrCd());
                hMap.put("dealerDlrTp", vo.getDealerDlrTp());
                hMap.put(vo.getDealerCarlineCd(), vo.getDealerGoalPrefVal() );
            }else{
                hMap.put(vo.getDealerCarlineCd(), vo.getDealerGoalPrefVal() );
            }

            if(count == maxSize){
                resultList.add(hMap);
                count = 0;
            }
        }

        map.put("dataSet", resultList);
        return map;
    }

    /**
     * 딜러분해 차종별 목표자료를 등록한다.
     */
    @Override
    public int insertTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptMgmtSearchVO.setDealerRegUsrId(userId);
        return targetDcptMgmtDAO.insertTargetDcptMgmtDealerSaleDcptCarResult(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(집객 목표 그리드)
     */
    @Override
    public int selectTargetDcptMgmtDealerDcptCustCnt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptCustCnt(searchVO);
    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptCustResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptCustResult(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 집객 목표자료를 등록한다.
     */
    @Override
    public int insertTargetDcptMgmtDealerDcptCustResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptMgmtSearchVO.setDealerRegUsrId(userId);
        return targetDcptMgmtDAO.insertTargetDcptMgmtDealerDcptCustResult(targetDcptMgmtSearchVO);
    }

    /*
     * 딜러분해 집객 목표자료를 등록한다.
     */
    @Override
    public void updateTargetDcptMgmtDealerDcptCar(BaseSaveVO<TargetDcptMgmtSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO : obj.getUpdateList()){

            targetDcptMgmtSearchVO.setDealerUpdtUsrId(userId);
            targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptCar(targetDcptMgmtSearchVO);
        }

    }

    /**
     * 딜러분해 집객 목표자료를 등록한다.
     */
    @Override
    public void updateTargetDcptMgmtDealerDcptCust(BaseSaveVO<TargetDcptMgmtSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO : obj.getUpdateList()){

            targetDcptMgmtSearchVO.setCustDealerUpdtUsrId(userId);
            targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptCust(targetDcptMgmtSearchVO);
        }

    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManAllData(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptSaleManAllData(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManAllStatus(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptSaleManAllStatus(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManProStatus(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerDcptSaleManProStatus(targetDcptMgmtSearchVO);
    }

    /**
     * [제조사] 년간 목표 등록 엑셀 전체 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertSalesmanDcptRegUploadSave(List<TargetDcptMgmtSalemanVO> list, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO : list){
            targetDcptMgmtSalemanVO.setRegUsrId(userId);

            targetDcptMgmtSalemanVO.setsDealerSaleManDcptYyMm(targetDcptMgmtSalemanVO.getsDealerSaleManDcptYyMm());

            TargetDcptMgmtSalemanVO obj = selectSalesmanDcptRegByKey(targetDcptMgmtSalemanVO.getsDealerSaleManDcptYyMm(), targetDcptMgmtSalemanVO.getEmpNo(), targetDcptMgmtSalemanVO.getCarlineCd());


            if(obj == null) {
                targetDcptMgmtSalemanVO.setsDealerSaleManDcptYyMm(targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm());
                insertSalesmanDcptReg(targetDcptMgmtSalemanVO);
            }else{
                targetDcptMgmtSalemanVO.setsDealerSaleManDcptYyMm(obj.getsDealerSaleManDcptYyMm());
                targetDcptMgmtSalemanVO.setEmpNo(obj.getEmpNo());
                targetDcptMgmtSalemanVO.setCarlineCd(obj.getCarlineCd());
                targetDcptMgmtSalemanVO.setGoalPrefVal(obj.getGoalPrefVal());

                updateSalesmanDcptReg(targetDcptMgmtSalemanVO);
            }
        }
    }

    @Override
    public int insertSalesmanDcptReg(TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO) throws Exception {

        targetDcptMgmtSalemanVO.setsDealerSaleManDcptYyMm(targetDcptMgmtSalemanVO.getsDealerSaleManDcptYyMm());

        TargetDcptMgmtSalemanVO obj = selectSalesmanDcptRegByKey(targetDcptMgmtSalemanVO.getsDealerSaleManDcptYyMm(), targetDcptMgmtSalemanVO.getEmpNo(), targetDcptMgmtSalemanVO.getCarlineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetDcptMgmtDAO.insertSalesmanDcptReg(targetDcptMgmtSalemanVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetDcptMgmtSalemanVO selectSalesmanDcptRegByKey(String sDealerSaleManDcptYyMm, String empNo, String carlineCd) throws Exception {
        return targetDcptMgmtDAO.selectSalesmanDcptRegByKey(sDealerSaleManDcptYyMm, empNo, carlineCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSalesmanDcptReg(TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetDcptMgmtDAO.updateSalesmanDcptReg(targetDcptMgmtSalemanVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSalemanDcpt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSalemanDcpt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetDcptMgmtDealerSalemanDcptCnt(TargetDcptMgmtSearchVO searchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerSalemanDcptCnt(searchVO);
    }

    /**
     * 과정관리 자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtSale(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtProcessMgmtSale(searchVO);
    }

    /**
     * KPI 자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtKpi(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtKpi(targetDcptMgmtSearchVO);
    }

    @Override
    public int updateTargetDcptMgmtDealerDcptSaleAll(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptMgmtSearchVO.setDealerUpdtUsrId(userId);

        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleIdcc(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleShop(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo1(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo2(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo3(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo4(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo5(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo6(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo7(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo8(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo9(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo10(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo11(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo12(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo13(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo14(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo15(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo16(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo17(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo18(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo19(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo20(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo21(targetDcptMgmtSearchVO);

        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo22(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo23(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo24(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo25(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo26(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo27(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo28(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo29(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo30(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo31(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo32(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo33(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo34(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo35(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo36(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo37(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo38(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo39(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo40(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo41(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleCarNo42(targetDcptMgmtSearchVO);

        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptCustIdcc(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptCustShop(targetDcptMgmtSearchVO);

        return 1;
    }

    @Override
    public int updateTargetDcptMgmtDealerDcptSaleComplete(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptMgmtSearchVO.setDealerUpdtUsrId(userId);

        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptSaleComplete(targetDcptMgmtSearchVO);

        return 1;
    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtPotenCustCnt(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtPotenCustCnt(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealRate(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtDealRate(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtTargetConfig(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {
        return targetDcptMgmtDAO.selectTargetDcptMgmtTargetConfig(targetDcptMgmtSearchVO);
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerTargetAchieveGrid(searchVO);
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveIdccGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerTargetAchieveIdccGrid(searchVO);
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveShopGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtDealerTargetAchieveShopGrid(searchVO);
    }

    @Override
    public int updateTargetDcptMgmtTargetStatusSave(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptMgmtSearchVO.setDealerUpdtUsrId(userId);

        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt1(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt2(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt3(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt4(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt5(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt6(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt7(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt8(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt9(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt10(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt11(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt12(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt13(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt14(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt15(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt16(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt17(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt18(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt19(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt20(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt21(targetDcptMgmtSearchVO);

        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt22(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt23(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt24(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt25(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt26(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt27(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt28(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt29(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt30(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt31(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt32(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt33(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt34(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt35(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt36(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt37(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt38(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt39(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt40(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt41(targetDcptMgmtSearchVO);
        targetDcptMgmtDAO.updateTargetDcptMgmtTargetStatuspotenCustCnt42(targetDcptMgmtSearchVO);


        return 1;
    }

    @Override
    public int updateTargetDcptMgmtDealerDcptCustComplete(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptMgmtSearchVO.setDealerUpdtUsrId(userId);

        targetDcptMgmtDAO.updateTargetDcptMgmtDealerDcptCustComplete(targetDcptMgmtSearchVO);

        return 1;
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtProcessMgmtGrid(searchVO);
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessCustConfig(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtProcessCustConfig(searchVO);
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessCustConfigVal(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtProcessCustConfigVal(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiTargetCustConfigRegTempSave(BaseSaveVO<TargetDcptMgmtVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptMgmtVO targetDcptMgmtVO : obj.getInsertList()){
            targetDcptMgmtVO.setRegUsrId(userId);
            insertCustConfigReg(targetDcptMgmtVO);
        }

        for(TargetDcptMgmtVO targetDcptMgmtVO : obj.getUpdateList()){
            targetDcptMgmtVO.setUpdtUsrId(userId);
            updateCustConfigReg(targetDcptMgmtVO);
        }

        for(TargetDcptMgmtVO targetDcptMgmtVO : obj.getDeleteList()){
            deleteCustConfigReg(targetDcptMgmtVO);
        }
    }

    @Override
    public int insertCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception {

        TargetDcptMgmtVO obj = selectCustConfigRegByKey(targetDcptMgmtVO.getCustGubnVal(), targetDcptMgmtVO.getCustChannelVal());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetDcptMgmtDAO.insertCustConfigReg(targetDcptMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetDcptMgmtDAO.updateCustConfigReg(targetDcptMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetDcptMgmtDAO.deleteCustConfigReg(targetDcptMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetDcptMgmtVO selectCustConfigRegByKey(String custGubnVal, String custChannelVal) throws Exception {
        return targetDcptMgmtDAO.selectCustConfigRegByKey(custGubnVal, custChannelVal);
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtSaleGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtProcessMgmtSaleGrid(searchVO);
    }

    /**
     * 딜러현황자료(기초값)를 조회한다.
     */
    @Override
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtCustGrid(TargetDcptMgmtSearchVO searchVO) throws Exception {

        return targetDcptMgmtDAO.selectTargetDcptMgmtProcessMgmtCustGrid(searchVO);
    }






}
