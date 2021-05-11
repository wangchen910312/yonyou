package chn.bhmc.dms.mis.tds.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mis.tds.service.TargetDcptStepService;
import chn.bhmc.dms.mis.tds.service.dao.TargetDcptStepDAO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepCuSaveVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepSaSaveVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepSearchVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepToSaveVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepVO;


/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepServiceImpl.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetDcptStepService")
public class TargetDcptStepServiceImpl extends HService implements TargetDcptStepService {

    /** targetDcptStep DAO */
    @Resource(name = "targetDcptStepDAO")
    private TargetDcptStepDAO targetDcptStepDAO;

    /**
     * 목표 차종 설정 총 갯수
     */
    @Override
    public int selectTargetDcptCarlineGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptCarlineGridCnt(searchVO);
    }

    /**
     * 목표 차종 설정 데이터
     */
    @Override
    public List<TargetDcptStepVO> selectTargetDcptCarlineGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptCarlineGrid(searchVO);
    }

    /**
     * 목표 차종, 차종 마스터 목록 저장
     */
    @Override
    public int insertTargetDcptCarlineGridSave(TargetDcptStepSearchVO searchVO) throws Exception {

        searchVO.setRegUsrId(LoginUtil.getUserId());
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.insertTargetDcptCarlineGridSave(searchVO);
    }

    /**
     * 목표 차종 설정 데이터 저장 분기
     */
    @Override
    public void multiTargetDcptCarlineGrid(BaseSaveVO<TargetDcptStepVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptStepVO targetDcptStepVO : obj.getInsertList()){
            targetDcptStepVO.setRegUsrId(userId);
            targetDcptStepVO.setDlrCd(LoginUtil.getDlrCd());
            insertTargetDcptCarlineGrid(targetDcptStepVO);
        }

        for(TargetDcptStepVO targetDcptStepVO : obj.getUpdateList()){
            targetDcptStepVO.setUpdtUsrId(userId);
            targetDcptStepVO.setDlrCd(LoginUtil.getDlrCd());
            updateTargetDcptCarlineGrid(targetDcptStepVO);
        }

        for(TargetDcptStepVO targetDcptStepVO : obj.getDeleteList()){
            targetDcptStepVO.setDlrCd(LoginUtil.getDlrCd());
            deleteTargetDcptCarlineGrid(targetDcptStepVO);
        }
    }

    /**
     * Key에 해당하는 목표 차종 설정 데이터 정보를 조회
     */
    @Override
    public TargetDcptStepVO selectTargetDcptCarlineGridByKey(String goalYy, String goalMm, String carLineCd, String dlrCd) throws Exception {
        dlrCd = LoginUtil.getDlrCd();
        return targetDcptStepDAO.selectTargetDcptCarlineGridByKey(goalYy, goalMm, carLineCd, dlrCd);
    }


    /**
     * 목표 차종 설정 데이터 등록
     */
    @Override
    public int insertTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception {

        TargetDcptStepVO obj = selectTargetDcptCarlineGridByKey(targetDcptStepVO.getGoalYy(), targetDcptStepVO.getGoalMm(), targetDcptStepVO.getCarlineCd(), LoginUtil.getDlrCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        targetDcptStepVO.setDlrCd(LoginUtil.getDlrCd());

        return targetDcptStepDAO.insertTargetDcptCarlineGrid(targetDcptStepVO);
    }

    /**
     * 목표 차종 설정 데이터 수정
     */
    @Override
    public int updateTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception {
        targetDcptStepVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.updateTargetDcptCarlineGrid(targetDcptStepVO);
    }

    /**
     * 목표 차종 설정 데이터 삭제
     */
    @Override
    public int deleteTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception {
        targetDcptStepVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.deleteTargetDcptCarlineGrid(targetDcptStepVO);
    }

    /**
     * 목표 분해 공구 - 시장현황 자료 조회
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptMarketStatusGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptMarketStatusGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러현황자료(기초값) 조회
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerStatusBasicGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerStatusBasicGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러현황자료(채널) 조회
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerStatusChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerStatusChannelGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 제조사 당월 총목표를 조회
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptManuTargetAllGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptManuTargetAllGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 제조사 당월 차종별 목표 총 갯수를 조회
     */
    @Override
    public int selectTargetDcptManuTargetChannelGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptManuTargetChannelGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 제조사 당월 차종별 목표를 조회한다.
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDcptManuTargetChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception{
        Map<String, List> map = new HashMap<String, List>();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<TargetDcptStepSearchVO> manuColumnList = targetDcptStepDAO.selectTargetDcptManuTargetChannelGridHeader(searchVO);
        map.put("manuColumnList", manuColumnList);

        int maxSize = manuColumnList.size();

        List<TargetDcptStepSearchVO> manuList = targetDcptStepDAO.selectTargetDcptManuTargetChannelGrid(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptStepSearchVO vo : manuList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("manuDlrCd") ){

                hMap.put("manuDlrCd", vo.getManuDlrCd());
                hMap.put("manuCarlineCd", vo.getManuCarlineCd());
                hMap.put("manuCarlineNm", vo.getManuCarlineNm());
                hMap.put(vo.getManuCarlineCd(), vo.getManuTargQty() );
            } else {
                hMap.put(vo.getManuCarlineCd(), vo.getManuTargQty() );
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
     * 목표 분해 공구 - 딜러사 당월 차종별 목표 총 갯수를 조회
     */
    @Override
    public int selectTargetDcptDealerTargetChannelGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerTargetChannelGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 차종별 목표를 조회한다.
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDcptDealerTargetChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception{
        Map<String, List> map = new HashMap<String, List>();
        searchVO.setDlrCd(LoginUtil.getDlrCd());

        List<TargetDcptStepSearchVO> dealerColumnList = targetDcptStepDAO.selectTargetDcptDealerTargetChannelGridHeader(searchVO);
        map.put("dealerColumnList", dealerColumnList);

        int maxSize = dealerColumnList.size();

        List<TargetDcptStepSearchVO> dealerList = targetDcptStepDAO.selectTargetDcptDealerTargetChannelGrid(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptStepSearchVO vo : dealerList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("dealerDlrTp") ){

                hMap.put("dealerGoalYy", vo.getDealerGoalYy());
                hMap.put("dealerGoalMm", vo.getDealerGoalMm());
                hMap.put("dealerDlrCd", vo.getDealerDlrCd());
                hMap.put("dealerCarlineCd", vo.getDealerCarlineCd());
                hMap.put("dealerCarlineNm", vo.getDealerCarlineNm());
                hMap.put("dealerDlrTp", vo.getDealerDlrTp());
                hMap.put("dealerGoalTp", vo.getDealerGoalTp());
                hMap.put("dealerSumGoalPrefVal", vo.getDealerSumGoalPrefVal());
                hMap.put("dealerGapGoalPrefVal", vo.getDealerGapGoalPrefVal());
                hMap.put(vo.getDealerCarlineCd(), vo.getDealerGoalPrefVal() );
            } else {
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
     * 목표 분해 공구 - 딜러분해(차형) 총 목표 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptStepTotalResult(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptStepTotalResult(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(차형) 총 목표 자료를 등록한다.
     */
    @Override
    public int insertTargetDcptStepTotalResult(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptStepSearchVO.setRegUsrId(userId);
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.insertTargetDcptStepTotalResult(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사목표(당월 총 목표) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerTargetAllGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerTargetAllGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(당월 총 목표) 총 갯수를 조회
     */
    @Override
    public int selectTargetDcptDealerSaleTargetAllGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerSaleTargetAllGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표 저장 분기한다.
     */
    @Override
    public void multiDealerTargetGridSave(BaseSaveVO<TargetDcptStepSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getInsertList()){
            targetDcptStepSearchVO.setRegUsrId(userId);
            targetDcptStepSearchVO.setUpdtUsrId(userId);
            targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
            updateDealerTargetIdccDealerGoalPrefValSave(targetDcptStepSearchVO);
            updateDealerTargetShopDealerGoalPrefValSave(targetDcptStepSearchVO);
            updateDealerTargetOrgDealerGoalPrefValSave(targetDcptStepSearchVO);
            updateDealerTargetEtcDealerGoalPrefValSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getUpdateList()){
            targetDcptStepSearchVO.setUpdtUsrId(userId);
            targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
            updateDealerTargetIdccDealerGoalPrefValSave(targetDcptStepSearchVO);
            updateDealerTargetShopDealerGoalPrefValSave(targetDcptStepSearchVO);
            updateDealerTargetOrgDealerGoalPrefValSave(targetDcptStepSearchVO);
            updateDealerTargetEtcDealerGoalPrefValSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getDeleteList()){
            targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
            deleteDealerTargetGridSave(targetDcptStepSearchVO);
        }
    }

    @Override
    public int insertDealerTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());

        TargetDcptStepSearchVO obj = selectDealerTargetGridSaveByKey(targetDcptStepSearchVO.getsMonitorDate(), LoginUtil.getDlrCd());

        if(obj != null) { throw processException("global.err.duplicate"); }

        return targetDcptStepDAO.insertDealerTargetGridSave(targetDcptStepSearchVO);
    }

    @Override
    public TargetDcptStepSearchVO selectDealerTargetGridSaveByKey(String sMonitorDate, String sDlrCd) throws Exception {
        return targetDcptStepDAO.selectDealerTargetGridSaveByKey(sMonitorDate, sDlrCd);
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표 저장한다.
     */
    @Override
    public int updateDealerTargetIdccDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.updateDealerTargetIdccDealerGoalPrefValSave(targetDcptStepSearchVO);
    }
    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표 저장한다.
     */
    @Override
    public int updateDealerTargetShopDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.updateDealerTargetShopDealerGoalPrefValSave(targetDcptStepSearchVO);
    }
    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표 저장한다.
     */
    @Override
    public int updateDealerTargetOrgDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.updateDealerTargetOrgDealerGoalPrefValSave(targetDcptStepSearchVO);
    }
    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표 저장한다.
     */
    @Override
    public int updateDealerTargetEtcDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.updateDealerTargetEtcDealerGoalPrefValSave(targetDcptStepSearchVO);
    }

    @Override
    public int deleteDealerTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.deleteProfitTargetGridSave(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 개별목표 저장 분기한다.
     */
    @SuppressWarnings("rawtypes")
    public int multiDealerChannelGridSave(Map<?,?> saveVO) throws Exception{

        String chanKey = "";
        TargetDcptStepToSaveVO strSaveVO = null;

        List updateList = (List)saveVO.get("updateChanList");
        ArrayList<String> chanList = null;

        for(int i=0; i<updateList.size(); i++){
            HashMap map = (HashMap)updateList.get(i);

            strSaveVO = new TargetDcptStepToSaveVO();

            strSaveVO.setDlrCd(LoginUtil.getDlrCd());
            strSaveVO.setUpdtUsrId(LoginUtil.getUserId());
            strSaveVO.setRegUsrId(LoginUtil.getUserId());
            strSaveVO.setDealerGoalYy((String)map.get("dealerGoalYy"));
            strSaveVO.setDealerGoalMm((String)map.get("dealerGoalMm"));
            strSaveVO.setCarlineCd((String)map.get("carlineCd"));
            strSaveVO.setCarlineNm((String)map.get("carlineNm"));
            strSaveVO.setDealerCarlineCd((String)map.get("dealerCarlineCd"));
            strSaveVO.setDealerCarlineNm((String)map.get("dealerCarlineNm"));
            strSaveVO.setDealerDlrTp((String)map.get("dealerDlrTp"));
            strSaveVO.setDealerGoalTp((String)map.get("dealerGoalTp"));
            strSaveVO.setDealerGoalPrefVal((String)map.get("dealerGoalPrefVal"));

            chanList = new ArrayList<String>();
            Iterator<?>  itr = map.keySet().iterator();
            while(itr.hasNext()){
                chanKey = (String)itr.next();

                if(  !chanKey.equals("dealerGoalYy")
                  && !chanKey.equals("dealerGoalMm")
                  && !chanKey.equals("dealerCarlineCd")
                  && !chanKey.equals("dealerCarlineNm")
                  && !chanKey.equals("dealerDlrTp")
                  && !chanKey.equals("dealerGoalTp")
                  && !chanKey.equals("uid")
                ){
                    chanList.add(chanKey);
                }
            }

            for(String mapKey : chanList){
                strSaveVO = new TargetDcptStepToSaveVO();
                strSaveVO.setUpdtUsrId(LoginUtil.getUserId());
                strSaveVO.setRegUsrId(LoginUtil.getUserId());
                strSaveVO.setDlrCd(LoginUtil.getDlrCd());
                strSaveVO.setDealerGoalYy((String)map.get("dealerGoalYy"));
                strSaveVO.setDealerGoalMm((String)map.get("dealerGoalMm"));
                //strSaveVO.setCarlineCd((String)map.get("carlineCd"));
                strSaveVO.setCarlineNm((String)map.get("carlineNm"));
                strSaveVO.setDealerCarlineCd((String)map.get("dealerCarlineCd"));
                strSaveVO.setDealerCarlineNm((String)map.get("dealerCarlineNm"));
                strSaveVO.setDealerDlrTp((String)map.get("dealerDlrTp"));
                strSaveVO.setDealerGoalTp((String)map.get("dealerGoalTp"));
                strSaveVO.setCarlineCd(mapKey);
                strSaveVO.setDealerGoalPrefVal((String)map.get(mapKey));
                strSaveVO.setDlrCd(LoginUtil.getDlrCd());

                targetDcptStepDAO.updateDealerChannelGridSave(strSaveVO);

            }
        }
        return 1;
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 집객 총 목표 저장 분기한다.
     */
    @Override
    public void multiDealerCustGridSave(BaseSaveVO<TargetDcptStepSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getInsertList()){
            targetDcptStepSearchVO.setRegUsrId(userId);
            String dlrCd = LoginUtil.getDlrCd();
            targetDcptStepSearchVO.setsDlrCd(dlrCd);
            insertDealerCustGridSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getUpdateList()){
            targetDcptStepSearchVO.setUpdtUsrId(userId);
            String dlrCd = LoginUtil.getDlrCd();
            targetDcptStepSearchVO.setsDlrCd(dlrCd);
            updateIdccCustDealerSave(targetDcptStepSearchVO);
            updateShopCustDealerSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getDeleteList()){
            deleteDealerCustGridSave(targetDcptStepSearchVO);
        }
    }

    @Override
    public int insertDealerCustGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        TargetDcptStepSearchVO obj = selectDealerCustGridSaveByKey(targetDcptStepSearchVO.getsMonitorDate());

        if(obj != null) { throw processException("global.err.duplicate"); }

        String dlrCd = LoginUtil.getDlrCd();
        targetDcptStepSearchVO.setsDlrCd(dlrCd);

        return targetDcptStepDAO.insertDealerCustGridSave(targetDcptStepSearchVO);
    }

    @Override
    public TargetDcptStepSearchVO selectDealerCustGridSaveByKey(String sMonitorDate) throws Exception {
        return targetDcptStepDAO.selectDealerCustGridSaveByKey(sMonitorDate);
    }

    @Override
    public int updateIdccCustDealerSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.updateIdccCustDealerSave(targetDcptStepSearchVO);
    }

    @Override
    public int updateShopCustDealerSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.updateShopCustDealerSave(targetDcptStepSearchVO);
    }

    @Override
    public int deleteDealerCustGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        return targetDcptStepDAO.deleteDealerCustGridSave(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 과정목표 저장 분기한다.
     */
    @Override
    public void multiDealerProcessTargetSave(BaseSaveVO<TargetDcptStepSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getInsertList()){
            targetDcptStepSearchVO.setRegUsrId(userId);
            insertDealerProcessTargetSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getUpdateList()){
            targetDcptStepSearchVO.setUpdtUsrId(userId);
            updateDealerProcessTargetSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getDeleteList()){
            deleteDealerProcessTargetSave(targetDcptStepSearchVO);
        }
    }

    @Override
    public int insertDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        TargetDcptStepSearchVO obj = selectDealerProcessTargetByKey(targetDcptStepSearchVO.getsMonitorDate());

        if(obj != null) { throw processException("global.err.duplicate"); }

        return targetDcptStepDAO.insertDealerProcessTargetSave(targetDcptStepSearchVO);
    }

    @Override
    public TargetDcptStepSearchVO selectDealerProcessTargetByKey(String sMonitorDate) throws Exception {
        return targetDcptStepDAO.selectDealerProcessTargetByKey(sMonitorDate);
    }

    @Override
    public int updateDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.updateDealerProcessTargetSave(targetDcptStepSearchVO);
    }

    @Override
    public int deleteDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        return targetDcptStepDAO.deleteDealerProcessTargetSave(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 파생예측 저장 분기한다.
     */
    @Override
    public void multiProcessDerivationGridSave(BaseSaveVO<TargetDcptStepSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getInsertList()){
            targetDcptStepSearchVO.setRegUsrId(userId);
            insertProcessDerivationGridSave(targetDcptStepSearchVO);        // 안씀. 확인
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getUpdateList()){
            targetDcptStepSearchVO.setUpdtUsrId(userId);
            targetDcptStepSearchVO.setDlrCd(dlrCd);
            updateProcessDerivationGridSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getDeleteList()){
            deleteProcessDerivationGridSave(targetDcptStepSearchVO);        // 안씀 확인.
        }
    }

    @Override
    public int insertProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        TargetDcptStepSearchVO obj = selectProcessDerivationGridByKey(targetDcptStepSearchVO.getsMonitorDate());

        if(obj != null) { throw processException("global.err.duplicate"); }

        return targetDcptStepDAO.insertProcessDerivationGridSave(targetDcptStepSearchVO);
    }

    @Override
    public TargetDcptStepSearchVO selectProcessDerivationGridByKey(String sMonitorDate) throws Exception {
        return targetDcptStepDAO.selectProcessDerivationGridByKey(sMonitorDate);
    }

    @Override
    public int updateProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.updateProcessDerivationGridSave(targetDcptStepSearchVO);
    }

    @Override
    public int deleteProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        return targetDcptStepDAO.deleteProcessDerivationGridSave(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 설정 차종 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectDealerCarlineCdList(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception {
        TargetDcptStepSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectDealerCarlineCdList(TargetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구 - 딜러분해(당월 차형별 분해 목표, 진도, 차이) 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDealerSaleDcptStatusGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDealerSaleDcptStatusGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(당월 차형별 분해 목표, 진도, 차이) 목표 자료를 조회한다.
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDealerSaleDcptStatusGrid(TargetDcptStepSearchVO searchVO) throws Exception{
        Map<String, List> map = new HashMap<String, List>();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<TargetDcptStepSearchVO> carDcptColumnList = targetDcptStepDAO.selectTargetDealerSaleDcptStatusGridHeader(searchVO);
        map.put("carDcptColumnList", carDcptColumnList);

        int maxSize = carDcptColumnList.size();

        List<TargetDcptStepSearchVO> carDcptList = targetDcptStepDAO.selectTargetDealerSaleDcptStatusGrid(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptStepSearchVO vo : carDcptList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("nameGubn") ){

                hMap.put("nameGubn", vo.getNameGubn());
                hMap.put("scDcptCarlineCd", vo.getScDcptCarlineCd());
                hMap.put("scDcptCarlineNm", vo.getScDcptCarlineNm());
                hMap.put(vo.getScDcptCarlineCd(), vo.getScDcptGoalPrefVal() );
            } else {
                hMap.put(vo.getScDcptCarlineCd(), vo.getScDcptGoalPrefVal() );
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
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDcptDealerSaleManSearchGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerSaleManSearchGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDcptDealerSaleManSearchGrid(TargetDcptStepSearchVO searchVO) throws Exception{
        Map<String, List> map = new HashMap<String, List>();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<TargetDcptStepSearchVO> smDcptColumnList = targetDcptStepDAO.selectTargetDcptDealerSaleManSearchGridHeader(searchVO);
        map.put("smDcptColumnList", smDcptColumnList);

        int maxSize = smDcptColumnList.size();

        List<TargetDcptStepSearchVO> carDcptList = targetDcptStepDAO.selectTargetDcptDealerSaleManSearchGrid(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptStepSearchVO vo : carDcptList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("carDcptEmpNo") ){

                hMap.put("saleGoalYy", vo.getSaleGoalYy());
                hMap.put("saleGoalMm", vo.getSaleGoalMm());
                hMap.put("carDcptEmpNo", vo.getCarDcptEmpNo());
                hMap.put("carDcptEmpNm", vo.getCarDcptEmpNm());
                hMap.put("carDcptCarlineCd", vo.getCarDcptCarlineCd());
                hMap.put("carDcptCarlineNm", vo.getCarDcptCarlineNm());
                hMap.put("carDcptGoalSumfVal", vo.getCarDcptGoalSumfVal());
                hMap.put(vo.getCarDcptCarlineCd(), vo.getCarDcptGoalPrefVal() );
            } else {
                hMap.put(vo.getCarDcptCarlineCd(), vo.getCarDcptGoalPrefVal() );
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
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.selectTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptShopResult(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.selectTargetDcptMgmtDealerSaleDcptShopResult(TargetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 등록한다.
     */
    @Override
    public int insertTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptStepSearchVO.setRegUsrId(userId);
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.insertTargetDcptMgmtDealerSaleDcptCarResult(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 저장한다.
     */
    @SuppressWarnings("rawtypes")
    public int multiTargetDcptDealerSaleManSearchGrid(Map<?,?> saveVO) throws Exception{

        String saleKey = "";
        TargetDcptStepSaSaveVO strSaveVO = null;

        List updateList = (List)saveVO.get("updateSaleList");
        ArrayList<String> saleList = null;

        for(int i=0; i<updateList.size(); i++){
            HashMap map = (HashMap)updateList.get(i);

            strSaveVO = new TargetDcptStepSaSaveVO();
            strSaveVO.setSaleUpdtUsrId(LoginUtil.getUserId());
            strSaveVO.setSaleRegUsrId(LoginUtil.getUserId());
            strSaveVO.setDlrCd(LoginUtil.getDlrCd());
            strSaveVO.setSaleGoalYy((String)map.get("saleGoalYy"));
            strSaveVO.setSaleGoalMm((String)map.get("saleGoalMm"));
            strSaveVO.setCarlineCd((String)map.get("carlineCd"));
            strSaveVO.setCarlineNm((String)map.get("carlineNm"));
            strSaveVO.setCarDcptEmpNo((String)map.get("carDcptEmpNo"));
            strSaveVO.setCarDcptEmpNm((String)map.get("carDcptEmpNm"));
            strSaveVO.setCarDcptCarlineCd((String)map.get("carDcptCarlineCd"));
            strSaveVO.setCarDcptCarlineNm((String)map.get("carDcptCarlineNm"));
            strSaveVO.setCarDcptGoalPrefVal((String)map.get("carDcptGoalPrefVal"));
            strSaveVO.setCarDcptGoalSumfVal((String)map.get("carDcptGoalSumfVal"));

            targetDcptStepDAO.deleteTargetDcptDealerSaleManSearchGrid(strSaveVO);

            saleList = new ArrayList<String>();
            Iterator<?>  itr = map.keySet().iterator();
            while(itr.hasNext()){
                saleKey = (String)itr.next();

                if(  !saleKey.equals("saleGoalYy")
                  && !saleKey.equals("saleGoalMm")
                  && !saleKey.equals("carDcptEmpNo")
                  && !saleKey.equals("carDcptEmpNm")
                  && !saleKey.equals("carDcptCarlineCd")
                  && !saleKey.equals("carDcptCarlineNm")
                  && !saleKey.equals("carDcptGoalSumfVal")
                  && !saleKey.equals("uid")
                ){
                    saleList.add(saleKey);
                }
            }

            for(String mapKey : saleList){
                strSaveVO = new TargetDcptStepSaSaveVO();
                strSaveVO.setSaleUpdtUsrId(LoginUtil.getUserId());
                strSaveVO.setSaleRegUsrId(LoginUtil.getUserId());
                strSaveVO.setDlrCd(LoginUtil.getDlrCd());
                strSaveVO.setSaleGoalYy((String)map.get("saleGoalYy"));
                strSaveVO.setSaleGoalMm((String)map.get("saleGoalMm"));
                strSaveVO.setCarDcptEmpNo((String)map.get("carDcptEmpNo"));
                strSaveVO.setCarDcptEmpNm((String)map.get("carDcptEmpNm"));
                strSaveVO.setCarDcptCarlineCd((String)map.get("carDcptCarlineCd"));
                strSaveVO.setCarDcptCarlineNm((String)map.get("carDcptCarlineNm"));
                strSaveVO.setCarDcptGoalSumfVal((String)map.get("carDcptGoalSumfVal"));
                strSaveVO.setCarlineCd(mapKey);
                strSaveVO.setCarDcptGoalPrefVal((String)map.get(mapKey));

                targetDcptStepDAO.insertTargetDcptDealerSaleManSearchGrid(strSaveVO);

            }
        }
        return 1;
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDealerDcptCustFirstGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        return targetDcptStepDAO.selectTargetDealerDcptCustFirstGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDealerDcptCustFirstGrid(TargetDcptStepSearchVO searchVO) throws Exception{
        Map<String, List> map = new HashMap<String, List>();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<TargetDcptStepSearchVO> firstColumnList = targetDcptStepDAO.selectTargetDealerDcptCustFirstGridHeader(searchVO);
        map.put("firstColumnList", firstColumnList);

        int maxSize = firstColumnList.size();

        List<TargetDcptStepSearchVO> firstList = targetDcptStepDAO.selectTargetDealerDcptCustFirstGrid(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptStepSearchVO vo : firstList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("nameGubn") ){

                hMap.put("nameGubn", vo.getNameGubn());
                hMap.put("nameChannel", vo.getNameChannel());
                hMap.put("statusCarlineCd", vo.getStatusCarlineCd());
                hMap.put("statusCarlineNm", vo.getStatusCarlineNm());
                hMap.put(vo.getStatusCarlineCd(), vo.getResultValue() );
            } else {
                hMap.put(vo.getStatusCarlineCd(), vo.getResultValue() );
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
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDealerDcptCustSecondGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDealerDcptCustSecondGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDealerDcptCustSecondGrid(TargetDcptStepSearchVO searchVO) throws Exception{
        Map<String, List> map = new HashMap<String, List>();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<TargetDcptStepSearchVO> secondColumnList = targetDcptStepDAO.selectTargetDealerDcptCustSecondGridHeader(searchVO);
        map.put("secondColumnList", secondColumnList);

        int maxSize = secondColumnList.size();

        List<TargetDcptStepSearchVO> secondList = targetDcptStepDAO.selectTargetDealerDcptCustSecondGrid(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptStepSearchVO vo : secondList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("custGubn") ){

                hMap.put("custGubn", vo.getCustGubn());
                hMap.put("custChannel", vo.getCustChannel());
                hMap.put("custCarlineCd", vo.getCustCarlineCd());
                hMap.put("custCarlineNm", vo.getCustCarlineNm());
                hMap.put(vo.getCustCarlineCd(), vo.getCustValue() );
            } else {
                hMap.put(vo.getCustCarlineCd(), vo.getCustValue() );
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
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDealerDcptCustThirdGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDealerDcptCustThirdGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 조회한다.
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectTargetDealerDcptCustThirdGrid(TargetDcptStepSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        Map<String, List> map = new HashMap<String, List>();

        List<TargetDcptStepSearchVO> thirdColumnList = targetDcptStepDAO.selectTargetDealerDcptCustThirdGridHeader(searchVO);
        map.put("thirdColumnList", thirdColumnList);

        int maxSize = thirdColumnList.size();

        List<TargetDcptStepSearchVO> thirdList = targetDcptStepDAO.selectTargetDealerDcptCustThirdGrid(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(TargetDcptStepSearchVO vo : thirdList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("custGubnVal") ){

                hMap.put("custGoalYy", vo.getCustGoalYy());
                hMap.put("custGoalMm", vo.getCustGoalMm());
                hMap.put("custGubnVal", vo.getCustGubnVal());
                hMap.put("custChannelVal", vo.getCustChannelVal());
                hMap.put("custGubnCarlineCd", vo.getCustGubnCarlineCd());
                hMap.put("custGubnCarlineNm", vo.getCustGubnCarlineNm());
                hMap.put(vo.getCustGubnCarlineCd(), vo.getCustGubnValue() );
            } else {
                hMap.put(vo.getCustGubnCarlineCd(), vo.getCustGubnValue() );
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
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 저장한다.
     */
    @SuppressWarnings("rawtypes")
    public int multiTargetDealerDcptCustThirdGrid(Map<?,?> saveVO) throws Exception{
        //String isSearchOcnCd = (String)saveVO.get("searchOcn") == null ? "N" : (String)saveVO.get("searchOcn");

        String thirdKey = "";
        TargetDcptStepCuSaveVO strSaveVO = null;

        List updateList = (List)saveVO.get("updateCustList");
        ArrayList<String> thirdList = null;

        for(int i=0; i<updateList.size(); i++){
            HashMap map = (HashMap)updateList.get(i);

            strSaveVO = new TargetDcptStepCuSaveVO();
            strSaveVO.setCustUpdtUsrId(LoginUtil.getUserId());
            strSaveVO.setCustRegUsrId(LoginUtil.getUserId());
            strSaveVO.setCustGoalYy((String)map.get("custGoalYy"));
            strSaveVO.setCustGoalMm((String)map.get("custGoalMm"));
            strSaveVO.setCarlineCd((String)map.get("carlineCd"));
            strSaveVO.setCarlineNm((String)map.get("carlineNm"));
            strSaveVO.setCustGubnVal((String)map.get("custGubnVal"));
            strSaveVO.setCustChannelVal((String)map.get("custChannelVal"));
            strSaveVO.setCustGubnCarlineCd((String)map.get("custGubnCarlineCd"));
            strSaveVO.setCustGubnValue((String)map.get("custGubnValue"));

            thirdList = new ArrayList<String>();
            Iterator<?>  itr = map.keySet().iterator();
            while(itr.hasNext()){
                thirdKey = (String)itr.next();

                if(  !thirdKey.equals("custGubnCarlineCd")
                  &&!thirdKey.equals("custGubnCarlineNm")
                  && !thirdKey.equals("custGubnVal")
                  && !thirdKey.equals("custChannelVal")
                  //&& !thirdKey.equals("custGubnValue")
                  && !thirdKey.equals("custGoalYy")
                  && !thirdKey.equals("custGoalMm")
                  //&& !thirdKey.equals("carlineCd")
                  && !thirdKey.equals("carlineNm")
                  && !thirdKey.equals("uid")
                ){
                    thirdList.add(thirdKey);
                }
            }

            for(String mapKey : thirdList){
                strSaveVO = new TargetDcptStepCuSaveVO();
                strSaveVO.setCustUpdtUsrId(LoginUtil.getUserId());
                strSaveVO.setCustRegUsrId(LoginUtil.getUserId());
                strSaveVO.setCustGoalYy((String)map.get("custGoalYy"));
                strSaveVO.setCustGoalMm((String)map.get("custGoalMm"));
                //strSaveVO.setCarlineCd((String)map.get("carlineCd"));
                strSaveVO.setCarlineNm((String)map.get("carlineNm"));
                strSaveVO.setCustGubnVal((String)map.get("custGubnVal"));
                strSaveVO.setCustChannelVal((String)map.get("custChannelVal"));
                strSaveVO.setCustGubnCarlineCd((String)map.get("custGubnCarlineCd"));
                //strSaveVO.setCustGubnValue((String)map.get("custGubnValue"));
                strSaveVO.setCarlineCd(mapKey);
                strSaveVO.setCustGubnValue((String)map.get(mapKey));

                targetDcptStepDAO.updateTargetDealerDcptCustThirdGrid(strSaveVO);
            }
        }
        return 1;
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerDcptCustResult(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.selectTargetDcptMgmtDealerDcptCustResult(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerDcptCustGrid(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptMgmtDealerDcptCustGrid(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 등록한다.
     */
    @Override
    public int insertTargetDcptMgmtDealerDcptCustResult(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();
        targetDcptStepSearchVO.setRegUsrId(userId);
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.insertTargetDcptMgmtDealerDcptCustResult(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptStepProcessDerivationTarget(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptStepProcessDerivationTarget(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptStepProcessDerivationGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptStepProcessDerivationGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 등록한다.
     */
    @Override
    public int insertTargetDcptStepProcessDerivationTarget(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        String userId = LoginUtil.getUserId();
        targetDcptStepSearchVO.setRegUsrId(userId);
        targetDcptStepSearchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.insertTargetDcptStepProcessDerivationTarget(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사목표(당월 총 목표) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleTargetAllGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerSaleTargetAllGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptAllStatus(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.selectTargetDcptMgmtDealerSaleDcptAllStatus(targetDcptStepSearchVO);
    }

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptProStatus(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        return targetDcptStepDAO.selectTargetDcptMgmtDealerSaleDcptProStatus(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetDcptDealerSaleManGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectTargetDcptDealerSaleManGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleManGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        return targetDcptStepDAO.selectTargetDcptDealerSaleManGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 조회
     */
    @Override
    public TargetDcptStepVO selectSalesmanTargetDcptRegByKey(String sMonitorSaleDate, String empNo, String carlineCd) throws Exception {
        return targetDcptStepDAO.selectSalesmanTargetDcptRegByKey(sMonitorSaleDate, empNo, carlineCd);
    }

    @Override
    public int insertSalesmanTargetDcptReg(TargetDcptStepVO targetDcptStepVO) throws Exception {

        targetDcptStepVO.setsMonitorSaleDate(targetDcptStepVO.getsMonitorSaleDate());

        TargetDcptStepVO obj = selectSalesmanTargetDcptRegByKey(targetDcptStepVO.getsMonitorSaleDate(), targetDcptStepVO.getEmpNo(), targetDcptStepVO.getCarlineCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetDcptStepDAO.insertSalesmanTargetDcptReg(targetDcptStepVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSalesmanTargetDcptReg(TargetDcptStepVO targetDcptStepVO) throws Exception {
        return targetDcptStepDAO.updateSalesmanTargetDcptReg(targetDcptStepVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    @Override
    public void insertSalesmanTargetDcptRegUploadSave(List<TargetDcptStepVO> list, TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptStepVO targetDcptStepVO : list){
            targetDcptStepVO.setRegUsrId(userId);

            targetDcptStepVO.setsMonitorSaleDate(targetDcptStepVO.getsMonitorSaleDate());

            TargetDcptStepVO obj = selectSalesmanTargetDcptRegByKey(targetDcptStepVO.getsMonitorSaleDate(), targetDcptStepVO.getEmpNo(), targetDcptStepVO.getCarlineCd());


            if(obj == null) {
                targetDcptStepVO.setsMonitorSaleDate(targetDcptStepSearchVO.getsMonitorSaleDate());
                insertSalesmanTargetDcptReg(targetDcptStepVO);
            }else{
                targetDcptStepVO.setsMonitorSaleDate(obj.getsMonitorSaleDate());
                targetDcptStepVO.setEmpNo(obj.getEmpNo());
                targetDcptStepVO.setCarlineCd(obj.getCarlineCd());
                targetDcptStepVO.setGoalPrefVal(obj.getGoalPrefVal());

                updateSalesmanTargetDcptReg(targetDcptStepVO);
            }
        }
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 잠재고객수 , 최근3개월 현황 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustGrid(TargetDcptStepSearchVO searchVO) throws Exception {

        return targetDcptStepDAO.selectTargetDealerDcptCustGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustConfig(TargetDcptStepSearchVO searchVO) throws Exception {

        return targetDcptStepDAO.selectTargetDealerDcptCustConfig(searchVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustConfigVal(TargetDcptStepSearchVO searchVO) throws Exception {

        return targetDcptStepDAO.selectTargetDealerDcptCustConfigVal(searchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 총 갯수를 조회한다.
     */
    @Override
    public int selectCarlineProfitGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectCarlineProfitGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 정보를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectCarlineProfitGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        return targetDcptStepDAO.selectCarlineProfitGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 정보가 없을 경우 신규 등록한다.
     */
    @Override
    public int insertCarlineProfitGrid(TargetDcptStepSearchVO searchVO) throws Exception {

        TargetDcptStepSearchVO obj = selectCarlineProfitGridByKey(searchVO.getsMonitorProfitDate());

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        searchVO.setRegUsrId(userId);
        searchVO.setsDlrCd(dlrCd);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetDcptStepDAO.insertCarlineProfitGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) Key에 해당하는 파생업무이익지표분해 정보를 조회한다.
     */
    @Override
    public TargetDcptStepSearchVO selectCarlineProfitGridByKey(String sMonitorProfitDate) throws Exception {
        return targetDcptStepDAO.selectCarlineProfitGridByKey(sMonitorProfitDate);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 총 갯수를 조회한다.
     */
    @Override
    public int selectProfitTargetGridCnt(TargetDcptStepSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return targetDcptStepDAO.selectProfitTargetGridCnt(searchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 정보를 조회한다.
     */
    @Override
    public List<TargetDcptStepSearchVO> selectProfitTargetGrid(TargetDcptStepSearchVO searchVO) throws Exception {
        return targetDcptStepDAO.selectProfitTargetGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 정보가 없을 경우 신규 등록한다.
     */
    @Override
    public int insertProfitTargetGrid(TargetDcptStepSearchVO searchVO) throws Exception {

        TargetDcptStepSearchVO obj = selectProfitTargetGridByKey(searchVO.getsMonitorProfitDate());

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        searchVO.setRegUsrId(userId);
        searchVO.setsDlrCd(dlrCd);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetDcptStepDAO.insertProfitTargetGrid(searchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) Key에 해당하는 파생업무이익지표분해 정보를 조회한다.
     */
    @Override
    public TargetDcptStepSearchVO selectProfitTargetGridByKey(String sMonitorProfitDate) throws Exception {
        return targetDcptStepDAO.selectProfitTargetGridByKey(sMonitorProfitDate);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 저장한다.
     */
    @Override
    public void multiCarlineProfitGridSave(BaseSaveVO<TargetDcptStepSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getInsertList()){
            targetDcptStepSearchVO.setRegUsrId(userId);
            targetDcptStepSearchVO.setsDlrCd(dlrCd);
            insertCarlineProfitGridSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getUpdateList()){
            targetDcptStepSearchVO.setUpdtUsrId(userId);
            targetDcptStepSearchVO.setsDlrCd(dlrCd);
            updateCarlineProfitGridSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getDeleteList()){
            deleteCarlineProfitGridSave(targetDcptStepSearchVO);
        }
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 저장 분기한다.
     */
    @Override
    public TargetDcptStepSearchVO selectCarlineProfitGridSaveByKey(String goalProfitYy, String goalProfitMm, String carlineProfitCd) throws Exception {
        return targetDcptStepDAO.selectCarlineProfitGridSaveByKey(goalProfitYy, goalProfitMm, carlineProfitCd);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 저장한다.
     */
    @Override
    public int insertCarlineProfitGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        TargetDcptStepSearchVO obj = selectCarlineProfitGridSaveByKey(targetDcptStepSearchVO.getGoalProfitYy(), targetDcptStepSearchVO.getGoalProfitMm(), targetDcptStepSearchVO.getCarlineProfitCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetDcptStepDAO.insertCarlineProfitGridSave(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 수정한다.
     */
    @Override
    public int updateCarlineProfitGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        return targetDcptStepDAO.updateCarlineProfitGridSave(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 삭제한다.
     */
    @Override
    public int deleteCarlineProfitGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        return targetDcptStepDAO.deleteCarlineProfitGridSave(targetDcptStepSearchVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표)를 저장한다.
     */
    @Override
    public void multiProfitTargetGridSave(BaseSaveVO<TargetDcptStepSearchVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getInsertList()){
            targetDcptStepSearchVO.setRegUsrId(userId);
            insertProfitTargetGridSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getUpdateList()){
            targetDcptStepSearchVO.setUpdtUsrId(userId);
            updateProfitTargetGridSave(targetDcptStepSearchVO);
        }

        for(TargetDcptStepSearchVO targetDcptStepSearchVO : obj.getDeleteList()){
            deleteProfitTargetGridSave(targetDcptStepSearchVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertProfitTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        TargetDcptStepSearchVO obj = selectProfitTargetGridSaveByKey(targetDcptStepSearchVO.getGoalTargetYy(), targetDcptStepSearchVO.getGoalTargetMm(), targetDcptStepSearchVO.getCarlineTargetCd());


        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return targetDcptStepDAO.insertProfitTargetGridSave(targetDcptStepSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateProfitTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        return targetDcptStepDAO.updateProfitTargetGridSave(targetDcptStepSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteProfitTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {

        return targetDcptStepDAO.deleteProfitTargetGridSave(targetDcptStepSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TargetDcptStepSearchVO selectProfitTargetGridSaveByKey(String goalTargetYy, String goalTargetMm, String carlineTargetCd) throws Exception {
        return targetDcptStepDAO.selectProfitTargetGridSaveByKey(goalTargetYy, goalTargetMm, carlineTargetCd);
    }







}
