package chn.bhmc.dms.sal.acc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemSupportVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchSupportVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSupportVO;

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

@Mapper("accessoryItemSalesSupportDAO")
public interface AccessoryItemSalesSupportDAO {

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
     * 조회조건에 해당하는 용품판매문서 품목 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesItemsSupportByConditionCnt(AccessoryItemSalesSearchSupportVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 품목 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesItemSupportVO> selectAccessoryItemSalesItemsSupportByCondition(AccessoryItemSalesSearchSupportVO searchVO) throws Exception;
}