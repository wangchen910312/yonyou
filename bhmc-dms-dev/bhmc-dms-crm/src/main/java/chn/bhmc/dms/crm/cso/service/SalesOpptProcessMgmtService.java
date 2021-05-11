package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;

/**
 * 판매기회 관리 서비스
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

public interface SalesOpptProcessMgmtService {

    /**
     * 조회 조건에 해당하는 판매기회프로세스 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return int
     */
    public int selectSalesOpptProcessUnionMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return int 조회 목록
     */
    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessUnionMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회프로세스 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return int
     */
    public int selectSalesOpptProcessMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return SalesOpptProcessMgmtVO 조회 목록
     */
    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다. (단건)
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return SalesOpptProcessMgmtVO 조회 목록
     */
    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 판매기회프로세스 관리 정보를 등록한다. ( 판매기회 + 주소 )
    * @param SalesOpptProcessMgmtVO - 판매기회정보를 등록할 정보가 담긴 SalesOpptProcessMgmtVO, 주소을 등록할 정보가 담긴 addressInfoVO
    * @return 등록된 목록수
    */
   public String multiSalesOpptProcMgmts(SalesOpptProcessMgmtSaveVO saveVO) throws Exception;

   /**
    * 판매기회프로세스 관리 정보를 등록한다.
    * @param SalesOpptProcessMgmtVO - 등록할 정보가 담긴 SalesOpptProcessMgmtVO
    * @return int
    */
   public int insertSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

   /**
    * 판매기회프로세스 관리 정보를 수정한다.
    * @param SalesOpptProcessMgmtVO - 수정할 정보가 담긴 SalesOpptProcessMgmtVO
    * @return 수정된 목록수
    * support로 이동 (salesOpptProcessMgmtOutBoundService)
    */
   //public int updateSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회 이력 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtHistSearchVO
    * @return int
    */
   public int selectSalesOpptProcessMgmtsHistByConditionCnt(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회 이력 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtHistSearchVO
    * @return SalesOpptProcessMgmtHistVO
    */
   public List<SalesOpptProcessMgmtHistVO> selectSalesOpptProcessMgmtsHistByCondition(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;

   /**
    * 판매기회 이력정보를 등록한다.
    * @param SalesOpptProcessMgmtHistVO - 등록할 정보가 담긴 SalesOpptProcessMgmtHistVO
    * @return int
    */
   public int insertSalesOpptProcessMgmtHist(SalesOpptProcessMgmtHistVO salesOpptProcessMgmtHistVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return SalesOpptProcessMgmtVO 조회 목록
    */
   public int selectSalesOpptProcessMgmtsIngByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return SalesOpptProcessMgmtVO 조회 목록
    */
   public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsIngByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다. (단건)
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return SalesOpptProcessMgmtVO 조회 목록
    */
   public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsIngByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 판매기회 일괄등록 처리를 수행한다.
    *
    * @param list
    * @return message
    * @throws Exception
    */
   public String insertSalesOpptPorcessBatchUpload(List<SalesOpptProcessMgmtVO> list) throws Exception;

   /**
    * 판매기회 일괄등록 처리를 수행한다.
    *
    * @param list
    * @return message
    * @throws Exception
    */
   public List<SalesOpptProcessMgmtVO> insertSalesOpptPorcessBatchUploadRlt(List<SalesOpptProcessMgmtVO> list) throws Exception;

   /**
    * 판매기회 일괄등록 처리 시 사전 체크를 수행한다.
    *
    * @param list
    * @return message
    * @throws Exception
    */
   public List<SalesOpptProcessMgmtVO> selectSalesOpptPorcessBatchUploadPreChk(List<SalesOpptProcessMgmtVO> list) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return int
    */
   public int selectSalesOpptDupHistByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return int 조회 목록
    */
   public List<SalesOpptProcessMgmtVO> selectSalesOpptDupHistByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;





   /**
    * 조회 조건에 해당하는 중복 판매기회  관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return int
    */
   public int selectLeadRepetitionByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 중복 판매기회 관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return int 조회 목록
    */
   public List<SalesOpptProcessMgmtVO> selectLeadRepetitionByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;






   /**
    * 대량 전출을 한다.
    * @param SalesOpptProcessSaveVO
    * @return 등록된 목록수
    */
   public void multiSalesOpptProcessToFail(SalesOpptProcessSaveVO saveVO) throws Exception;

}
