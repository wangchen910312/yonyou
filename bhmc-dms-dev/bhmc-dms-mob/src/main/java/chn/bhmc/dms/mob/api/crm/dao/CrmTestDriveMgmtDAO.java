package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.vo.CrmTestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveResvSearchVO;


/**
 * 시승에 관한 데이터처리 매퍼 클래스
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

@Mapper("CrmTestDriveMgmtDAO")
public interface CrmTestDriveMgmtDAO {
	
	public TestDriveResvVO selectTestDriveLastTimeDrivByKey(TestDriveResvSearchVO searchVO)throws Exception;

    public int selectTestDriveResvsByConditionCnt(TestDriveResvSearchVO searchVO) throws Exception;

    public List<CrmTestDriveResvVO> selectTestDriveResvsByCondition(TestDriveResvSearchVO searchVO) throws Exception;

    public CrmTestDriveResvVO selectTestDriveMgmtByKey(TestDriveResvSearchVO searchVO)throws Exception;

}
