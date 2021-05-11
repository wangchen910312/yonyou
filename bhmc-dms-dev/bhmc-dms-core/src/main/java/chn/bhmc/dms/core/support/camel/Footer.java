package chn.bhmc.dms.core.support.camel;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Footer.java
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

@XmlAccessorType(XmlAccessType.FIELD)
public class Footer {

    @XmlElement(name="IFRESULT")
    private String ifResult;

    @XmlElement(name="IFFAILMSG")
    private String ifFailMsg;
    /**
     * @return the ifResult
     */
    public String getIfResult() {
        return ifResult;
    }
    /**
     * @param ifResult the ifResult to set
     */
    public void setIfResult(String ifResult) {
        this.ifResult = ifResult;
    }
    /**
     * @return the ifFailMsg
     */
    public String getIfFailMsg() {
        return ifFailMsg;
    }
    /**
     * @param ifFailMsg the ifFailMsg to set
     */
    public void setIfFailMsg(String ifFailMsg) {
        this.ifFailMsg = ifFailMsg;
    }
}
