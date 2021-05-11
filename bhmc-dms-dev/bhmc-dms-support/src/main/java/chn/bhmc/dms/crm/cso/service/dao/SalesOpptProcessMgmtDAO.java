package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;

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

@Mapper("salesOpptProcessMgmtDAO")
public interface SalesOpptProcessMgmtDAO {

    public int selectSalesOpptProcessUnionMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessUnionMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int selectSalesOpptProcessMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int selectSalesOpptProcessMgmtsByConditionStatsCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int insertSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

    public int updateSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

    public int updateSalesOpptProcessMgmtReSet(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

    public String multiSalesOpptMgmts(SalesOpptProcessMgmtSaveVO saveVO) throws Exception;

    public int selectSalesOpptProcessMgmtsHistByConditionCnt(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtHistVO> selectSalesOpptProcessMgmtsHistByCondition(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtHistVO> selectSalesOpptProcessMgmtsHistLatestByCondition(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;

    public int insertSalesOpptProcessMgmtHist(SalesOpptProcessMgmtHistVO salesOpptProcessMgmtHistVO) throws Exception;

    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsIngByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsIngByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int selectSalesOpptProcessMgmtsIngByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    /*
     * Excel Upload - 시작
     * 인터페이스 로직과 동일하게 사용해야함.
     */
    public int selectSalesOpptProcessDmsOriginalByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessDmsOriginalByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public String selectSalesOpptProcessMgmtContinueByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int insertSalesOpptDup(SalesOpptProcessMgmtVO SalesOpptProcessMgmtVO) throws Exception;

    public int selectSalesOpptDupHistByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtVO> selectSalesOpptDupHistByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int selectLeadRepetitionByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtVO> selectLeadRepetitionByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int insertCustomerFailNoticeToFms(SalesOpptProcessMgmtVO vo) throws Exception;
    
    /**
     * 生成试驾线索跟踪促给fms的接口记录
     * @param vo
     * @return
     * @throws Exception
     */
    public int insertCustomerSuccessNoticeToFms(SalesOpptProcessMgmtVO vo) throws Exception;
    /**
     * 判断之前是否存在过跟踪促成的记录
     */
    public int selectSucByConditionCnt(String sSaleOpptSeq)throws Exception;
    /**
     * 合同变动时线索通知fms：车辆出库，退库 
     * @param vo
     * @return
     * @throws Exception
     */
    public int insertContNoticeToFms(SalesOpptProcessMgmtVO vo) throws Exception;
}
