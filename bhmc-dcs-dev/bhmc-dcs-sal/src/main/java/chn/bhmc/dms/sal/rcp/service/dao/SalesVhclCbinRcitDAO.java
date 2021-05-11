package chn.bhmc.dms.sal.rcp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.core.datatype.BlobVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitVO;
/**
 * <pre>
 * 영수증관리 > 기동차통일영수증관리
 * </pre>
 *
 * @ClassName   : SalesVhclCbinRcitDAO.java
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
@Mapper("salesVhclCbinRcitDAO")
public interface SalesVhclCbinRcitDAO {

    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회 목록
     */
    public List<SalesVhclCbinRcitVO> selectSalesVehicleCombineReceiptSearchData(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public int selectSalesVehicleCombineReceiptSearchCnt(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<SalesVhclCbinRcitVO> selectCityInfoList(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 영수증 데이터 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public int selectSaleVehicleCombineReceiptCnt(SalesVhclCbinRcitVO searchVO);

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitVO
     * @return
     */
    public int insertSalesVehicleCombineReceiptSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO);

    /**
     * 영수증관리 > 기동차통일영수증관리 이력 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitVO
     * @return
     */
    public int insertSalesVehicleCombineReceiptHistSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO);

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 SalesVhclCbinRcitVO
     * @return 등록된 목록수
     */
    public int insertSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 SalesVhclCbinRcitVO
     * @return 수정된 목록수
     */
    public int updateSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

    /**
     * Key에 해당하는 영수증관리 > 기동차통일영수증관리 데이터를 조회한다.
     * @param
     * @return
     */
    public SalesVhclCbinRcitVO selectSalesVehicleCombineReceiptGridSaveByKey(@Param("vinNo") String vinNo);

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회 목록
     */
    public List<SalesVhclCbinRcitVO> selectVinNoSearchPopupSearchData(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public int selectVinNoSearchPopupSearchCnt(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 cnt 조회
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    public int selectSecondDealerSearchCnt(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 조회
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회 목록
     */
    public List<SalesVhclCbinRcitVO> selectSecondDealerSearchData(SalesVhclCbinRcitSearchVO searchVO);


    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회 목록
     */
    public SalesVhclCbinRcitVO selectReceiptDetailPopupSearchData(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return 조회 목록
     */
    public SalesVhclCbinRcitVO selectReceiptImageSearchData(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 이미지를 조회한다.
     * @param carId
     * @return
     */
    public BlobVO selectSalesVehicleCombineReceiptImg(String carId);

    /**
     * 기동차통일영수증관리 > 영수증관리 > 기동차통일영수증 스캔파일을 등록한다.
     * @param salesVhclCbinRcitVO
     * @return
     */
    public int updateSalesVehicleCombineReceiptImg(SalesVhclCbinRcitVO salesVhclCbinRcitVO);

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 차량마스터의 보증시작일자 수정구분을 조회한다.
     * @param salesVhclCbinRcitVO
     * @return 수정구분값
     */
    public String selectVehicleMasterUpdtCd(SalesVhclCbinRcitVO salesVhclCbinRcitVO);

    /**
     * 기동차통일영수증관리 > 영수증관리 > 차량마스터의 보증시작일자를 수정한다.
     * @param salesVhclCbinRcitVO
     * @return
     */
    public int updateSalesVehicleMasterSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO);

    public String selectDealerSungStr(SalesVhclCbinRcitSearchVO searchVO);

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 Is테이블에 등록한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitVO
     * @return
     */
    public int insertSalesVehicleCombineReceiptSaveIs(SalesVhclCbinRcitVO salesVhclCbinRcitVO);

    /**
     * 기동차통일영수증관리 > 영수증관리 > 기동차통일영수증 스캔파일을 Is테이블에 등록한다.
     * @param salesVhclCbinRcitVO
     * @return
     */
    public int updateSalesVehicleCombineReceiptImgIs(SalesVhclCbinRcitVO salesVhclCbinRcitVO);

}
