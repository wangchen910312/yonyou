package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.SalesMgrDetlSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.SalesMgrDetlSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.SalesMgrDetlVO;

/**
 * 판매고문 직무상세 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2017. 7. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.07.27         Kang Seok Han            최초 생성
 * </pre>
 */

public interface SalesMgrDetlService {

    /**
     * 판매고문 직무상세 정보를 등록한다.
     * @param salesMgrDetlVO - 등록할 정보가 담긴 SalesMgrDetlVO
     * @return 등록된 목록수
     */
    public int insertSalesMgrDetl(SalesMgrDetlVO salesMgrDetlVO) throws Exception;

    /**
     * 판매고문 직무상세 정보를 수정한다.
     * @param salesMgrDetlVO - 수정할 정보가 담긴 SalesMgrDetlVO
     * @return 수정된 목록수
     */
    public int updateSalesMgrDetl(SalesMgrDetlVO salesMgrDetlVO) throws Exception;

    /**
     * 판매고문 직무상세 정보를 삭제한다.
     * @param salesMgrDetlVO - 삭제할 정보가 담긴 SalesMgrDetlVO
     * @return 삭제된 목록수
     */
    public int deleteSalesMgrDetl(SalesMgrDetlVO salesMgrDetlVO) throws Exception;

    /**
     * 판매고문 직무상세 정보를 등록/수정/삭제 처리한다.
     * @param salesMgrDetlSaveVO
     */
    public void multiSalesMgrDetls(SalesMgrDetlSaveVO salesMgrDetlSaveVO) throws Exception;

    /**
     * Key에 해당하는 판매고문 직무상세 정보를 조회한다.
     * @param salesMgrDetlCd 판매고문 직무상세코드
     * @return 조회한 판매고문 직무상세 정보
     */
    public SalesMgrDetlVO selectSalesMgrDetlByKey(String salesMgrDetlCd) throws Exception;

    /**
     * 조회 조건에 해당하는 판매고문 직무상세 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 SalesMgrDetlSearchVO
     * @return 조회 목록
     */
    public List<SalesMgrDetlVO> selectSalesMgrDetlsByCondition(SalesMgrDetlSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매고문 직무상세 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 SalesMgrDetlSearchVO
     * @return
     */
    public int selectSalesMgrDetlsByConditionCnt(SalesMgrDetlSearchVO searchVO) throws Exception;
}
