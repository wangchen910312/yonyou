//
// 이 파일은 JAXB(JavaTM Architecture for XML Binding) 참조 구현 2.2.11 버전을 통해 생성되었습니다. 
// <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a>를 참조하십시오. 
// 이 파일을 수정하면 소스 스키마를 재컴파일할 때 수정 사항이 손실됩니다. 
// 생성 날짜: 2017.08.16 시간 03:40:10 PM CST 
//


package chn.bhmc.dms.ws.sal.bdw;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type에 대한 Java 클래스입니다.
 * 
 * <p>다음 스키마 단편이 이 클래스에 포함되는 필요한 콘텐츠를 지정합니다.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="header" type="{http://www.bhmc.com.cn/schema/dcs-webservice}salBasicDataWsHeader"/&gt;
 *         &lt;element name="body" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="footer" type="{http://www.bhmc.com.cn/schema/dcs-webservice}salBasicDataWsFooter" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "header",
    "body",
    "footer"
})
@XmlRootElement(name = "salBasicDataWsDoc")
public class SalBasicDataWsDoc {

    @XmlElement(required = true)
    protected SalBasicDataWsHeader header;
    @XmlElementRef(name = "body", namespace = "http://www.bhmc.com.cn/schema/dcs-webservice", type = JAXBElement.class, required = false)
    protected JAXBElement<String> body;
    @XmlElementRef(name = "footer", namespace = "http://www.bhmc.com.cn/schema/dcs-webservice", type = JAXBElement.class, required = false)
    protected JAXBElement<SalBasicDataWsFooter> footer;

    /**
     * header 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link SalBasicDataWsHeader }
     *     
     */
    public SalBasicDataWsHeader getHeader() {
        return header;
    }

    /**
     * header 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link SalBasicDataWsHeader }
     *     
     */
    public void setHeader(SalBasicDataWsHeader value) {
        this.header = value;
    }

    /**
     * body 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getBody() {
        return body;
    }

    /**
     * body 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setBody(JAXBElement<String> value) {
        this.body = value;
    }

    /**
     * footer 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link SalBasicDataWsFooter }{@code >}
     *     
     */
    public JAXBElement<SalBasicDataWsFooter> getFooter() {
        return footer;
    }

    /**
     * footer 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link SalBasicDataWsFooter }{@code >}
     *     
     */
    public void setFooter(JAXBElement<SalBasicDataWsFooter> value) {
        this.footer = value;
    }

}
