package chn.bhmc.dms.sal.acc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.ism.vo.PartsSaleOrdItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemSalesDAO
 * @Description : 용품판매관리 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("accessoryItemSalesDAO")
public interface AccessoryItemSalesDAO {

    /**
     * 용품판매 정보를 조회한다.
     * @param dlrCd 딜러코드
     * @param goodsContractNo 용품계약번호
     * @return
     * @throws Exception
     */
    public AccessoryItemSalesVO selectAccessoryItemSalesByKey(@Param("dlrCd") String dlrCd, @Param("goodsContractNo") String goodsContractNo) throws Exception;

    /**
     * 용품판매 정보를 저장한다.
     * @param acessoryItemSalesVO
     * @return
     * @throws Exception
     */
    public int insertAccessoryItemSales(AccessoryItemSalesVO acessoryItemSalesVO) throws Exception;

    /**
     * 용품판매 정보를 변경한다.
     * @param acessoryItemSalesVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSales(AccessoryItemSalesVO acessoryItemSalesVO) throws Exception;

    /**
     * 용품판매 정보를 확정한다.
     * @param acessoryItemSalesVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesCnfm(AccessoryItemSalesVO acessoryItemSalesVO) throws Exception;

    /**
     * 용품판매 품목정보를 확정한다.
     * @param acessoryItemSalesVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSaleItemCnfm(AccessoryItemSalesItemVO acessoryItemSalesItemVO) throws Exception;

    /**
     * 용품판매문서 품목 정보를 저장한다.
     * @param acessoryItemSalesItemVO
     * @return
     * @throws Exception
     */
    public int insertAccessoryItemSalesItem(AccessoryItemSalesItemVO acessoryItemSalesItemVO) throws Exception;

    /**
     * 용품판매문서 품목 정보를 변경한다.
     * @param acessoryItemSalesItemVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesItem(AccessoryItemSalesItemVO acessoryItemSalesItemVO) throws Exception;


    /**
     * 용품판매문서 품목 정보를 확정한다.
     * @param acessoryItemSalesItemVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesItemCnfm(AccessoryItemSalesItemVO acessoryItemSalesItemVO) throws Exception;

    /**
     * 용품판매관리item 삭제
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteAccessoryItemSalesItem(AccessoryItemSalesItemVO itemVO) throws Exception;


    /**
     * 용품판매문서 번호에 해당하는 품목을 모두 삭제한다.
     * @param goodsContractNo
     * @return
     *
    public int deleteAccessoryItemSalesItemByGoodsContractNo(@Param("dlrCd") String dlrCd, @Param("goodsContractNo") String goodsContractNo);
    */


    /**
     * 용품 출고확정 시 수불 정보를 반영한다.
     * @param itemVO
     * @return
     * @throws Exception
     */
    public int updateAccessorySaleOrdItemMvtInfo(PartsSaleOrdItemVO itemVO) throws Exception;

    /**
     * 용품 출고확정 시 수불 정보를 반영한다.
     * @param itemVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesCnfmItemMvtInfo(AccessoryItemSalesItemVO itemVO) throws Exception;

    /**
     * 용품판매문서 상태를 변경한다.
     *
     * @param dlrCd 딜러코드
     * @param goodsContractNo 용품판매문서번호
     * @param statCd 상태코드 출고대기(10),부분출고(20),전체출고(30),완성(40),취소(50),반품(60)
     * @param updtUsrId 변경자ID
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesContractStatCd(@Param("dlrCd") String dlrCd, @Param("goodsContractNo") String goodsContractNo, @Param("contractStatCd") String contractStatCd, @Param("updtUsrId") String updtUsrId) throws Exception;

    /**
     * 소매계약건의 용품 Item내역을 삭제한다.
     * @param deleteVO
     * @return
     * @throws Exception
     */
    public int deleteContractAccessoryItemSalesItem(AccessoryItemSalesVO deleteVO) throws Exception;

    /**
     * 소매계약건의 용품 Header내역을 삭제한다.
     * @param deleteVO
     * @return
     * @throws Exception
     */
    public int deleteContractAccessoryItemSalesHeader(AccessoryItemSalesVO deleteVO) throws Exception;


    /**
     * 할인레벨을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesVO> selectDlrGoodsDcLevel(AccessoryItemSalesSearchVO searchVO) throws Exception;


    /**
     * 판매출고번호에 해당하는 용품판매문서 품목 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesItemVO> selectAccessoryItemStockOutItemsByKey(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 용품판매 상태변경을 위한 품목 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesItemsForStatChangeCnt(AccessoryItemSalesVO searchVO) throws Exception;

    /**
     * 용품판매 출고전 상태 체크한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesItemsForStatCnt(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 완성차 출고 - 용품판매문서 차량정보를 변경한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesVehicleInfoChange(AccessoryItemSalesVO saveVO) throws Exception;

    /**
     * 용품판매Key에 해당하는 수정일자  정보를 조회한다.
     * @param accessoryItemSalesVO - 조회할 정보가 담긴 AccessoryItemSalesVO
     * @return 조회한 용품판매  정의 정보
     */
    public String selectAccessorySaleUpdtDtByKey(AccessoryItemSalesVO accessoryItemSalesVO);


    /**
     * 조회조건에 해당하는 용품판매문서 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesByConditionCnt(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesVO> selectAccessoryItemSalesByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     *
     * 계약 화면 용품 판매 관리 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesItemVO> selectAccessoryItemSalesContractByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 품목 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesItemsByConditionCnt(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 품목 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesItemVO> selectAccessoryItemSalesItemsByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception;

}