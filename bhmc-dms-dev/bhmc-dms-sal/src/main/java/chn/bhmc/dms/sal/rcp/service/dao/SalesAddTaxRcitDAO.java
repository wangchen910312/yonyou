package chn.bhmc.dms.sal.rcp.service.dao;

import java.util.List;
import java.util.Map;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddReceiptAndCarBinDingVO;
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
     * <p>Title:绑定车架号-查询增值税发票数量 </p >
     * @author TangWei 2021年4月15日 下午2:47:07
     * @param SalesAddTaxRcitSearchVO searchVO
     * @return
     */
    public int selectAddTaxReceiptListCnt(SalesAddTaxRcitSearchVO searchVO);
    
    /**
     * <p>Title:绑定车架号-查询增值税发票数据 </p >
     * @author TangWei 2021年4月15日 下午2:47:07
     * @param SalesAddTaxRcitSearchVO searchVO
     * @return
     */
    public List<SalesAddTaxRcitVO> selectAddTaxReceiptListData(SalesAddTaxRcitSearchVO searchVO);
    
    /**
     * <p>Title:更改赠票的绑定车辆标识 </p >
     * @author TangWei 2021年4月19日 上午10:53:29
     * @param Map<String, Object> map
     * @return
     */
    public int updateAddTaxReceiptBinDingInfo(Map<String, Object> map);
    
    /**
     * <p>Title:查询SA_0508T,发票下对应的车辆 </p >
     * @author TangWei 2021年4月20日 下午2:44:25
     * @param Map<String, Object> map
     * @return
     */
    public List<SalesAddReceiptAndCarBinDingVO> selectAddReceiptAndCarList(Map<String, Object> map);
    
    /**
     * <p>Title:插入数据到SA_0508T表 </p >
     * @author TangWei 2021年4月20日 上午9:16:18
     * @param SalesAddReceiptAndCarBinDingVO salesAddReceiptAndCarBinDingVO
     * @return
     */
    public int insertSalesAddReceiptAndCarBinDing(SalesAddReceiptAndCarBinDingVO salesAddReceiptAndCarBinDingVO);
    
    /**
     * <p>Title:根据carId和receiptId删除SA_0508T表数据 </p >
     * @author TangWei 2021年4月20日 下午4:06:34
     * @param SalesAddReceiptAndCarBinDingVO salesAddReceiptAndCarBinDingVO
     * @return
     */
    public void deleteDataByReceiptIdAndCarId(SalesAddReceiptAndCarBinDingVO salesAddReceiptAndCarBinDingVO);
    
    /**
     * <p>Title:更改赠票的是否显示状态 </p >
     * @author TangWei 2021年4月20日 下午20:25:03
     * @param Map<String,Map<String,Object>> map
     * @return
     */
    public void updateAddTaxReceiptShowYn(Map<String, Object> map);

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
