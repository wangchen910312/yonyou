package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DMSConnectErrorsVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 17.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DMSConnectErrorsVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4423292200334094540L;

    private String dlrCd              ;

    private String dlrNm              ;

    private String dmsIpNm            ;

    private String dmsOperEmailNm     ;

    private String dmsOperTelNo       ;

    private String dmsUseYn           ;

    private String deployRsltCd       ;

    private int    deployProcCnt      ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   lastDeployProcDt   ;

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dmsIpNm the dmsIpNm to set
     */
    public void setDmsIpNm(String dmsIpNm) {
        this.dmsIpNm = dmsIpNm;
    }

    /**
     * @return the dmsIpNm
     */
    public String getDmsIpNm() {
        return dmsIpNm;
    }

    /**
     * @param dmsOperEmailNm the dmsOperEmailNm to set
     */
    public void setDmsOperEmailNm(String dmsOperEmailNm) {
        this.dmsOperEmailNm = dmsOperEmailNm;
    }

    /**
     * @return the dmsOperEmailNm
     */
    public String getDmsOperEmailNm() {
        return dmsOperEmailNm;
    }

    /**
     * @param dmsOperTelNo the dmsOperTelNo to set
     */
    public void setDmsOperTelNo(String dmsOperTelNo) {
        this.dmsOperTelNo = dmsOperTelNo;
    }

    /**
     * @return the dmsOperTelNo
     */
    public String getDmsOperTelNo() {
        return dmsOperTelNo;
    }

    /**
     * @param dmsUseYn the dmsUseYn to set
     */
    public void setDmsUseYn(String dmsUseYn) {
        this.dmsUseYn = dmsUseYn;
    }

    /**
     * @return the dmsUseYn
     */
    public String getDmsUseYn() {
        return dmsUseYn;
    }

    /**
     * @param deployRsltCd the deployRsltCd to set
     */
    public void setDeployRsltCd(String deployRsltCd) {
        this.deployRsltCd = deployRsltCd;
    }

    /**
     * @return the deployRsltCd
     */
    public String getDeployRsltCd() {
        return deployRsltCd;
    }

    /**
     * @param deployProcCnt the deployProcCnt to set
     */
    public void setDeployProcCnt(int deployProcCnt) {
        this.deployProcCnt = deployProcCnt;
    }

    /**
     * @return the deployProcCnt
     */
    public int getDeployProcCnt() {
        return deployProcCnt;
    }

    /**
     * @param lastDeployProcDt the lastDeployProcDt to set
     */
    public void setLastDeployProcDt(Date lastDeployProcDt) {
        this.lastDeployProcDt = lastDeployProcDt;
    }

    /**
     * @return the lastDeployProcDt
     */
    public Date getLastDeployProcDt() {
        return lastDeployProcDt;
    }


}
