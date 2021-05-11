package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.SanbaoBaseService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoBaseDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBasePartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseSaveVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoBaseServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("sanbaoBaseService")
public class SanbaoBaseServiceImpl extends HService implements SanbaoBaseService{
    
    @Resource(name="sanbaoBaseDAO")
    SanbaoBaseDAO sanbaoBaseDAO;
     

    /**
    * 
    * 삼보 정책기준 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseByCondition(SanbaoBaseSearchVO searchVO) throws Exception {

        return sanbaoBaseDAO.selectSanbaoBaseByCondition(searchVO);
    }

    /**
    * 
    * 삼보 정책기준 RO 작업시간 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 RO 작업시간 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseRoWorkTimeByCondition(SanbaoBaseSearchVO searchVO) throws Exception {

        return sanbaoBaseDAO.selectSanbaoBaseRoWorkTimeByCondition(searchVO);
    }
     
    /**
    * 
    * 삼보 정책기준 감각상각률 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 감각상각률 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseDepreRateByCondition(SanbaoBaseSearchVO searchVO) throws Exception {

        return sanbaoBaseDAO.selectSanbaoBaseDepreRateByCondition(searchVO);
    }
    
    
    /**
     * 
     * 등록된 부품 목록 데이터 목록수를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
     * @return 등록된 부품 목록수
     * @throws Exception 
     */
    public int selectSanbaoBasePartGrpByConditionCnt(SanbaoBaseSearchVO searchVO) throws Exception {
        
        return sanbaoBaseDAO.selectSanbaoBasePartGrpByConditionCnt(searchVO);
    }
 
    /**
    * 
    * 등록된 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 등록된 부품 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBasePartVO> selectSanbaoBasePartGrpByCondition(SanbaoBaseSearchVO searchVO) throws Exception {

        return sanbaoBaseDAO.selectSanbaoBasePartGrpByCondition(searchVO);
    }

    /**
     * 
     * 미등록 부품 그룹 목록수 를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
     * @return 미등록 부품 그룹 목록수
     * @throws Exception 
     */
    public int selectSanbaoBaseUnregItemGrpByConditionCnt(SanbaoBaseSearchVO searchVO)
            throws Exception {

        return sanbaoBaseDAO.selectSanbaoBaseUnregItemGrpByConditionCnt(searchVO); 
    }
    
    /**
    * 
    * 미등록 부품 그룹 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 미등록 부품 그룹 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBasePartVO> selectSanbaoBaseUnregItemGrpByCondition(SanbaoBaseSearchVO searchVO) throws Exception {

        return sanbaoBaseDAO.selectSanbaoBaseUnregItemGrpByCondition(searchVO);
    }
    
    

    /**
    * 
    * 삼보 정책기준 적용기준별 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 적용기준별  데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseByKey(String sApplyDstinCd) throws Exception {
        

        SanbaoBaseSearchVO searchVO = new SanbaoBaseSearchVO();
        searchVO.setsApplyDstinCd(sApplyDstinCd);
        
        return sanbaoBaseDAO.selectSanbaoBaseByKey(searchVO);
    }

    /**
    * 
    * 삼보 기준정책 그리드 목록 데이터를 등록/수정한다.
    *
    * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
    * @return 삼보 기준정책 목록 데이터를 등록/수정
    * @throws Exception 
    */
    public void multiSabaoBases(SanbaoBaseSaveVO saveVO) throws Exception {
          
        multiSabaoBasesApply(saveVO.getGridBaseVO());
        multiSabaoBasesRoWorkTime(saveVO.getGridRoBaseVO());
        multiSabaoBasesRate(saveVO.getGridRateVO());
        
    }
    
    /**
     * 
     * 삼보 기준정책 목록 데이터를 등록/수정한다.
     *
     * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
     * @return 삼보 기준정책 목록 데이터를 등록/수정
     * @throws Exception 
     */
    public void multiSabaoBasesApply(BaseSaveVO<SanbaoBaseVO> objVO) throws Exception {
        
        for(SanbaoBaseVO sabaoBaseVO : objVO.getInsertList()){
            insertSabaoBase(sabaoBaseVO);
        } 
        for(SanbaoBaseVO sabaoBaseVO : objVO.getUpdateList()){
            updateSabaoBase(sabaoBaseVO);
        } 
        for(SanbaoBaseVO sabaoBaseVO : objVO.getDeleteList()){
            deleteSabaoBase(sabaoBaseVO);
        } 
    }
    
