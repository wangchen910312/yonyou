//
// 이 파일은 JAXB(JavaTM Architecture for XML Binding) 참조 구현 2.2.11 버전을 통해 생성되었습니다. 
// <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a>를 참조하십시오. 
// 이 파일을 수정하면 소스 스키마를 재컴파일할 때 수정 사항이 손실됩니다. 
// 생성 날짜: 2016.06.22 시간 10:13:27 AM KST 
//


package chn.bhmc.dms.core.support.eai.schema;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the chn.bhmc.dms.core.support.eai.schema package. 
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

    private final static QName _CommDMSDocBody_QNAME = new QName("", "Body");
    private final static QName _CommDMSDocAttachments_QNAME = new QName("", "Attachments");
    private final static QName _CommDMSDocFooter_QNAME = new QName("", "Footer");
    private final static QName _AttachmentNAME_QNAME = new QName("", "NAME");
    private final static QName _AttachmentPATH_QNAME = new QName("", "PATH");
    private final static QName _AttachmentDATA_QNAME = new QName("", "DATA");
    private final static QName _FooterIFRESULT_QNAME = new QName("", "IFRESULT");
    private final static QName _FooterIFFAILMSG_QNAME = new QName("", "IFFAILMSG");
    private final static QName _BodyMESSAGE_QNAME = new QName("", "MESSAGE");
    private final static QName _HeaderROOTCONTEXTID_QNAME = new QName("", "ROOTCONTEXT_ID");
    private final static QName _HeaderCONTEXTID_QNAME = new QName("", "CONTEXT_ID");
    private final static QName _HeaderMAINPROCESSID_QNAME = new QName("", "MAINPROCESS_ID");
    private final static QName _HeaderSUBPROCESSID_QNAME = new QName("", "SUBPROCESS_ID");
    private final static QName _HeaderADDRESS_QNAME = new QName("", "ADDRESS");
    private final static QName _HeaderTOTCOUNT_QNAME = new QName("", "TOTCOUNT");
    private final static QName _HeaderTRANCOUNT_QNAME = new QName("", "TRANCOUNT");
    private final static QName _HeaderFLAG_QNAME = new QName("", "FLAG");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: chn.bhmc.dms.core.support.eai.schema
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link CommDMSDoc }
     * 
     */
    public CommDMSDoc createCommDMSDoc() {
        return new CommDMSDoc();
    }

    /**
     * Create an instance of {@link Header }
     * 
     */
    public Header createHeader() {
        return new Header();
    }

    /**
     * Create an instance of {@link Body }
     * 
     */
    public Body createBody() {
        return new Body();
    }

    /**
     * Create an instance of {@link Attachments }
     * 
     */
    public Attachments createAttachments() {
        return new Attachments();
    }

    /**
     * Create an instance of {@link Footer }
     * 
     */
    public Footer createFooter() {
        return new Footer();
    }

    /**
     * Create an instance of {@link Attachment }
     * 
     */
    public Attachment createAttachment() {
        return new Attachment();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Body }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Body", scope = CommDMSDoc.class)
    public JAXBElement<Body> createCommDMSDocBody(Body value) {
        return new JAXBElement<Body>(_CommDMSDocBody_QNAME, Body.class, CommDMSDoc.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Attachments }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Attachments", scope = CommDMSDoc.class)
    public JAXBElement<Attachments> createCommDMSDocAttachments(Attachments value) {
        return new JAXBElement<Attachments>(_CommDMSDocAttachments_QNAME, Attachments.class, CommDMSDoc.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Footer }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Footer", scope = CommDMSDoc.class)
    public JAXBElement<Footer> createCommDMSDocFooter(Footer value) {
        return new JAXBElement<Footer>(_CommDMSDocFooter_QNAME, Footer.class, CommDMSDoc.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "NAME", scope = Attachment.class)
    public JAXBElement<String> createAttachmentNAME(String value) {
        return new JAXBElement<String>(_AttachmentNAME_QNAME, String.class, Attachment.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "PATH", scope = Attachment.class)
    public JAXBElement<String> createAttachmentPATH(String value) {
        return new JAXBElement<String>(_AttachmentPATH_QNAME, String.class, Attachment.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "DATA", scope = Attachment.class)
    public JAXBElement<String> createAttachmentDATA(String value) {
        return new JAXBElement<String>(_AttachmentDATA_QNAME, String.class, Attachment.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "IFRESULT", scope = Footer.class)
    public JAXBElement<String> createFooterIFRESULT(String value) {
        return new JAXBElement<String>(_FooterIFRESULT_QNAME, String.class, Footer.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "IFFAILMSG", scope = Footer.class)
    public JAXBElement<String> createFooterIFFAILMSG(String value) {
        return new JAXBElement<String>(_FooterIFFAILMSG_QNAME, String.class, Footer.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "MESSAGE", scope = Body.class)
    public JAXBElement<String> createBodyMESSAGE(String value) {
        return new JAXBElement<String>(_BodyMESSAGE_QNAME, String.class, Body.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "ROOTCONTEXT_ID", scope = Header.class)
    public JAXBElement<String> createHeaderROOTCONTEXTID(String value) {
        return new JAXBElement<String>(_HeaderROOTCONTEXTID_QNAME, String.class, Header.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "CONTEXT_ID", scope = Header.class)
    public JAXBElement<String> createHeaderCONTEXTID(String value) {
        return new JAXBElement<String>(_HeaderCONTEXTID_QNAME, String.class, Header.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "MAINPROCESS_ID", scope = Header.class)
    public JAXBElement<String> createHeaderMAINPROCESSID(String value) {
        return new JAXBElement<String>(_HeaderMAINPROCESSID_QNAME, String.class, Header.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "SUBPROCESS_ID", scope = Header.class)
    public JAXBElement<String> createHeaderSUBPROCESSID(String value) {
        return new JAXBElement<String>(_HeaderSUBPROCESSID_QNAME, String.class, Header.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "ADDRESS", scope = Header.class)
    public JAXBElement<String> createHeaderADDRESS(String value) {
        return new JAXBElement<String>(_HeaderADDRESS_QNAME, String.class, Header.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "TOTCOUNT", scope = Header.class)
    public JAXBElement<String> createHeaderTOTCOUNT(String value) {
        return new JAXBElement<String>(_HeaderTOTCOUNT_QNAME, String.class, Header.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "TRANCOUNT", scope = Header.class)
    public JAXBElement<String> createHeaderTRANCOUNT(String value) {
        return new JAXBElement<String>(_HeaderTRANCOUNT_QNAME, String.class, Header.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "FLAG", scope = Header.class)
    public JAXBElement<String> createHeaderFLAG(String value) {
        return new JAXBElement<String>(_HeaderFLAG_QNAME, String.class, Header.class, value);
    }

}
