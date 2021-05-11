package chn.bhmc.dms.ser.svi.service.impl;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.ibm.icu.text.SimpleDateFormat;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.svi.service.ReviewWarrantyOrderService;
import chn.bhmc.dms.ser.svi.service.dao.ReviewWarrantyOrderDAO;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderISVO;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderSearchVO;
import chn.bhmc.dms.ser.svi.vo.ReviewWarrantyOrderVO;
import chn.bhmc.dms.ser.svi.vo.WarrantyOrderMappingVO;
import chn.bhmc.dms.ser.svi.vo.WarrantyOrderVO;

/**
 * <pre>
 * PDI점검항목 구현 서비스
 * </pre>
 *
 * @ClassName   : ReviewWarrantyOrderServiceImpl.java
 * @Description : 保修工单审核 ServiceImpl
 * @author lixinfei
 * @since 2021. 04. 06.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 06.   lixifnei      		保修工单审核 ServiceImpl
 * </pre>
 */

@Service("reviewWarrantyOrderService")
public class ReviewWarrantyOrderServiceImpl extends HService implements ReviewWarrantyOrderService, JxlsSupport{

    /**
    * 保修工单审核 DAO
    */
    @Resource(name="reviewWarrantyOrderDAO")
    ReviewWarrantyOrderDAO reviewWarrantyOrderDAO;
   
   /**
    * 根据条件查询保修工单
    * <p>Title: </p >
    * @author lixinfei 2021年4月2日 下午5:19:33
    * @param ReviewWarrantyOrderSearchVO
    * @return List<WarrantyOrderMappingVO>
    */
    @Override
    public List<WarrantyOrderMappingVO> selectReviewWarrantyOrderByCondition(ReviewWarrantyOrderSearchVO searchVO) throws Exception {
    	return reviewWarrantyOrderDAO.selectReviewWarrantyOrderByCondition(searchVO);
    }
   
   /**
    * 根据条件查询保修工单count
    * <p>Title: </p >
    * @author lixinfei 2021年4月2日 下午5:19:33
    * @param ReviewWarrantyOrderSearchVO
    * @return long
    */
    @Override
    public long selectReviewWarrantyOrderByConditionCnt(ReviewWarrantyOrderSearchVO searchVO) throws Exception {
    	return reviewWarrantyOrderDAO.selectReviewWarrantyOrderByConditionCnt(searchVO);
    }
    
    /**
     * 查询当前申请编号的记录是否被审核，返回1被审核，返回0未被审核
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:10:37
     * @param WarrantyOrderVO
     * @return int
     */
    @Override
    public int selectReviewWarrantyOrderByReqNo(WarrantyOrderVO warrantyOrderVO)throws Exception{
    	return reviewWarrantyOrderDAO.selectReviewWarrantyOrderByReqNo(warrantyOrderVO);
    }
    
