package chn.bhmc.dms.crm.cal.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;

/**
 * 콜센터실행 히스토리에 관한 데이터처리 매퍼 클래스
 *
 * @author in moon lee
 * @since 2016.07.22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.22         in moon lee            최초 생성
 * </pre>
 */

@Mapper("callCenterActionHistoryDAO")
public interface CallCenterActionHistoryDAO {

    /**
     * 콜센터실행 히스토리 정보를 등록한다.
     * @param saveVO
     * @return 등록 수량
     */
    int insertCallCenterActionHistory(CallCenterActionVO saveVO);

    /**
     * 조회 조건에 해당하는 콜센터실행 히스토리 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    int selectCallCenterActionHistorysByConditionCnt(CallCenterActionSearchVO searchVO) throws Exception ;

    /**
     * 조회 조건에 해당하는 콜센터실행 히스토리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCenterActionSearchVO
     * @return
     */
    List<CallCenterActionVO> selectCallCenterActionHistorysByCondition(CallCenterActionSearchVO searchVO) throws Exception ;

    /**
     * 조회 조건에 해당하는 콜센터실행 히스토리 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCenterActionSearchVO
     * @return  CallCenterActionVO
     */
    CallCenterActionVO selectCallCenterActionHistoryByKey(CallCenterActionSearchVO searchVO) throws Exception ;


}
