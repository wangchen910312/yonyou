package chn.bhmc.dms.core.support.camel;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RequestData.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     Kang Seok Han     최초 생성
 * </pre>
 */
@XmlRootElement(name="data")
@XmlAccessorType(XmlAccessType.FIELD)
public class Message {

    @XmlElement(name="Header")
    private Header header = new Header();

    @XmlElement(name="Body")
    private Body body = new Body();

    @XmlElement(name="Footer")
    private Footer footer = new Footer();

    /**
     * @return the header
     */
    public Header getHeader() {
        return header;
    }
    /**
     * @param header the header to set
     */
    public void setHeader(Header header) {
        this.header = header;
    }
    /**
     * @return the body
     */
    public Body getBody() {
        return body;
    }
    /**
     * @param body the body to set
     */
    public void setBody(Body body) {
        this.body = body;
    }
    /**
     * @return the footer
     */
    public Footer getFooter() {
        return footer;
    }
    /**
     * @param footer the footer to set
     */
    public void setFooter(Footer footer) {
        this.footer = footer;
    }

}
