package chn.bhmc.dms.sal.fim.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.fim.vo.FincInfoMngIFVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FincInfoMngDAO
 * @Description : 금융정보관리 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("fincInfoMngDAO")
public interface FincInfoMngDAO {

    /**
     * 금융서비스 - 계약번호로 금융번호를 조회한다.
     */
    public List<FincInfoMngVO> selectFincNoSearch(FincInfoMngVO searchVO) throws Exception;

    /**
     * 금융서비스를 저장한다.
     */
    public int insertFincMng(FincInfoMngVO saveVO) throws Exception;

    /**
     * 금융서비스 내역을 수정한다.
     */
    public int updateFincMng(FincInfoMngVO saveVO) throws Exception;

    /**
     * 금융서비스 내역을 삭제한다.
     */
    public int deleteFincMng(FincInfoMngVO saveVO) throws Exception;

    /**
     * 금융서비스 목록을 조회한다.
     */
    public int selectFincInfoMngsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngVO> selectFincInfoMngsByCondition(FincInfoMngSearchVO searchVO) throws Exception;

    /**
     * 금융서비스 저장한다.
     */
    public void updateFincInfo(FincInfoMngVO saveVO) throws Exception;
    
    /**
     * 금융서비스 차량정보를 저장한다.
     * @param saveVO
     * @throws Exception
     */
    public void updateVehicleFincMng(FincInfoMngVO saveVO) throws Exception;
    
    
    /**
     * 금융견적 팝업 내역을 조회한다.
     */
    public int selectFincInfoPopupsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngIFVO> selectFincInfoPopupsByCondition(FincInfoMngSearchVO searchVO) throws Exception;

    /**
     * CRM : 고객의 금융 정보 조회
     */
    public int selectCustFincInfosByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngVO> selectCustFincInfosByCondition(FincInfoMngSearchVO searchVO) throws Exception;

}