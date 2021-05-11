package chn.bhmc.dms.sal.ctl.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OneShotCtrlMngSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 11. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 10.     Lee Seungmin     최초 생성
 * </pre>
 */

public class OneShotCtrlMngSaveVO extends BaseSaveVO<OneShotCtrlMngVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7311662078297247247L;

    private String courseTp;            //좌우그리드구분
    private String ctrlYn;              //통제여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDtTm;             //통제시작일시
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDtTm;               //통제종료일시
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   ctrlStartYyMmDt;     //통제시작일시
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   ctrlEndYyMmDt;       //통제종료일시

    /**
     * @return the courseTp
     */
    public String getCourseTp() {
        return courseTp;
    }

    /**
     * @param courseTp the courseTp to set
     */
    public void setCourseTp(String courseTp) {
        this.courseTp = courseTp;
    }

    /**
     * @return the ctrlYn
     */
    public String getCtrlYn() {
        return ctrlYn;
    }

    /**
     * @param ctrlYn the ctrlYn to set
     */
    public void setCtrlYn(String ctrlYn) {
        this.ctrlYn = ctrlYn;
    }

    /**
     * @return the startDtTm
     */
    public Date getStartDtTm() {
        return startDtTm;
    }

    /**
     * @param startDtTm the startDtTm to set
     */
    public void setStartDtTm(Date startDtTm) {
        this.startDtTm = startDtTm;
    }

    /**
     * @return the endDtTm
     */
    public Date getEndDtTm() {
        return endDtTm;
    }

    /**
     * @param endDtTm the endDtTm to set
     */
    public void setEndDtTm(Date endDtTm) {
        this.endDtTm = endDtTm;
    }

    /**
     * @return the ctrlStartYyMmDt
     */
    public Date getCtrlStartYyMmDt() {
        return ctrlStartYyMmDt;
    }

    /**
     * @param ctrlStartYyMmDt the ctrlStartYyMmDt to set
     */
    public void setCtrlStartYyMmDt(Date ctrlStartYyMmDt) {
        this.ctrlStartYyMmDt = ctrlStartYyMmDt;
    }

    /**
     * @return the ctrlEndYyMmDt
     */
    public Date getCtrlEndYyMmDt() {
        return ctrlEndYyMmDt;
    }

    /**
     * @param ctrlEndYyMmDt the ctrlEndYyMmDt to set
     */
    public void setCtrlEndYyMmDt(Date ctrlEndYyMmDt) {
        this.ctrlEndYyMmDt = ctrlEndYyMmDt;
    }


}
