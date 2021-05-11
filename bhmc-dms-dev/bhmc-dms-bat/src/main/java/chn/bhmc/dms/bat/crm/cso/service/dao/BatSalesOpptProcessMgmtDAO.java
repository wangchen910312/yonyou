package chn.bhmc.dms.bat.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtHistVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatSalesOpptProcessMgmtDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE     최초 생성
 * </pre>
 */

@Mapper("batSalesOpptProcessMgmtDAO")
public interface BatSalesOpptProcessMgmtDAO {

    public int selectSalesOpptProcessMgmtsByConditionCnt(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<BatSalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsByCondition(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int updateSalesOpptProcessMgmt(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO ) throws Exception;

    public int insertSalesOpptProcessMgmtHist(BatSalesOpptProcessMgmtHistVO batSalesOpptProcessMgmtHistVO) throws Exception;


}
