package chn.bhmc.dms.ws;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceRequest;
import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceResponse;
import chn.bhmc.dms.ws.cmm.sms.service.SmsSendMessageService;
import chn.bhmc.dms.ws.sal.bdw.ObjectFactory;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsDoc;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsFooter;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsHeader;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsParam;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsParams;
import chn.bhmc.dms.ws.sal.bdw.service.SalBasicDataService;





/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleWebServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 1. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 23.     Kang Seok Han     최초 생성
 * </pre>
 */

@WebService(
    endpointInterface = "chn.bhmc.dms.ws.DcsWebService"
    ,serviceName="DcsWebService"
    ,portName="DcsWebServicePort")
public class DcsWebServiceImpl implements DcsWebService, ApplicationContextAware {

    private Logger log = LoggerFactory.getLogger(DcsWebServiceImpl.class);

    private ApplicationContext applicationContext;

    @Resource(name = "smsSendMessageService")
    private SmsSendMessageService smsSendMessageService;

    @Override
    public SmsSendWebServiceResponse smsSendRequest(SmsSendWebServiceRequest smsSendWebServiceRequest) {
    	//TODO[최경용] 프로퍼티 설정 확인 필요
        Properties props = System.getProperties();
        props.setProperty("org.apache.cxf.stax.allowInsecureParser", "1");
        props.setProperty("UseSunHttpHandler", "true");

        //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
        SmsSendWebServiceResponse smsSendWebServiceResponse = new SmsSendWebServiceResponse();
        try{
            List<HashMap<String, String>> rtnList = smsSendMessageService.getSMSMessageValidate(smsSendWebServiceRequest);

            if(rtnList != null && rtnList.size() > 0){
                smsSendWebServiceResponse = smsSendMessageService.requestSMSMessageValidate(rtnList);
            }
        }catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        return smsSendWebServiceResponse;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SalBasicDataWsDoc salBasicDataRequest(SalBasicDataWsDoc salBasicDataWsDoc) {
        SalBasicDataService salBasicDataService = null;
        ObjectFactory objectFactory = new ObjectFactory();

        SalBasicDataWsHeader salBasicDataWsHeader = salBasicDataWsDoc.getHeader();
        SalBasicDataWsFooter salBasicDataWsFooter = new SalBasicDataWsFooter();
        SalBasicDataWsParams salBasicDataWsParams = null;

        if(salBasicDataWsHeader.getParams() == null){
            salBasicDataWsHeader.setParams(objectFactory.createSalBasicDataWsHeaderParams(new SalBasicDataWsParams()));
        }
        salBasicDataWsParams = salBasicDataWsHeader.getParams().getValue();

        salBasicDataWsDoc.setBody(objectFactory.createSalBasicDataWsDocBody("[]"));
        salBasicDataWsDoc.setFooter(objectFactory.createSalBasicDataWsDocFooter(salBasicDataWsFooter));

        //판매 기초데이터 서비스 인터페이스를 구현한 서비스를 조회한다.
        //chn.bhmc.dms.ws.sal.bdw.service.SalBasicDataService
        Map<String, SalBasicDataService> beansMap = applicationContext.getBeansOfType(SalBasicDataService.class);
        log.debug("beansMap="+beansMap);

        //판매 기초데이터 서비스 인터페이스를 구현한 서비스가 없다면 요청결과에 에러정보를 포함하여 리턴한다.
        if(beansMap.size() == 0){
            salBasicDataWsFooter.setResult(SalBasicDataService.NOT_SUPPORTED);
            salBasicDataWsFooter.setMessage("NOT_SUPPORTED");
            return salBasicDataWsDoc;
        }

        for(SalBasicDataService service : beansMap.values()){
            if(service.isSupport(salBasicDataWsHeader.getId())){
                salBasicDataService = service;
                break;
            }
        }

        //id에 해당하는 구현 서비스가 없다면 요청결과에 에러정보를 포함하여 리턴한다.
        if(salBasicDataService == null){
            salBasicDataWsFooter.setResult(SalBasicDataService.NOT_SUPPORTED);
            salBasicDataWsFooter.setMessage("NOT_SUPPORTED");
            return salBasicDataWsDoc;
        }

        List<SalBasicDataWsParam> paramList = salBasicDataWsParams.getParam();
        Map<String, Object> params = new HashMap<String, Object>();
        for(SalBasicDataWsParam param : paramList){
            params.put(param.getName(), param.getValue());
        }

        try{
            List<?> list = salBasicDataService.selectList(params);
            if(list.size() != 0){
                salBasicDataWsDoc.getBody().setValue(JSONArray.toJSONString(list));
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        salBasicDataWsFooter.setResult(SalBasicDataService.SUCCESS);
        salBasicDataWsFooter.setMessage("SUCCESS");

        return salBasicDataWsDoc;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
