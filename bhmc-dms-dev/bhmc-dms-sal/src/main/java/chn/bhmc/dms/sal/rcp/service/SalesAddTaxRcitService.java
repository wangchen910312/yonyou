package chn.bhmc.dms.sal.rcp.service;

import java.util.List;
import java.util.Map;

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
     * <p>Title:绑定车架号-查询增值税发票数量 </p >
     * @author TangWei 2021年4月15日 下午1:37:29
     * @param SalesAddTaxRcitSearchVO searchVO
     * @return
     */
    public int selectAddTaxReceiptListCnt(SalesAddTaxRcitSearchVO searchVO) throws Exception;
    
    /**
     * <p>Title:绑定车架号-查询增值税发票数据 </p >
     * @author TangWei 2021年4月15日 下午1:39:29
     * @param SalesAddTaxRcitSearchVO searchVO
     * @return
     */
    public List<SalesAddTaxRcitVO> selectAddTaxReceiptListData(SalesAddTaxRcitSearchVO searchVO) throws Exception;
    
    /**
     * <p>Title:绑定车架号-提报 </p >
     * @author TangWei 2021年4月19日 上午10:44:43
     * @param Map<String, Object> map
     * @return
     */
    public void multiAddTaxReceiptAndCarBinDingInfo(Map<String, Object> dataMap) throws Exception;
    
    /**
     * <p>Title:更改赠票的是否显示状态 </p >
     * @author TangWei 2021年4月20日 下午20:21:03
     * @param Map<String,Map<String,Object>> map
     * @return
     */
    public void updateAddTaxReceiptShowYn(Map<String, Object> dataMap) throws Exception;
    
    /**
     * <p>Title:绑定车架号-解绑 </p >
     * @author TangWei 2021年4月20日 下午2:38:09
     * @param Map<String, Object> map
     * @return
     */
    public void unbundlingAddTaxReceiptAndCar(Map<String, Object> map) throws Exception;

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
