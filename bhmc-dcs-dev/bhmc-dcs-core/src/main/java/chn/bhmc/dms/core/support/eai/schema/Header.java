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
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Header complex type에 대한 Java 클래스입니다.
 * 
 * <p>다음 스키마 단편이 이 클래스에 포함되는 필요한 콘텐츠를 지정합니다.
 * 
 * <pre>
 * &lt;complexType name="Header"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="IF_ID" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *         &lt;element name="COMPANY" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *         &lt;element name="SENDER" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *         &lt;element name="RECEIVER" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *         &lt;element name="ROOTCONTEXT_ID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="CONTEXT_ID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="MAINPROCESS_ID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="SUBPROCESS_ID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="ADDRESS" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="TOTCOUNT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="TRANCOUNT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="FLAG" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Header", propOrder = {
    "ifid",
    "company",
    "sender",
    "receiver",
    "rootcontextid",
    "contextid",
    "mainprocessid",
    "subprocessid",
    "address",
    "totcount",
    "trancount",
    "flag"
})
public class Header {

    @XmlElement(name = "IF_ID", required = true, nillable = true)
    protected String ifid;
    @XmlElement(name = "COMPANY", required = true, nillable = true)
    protected String company;
    @XmlElement(name = "SENDER", required = true, nillable = true)
    protected String sender;
    @XmlElement(name = "RECEIVER", required = true, nillable = true)
    protected String receiver;
    @XmlElementRef(name = "ROOTCONTEXT_ID", type = JAXBElement.class, required = false)
    protected JAXBElement<String> rootcontextid;
    @XmlElementRef(name = "CONTEXT_ID", type = JAXBElement.class, required = false)
    protected JAXBElement<String> contextid;
    @XmlElementRef(name = "MAINPROCESS_ID", type = JAXBElement.class, required = false)
    protected JAXBElement<String> mainprocessid;
    @XmlElementRef(name = "SUBPROCESS_ID", type = JAXBElement.class, required = false)
    protected JAXBElement<String> subprocessid;
    @XmlElementRef(name = "ADDRESS", type = JAXBElement.class, required = false)
    protected JAXBElement<String> address;
    @XmlElementRef(name = "TOTCOUNT", type = JAXBElement.class, required = false)
    protected JAXBElement<String> totcount;
    @XmlElementRef(name = "TRANCOUNT", type = JAXBElement.class, required = false)
    protected JAXBElement<String> trancount;
    @XmlElementRef(name = "FLAG", type = JAXBElement.class, required = false)
    protected JAXBElement<String> flag;

    /**
     * ifid 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIFID() {
        return ifid;
    }

    /**
     * ifid 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIFID(String value) {
        this.ifid = value;
    }

    /**
     * company 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCOMPANY() {
        return company;
    }

    /**
     * company 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCOMPANY(String value) {
        this.company = value;
    }

    /**
     * sender 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSENDER() {
        return sender;
    }

    /**
     * sender 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSENDER(String value) {
        this.sender = value;
    }

    /**
     * receiver 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRECEIVER() {
        return receiver;
    }

    /**
     * receiver 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRECEIVER(String value) {
        this.receiver = value;
    }

    /**
     * rootcontextid 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getROOTCONTEXTID() {
        return rootcontextid;
    }

    /**
     * rootcontextid 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setROOTCONTEXTID(JAXBElement<String> value) {
        this.rootcontextid = value;
    }

    /**
     * contextid 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getCONTEXTID() {
        return contextid;
    }

    /**
     * contextid 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setCONTEXTID(JAXBElement<String> value) {
        this.contextid = value;
    }

    /**
     * mainprocessid 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getMAINPROCESSID() {
        return mainprocessid;
    }

    /**
     * mainprocessid 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setMAINPROCESSID(JAXBElement<String> value) {
        this.mainprocessid = value;
    }

    /**
     * subprocessid 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getSUBPROCESSID() {
        return subprocessid;
    }

    /**
     * subprocessid 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setSUBPROCESSID(JAXBElement<String> value) {
        this.subprocessid = value;
    }

    /**
     * address 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getADDRESS() {
        return address;
    }

    /**
     * address 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setADDRESS(JAXBElement<String> value) {
        this.address = value;
    }

    /**
     * totcount 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getTOTCOUNT() {
        return totcount;
    }

    /**
     * totcount 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setTOTCOUNT(JAXBElement<String> value) {
        this.totcount = value;
    }

    /**
     * trancount 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getTRANCOUNT() {
        return trancount;
    }

    /**
     * trancount 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setTRANCOUNT(JAXBElement<String> value) {
        this.trancount = value;
    }

    /**
     * flag 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getFLAG() {
        return flag;
    }

    /**
     * flag 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setFLAG(JAXBElement<String> value) {
        this.flag = value;
    }

}
