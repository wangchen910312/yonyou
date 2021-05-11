package chn.bhmc.dms.crm.cal.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceVO;

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

@Mapper("callCenterDeviceDAO")
public interface CallCenterDeviceDAO {

    /**
     * 콜센터실행 히스토리 정보를 등록한다.
     * @param saveVO
     * @return 등록 수량
     */
    int insertCallCenterHistory(CallCenterDeviceVO saveVO);

    /**
     * 콜센터실행 히스토리 정보를 조회한다.
     * @param CallCenterDeviceSearchVO - DLR_CD, CALL_HIS_SEQ
     * @return
     */
    public CallCenterDeviceVO selectCallCenterDeviceByKey(CallCenterDeviceSearchVO searchVO) throws Exception;


}
