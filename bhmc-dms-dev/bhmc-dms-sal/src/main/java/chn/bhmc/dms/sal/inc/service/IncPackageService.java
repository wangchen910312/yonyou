package chn.bhmc.dms.sal.inc.service;

import java.util.List;

import chn.bhmc.dms.sal.inc.vo.IncPackageSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageVO;



/**
 * @ClassName   : IncPackageService
 * @Description : 보험패키지 서비스
 * @author Kim Jin Suk
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

public interface IncPackageService {
    
    /**
     * 보험패키지 메인목록 갯수 조회 
     * @param searchVO
     * @return
     */
    public int selectIncPackagesByConditionCnt(IncPackageSearchVO searchVO) throws Exception;
    
    /**
     * 보험패키지 메인목록 조회
     * @param searchVO
     * @return
     */
    public List<IncPackageVO> selectIncPackagesByCondition(IncPackageSearchVO searchVO) throws Exception;

    
    /**
     * 보험패키지 디테일목록 갯수 조회 
     * @param searchVO
     * @return
     */
    public int selectIncDetailPackagesByConditionCnt(IncPackageSearchVO searchVO) throws Exception;
    
    /**
     * 보험패키지 디테일목록 조회
     * @param searchVO
     * @return
     */
    public List<IncPackageVO> selectIncDetailPackagesByCondition(IncPackageSearchVO searchVO) throws Exception;
    
    /**
     * 보험패키지 header 생성
     * @param searchVO
     * @return
     */
    public int multiIncPackageHeaderSave(IncPackageVO saveVO) throws Exception;
    
    
    /**
     * 보험패키지 디테일목록 저장/삭제
     * @param searchVO
     * @return
     */    
    public int multiIncPackageDetail(IncPackageSaveVO saveVO) throws Exception;
    
}