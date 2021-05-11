package chn.bhmc.dms.sal.acc.service;

import java.util.List;

import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesVO;


/**
 *  용품판매관리 서비스
 *
 * @author Kang Seok Han
 * @since 2017. 2. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                                  수정내용
 *  ----------------    ------------    ---------------------------
 *  2017.02.08          Kang Seok Han   최초 생성
 * </pre>
 */
public interface AccessoryItemSalesService {

    /**
     * 용품판매 정보를 조회한다.
     * @param dlrCd 딜러코드
     * @param goodsContractNo 용품계약번호
     * @return
     * @throws Exception
     */
    public AccessoryItemSalesVO selectAccessoryItemSalesByKey(String dlrCd, String goodsContractNo) throws Exception;

    /**
     * 판매출고번호에 해당하는 용품판매문서 품목 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesItemVO> selectAccessoryItemStockOutItemsByKey(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 용품할인레벨을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesVO> selectDlrGoodsDcLevel(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 용품판매문서 정보를 저장한다.
     * @param accessoryItemSalesSaveVO
     * @throws Exception
     */
    public void multiAccessoryItemSales(AccessoryItemSalesSaveVO accessoryItemSalesSaveVO) throws Exception;

    /**
     * 용품판매문서  정보를 출고 확정한다.
     * @param accessoryItemSalesVO - 수정할 정보가 담긴 AccessoryItemSalesVO
     * @return 확정된 목록수
     */
    public AccessoryItemSalesVO applySalesCnfm(AccessoryItemSalesVO accessoryItemSalesVO, List<AccessoryItemSalesItemVO> list) throws Exception;


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
    public int updateAccessoryItemSalesContractStatCd(String dlrCd, String goodsContractNo, String statCd, String updtUsrId, String updtDtStr) throws Exception;

    public int updateAccessoryItemSalesContractStatCd(AccessoryItemSalesVO accessoryItemSalesVO , String statCd) throws Exception;


    /**
     * 용품판매문서를 취소한다.
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public String applyCancel(AccessoryItemSalesSearchVO saveVO) throws Exception;

    /**
     * 소매계약건의 용품내역을 삭제한다.
     *
     * @param contractNo
     * @return
     * @throws Exception
     */
    public int deleteContractSaleAccessoryItemSales(String contractNo) throws Exception;
    
    /**
     * 소매계약건의 용품ITEM내역을 삭제한다.
     *
     * @param contractNo
     * @return
     * @throws Exception
     */
    public int deleteContractAccessoryItemSalesItem(AccessoryItemSalesVO deleteVO) throws Exception;

    /**
     * 용품판매문서 차량정보를 변경한다.
     * @param contractNo
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesVehicleInfoChange(AccessoryItemSalesVO saveVO) throws Exception;


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
     * 조회조건에 해당하는 용품판매문서 품목의 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesItemsByConditionCnt(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 품목의 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesItemVO> selectAccessoryItemSalesItemsByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 포인트 교환 ( CRM 멤버십에서 호출
     * @param AccessoryItemSalesSaveVO accessoryItemSalesSaveVO
     * @return
     */
    public void updateMembershipPointGoodsExchange(AccessoryItemSalesSaveVO accessoryItemSalesSaveVO) throws Exception;


}
