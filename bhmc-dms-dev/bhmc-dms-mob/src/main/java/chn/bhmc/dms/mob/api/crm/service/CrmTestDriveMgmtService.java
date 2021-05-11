package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.vo.CrmTestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveResvSearchVO;



/**
 * 시승 예약 관리 서비스
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

public interface CrmTestDriveMgmtService {


	public TestDriveResvVO selectTestDriveLastTimeDrivByKey(TestDriveResvSearchVO searchVO) throws Exception;
   
    public int selectTestDriveResvsByConditionCnt(TestDriveResvSearchVO searchVO) throws Exception;

    public List<CrmTestDriveResvVO> selectTestDriveResvsByCondition(TestDriveResvSearchVO searchVO) throws Exception;

    public CrmTestDriveResvVO selectTestDriveMgmtByKey(TestDriveResvSearchVO searchVO) throws Exception;

}