    /**
     * 提交审核结果
     * <p>Title: </p >
     * @author lixinfei 2021年4月14日 下午3:55:36
     * @param warrantyOrderVO
     * @return String
     */
    @Override
    public String updateReviewWarrantyOrderByCondition(@RequestBody WarrantyOrderVO warrantyOrderVO) throws Exception{
    	/**
         * 根据申请编号进行保修工单审核，需查询当前记录是否为已审核状态
         */
        int isReviewed = selectReviewWarrantyOrderByReqNo(warrantyOrderVO);
        if (isReviewed == 1) {
            // 返回值1表示当前记录已被审核过，返回"exist"
            return "exist";
        } else if (isReviewed == 0) {
            /**
             * 返回值0则不为已审核状态，进行审核状态修改 
             * SE_1162T 
             * - REQ_STAT_CD 单据状态 
             * - APPROVE_DESC 审核原因（包括驳回原因/拒绝原因） 
             * - APPROVE_USR_ID 审核人ID 
             * - APPROVE_USR_NM 审核人姓名
             * - UPDT_DT 工单修改时间
             */
            //获取当前时间
            Date nowDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            String yyyyMMddHHmmss = sdf.format(nowDate);   //当前：年月日时分秒的字符串
            // 设置审核人ID、名称、时间
            warrantyOrderVO.setApproveUsrId(LoginUtil.getUserId());
            warrantyOrderVO.setApproveUsrNm(LoginUtil.getUserNm());
            warrantyOrderVO.setApproveDt(nowDate);  //这里设置的
            // 执行更新SE_1162T表方法
            updateReviewWarrantyOrderByReqNo(warrantyOrderVO);

            
            /**
             * SE_1163T 新增一条记录
             */
            ReviewWarrantyOrderVO reviewWarrantyOrder = new ReviewWarrantyOrderVO();
            reviewWarrantyOrder.setReqNo(warrantyOrderVO.getReqNo());
            reviewWarrantyOrder.setDlrCd(warrantyOrderVO.getDlrCd());
            reviewWarrantyOrder.setApproveStatCd(warrantyOrderVO.getApproveStatCd());
            reviewWarrantyOrder.setApproveDesc(warrantyOrderVO.getApproveDesc());
            reviewWarrantyOrder.setRegUsrId(warrantyOrderVO.getApproveUsrId());
            reviewWarrantyOrder.setRegDt(nowDate);
            //插入SE_1163T记录
            long afterInsert_SE_1163T = insertReviewWarrantyOrder(reviewWarrantyOrder);
            
            /**
             * SE_1163IS 新增一条记录
             */
            ReviewWarrantyOrderISVO reviewWarrantyOrderIs = new ReviewWarrantyOrderISVO();
            reviewWarrantyOrderIs.setReqNo(warrantyOrderVO.getReqNo());
            reviewWarrantyOrderIs.setDlrCd(warrantyOrderVO.getDlrCd());
            reviewWarrantyOrderIs.setApproveStatCd(warrantyOrderVO.getApproveStatCd());
            reviewWarrantyOrderIs.setApproveDesc(warrantyOrderVO.getApproveDesc());
            reviewWarrantyOrderIs.setRegUsrId(warrantyOrderVO.getApproveUsrId());
            reviewWarrantyOrderIs.setRegUsrNm(warrantyOrderVO.getApproveUsrNm());
            reviewWarrantyOrderIs.setRegDt(nowDate);
            reviewWarrantyOrderIs.setCreatedate(yyyyMMddHHmmss);        //添加时间戳字符串
            //插入SE_1163IS记录
            long afterInsert_SE_1163IS = insertReviewWarrantyOrderToInterfaceTable(reviewWarrantyOrderIs);
            
            //字符串初始值“fail”，若插入数据成功则将字符串赋值为“success”
            String isSuccess = "fail";
            if(afterInsert_SE_1163T > 0 && afterInsert_SE_1163IS > 0){
                isSuccess = "success";
            }
            return isSuccess;
            
        }
        //没有进if-else直接返回fail
        return "fail";
    }
    
    
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
     * @param WarrantyOrderVO
     * @return int
     */
    @Override
    public int updateReviewWarrantyOrderByReqNo(WarrantyOrderVO warrantyOrderVO){
        return reviewWarrantyOrderDAO.updateReviewWarrantyOrderByReqNo(warrantyOrderVO);
    }
    
    /**
     * SE_1163T插入一条记录，若返回了插入ID，插入成功，否则失败
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:43:23
     * @param ReviewWarrantyOrderVO
     * @return long
     */
    @Override
    public long insertReviewWarrantyOrder(ReviewWarrantyOrderVO reviewWarrantyOrderVO){
        return reviewWarrantyOrderDAO.insertReviewWarrantyOrder(reviewWarrantyOrderVO);
    }
    
    /**
     * SE_1163IS插入一条记录，若返回了插入ID，插入成功，否则失败
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:43:23
     * @param ReviewWarrantyOrderISVO
     * @return long
     */
    @Override
    public long insertReviewWarrantyOrderToInterfaceTable(ReviewWarrantyOrderISVO reviewWarrantyOrderISVO){
        return reviewWarrantyOrderDAO.insertReviewWarrantyOrderToInterfaceTable(reviewWarrantyOrderISVO);
    }
    
    /**
     * 保修工单审核导出excel
     *  <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:43:23
     * @param Context context, HMap params
     * @return void
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        
        ReviewWarrantyOrderSearchVO searchVO = new ReviewWarrantyOrderSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<WarrantyOrderMappingVO> list = selectReviewWarrantyOrderByCondition(searchVO);

        context.putVar("items", list);
    }

}
