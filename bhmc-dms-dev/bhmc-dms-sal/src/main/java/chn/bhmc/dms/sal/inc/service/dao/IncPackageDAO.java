package chn.bhmc.dms.sal.inc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.inc.vo.IncPackageSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageVO;

/**
 *
 * @ClassName   : IncPackageDAO
 * @Description : 보험패키지관리 DAO
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

@Mapper("incPackageDAO")
public interface IncPackageDAO {

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
    public int insertIncPackageHeader(IncPackageVO saveVO) throws Exception;
    
    /**
     * 보험패키지 디테일목록 삭제
     * @param Map
     * @return
     */    
    public int deleteIncPackageDetail(@Param("dlrCd") String dlrCd, @Param("packageNo") String packageNo) throws Exception;
    
    /**
     * 보험패키지 디테일목록 저장
     * @param Map
     * @return
     */    
    public int insertIncPackageDetail(IncPackageVO saveVO) throws Exception;
    
    
    
    
    
    
    
    
    
    
    
    
}