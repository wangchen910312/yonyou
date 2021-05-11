package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceRecService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimInvoiceRecDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecExcelDownloadVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementISVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRecServiceImpl.java
 * @Description : 索赔发票收款 ServiceImpl
 * @author lixinfei
 * @since 2021. 04. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 21.     lixinfei      索赔发票收款ServiceImpl
 * </pre>
 */

@Service("claimInvoiceRecService")
public class ClaimInvoiceRecServiceImpl extends HService implements ClaimInvoiceRecService, JxlsSupport{

    @Resource(name="claimInvoiceRecDAO")
    ClaimInvoiceRecDAO claimInvoiceRecDAO;


    /**
    *
    * 索赔发票收款 主单 数量查找
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return long
    * @throws Exception
    */
    public long selectClaimInvoiceRecSettlementByConditionCnt(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception{
        return claimInvoiceRecDAO.selectClaimInvoiceRecSettlementByConditionCnt(searchVO);
    }

    /**
    *
    * 索赔发票收款 主单 分页查询
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return List<ClaimInvoiceRecSettlementVO>
    * @throws Exception
    */
    public List<ClaimInvoiceRecSettlementVO> selectClaimInvoiceRecSettlementByCondition(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception{
        return claimInvoiceRecDAO.selectClaimInvoiceRecSettlementByCondition(searchVO);
    }
  
    
    /**
    *
    * 索赔发票收款 发票 数量查找
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return long
    * @throws Exception
    */
    public long selectClaimInvoiceRecByConditionCnt(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception{
        return claimInvoiceRecDAO.selectClaimInvoiceRecByConditionCnt(searchVO);
    }

    /**
    *
    * 索赔发票收款 发票 分页查询
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return List<ClaimInvoiceRecVO>
    * @throws Exception
    */
    public List<ClaimInvoiceRecVO> selectClaimInvoiceRecByCondition(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception{
        return claimInvoiceRecDAO.selectClaimInvoiceRecByCondition(searchVO);
    }
    
    
    /**
     * 更新当前索赔单收款信息，若返回1更新成功，否则失败
     * SE_0960T PAYM_TP汇款状态  01(未汇款),02(已汇款),03(已收款)    
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param ClaimInvoiceRecSettlementVO
     * @return String
     */
    public String updateClaimInvoiceRecPaymTp(@RequestBody ClaimInvoiceRecSettlementVO saveVO)throws Exception{
        ClaimInvoiceRecSettlementSearchVO searchVO = new ClaimInvoiceRecSettlementSearchVO();
        //存入筛选条件
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsInvcNo(saveVO.getInvcNo());
        
        //查询当前索赔主单对象，是否为未收款状态   01(未汇款),02(已汇款),03(已收款)
        ClaimInvoiceRecSettlementISVO searchedVO = claimInvoiceRecDAO.selectClaimInvoiceRecSettlementPaymTpByCondition(searchVO);
        if(searchedVO.getPaymTp().equals("02")){
            //如果是已汇款状态，则进行修改汇款状态为 已收款
            saveVO.setPaymTp("03");
            searchedVO.setPaymTp("03");
            //对SE_0960T主表汇款状态进行更新
            int isUpdated = claimInvoiceRecDAO.updateClaimInvoiceRecPaymTp(saveVO);
            if(isUpdated > 0){
                //更新成功返回success，并向接口表插入数据
                int isInserted = claimInvoiceRecDAO.insertClaimInvoiceRecSettlementToInterfaceTable(searchedVO);
                if(isInserted > 0){
                    //对接口表插入数据成功返回success
                    return "success";
                }else{
                    //否则返回fail
                    return "fail";
                }
            }else{
                //否则返回fail
                return "fail";
            }
        }else if(searchedVO.getPaymTp().equals("03")){
            //如果是已收款状态则返回processed 表示已处理
            return "processed";
        }else{
            //既不是已汇款也不是已收款则直接返回失败
            return "fail";
        }
        
    }
    
    /**
    * 索赔发票收款 下载Excel List查询
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return List<ClaimInvoiceRecExcelDownloadVO>
    * @throws Exception
    */
    public List<ClaimInvoiceRecExcelDownloadVO> selectClaimInvoiceRecByConditionForExcelDownload(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception{
        return claimInvoiceRecDAO.selectClaimInvoiceRecByConditionForExcelDownload(searchVO);
    }

    /**
     * 索赔发票汇款 下载Excel
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param Context context, HMap params
     * @return void
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ClaimInvoiceRecSettlementSearchVO searchVO = new ClaimInvoiceRecSettlementSearchVO();
        
        if(!StringUtils.isBlank(params.get("sInvcStartDt").toString())){
            String sInvcStartDt = params.get("sInvcStartDt").toString();
            Date dInvcStartDt = DateUtil.convertToDate(sInvcStartDt);
            searchVO.setsInvcStartDt(dInvcStartDt);
        }
        if(!StringUtils.isBlank(params.get("sInvcEndDt").toString())){
            String sInvcEndDt = params.get("sInvcEndDt").toString();
            Date dInvcEndDt = DateUtil.convertToDate(sInvcEndDt);
            searchVO.setsInvcEndDt(dInvcEndDt);
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ClaimInvoiceRecExcelDownloadVO> list = selectClaimInvoiceRecByConditionForExcelDownload(searchVO);
        context.putVar("items", list);

    }
}