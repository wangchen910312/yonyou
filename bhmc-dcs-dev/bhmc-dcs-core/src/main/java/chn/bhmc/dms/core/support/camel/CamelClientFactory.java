package chn.bhmc.dms.core.support.camel;

import org.springframework.oxm.jaxb.Jaxb2Marshaller;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CamelClientFactory.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 10.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CamelClientFactory {

    String endpointUrl;
    Jaxb2Marshaller marshaller;
    Jaxb2Marshaller unmarshaller;
    /**
     * @param endpointUrl the endpointUrl to set
     */
    public void setEndpointUrl(String endpointUrl) {
        this.endpointUrl = endpointUrl;
    }
    /**
     * @param marshaller the marshaller to set
     */
    public void setMarshaller(Jaxb2Marshaller marshaller) {
        this.marshaller = marshaller;
    }
    /**
     * @param unmarshaller the unmarshaller to set
     */
    public void setUnmarshaller(Jaxb2Marshaller unmarshaller) {
        this.unmarshaller = unmarshaller;
    }

    public CamelClient createCamelClient(){

        CamelClient camelClient = new CamelClient();

        camelClient.setEndpointUrl(this.endpointUrl);
        camelClient.setMarshaller(this.marshaller);
        camelClient.setUnmarshaller(this.unmarshaller);

        return camelClient;
    }
}
