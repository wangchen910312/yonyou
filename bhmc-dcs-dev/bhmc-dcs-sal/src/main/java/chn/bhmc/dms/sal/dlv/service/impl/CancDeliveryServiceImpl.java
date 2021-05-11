package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.bind.JAXBElement;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.dlv.service.CancDeliveryService;
import chn.bhmc.dms.sal.dlv.service.dao.CancDeliveryDAO;
import chn.bhmc.dms.sal.dlv.service.dao.DeliveryMngDAO;
import chn.bhmc.dms.sal.dlv.vo.CancDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.CancDeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.DeliveryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CancDeliveryServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.      Kim yewon              최초 생성
 * </pre>
 */

@Service("cancDeliveryService")
public class CancDeliveryServiceImpl extends HService implements CancDeliveryService ,JxlsSupport{

    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="cancDeliveryDAO")
    CancDeliveryDAO cancDeliveryDAO;

    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="deliveryMngDAO")
    DeliveryMngDAO deliveryMngDAO;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     * 조회 조건에 해당하는 이월판매취소결과를 조회한다.
     */
    @Override
    public List<CancDeliveryVO> selectCancDeliveryByCondition(CancDeliverySearchVO searchVO) throws Exception {
        return cancDeliveryDAO.selectCancDeliveryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 이월판매취소결과 총 갯수를 조회한다.
     */
    @Override
    public int selectCancDeliveryByConditionCnt(CancDeliverySearchVO searchVO) throws Exception {
        return cancDeliveryDAO.selectCancDeliveryByConditionCnt(searchVO);
    }

    /**
     * LPAD 구현
     */
    private String lpad(String val, String pad, int length){
        if(val != null && val.length() > 0){
            while(val.length() < length){
                val = pad + val;
            }
        }
        return val;
    }

    @Override
    public void updateApproveCancDelivery(CancDeliveryVO cancDeliveryVO) throws Exception {

            DeliveryVO deliveryVO = new DeliveryVO();

            deliveryVO.setDlrCd(cancDeliveryVO.getDlrCd());
            deliveryVO.setVinNo(cancDeliveryVO.getVinNo());
            deliveryVO.setContractNo(cancDeliveryVO.getContractNo());

            cancDeliveryVO.setUpdtUsrId(LoginUtil.getUserId());

            //deliveryVO.setDlrCd(LoginUtil.getDlrCd());

            if(cancDeliveryVO.getApproveYn().equals("Y")){

                Map<String, Object> message = new HashMap<String, Object>();

                message.put("KMTRDY", DateUtil.getDate("yyyy-MM-dd"));
                message.put("KMTRTM", DateUtil.getDate("HH:mm:ss"));

                /*인터페이스seq채번*/
                int kmseq = deliveryMngDAO.selectSeqCondition(deliveryVO);
                message.put("KMSEQ", lpad(kmseq+"", "0", 6));

                message.put("KMOPT", "J2");
                message.put("KMSTDY", DateUtil.getDate("yyyy-MM-dd"));  //요청년월일(필수)
                message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));    //요청시간(필수)
                message.put("KMCNCD", cancDeliveryVO.getCancReasonCd());//취소사유코드(필수)
                message.put("KMVIN",  cancDeliveryVO.getVinNo());       //VIN_NO(필수)
                message.put("KMDELR", cancDeliveryVO.getDlrCd());       //세션 딜러코드(필수)
                message.put("KMCTCD", "");                              //2급딜러코드

                /*판매사원id가져오기*/
                String salesEmpNo = deliveryMngDAO.selectSalesEmpNoCondition(deliveryVO);
                message.put("KMRGNO", salesEmpNo);                      //판매사원ID(필수)

                /*승상구분가져오기*/
                String CarDstinCd = deliveryMngDAO.selectCarDstinCdCondition(deliveryVO);
                message.put("KMOTIT", CarDstinCd);                      //승상구분(필수)

                message.put("KMCONT", cancDeliveryVO.getContractNo());  //계약번호(필수)
                message.put("KMSTDY2","");                              //보증수리시작일
                message.put("KMPROP", cancDeliveryVO.getRetlTpCd());    //소매유형코드(필수)
                message.put("KMUSER", LoginUtil.getUserId());           //사용자ID(필수)

                CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
                .ifId("SAL025")
                .company("H")
                .sender("SAL")
                .receiver(LoginUtil.getDlrCd())
                .flag("Y")
                .addMessage(message)
                .build()
                .buildCommDMSDoc();

                CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);

                String ifresultCd = commDMSDoc.getFooter().getValue().getIFRESULT().getValue();

                if(!ifresultCd.equals("Z")){
                    JAXBElement<String>  ifResult = commDMSDoc.getFooter().getValue().getIFRESULT();
                    JAXBElement<String>  ifResultMsg =  commDMSDoc.getFooter().getValue().getIFFAILMSG();

                    log.error("commDMSDoc ifResult Value ="+ commDMSDoc.getFooter().getValue().getIFRESULT().getValue());
                    log.error("commDMSDoc ifResultMsg Value="+ commDMSDoc.getFooter().getValue().getIFFAILMSG());
                    log.error("commDMSDoc IFRESULT ="+ commDMSDoc.getFooter().getValue().getIFRESULT());

                    throw processException("global.err.dcsIfErrMsg", new String[] { ifResult.getValue(), ifResultMsg.getValue() });
                }
            }

            cancDeliveryDAO.updateApproveCancDelivery(cancDeliveryVO);
            cancDeliveryDAO.procApproveCancDelivery(cancDeliveryVO);

    }
   
    //Q21012900002 出库取消审批增加下载功能 下载Excle JiaMing 2021-2-5
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		CancDeliverySearchVO searchVO = new CancDeliverySearchVO();
		//申请日期	
        searchVO.setsReqStartDt(DateUtil.convertToDate((String)params.get("sReqStartDt")));
        searchVO.setsReqEndDt(DateUtil.convertToDate((String)params.get("sReqEndDt")));
        //审批日期	sApproveStartDt
        searchVO.setsApproveStartDt(DateUtil.convertToDate((String)params.get("sApproveStartDt")));
        searchVO.setsApproveEndDt(DateUtil.convertToDate((String)params.get("sApproveEndDt")));

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<CancDeliveryVO>  list = new ArrayList<CancDeliveryVO>();
        int cnt = selectCancDeliveryByConditionCnt(searchVO);
        if(cnt != 0) {
        	list = selectCancDeliveryByCondition(searchVO);
        	for(CancDeliveryVO cancDeliveryVO:list){
        		//是否存在机动车统一发票
        		if(null != cancDeliveryVO.getCarTaxReceiptIssDt()) {
        			   cancDeliveryVO.setCarTaxReceiptYn("有");
        		} else {
        			   cancDeliveryVO.setCarTaxReceiptYn("无");
        		}
        	}
        }
        context.putVar("items", list);
        
	}
}