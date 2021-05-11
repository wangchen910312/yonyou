package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import com.ibm.icu.text.SimpleDateFormat;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceEditService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimInvoiceEditDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditISVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditMap;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceEditServiceImpl.java
 * @Description : 索赔发票编辑ServiceImpl
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 12.     lixinfei     索赔发票编辑ServiceImpl
 * </pre>
 */
@Service("claimInvoiceEditService")
public class ClaimInvoiceEditServiceImpl extends HService implements ClaimInvoiceEditService, JxlsSupport{

    @Resource(name="claimInvoiceEditDAO")
    ClaimInvoiceEditDAO claimInvoiceEditDAO;


    /**
    * 索赔发票编辑 数量查询 
    * 只有状态为”未开票”的信息可以编辑发票备注和结算报表年月
    * 일자별로 클레임요청 현황 목록수를 조회한다.
    *
    * @param searchVO - ClaimReqSearchVO
    * @return long
    * @throws Exception
    */
    @Override
    public long selectClaimInvoiceEditByConditionCnt(ClaimInvoiceEditSearchVO searchVO) throws Exception {

        return claimInvoiceEditDAO.selectClaimInvoiceEditByConditionCnt(searchVO);
    }

    /**
    *
    * 索赔发票编辑 分页查询
    *
    * @param searchVO - ClaimReqSearchVO
    * @return List<ClaimInvoiceEditVO>
    * @throws Exception
    */
    @Override
    public List<ClaimInvoiceEditVO> selectClaimInvoiceEditByCondition(ClaimInvoiceEditSearchVO searchVO) throws Exception {

        return claimInvoiceEditDAO.selectClaimInvoiceEditByCondition(searchVO);
    }

    
    
    /**
     * 更新当前发票备注信息，若返回1更新成功，否则失败
     * SA_0502T     发票信息表（SETTLEMENT_NO 与 索赔结算单信息INVC_NO、经销商代码DLR_CD 关联查询）
     * - REMARK 备注
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param ClaimInvoiceEditVO
     * @return int
     */
    @Override
    public StringBuffer updateClaimInvoiceByInvcNo(ClaimInvoiceEditMap claimInvoiceEditMap)throws Exception{
        //取出updatedList
        List<ClaimInvoiceEditVO> claimInvoiceEditVOList = claimInvoiceEditMap.getUpdatedList();
        //用于记录状态不为未开票，且不允许修改的发票号
        StringBuffer recordReceiptNo = new StringBuffer();
        
        ClaimInvoiceEditSearchVO searchVO = new ClaimInvoiceEditSearchVO();
        //for循环批量更新
        for(ClaimInvoiceEditVO claimInvoiceEditVO : claimInvoiceEditVOList){
            searchVO.setsDlrCd(claimInvoiceEditVO.getDlrCd());
            searchVO.setsInvcNo(claimInvoiceEditVO.getInvcNo());
            searchVO.setsReceiptNo(claimInvoiceEditVO.getReceiptNo());
            searchVO.setsReceiptCd(claimInvoiceEditVO.getReceiptCd());
            //更新前先查询当前发票所在索赔主单是否为“未开票”状态
            String state = claimInvoiceEditDAO.selectClaimInvoiceStateByCondition(searchVO);
            if(!state.equals("01")){
                //01为未开票状态，02已开票、03已退票
                if(state.equals("02") || state.equals("03")){
                    //当前状态不为未开票，则记录发票号
                    recordReceiptNo.append(claimInvoiceEditVO.getReceiptNo() + "\n");
                }
            }else{
                //执行更新发票方法
                int update = claimInvoiceEditDAO.updateClaimInvoiceByInvcNo(claimInvoiceEditVO);
                
                //如果update返回值小于等于0，返回-1
                if(update <= 0){
                    //删除所有字符，添加返回值-1
                    recordReceiptNo.delete(0, recordReceiptNo.length());
                    recordReceiptNo.append("-1");
                    break;
                }else{
                  //更新发票成功后，查询接口表中是否存在当前发票
                    int ifExist = claimInvoiceEditDAO.selectClaimInvoiceEditIfExistByReceiptId(claimInvoiceEditVO);
                    //创建新对象，存入数据
                    ClaimInvoiceEditISVO claimInvoiceEditISVO = new ClaimInvoiceEditISVO();
                    claimInvoiceEditISVO.setDlrCd(claimInvoiceEditVO.getDlrCd());
                    claimInvoiceEditISVO.setReceiptId(claimInvoiceEditVO.getReceiptId());
                    //生成当前 年月日时分秒 的字符串
                    Date nowDate = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                    String yyyyMMddHHmmss = sdf.format(nowDate);   
                    //声明变量接收 更新 /插入 操作的返回值
                    long isUpdateOrInsert = 0;
                    if(ifExist > 0){
                        //如果返回值大于0，说明存在，执行更新操作
                        claimInvoiceEditISVO.setUpdatedate(yyyyMMddHHmmss);
                        isUpdateOrInsert = claimInvoiceEditDAO.updateClaimInvoiceByReceiptId(claimInvoiceEditISVO);
                    }else{
                        //否则不存在，执行插入新数据操作
                        claimInvoiceEditISVO.setCreatedate(yyyyMMddHHmmss);
                        isUpdateOrInsert = claimInvoiceEditDAO.insertClaimInvoiceToInterfaceTable(claimInvoiceEditISVO);
                    }
                    if(isUpdateOrInsert <= 0){
                        //如果等于0说明更新/插入失败
                        //删除所有字符，添加返回值-1
                        recordReceiptNo.delete(0, recordReceiptNo.length());
                        recordReceiptNo.append("-1");
                    }
                }
            }
        }
        if(recordReceiptNo.length() == 0){
            //如果长度为0，说明全部更新操作都已完成，返回1
            recordReceiptNo.append("1");
            return recordReceiptNo;
        }else{
            //否则返回被赋值过后的字符串
            return recordReceiptNo;
        }
    }
    
    /**
     * 下载Excel
     * @param Context context, HMap params
     * @return void
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ClaimInvoiceEditSearchVO searchVO = new ClaimInvoiceEditSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<ClaimInvoiceEditVO> list = selectClaimInvoiceEditByCondition(searchVO);

        context.putVar("items", list);
    }
    
}