package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyDlrSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 11.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DplyDlrSaveVO extends BaseSaveVO<DplyDlrVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7042380177648047854L;


    private String specCd;

    private String deployVerNo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployEndDt;


    /**
     * @param specCd the specCd to set
     */
    public void setSpecCd(String specCd) {
        this.specCd = specCd;
    }


    /**
     * @return the specCd
     */
    public String getSpecCd() {
        return specCd;
    }


    /**
     * @param deployVerNo the deployVerNo to set
     */
    public void setDeployVerNo(String deployVerNo) {
        this.deployVerNo = deployVerNo;
    }


    /**
     * @return the deployVerNo
     */
    public String getDeployVerNo() {
        return deployVerNo;
    }


    /**
     * @param deployStartDt the deployStartDt to set
     */
    public void setDeployStartDt(Date deployStartDt) {
        this.deployStartDt = deployStartDt;
    }


    /**
     * @return the deployStartDt
     */
    public Date getDeployStartDt() {
        return deployStartDt;
    }


    /**
     * @param deployEndDt the deployEndDt to set
     */
    public void setDeployEndDt(Date deployEndDt) {
        this.deployEndDt = deployEndDt;
    }


    /**
     * @return the deployEndDt
     */
    public Date getDeployEndDt() {
        return deployEndDt;
    }

}
