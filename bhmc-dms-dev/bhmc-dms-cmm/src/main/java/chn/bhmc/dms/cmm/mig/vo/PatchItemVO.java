package chn.bhmc.dms.cmm.mig.vo;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchItemVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 14.     Kang Seok Han     최초 생성
 * </pre>
 */

@XmlAccessorType(XmlAccessType.FIELD)
public class PatchItemVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3770444519988940482L;

    /**
     * 패치ID
     */
    @XmlElement(name="Id")
    private String id;

    /**
     * 패치내용
     */
    @XmlElement(name="Desc")
    private String desc;

    /**
     * 패치유형
     * 'sql' : sql 적용
     * 'source' : 소스변경 적용
     */
    @XmlElement(name="Type")
    private String type;

    /**
     * 소스파일 경로
     */
    @XmlElement(name="SrcFilePath")
    private String srcFilePath;

    /**
     * 패치적용 경로
     */
    @XmlElement(name="DestFilePath")
    private String destFilePath;

    /**
     * 패치적용 일자
     */
    @XmlElement(name="UpdateDate")
    private String updateDate;

    /**
     * 다운로드적용 상태
     * '1':대기
     * '2':다운로드중
     * '3':다운로드실패
     * '4':다운로드성공
     */
    private String downloadStatus = "1";

    /**
     * 패치적용 상태
     * '1':대기
     * '2':패치중
     * '3':패치실패
     * '4':패치성공
     */
    private String patchStatus = "1";

    /**
     * 실행결과 메세지
     */
    private String resultMessage = "";


    /**
     * @return the id
     */
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }
    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }
    /**
     * @return the type
     */
    public String getType() {
        return type;
    }
    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
    /**
     * @return the srcFilePath
     */
    public String getSrcFilePath() {
        return srcFilePath;
    }
    /**
     * @param srcFilePath the srcFilePath to set
     */
    public void setSrcFilePath(String srcFilePath) {
        this.srcFilePath = srcFilePath;
    }
    /**
     * @return the destFilePath
     */
    public String getDestFilePath() {
        return destFilePath;
    }
    /**
     * @param destFilePath the destFilePath to set
     */
    public void setDestFilePath(String destFilePath) {
        this.destFilePath = destFilePath;
    }
    /**
     * @return the updateDate
     */
    public String getUpdateDate() {
        return updateDate;
    }
    /**
     * @param updateDate the updateDate to set
     */
    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    /**
     * @return the downloadStatus
     */
    public String getDownloadStatus() {
        return downloadStatus;
    }
    /**
     * @param downloadStatus the downloadStatus to set
     */
    public void setDownloadStatus(String downloadStatus) {
        this.downloadStatus = downloadStatus;
    }
    /**
     * @return the patchStatus
     */
    public String getPatchStatus() {
        return patchStatus;
    }
    /**
     * @param patchStatus the patchStatus to set
     */
    public void setPatchStatus(String patchStatus) {
        this.patchStatus = patchStatus;
    }
    /**
     * @return the resultMessage
     */
    public String getResultMessage() {
        return resultMessage;
    }
    /**
     * @param resultMessage the resultMessage to set
     */
    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }

}
