//
// 이 파일은 JAXB(JavaTM Architecture for XML Binding) 참조 구현 2.2.11 버전을 통해 생성되었습니다. 
// <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a>를 참조하십시오. 
// 이 파일을 수정하면 소스 스키마를 재컴파일할 때 수정 사항이 손실됩니다. 
// 생성 날짜: 2016.06.22 시간 10:13:27 AM KST 
//


package chn.bhmc.dms.core.support.eai.schema;

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
 *         &lt;element name="Header" type="{http://unixtext1/CommDMS.WS.provider:FromCommDMS}Header"/&gt;
 *         &lt;element name="Body" type="{http://unixtext1/CommDMS.WS.provider:FromCommDMS}Body" minOccurs="0"/&gt;
 *         &lt;element name="Attachments" type="{http://unixtext1/CommDMS.WS.provider:FromCommDMS}Attachments" minOccurs="0"/&gt;
 *         &lt;element name="Footer" type="{http://unixtext1/CommDMS.WS.provider:FromCommDMS}Footer" minOccurs="0"/&gt;
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
    "attachments",
    "footer"
})
@XmlRootElement(name = "CommDMSDoc")
public class CommDMSDoc {

    @XmlElement(name = "Header", required = true, nillable = true)
    protected Header header;
    @XmlElementRef(name = "Body", type = JAXBElement.class, required = false)
    protected JAXBElement<Body> body;
    @XmlElementRef(name = "Attachments", type = JAXBElement.class, required = false)
    protected JAXBElement<Attachments> attachments;
    @XmlElementRef(name = "Footer", type = JAXBElement.class, required = false)
    protected JAXBElement<Footer> footer;

    /**
     * header 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link Header }
     *     
     */
    public Header getHeader() {
        return header;
    }

    /**
     * header 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link Header }
     *     
     */
    public void setHeader(Header value) {
        this.header = value;
    }

    /**
     * body 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link Body }{@code >}
     *     
     */
    public JAXBElement<Body> getBody() {
        return body;
    }

    /**
     * body 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link Body }{@code >}
     *     
     */
    public void setBody(JAXBElement<Body> value) {
        this.body = value;
    }

    /**
     * attachments 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link Attachments }{@code >}
     *     
     */
    public JAXBElement<Attachments> getAttachments() {
        return attachments;
    }

    /**
     * attachments 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link Attachments }{@code >}
     *     
     */
    public void setAttachments(JAXBElement<Attachments> value) {
        this.attachments = value;
    }

    /**
     * footer 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link Footer }{@code >}
     *     
     */
    public JAXBElement<Footer> getFooter() {
        return footer;
    }

    /**
     * footer 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link Footer }{@code >}
     *     
     */
    public void setFooter(JAXBElement<Footer> value) {
        this.footer = value;
    }

}
