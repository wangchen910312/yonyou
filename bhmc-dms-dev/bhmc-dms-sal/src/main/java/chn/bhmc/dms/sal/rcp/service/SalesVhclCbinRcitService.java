package chn.bhmc.dms.sal.rcp.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.BlobVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitAppScanSaveVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitAppScanSearchVO;
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
     * <p>Title:发票扫码查询页面 </p >
     * @author TangWei 2021年3月30日 下午3:51:48
     * @param SalesVhclCbinRcitAppScanSearchVO searchVO
     * @return
     */
    public int selectSalesVehicleCombineReceiptCnt(SalesVhclCbinRcitAppScanSearchVO searchVO) throws Exception;

    /**
     * 성(우편번호) 목록을 조회한다.
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(SalesVhclCbinRcitSearchVO searchVO) throws Exception;
    
    /**
     * <p>Title:发票扫码-查询页面数据 </p >
     * @author TangWei 2021年3月30日 下午4:07:51
     * @param 
     * @return
     */
    public List<SalesVhclCbinRcitAppScanSaveVO> selectSalesVehicleCombineReceiptData(SalesVhclCbinRcitAppScanSearchVO searchVO) throws Exception;

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
     * 
     * @param salesVhclCbinRcitVO
     * @return
     * @throws Exception
     */
    int updateVehicleUnifiedInvoiceinfo(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

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
     * <p>Title:发票扫码录入发票保存时，验证是否已经存在该发票号和发票代码的发票 </p >
     * @author TangWei 2021年4月11日 下午10:17:53
     * @param (Map<String,Object> map
     * @return
     */
    public SalesVhclCbinRcitAppScanSaveVO selectCntByReceiptNoAndReceiptCd(Map<String,Object> map) throws Exception;
        
    /**
     * <p>Title:发票扫码添加弹出框-保存 </p >
     * @author TangWei 2021年4月9日 上午9:34:31
     * @param Map<String,Object> map
     * @return 
     */
    public int addReceiptScan(Map<String,Object> map) throws Exception;
    
    /**
     * <p>Title:发票扫码-删除 </p >
     * @author TangWei 2021年4月11日 上午10:23:52
     * @param String appReceiptId
     * @return
     */
    public int deleteReceiptByAppReceiptId(String appReceiptId) throws Exception;
    
    /**
     * <p>Title:发票扫码-调验证接口 </p >
     * @author TangWei 2021年4月12日 下午3:27:55
     * @param Map<String, Object>
     * @return
     */
    public Map<String, Object> selectAppReceiptInfoByInterface(Map<String,Object> map) throws Exception;

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     * @param salesVhclCbinRcitVO - 등록할 정보가 담긴 SalesVhclCbinRcitVO
     * @return 등록된 목록수
     */
    public int insertSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;
    
    /**
     * <p>Title:发票扫码-提交 </p >
     * @author TangWei 2021年3月31日 下午1:31:34
     * @param SalesVhclCbinRcitVO salesVhclCbinRcitVO
     * @return
     */
    public int addsalesVehicleCombineReceiptGridScanSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception;

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
    
    /**
     * NO 31 DMS端车辆主信息的发票展示逻辑确定如下：1、车辆对应的发票，只有初审通过状态，没有复核通过的情况，那就以最新审核通过展示；2、有复核通过的发票，那就展示最新复核通过的。
     * 贾明 2019-11-28 
     * @param searchVO -  SalesVhclCbinRcitSearchVO
     * @return
     */
    public SalesVhclCbinRcitVO selectVehicleInfoMotorVehInvo(SalesVhclCbinRcitSearchVO searchVO) throws Exception;
    
    /**
     * crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话
     * @param searchVO
     * @return
     * @throws Exception
     */
    public SalesVhclCbinRcitVO selectContractNoSearchTelData(SalesVhclCbinRcitSearchVO searchVO) throws Exception;
}
