package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtVO;

/**
 * 판매기회 관리에 관한 데이터처리 매퍼 클래스
 *
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         kyo jin lee            최초 생성
 * </pre>
 */

@Mapper("salesOnDutyMgmtDAO")
public interface SalesOnDutyMgmtDAO {


    public int selectSalesOnDutyMgmtByConditionCnt(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    public List<SalesOnDutyMgmtVO> selectSalesOnDutyMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    public List<SalesOnDutyMgmtVO> selectSalesOnDutySchedulerMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    public int updateSalesOnDutyCountMgmt(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;

    public int selectSalesOpptScAssignMgmtByConditionCnt(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    public List<SalesOnDutyMgmtVO> selectSalesOpptScAssignMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    public int insertSalesOpptScAssignMgmt(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;

    public int insertCopyOnDutyMbrNextMonth(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;

    public int deleteOnDutyMbrthisMonth(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    public int deleteOnDutySetMember(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;
}
