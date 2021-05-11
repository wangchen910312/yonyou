package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtVO;

/**
 * 전시장 관리 서비스
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

public interface SalesOpptShowRoomMgmtService {

    /**
     * 조회 조건에 해당하는 전시장프로세스 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return int
     */
    public int selectSalesOpptShowRoomMgmtsByConditionCnt(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전시장프로세스 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return int 조회 목록
     */
    public List<SalesOpptShowRoomMgmtVO> selectSalesOpptShowRoomMgmtsByCondition(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception;

   /**
    * 전시장프로세스 관리 정보를 등록한다. ( 전시장 + 주소 )
    * @param SalesOpptShowRoomMgmtVO - 전시장정보를 등록할 정보가 담긴 SalesOpptShowRoomMgmtVO, 주소을 등록할 정보가 담긴 addressInfoVO
    * @return 등록된 목록수
    */
   public String multiSalesOpptShowRoomMgmts(SalesOpptShowRoomMgmtSaveVO saveVO) throws Exception;

   /**
    * 전시장프로세스 관리 정보를 등록한다.
    * @param SalesOpptShowRoomMgmtVO - 등록할 정보가 담긴 SalesOpptShowRoomMgmtVO
    * @return int
    */
   public int insertSalesOpptShowRoomMgmt(SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO) throws Exception;

   /**
    * 전시장프로세스 관리 정보를 수정한다.
    * @param SalesOpptShowRoomMgmtVO - 수정할 정보가 담긴 SalesOpptShowRoomMgmtVO
    * @return 수정된 목록수
    */
   public int updateSalesOpptShowRoomMgmt(SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO) throws Exception;

   /**
    * 전시장프로세스 카운트 조회
    * @param SalesOpptShowRoomMgmtSearchVO
    * @return SalesOpptShowRoomMgmtVO
    */
   public SalesOpptShowRoomMgmtVO selectSalesOpptShowRoomSummaryCntByCondition(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception;

}
