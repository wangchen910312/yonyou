package chn.bhmc.dms.sal.rcp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitSearchVO;

/**
 * <pre>
 * 영수증관리 > 부가세영수증관리
 * </pre>
 *
 * @ClassName   : SalesAddTaxRcitDAO.java
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
@Mapper("salesAddTaxRcitDAO")
public interface SalesAddTaxRcitDAO {

    /**
     * 조회 조건에 해당하는 영수증관리 > 부가세영수증관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAddTaxRcitSearchVO
     * @return
     */
    public int selectSalesAddTaxReceiptSearchCnt(SalesAddTaxRcitSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 영수증관리 > 부가세영수증관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAddTaxRcitSearchVO
     * @return 조회 목록
     */
    public List<SalesAddTaxRcitVO> selectSalesAddTaxReceiptSearchData(SalesAddTaxRcitSearchVO searchVO);

    /**
     * 부가세영수증업로드 > 기등록된 부가세영수증 갯수 조회
     * @param String receiptNo
     * @return
     */
    public int selectAddTaxReceiptCnt(SalesAddTaxRcitSearchVO searchVO);

    /**
     * 부가세영수증업로드 > 부가세영수증 정보등록
     * @param salesAddTaxRcitVO
     * @return
     */
    public int insertSalesAddTaxReceiptSave(SalesAddTaxRcitVO salesAddTaxRcitVO);

    /**
     * 부가세영수증업로드 > 부가세영수증 스캔파일을 등록한다.
     * @param salesAddTaxRcitVO
     * @return
     */
    public int updateSalesAddTaxReceiptImg(SalesAddTaxRcitVO salesAddTaxRcitVO);

    /**
     * 부가세영수증업로드 > 부가세영수증 정보등록
     * @param salesAddTaxRcitVO
     * @return
     */
    public int insertSalesAddTaxReceiptHistSave(SalesAddTaxRcitVO salesAddTaxRcitVO);

    /**
     * 부가세영수증관리 > 부가세영수증 이미지 조회
     * @param searchVO - 조회 조건을 포함하는 SalesAddTaxRcitSearchVO
     * @return 조회 목록
     */
    public SalesAddTaxRcitVO selectAddTaxReceiptImageSearch(SalesAddTaxRcitSearchVO searchVO);

    /**
     * 부가세영수증업로드 > 부가세영수증 정보등록
     * @param salesAddTaxRcitVO
     * @return
     */
    public int insertSalesAddTaxReceiptSaveIs(SalesAddTaxRcitVO salesAddTaxRcitVO);

    /**
     * 부가세영수증업로드 > 부가세영수증 스캔파일을 등록한다.
     * @param salesAddTaxRcitVO
     * @return
     */
    public int updateSalesAddTaxReceiptImgIs(SalesAddTaxRcitVO salesAddTaxRcitVO);

}
