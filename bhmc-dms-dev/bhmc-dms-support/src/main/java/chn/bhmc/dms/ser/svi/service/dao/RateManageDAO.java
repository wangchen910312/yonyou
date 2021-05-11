package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageVO;

/**
 * <pre>
 * 임률관리 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : RateManageDAO.java
 * @Description : 임률관리 DAO
 * @author Kwon Ki Hyun
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.   Kwon Ki Hyun      최초 생성
 * </pre>
 */

@Mapper("rateManageDAO")
public interface RateManageDAO {

    /**
     * 임률관리 정보를 등록한다.
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
     * 임률관리 정보를 삭제한다.
     * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
     * @return 삭제된 목록수
     */
    public int deleteRateManage(RateManageVO rateManageVO)throws Exception;
    
    
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
    public RateManageVO selectRateManageByKey(RateManageSearchVO searchVO)throws Exception;

    /**
    * 조회 조건에 해당하는 딜러별 임률관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateManageSearchVO
    * @return 조회 목록
    */
    public RateManageVO selectDlrRateByKey(RateManageSearchVO searchVO)throws Exception;

    /**
     * 임률 코드 별 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RateManageVO> selectRates(RateManageSearchVO searchVO)throws Exception;
    
    
    /**
     * 임률 코드 목록 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RateManageVO> selectRateManageByCondition(RateManageSearchVO searchVO)throws Exception;

}
