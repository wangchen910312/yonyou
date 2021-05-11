package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.RateManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageVO;

/**
 * <pre>
 * 임률코드 관리 Service
 * </pre>
 *
 * @ClassName   : RateManageService.java
 * @Description : 임률코드 관리 Service
 * @author Kwon Ki hyun
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.   Kwon Ki hyun      최초 생성
 * </pre>
 */

public interface RateManageService {

    /**
     * 임률코드 정보를 등록한다.
     * @param rateManageVO - 등록할 정보가 담긴 RateManageVO
     * @return 등록된 목록수
     */
    public int insertRateManage(RateManageVO rateManageVO) throws Exception;
    
    /**
     * 임률관리 정보를 수정한다.
     * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
     * @return 삭제된 목록수
     */
    public int updateRateManage(RateManageVO rateManageVO)throws Exception;

    /**
     * 임률코드 정보를 삭제한다.
     * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
     * @return 삭제된 목록수
     */
    public int deleteRateManage(RateManageVO rateManageVO) throws Exception;
    
    /**
     * 임률관리 전체 정보를 삭제한다.
     * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
     * @return 삭제된 목록수
     */
    public int deleteAllRateManage(RateManageVO rateManageVO)throws Exception;

 

     /**
     * 조회 조건에 해당하는 임률관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RateManageSearchVO
     * @return 조회 목록
     */
    public RateManageVO selectRateManageByKey(RateManageSearchVO searchVO) throws Exception;
    
    /**
    * 조회 조건에 해당하는 딜러별 임률관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateManageSearchVO
    * @return 조회 목록
    */
    public RateManageVO selectDlrRateByKey(RateManageSearchVO searchVO) throws Exception;

    /**
     * 임률 코드 별 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return 임률코드별 정보
     * @throws Exception
     */
    public List<RateManageVO> selectRates(RateManageSearchVO searchVO) throws Exception;
    
    
    /**
     * 임률 코드 목록 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RateManageVO> selectRateManageByCondition(RateManageSearchVO searchVO)throws Exception;

    /**
     * 임률코드 등록/수정 /삭제
     *
     * @param saveVO
     */
    public void multiRateManages(RateManageSaveVO saveVO)throws Exception;
}
