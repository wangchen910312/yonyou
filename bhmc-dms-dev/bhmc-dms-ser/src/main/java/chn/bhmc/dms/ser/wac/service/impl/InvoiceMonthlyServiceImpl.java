package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.InvoiceMonthlyService;
import chn.bhmc.dms.ser.wac.service.dao.InvoiceMonthlyDAO;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlyDeductVO;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlyDetailVO;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlySearchVO;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlyVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvoiceMonthlyServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("invoiceMonthlyService")
public class InvoiceMonthlyServiceImpl extends HService implements InvoiceMonthlyService, JxlsSupport {


    @Resource(name="invoiceMonthlyDAO")
    InvoiceMonthlyDAO invoiceMonthlyDAO;

    /**
    *
    * 인보이스 목록수 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 목록수
    * @throws Exception
    */
   public int selectInvoiceMonthlyByConditionCnt(InvoiceMonthlySearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(dlrCd);
       }
       return invoiceMonthlyDAO.selectInvoiceMonthlyByConditionCnt(searchVO);
   };

   /**
    *
    * 인보이스 목록 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 목록
    * @throws Exception
    */
   public List<InvoiceMonthlyVO> selectInvoiceMonthlyByCondition(InvoiceMonthlySearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(dlrCd);
       }

       return invoiceMonthlyDAO.selectInvoiceMonthlyByCondition(searchVO);
   }

   /**
    *
    * 인보이스 상세 목록수 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 상세 목록수
    * @throws Exception
    */
   public int selectInvoiceMonthlyDetailByConditionCnt(InvoiceMonthlySearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(dlrCd);
       }
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       return invoiceMonthlyDAO.selectInvoiceMonthlyDetailByConditionCnt(searchVO);
   }

   /**
    *
    * 인보이스 상세 목록 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 상세 목록
    * @throws Exception
    */
   public List<InvoiceMonthlyDetailVO> selectInvoiceMonthlyDetailByCondition(InvoiceMonthlySearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(dlrCd);
       }
       
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       return invoiceMonthlyDAO.selectInvoiceMonthlyDetailByCondition(searchVO);
   }

   /**
    *
    * 인보이스 상세 목록 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 상세 목록
    * @throws Exception
    */
   public List<InvoiceMonthlyDeductVO> selectInvoiceMonthlyDeductByCondition(InvoiceMonthlySearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(dlrCd);
       }

       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       
       return invoiceMonthlyDAO.selectInvoiceMonthlyDeductByCondition(searchVO);
   }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        InvoiceMonthlySearchVO searchVO = new InvoiceMonthlySearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsInvcNo((String)params.get("sInvcNo"));

        String sGubun = (String)params.get("sGubun");
        if(sGubun.equals("detail")){
            List<InvoiceMonthlyDetailVO> list = selectInvoiceMonthlyDetailByCondition(searchVO);
            context.putVar("items", list);

        } else {
            List<InvoiceMonthlyDeductVO> list = selectInvoiceMonthlyDeductByCondition(searchVO);
            context.putVar("items", list);
        }
    }

}