    /**
     * 
     * 삼보 RO 작업시간 목록 데이터를 등록/수정한다.
     *
     * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
     * @return 삼보 기준정책 목록 데이터를 등록/수정
     * @throws Exception 
     */
    public void multiSabaoBasesRoWorkTime(BaseSaveVO<SanbaoBaseVO> objVO) throws Exception {
        
        for(SanbaoBaseVO sabaoBaseVO : objVO.getInsertList()){
            insertSabaoBase(sabaoBaseVO);
        } 
        for(SanbaoBaseVO sabaoBaseVO : objVO.getUpdateList()){
            updateSabaoBase(sabaoBaseVO);
        } 
        for(SanbaoBaseVO sabaoBaseVO : objVO.getDeleteList()){
            deleteSabaoBase(sabaoBaseVO);
        } 
    }
    
    /**
     * 
     * 삼보 감가상각률 목록 데이터를 등록/수정한다.
     *
     * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
     * @return 삼보 기준정책 목록 데이터를 등록/수정
     * @throws Exception 
     */
    public void multiSabaoBasesRate(BaseSaveVO<SanbaoBaseVO> objVO) throws Exception {
        
        for(SanbaoBaseVO sabaoBaseVO : objVO.getInsertList()){
            insertSabaoBase(sabaoBaseVO);
        } 
        for(SanbaoBaseVO sabaoBaseVO : objVO.getUpdateList()){
            updateSabaoBase(sabaoBaseVO);
        } 
        for(SanbaoBaseVO sabaoBaseVO : objVO.getDeleteList()){
            deleteSabaoBase(sabaoBaseVO);
        } 
        
    }
    
    /**
     * 
     * 삼보 기준정책 등록
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertSabaoBase(SanbaoBaseVO sabaoBaseVO)throws Exception{
        
        sabaoBaseVO.setRegUsrId(LoginUtil.getUserId());
        return sanbaoBaseDAO.insertSabaoBase(sabaoBaseVO);
    }
    
    /**
     * 
     * 삼보 기준정책 수정
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateSabaoBase(SanbaoBaseVO sabaoBaseVO)throws Exception{
        sabaoBaseVO.setUpdtUsrId(LoginUtil.getUserId());
        return sanbaoBaseDAO.updateSabaoBase(sabaoBaseVO);
    }
    
    
    /**
     * 
     * 삼보 기준정책 삭제
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteSabaoBase(SanbaoBaseVO sabaoBaseVO)throws Exception{
        
        return sanbaoBaseDAO.deleteSabaoBase(sabaoBaseVO);
    }
    
 
    /**
     * 
     * 삼보 부품그룹 등록
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public void insertSabaoBaseItemsGrps(SanbaoBaseSaveVO saveVO)throws Exception{
        
        
        BaseSaveVO<SanbaoBasePartVO> objVO = saveVO.getGridPartVO();
        for(SanbaoBasePartVO sanbaoBasePartVO : objVO.getUpdateList()){
            sanbaoBasePartVO.setRegUsrId(LoginUtil.getUserId());
            sanbaoBaseDAO.insertSabaoBaseItemsGrps(sanbaoBasePartVO);
        } 
        
    }
    
    /**
     * 
     * 삼보 부품그룹 수정
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public void updateSabaoBaseItemsGrps(SanbaoBaseSaveVO saveVO)throws Exception{
        
        BaseSaveVO<SanbaoBasePartVO> objVO = saveVO.getGridPartVO();
        for(SanbaoBasePartVO sanbaoBasePartVO : objVO.getUpdateList()){
            sanbaoBasePartVO.setRegUsrId(LoginUtil.getUserId());
            sanbaoBaseDAO.updateSabaoBaseItemsGrps(sanbaoBasePartVO);
        } 
        
    }
    
    
    
    

}
