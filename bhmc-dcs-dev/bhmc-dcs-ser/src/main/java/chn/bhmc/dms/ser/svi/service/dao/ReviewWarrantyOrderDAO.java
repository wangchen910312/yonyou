package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderISVO;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderSearchVO;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderVO;
import chn.bhmc.dms.ser.svi.vo.WarrantyOrderMappingVO;
import chn.bhmc.dms.ser.svi.vo.WarrantyOrderVO;

/**
 * <pre>
 * 保修工单审核 mapper class
 * </pre>
 *
 * @ClassName   : ReviewWarrantyOrderDAO.java
 * @Description : 保修工单审核 DAO
 * @author lixinfei
 * @since 2021. 04. 06.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 06.   lixinfei      	保修工单审核 DAO
 * </pre>
 */

@Mapper("reviewWarrantyOrderDAO")
public interface ReviewWarrantyOrderDAO {

    /**
     * 查询待审核保修工单list
     * @param searchVO -  WarrantyOrderSearchVO
     * @return 조회 목록
     */
    public List<WarrantyOrderMappingVO> selectReviewWarrantyOrderByCondition(ReviewWarrantyOrderSearchVO searchVO);

    /**
     * 查询待审核保修工单数量
     * @param searchVO -  WarrantyOrderSearchVO
     * @return
     */
    public long selectReviewWarrantyOrderByConditionCnt(ReviewWarrantyOrderSearchVO searchVO);
    
    /**
     * 根据申请编号查询当前记录是否被审核
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午4:56:17
     * @param 
     * @return
     */
    public int selectReviewWarrantyOrderByReqNo(WarrantyOrderVO warrantyOrderVO);
    
    /**
     * 更新当前申请信息
     * SE_1162T 
        - REQ_STAT_CD 单据状态
        - APPROVE_DESC 审核原因（包括驳回原因/拒绝原因）
        - APPROVE_USR_ID 审核人ID
        - APPROVE_USR_NM 审核人姓名
        - RO_UPDT_DT 工单修改时间
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param 
     * @return
     */
    public int updateReviewWarrantyOrderByReqNo(WarrantyOrderVO warrantyOrderVO);
    
    /**
     * SE_1163T插入一条记录，若返回了插入ID，插入成功，否则失败
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:43:23
     * @param 
     * @return
     */
    public long insertReviewWarrantyOrder(ReviewWarrantyOrderVO reviewWarrantyOrderVO);
    
    /**
     * SE_1163IS插入一条记录，若返回了插入ID，插入成功，否则失败
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:43:23
     * @param 
     * @return
     */
    public long insertReviewWarrantyOrderToInterfaceTable(ReviewWarrantyOrderISVO reviewWarrantyOrderISVO);
    
    

}
