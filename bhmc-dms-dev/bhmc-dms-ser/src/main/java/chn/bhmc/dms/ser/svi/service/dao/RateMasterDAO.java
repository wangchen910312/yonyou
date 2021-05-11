package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.RateMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateMasterVO;

/**
 * <pre>
 * 임률관리 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : RateMasterDAO.java
 * @Description : 임률관리 DAO
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("rateMasterDAO")
public interface RateMasterDAO {

    /**
     * 임률관리 정보를 등록한다.
     * @param rateMasterVO - 등록할 정보가 담긴 RateMasterVO
     * @return 등록된 목록수
     */
    public int insertRateMaster(RateMasterVO rateMasterVO);

    /**
     * 임률관리 정보를 수정한다.
     * @param rateMasterVO - 수정할 정보가 담긴 RateMasterVO
     * @return 수정된 목록수
     */
    public int updateRateMaster(RateMasterVO rateMasterVO);

    /**
     * 임률관리 정보를 삭제한다.
     * @param rateMasterVO - 삭제할 정보가 담긴 RateMasterVO
     * @return 삭제된 목록수
     */
    public int deleteRateMaster(RateMasterVO rateMasterVO);

    /**
     * 조회 조건에 해당하는 임률관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
     * @return 조회 목록
     */
    public List<RateMasterVO> selectRateMasterByCondition(RateMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 임률관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
     * @return
     */
    public int selectRateMasterByConditionCnt(RateMasterSearchVO searchVO);

     /**
     * 조회 조건에 해당하는 임률관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
     * @return 조회 목록
     */
    public RateMasterVO selectRateMasterByKey(RateMasterSearchVO searchVO);

    /**
    * 조회 조건에 해당하는 딜러별 임률관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
    * @return 조회 목록
    */
    public RateMasterVO selectDlrRateByKey(RateMasterSearchVO searchVO)throws Exception;

    /**
     * 임률 코드 별 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RateMasterVO> selectRates(RateMasterSearchVO searchVO)throws Exception;

}
