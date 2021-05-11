package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.PartReservationSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PartReservationVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationDAO.java
 * @Description : 부품예약 DAO
 * @author KyungMok Kim
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("PartPartReservationDAO")
public interface PartPartReservationDAO {

    /**
     * 조회 조건에 해당하는 예약접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public int selectPartReservationByConditionCnt(PartReservationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 예약접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public List<PartReservationVO> selectPartReservationByCondition(PartReservationSearchVO searchVO);

 
//    /**
//     * 조회 조건에 해당하는 예약 KEY 정보를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
//     * @return 조회 목록
//     */
//    public PartReservationVO selectPartReservationByKey(PartReservationSearchVO searchVO) throws Exception;

}