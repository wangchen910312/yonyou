package chn.bhmc.dms.bat.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptTraceMgmtVO;

/**
 * 추적 관리에 관한 데이터처리 매퍼 클래스
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

@Mapper("batSalesOpptTraceMgmtDAO")
public interface BatSalesOpptTraceMgmtDAO {

    public int selectSalesOpptTraceMgmtsByConditionCnt(BatSalesOpptTraceMgmtSearchVO searchVO) throws Exception;

    public List<BatSalesOpptTraceMgmtVO> selectSalesOpptTraceMgmtsByCondition(BatSalesOpptTraceMgmtSearchVO searchVO) throws Exception;

    public int insertSalesOpptTraceMgmt(BatSalesOpptTraceMgmtVO SalesOpptTraceMgmtVO) throws Exception;

    public int updateSalesOpptTraceMgmt(BatSalesOpptTraceMgmtVO SalesOpptTraceMgmtVO) throws Exception;

    public String multiSalesOpptMgmts(BatSalesOpptTraceMgmtVO saveVO) throws Exception;

}
