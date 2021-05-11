package chn.bhmc.dms.sal.fim.service;

import java.util.List;

import chn.bhmc.dms.sal.fim.vo.FincInfoMngIFVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;


/**
 *  금융정보관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.09         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface FincInfoMngService {

    /**
     * 금융서비스 - 계약번호로 금융번호를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public List<FincInfoMngVO> selectFincNoSearch(FincInfoMngVO searchVO) throws Exception;

    /**
     * 금융서비스를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertFincMng(FincInfoMngVO saveVO) throws Exception;

    /**
     * 금융서비스 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateFincMng(FincInfoMngVO saveVO) throws Exception;

    /**
     * 금융서비스 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteFincMng(FincInfoMngVO saveVO) throws Exception;

    /**
     * 금융서비스 내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectFincInfoMngsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngVO> selectFincInfoMngsByCondition(FincInfoMngSearchVO searchVO) throws Exception;

    /**
     * 금융서비스 저장을 한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public String updateFincInfo(FincInfoMngVO saveVO) throws Exception;
    
    /**
     * 금융서비스 차량정보를 저장한다. 
     * @param saveVO
     * @return
     * @throws Exception
     */
    public String updateVehicleFincMng(FincInfoMngVO saveVO) throws Exception;

    /**
     * 금융견적 팝업 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectFincInfoPopupsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngIFVO> selectFincInfoPopupsByCondition(FincInfoMngSearchVO searchVO) throws Exception;


    /**
     * CRM : 고객의 금융 정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCustFincInfosByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngVO> selectCustFincInfosByCondition(FincInfoMngSearchVO searchVO) throws Exception;

}
