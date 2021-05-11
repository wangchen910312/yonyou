package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarVO;
/**
 * 시승 예약에 관한 데이터처리 매퍼 클래스
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

@Mapper("CrmtestDriveCarDAO")
public interface CrmTestDriveCarDAO {

	public int selectTestDriveCarsByConditionCnt(TestDriveCarSearchVO searchVO) throws Exception;
    
	public List<TestDriveCarVO> selectTestDriveCarsByCondition(TestDriveCarSearchVO searchVO) throws Exception;

}
