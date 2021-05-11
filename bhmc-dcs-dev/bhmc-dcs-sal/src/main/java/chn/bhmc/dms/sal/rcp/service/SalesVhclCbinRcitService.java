package chn.bhmc.dms.sal.rcp.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.BlobVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitVO;

/**
 * <pre>
 * 영수증관리 > 기동차통일영수증관리
 * </pre>
 *
 * @ClassName   : SalesVhclCbinRcitService.java
 * @Description : 영수증관리 > 기동차통일영수증관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.     chibeom.song     최초 생성
 * </pre>
 */

public interface SalesVhclCbinRcitService {

    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회 목록
     */
    public List<SalesVhclCbinRcitVO> selectSalesVehicleCombineReceiptSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public int selectSalesVehicleCombineReceiptSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 성(우편번호) 목록을 조회한다.
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(String provinceCd) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitVO
     * @return
     */
    int insertSalesVehicleCombineReceiptSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 이력 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitVO
     * @return
     */
    int insertSalesVehicleCombineReceiptHistSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     * @param SalesVhclCbinRcitSaveVO
     */
    public void multiSalesVehicleCombineReceiptGridSave(BaseSaveVO<SalesVhclCbinRcitVO> salesVhclCbinRcitVO) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     * @param salesVhclCbinRcitVO - 등록할 정보가 담긴 SalesVhclCbinRcitVO
     * @return 등록된 목록수
     */
    public int insertSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 수정한다.
     * @param salesVhclCbinRcitVO - 수정할 정보가 담긴 SalesVhclCbinRcitVO
     * @return 수정된 목록수
     */
    public int updateSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 정보를 조회한다.
     * @param
     * @return
     */
    public SalesVhclCbinRcitVO selectSalesVehicleCombineReceiptGridSaveByKey(String vinNo) throws Exception;

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public int selectVinNoSearchPopupSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회 목록
     */
    public List<SalesVhclCbinRcitVO> selectVinNoSearchPopupSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 cnt 조회
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public int selectSecondDealerSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 조회
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회목록
     */
    public List<SalesVhclCbinRcitVO> selectSecondDealerSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public SalesVhclCbinRcitVO selectReceiptDetailPopupSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public SalesVhclCbinRcitVO selectReceiptImageSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 이미지를 조회한다.
     * @param carId
     * @return
     */
    public BlobVO selectSalesVehicleCombineReceiptImg(String carId) throws Exception;

    public String selectDealerSungStr(SalesVhclCbinRcitSearchVO searchVO) throws Exception;

}
