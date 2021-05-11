package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarVO;


/**
 * 시승 차량 관리 서비스
 *
 * @author in moon lee
 * @since 2016.02.11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         in moon lee            최초 생성
 * </pre>
 */

public interface CrmTestDriveCarService {
	
	public int selectTestDriveCarsByConditionCnt(TestDriveCarSearchVO searchVO) throws Exception;

    public List<TestDriveCarVO> selectTestDriveCarsByCondition(TestDriveCarSearchVO searchVO) throws Exception;

}
