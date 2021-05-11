package chn.bhmc.dms.core.support.camel;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

import org.apache.commons.lang.RandomStringUtils;

import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Header.java
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
public class Header {

    @XmlElement(name="IF_ID")
    private String ifId;

    @XmlElement(name="COMPANY")
    private String company;

    @XmlElement(name="SENDER")
    private String sender;

    @XmlElement(name="RECEIVER")
    private String receiver;

    @XmlElement(name="ROOTCONTEXT_ID")
    private String rootContextId;

    @XmlElement(name="CONTEXT_ID")
    private String contextId;

    @XmlElement(name="MAINPROCESS_ID")
    private String mainProcessId;

    @XmlElement(name="SUBPROCESS_ID")
    private String subProcessId;

    @XmlElement(name="ADDRESS")
    private String address;

    @XmlElement(name="TOTCOUNT")
    private Integer totCount;

    @XmlElement(name="TRANCOUNT")
    private Integer tranCount;

    @XmlElement(name="FLAG")
    private String flag;

    /**
     * @return the ifId
     */
    public String getIfId() {
        return ifId;
    }

    /**
     * @param ifId the ifId to set
     */
    public void setIfId(String ifId) {
        this.ifId = ifId;

        String timeStr = DateUtil.getDate("yyyyMMddHHmmss");
        String randomStr = RandomStringUtils.randomAlphanumeric(5).toUpperCase();

        this.rootContextId = String.format("%s-%s-%s", ifId,timeStr,randomStr);
    }

    /**
     * @return the company
     */
    public String getCompany() {
        return company;
    }

    /**
     * @param company the company to set
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * @return the sender
     */
    public String getSender() {
        return sender;
    }

    /**
     * @param sender the sender to set
     */
    public void setSender(String sender) {
        this.sender = sender;
    }

    /**
     * @return the receiver
     */
    public String getReceiver() {
        return receiver;
    }

    /**
     * @param receiver the receiver to set
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    /**
     * @return the rootContextId
     */
    public String getRootContextId() {
        return rootContextId;
    }

    /**
     * @param rootContextId the rootContextId to set
     */
    public void setRootContextId(String rootContextId) {
        this.rootContextId = rootContextId;
    }

    /**
     * @return the contextId
     */
    public String getContextId() {
        return contextId;
    }

    /**
     * @param contextId the contextId to set
     */
    public void setContextId(String contextId) {
        this.contextId = contextId;
    }

    /**
     * @return the mainProcessId
     */
    public String getMainProcessId() {
        return mainProcessId;
    }

    /**
     * @param mainProcessId the mainProcessId to set
     */
    public void setMainProcessId(String mainProcessId) {
        this.mainProcessId = mainProcessId;
    }

    /**
     * @return the subProcessId
     */
    public String getSubProcessId() {
        return subProcessId;
    }

    /**
     * @param subProcessId the subProcessId to set
     */
    public void setSubProcessId(String subProcessId) {
        this.subProcessId = subProcessId;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the totCount
     */
    public Integer getTotCount() {
        return totCount;
    }

    /**
     * @param totCount the totCount to set
     */
    public void setTotCount(Integer totCount) {
        this.totCount = totCount;
    }

    /**
     * @return the tranCount
     */
    public Integer getTranCount() {
        return tranCount;
    }

    /**
     * @param tranCount the tranCount to set
     */
    public void setTranCount(Integer tranCount) {
        this.tranCount = tranCount;
    }

    /**
     * @return the flag
     */
    public String getFlag() {
        return flag;
    }

    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }

}
