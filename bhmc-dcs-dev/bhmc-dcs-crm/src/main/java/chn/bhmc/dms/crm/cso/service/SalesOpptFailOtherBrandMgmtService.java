package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO;

/**
 * 판매기회 타브랜드 실패 차량 관리 서비스
 *
 * @author liu jing
 * @since 2016.12.12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.12.12         liu jing            최초 생성
 * </pre>
 */

public interface SalesOpptFailOtherBrandMgmtService {


   /**
     * DMS 로 배포
     */
    public void updateDistOpptFailOtherBrand() throws Exception;

    /**
     * 판매기회 타브랜드 실패 차량 관리 서비스 정의
     */
    public void multiSalesOpptFailOtherBrandMgmtMain(SalesOpptFailOtherBrandMgmtSaveVO saveVO) throws Exception;

    /**
     * 판매기회 타브랜드 실패 차량 관리 서비스 update
     *
     * @param SalesOpptFailOtherBrandMgmtVO
     * @return void
     */
    public void updateSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO VO) throws Exception;

    /**
     * 판매기회 타브랜드 실패 차량 관리 서비스 insert
     *
     * @param SalesOpptFailOtherBrandMgmtVO
     * @return void
     */
    public void insertSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO VO) throws Exception;

    /**
     * 판매기회 타브랜드 실패 차량 관리 서비스 delete
     *
     * @param SalesOpptFailOtherBrandMgmtVO
     * @return void
     */
    public void deleteSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO VO) throws Exception;

    /**
     * 판매기회 타브랜드 실패 차량 관리 서비스 건수 조회
     *
     * @param SalesOpptFailOtherBrandMgmtSearchVO
     * @return NO.
     */
    public int selectSalesOpptFailOtherBrandMgmtsByConditionCnt(SalesOpptFailOtherBrandMgmtSearchVO searchVO)throws Exception;

    /**
     * 판매기회 타브랜드 실패 차량 관리 서비스 리스트 내용 조회
     *
     * @param SalesOpptFailOtherBrandMgmtSearchVO
     * @return 그리고 리그스 내용
     */
    public List<SalesOpptFailOtherBrandMgmtVO> selectSalesOpptFailOtherBrandMgmtsByCondition(SalesOpptFailOtherBrandMgmtSearchVO searchVO)throws Exception;




}
