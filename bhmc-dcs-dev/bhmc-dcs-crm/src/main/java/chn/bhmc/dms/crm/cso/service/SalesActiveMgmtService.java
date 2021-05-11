package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveVO;

/**
 * 영업활동 관리서비스
 *
 * @author in moon lee
 * @since 2016.04.27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.27         in moon lee            최초 생성
 * </pre>
 */

public interface SalesActiveMgmtService {

    /**
     * 조회 조건에 해당하는 영업관리 총 갯수를 조회한다.
     * @param SalesActiveSearchVO - 판매고문, 고객명, 영업활동유형코드
     * @return
     */
    public int selectSalesActiveMgmtsByConditionCnt(SalesActiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 영업관리 정보를 조회한다.
     * @param SalesActiveSearchVO - 판매고문, 고객명, 영업활동유형코드
     * @return 조회 목록
     */
    public List<SalesActiveVO> selectSalesActiveMgmtsByCondition(SalesActiveSearchVO searchVO) throws Exception;

    /**
     * 영업관리 상제정보를 조회한다.
     * @param SalesActiveSearchVO - 영업활동번호
     * @return
     */
    public SalesActiveVO selectSalesActiveMgmtByKey(SalesActiveSearchVO searchVO);

    /**
     * 영업관리 정보를 저장한다.
     * @param SalesActiveVO - 영업활동 정보
     * @return 등록된 목록수
     */
    public String multiSalesActiveMgmts(SalesActiveVO visitCustomerVO) throws Exception;

    /**
     * 영업활동스케줄 목록(내방/시승/활동)
     *
     * @param searchVO
     * @return
     */
    public SearchResult selectSalesTotalActiveCalendars(SalesActiveSearchVO searchVO)  throws Exception;


    /**
     * 영업관리 정보를 등록한다.
     * @param SalesActiveVO - 영업활동 정보
     * @return 등록된 목록수
     */
    //public int insertSalesActiveMgmt(SalesActiveVO visitCustomerVO) throws Exception;

    /**
     * 영업관리 정보를 수정한다.
     * @param SalesActiveVO - 영업활동 정보
     * @return 수정된 목록수
     */
    //public int updateSalesActiveMgmt(SalesActiveVO visitCustomerVO) throws Exception;


}
