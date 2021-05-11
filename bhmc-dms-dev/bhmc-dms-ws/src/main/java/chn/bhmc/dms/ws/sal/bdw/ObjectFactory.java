//
// 이 파일은 JAXB(JavaTM Architecture for XML Binding) 참조 구현 2.2.11 버전을 통해 생성되었습니다. 
// <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a>를 참조하십시오. 
// 이 파일을 수정하면 소스 스키마를 재컴파일할 때 수정 사항이 손실됩니다. 
// 생성 날짜: 2017.08.16 시간 03:40:10 PM CST 
//


package chn.bhmc.dms.ws.sal.bdw;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the chn.bhmc.dms.ws.sal.bdw package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _SalBasicDataWsDocBody_QNAME = new QName("http://www.bhmc.com.cn/schema/dcs-webservice", "body");
    private final static QName _SalBasicDataWsDocFooter_QNAME = new QName("http://www.bhmc.com.cn/schema/dcs-webservice", "footer");
    private final static QName _SalBasicDataWsHeaderParams_QNAME = new QName("http://www.bhmc.com.cn/schema/dcs-webservice", "params");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: chn.bhmc.dms.ws.sal.bdw
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link SalBasicDataWsDoc }
     * 
     */
    public SalBasicDataWsDoc createSalBasicDataWsDoc() {
        return new SalBasicDataWsDoc();
    }

    /**
     * Create an instance of {@link SalBasicDataWsHeader }
     * 
     */
    public SalBasicDataWsHeader createSalBasicDataWsHeader() {
        return new SalBasicDataWsHeader();
    }

    /**
     * Create an instance of {@link SalBasicDataWsFooter }
     * 
     */
    public SalBasicDataWsFooter createSalBasicDataWsFooter() {
        return new SalBasicDataWsFooter();
    }

    /**
     * Create an instance of {@link SalBasicDataWsParams }
     * 
     */
    public SalBasicDataWsParams createSalBasicDataWsParams() {
        return new SalBasicDataWsParams();
    }

    /**
     * Create an instance of {@link SalBasicDataWsParam }
     * 
     */
    public SalBasicDataWsParam createSalBasicDataWsParam() {
        return new SalBasicDataWsParam();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://www.bhmc.com.cn/schema/dcs-webservice", name = "body", scope = SalBasicDataWsDoc.class)
    public JAXBElement<String> createSalBasicDataWsDocBody(String value) {
        return new JAXBElement<String>(_SalBasicDataWsDocBody_QNAME, String.class, SalBasicDataWsDoc.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SalBasicDataWsFooter }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://www.bhmc.com.cn/schema/dcs-webservice", name = "footer", scope = SalBasicDataWsDoc.class)
    public JAXBElement<SalBasicDataWsFooter> createSalBasicDataWsDocFooter(SalBasicDataWsFooter value) {
        return new JAXBElement<SalBasicDataWsFooter>(_SalBasicDataWsDocFooter_QNAME, SalBasicDataWsFooter.class, SalBasicDataWsDoc.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SalBasicDataWsParams }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://www.bhmc.com.cn/schema/dcs-webservice", name = "params", scope = SalBasicDataWsHeader.class)
    public JAXBElement<SalBasicDataWsParams> createSalBasicDataWsHeaderParams(SalBasicDataWsParams value) {
        return new JAXBElement<SalBasicDataWsParams>(_SalBasicDataWsHeaderParams_QNAME, SalBasicDataWsParams.class, SalBasicDataWsHeader.class, value);
    }

}
