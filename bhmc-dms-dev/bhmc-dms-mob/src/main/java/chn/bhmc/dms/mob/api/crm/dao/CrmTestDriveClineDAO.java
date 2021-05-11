package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveClineSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveClineVO;



/**
 * 시승노선관리에 관한 데이터처리 매퍼 클래스
 *
 * @author in moon lee
 * @since 2016.05.12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.12         in moon lee            최초 생성
 * </pre>
 */

@Mapper("CrmTestDriveClineDAO")
public interface CrmTestDriveClineDAO {

    public List<TestDriveClineVO> selectTestDriveClinesByCondition(TestDriveClineSearchVO searchVO) throws Exception;

}
