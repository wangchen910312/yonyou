package chn.bhmc.dms.sal.rcp.service;

import java.util.List;

import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitSaveVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitVO;
/**
 * <pre>
 * 영수증관리 > 부가세영수증관리
 * </pre>
 *
 * @ClassName   : SalesAddTaxRcitService.java
 * @Description : 영수증관리 > 부가세영수증관리
 * @author chibeom.song
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.   chibeom.song     최초 생성
 * </pre>
 */

public interface SalesAddTaxRcitService {

    /**
     * 조회 조건에 해당하는 영수증관리 > 부가세 영수증관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAddTaxRcitSearchVO
     * @return
     */
    public int selectSalesAddTaxReceiptSearchCnt(SalesAddTaxRcitSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 영수증관리 > 부가세 영수증관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAddTaxRcitSearchVO
     * @return 조회 목록
     */
    public List<SalesAddTaxRcitVO> selectSalesAddTaxReceiptSearchData(SalesAddTaxRcitSearchVO searchVO) throws Exception;

    /**
     * 부가세영수증업로드 > 부가세영수증 정보 등록
     * @param SalesAddTaxRcitVO
     * @return
     * @throws Exception
     */
    public boolean insertSalesAddTaxReceiptSave(SalesAddTaxRcitSaveVO saveVO) throws Exception;

    /**
     * 부가세영수증업로드 > 부가세영수증 이미지 조회
     * @param SalesAddTaxRcitVO
     * @return
     * @throws Exception
     */
    public SalesAddTaxRcitVO selectAddTaxReceiptImageSearch(SalesAddTaxRcitSearchVO searchVO) throws Exception;



}
