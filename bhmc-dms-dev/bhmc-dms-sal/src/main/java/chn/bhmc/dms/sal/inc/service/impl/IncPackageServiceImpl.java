package chn.bhmc.dms.sal.inc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.sal.inc.service.IncPackageService;
import chn.bhmc.dms.sal.inc.service.dao.IncPackageDAO;
import chn.bhmc.dms.sal.inc.vo.IncPackageSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageVO;

/**
 *
 * @ClassName   : IncPackageServiceImpl
 * @Description : 보험패키지관리
 * @author
 * @since 2017. 02. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 02. 11.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("incPackageService")
public class IncPackageServiceImpl extends HService implements IncPackageService{

    /**
     * 보험패키지관리 DAO 선언
     */
    @Resource(name="incPackageDAO")
    IncPackageDAO incPackageDAO;


    /**
     * 보험패키지 메인목록 갯수 조회 
     * @param searchVO
     * @return
     */
    @Override
    public int selectIncPackagesByConditionCnt(IncPackageSearchVO searchVO) throws Exception{
        return incPackageDAO.selectIncPackagesByConditionCnt(searchVO);
    }
    
    /**
     * 보험패키지 메인목록 조회
     * @param searchVO
     * @return
     */
    @Override
    public List<IncPackageVO> selectIncPackagesByCondition(IncPackageSearchVO searchVO) throws Exception{
        return incPackageDAO.selectIncPackagesByCondition(searchVO);
    }

    /**
     * 보험패키지 디테일목록 갯수 조회 
     * @param searchVO
     * @return
     */
    @Override
    public int selectIncDetailPackagesByConditionCnt(IncPackageSearchVO searchVO) throws Exception{
        return incPackageDAO.selectIncDetailPackagesByConditionCnt(searchVO);
    }
    
    /**
     * 보험패키지 디테일목록 조회
     * @param searchVO
     * @return
     */
    @Override
    public List<IncPackageVO> selectIncDetailPackagesByCondition(IncPackageSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return incPackageDAO.selectIncDetailPackagesByCondition(searchVO);
    }
    
    /**
     * 보험패키지 header 생성
     * @param searchVO
     * @return
     */
    @Override
    public int multiIncPackageHeaderSave(IncPackageVO saveVO) throws Exception{
        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        };
        
        IncPackageSearchVO searchVO = new IncPackageSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsPackageNo(saveVO.getPackageNo());
        searchVO.setsPackageNm(saveVO.getPackageNm());
        if(incPackageDAO.selectIncPackagesByConditionCnt(searchVO) > 0 ){
            throw processException("global.err.duplicate");
        }else{
            saveVO.setRegUsrId(LoginUtil.getUserId());   //생성자
            saveVO.setUpdtUsrId(LoginUtil.getUserId());  //수정자
            incPackageDAO.insertIncPackageHeader(saveVO);
        }
        return 1;
    }
    
    /**
     * 보험패키지 디테일목록 저장/삭제
     * @param searchVO
     * @return
     */ 
    @Override
    public int multiIncPackageDetail(IncPackageSaveVO saveVO) throws Exception{
        incPackageDAO.deleteIncPackageDetail(saveVO.getDlrCd(), saveVO.getPackageNo());
        
        IncPackageSearchVO searchVO = new IncPackageSearchVO();
        for(IncPackageVO packVO : saveVO.getInsertList()){
            packVO.setRegUsrId(LoginUtil.getUserId());
            packVO.setUpdtUsrId(LoginUtil.getUserId());
            
            searchVO.setsDlrCd(packVO.getDlrCd());
            searchVO.setsPackageNo(packVO.getPackageNo());
            searchVO.setsIncTp(packVO.getIncTp());
            if(incPackageDAO.selectIncDetailPackagesByConditionCnt(searchVO) > 0){
                throw processException("global.err.duplicate");
            }
            incPackageDAO.insertIncPackageDetail(packVO);
        }
        return 1; 
    }
}
