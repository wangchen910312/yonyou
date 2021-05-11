package chn.bhmc.dms.sal.acc.service;

import java.util.List;

import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemSupportVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchSupportVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSupportVO;


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
public interface AccessoryItemSalesSupportService {

    /**
     * 조회조건에 해당하는 용품판매문서 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesSupportByConditionCnt(AccessoryItemSalesSearchSupportVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesSupportVO> selectAccessoryItemSalesSupportByCondition(AccessoryItemSalesSearchSupportVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 품목의 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesItemsSupportByConditionCnt(AccessoryItemSalesSearchSupportVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 품목의 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesItemSupportVO> selectAccessoryItemSalesItemsSupportByCondition(AccessoryItemSalesSearchSupportVO searchVO) throws Exception;

}