package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderISVO;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderSearchVO;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderVO;
import chn.bhmc.dms.ser.svi.vo.WarrantyOrderMappingVO;
import chn.bhmc.dms.ser.svi.vo.WarrantyOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReviewWarrantyOrderService.java
 * @Description : 保修工单审核
 * @author lixinfei
 * @since 2021. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 1.    lixinfei     		保修工单审核
 * </pre>
 */

public interface ReviewWarrantyOrderService {

    /**
     * 获取待审核保修工单list
     * <p>Title: </p >
     * @author lixinfei 2021年4月2日 下午5:18:25
     * @param 
     * @return
     */
    public List<WarrantyOrderMappingVO> selectReviewWarrantyOrderByCondition(ReviewWarrantyOrderSearchVO searchVO)throws Exception;
    
    /**
     * 获取待审核保修工单count
     * <p>Title: </p >
     * @author lixinfei 2021年4月2日 下午5:18:25
     * @param 
     * @return
     */
    public long selectReviewWarrantyOrderByConditionCnt(ReviewWarrantyOrderSearchVO searchVO)throws Exception;
    
    /**
     * 查询当前申请编号的记录是否被审核
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:10:37
     * @param 
     * @return
     */
    public int selectReviewWarrantyOrderByReqNo(WarrantyOrderVO warrantyOrderVO)throws Exception;

    /**
     * 提交审核结果
     * <p>Title: </p >
     * @author lixinfei 2021年4月14日 下午3:55:36
     * @param warrantyOrderVO
     * @return String
     */
    public String updateReviewWarrantyOrderByCondition(@RequestBody WarrantyOrderVO warrantyOrderVO) throws Exception;
    
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
