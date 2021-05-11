package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplySpecListSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DplySpecListSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 879592996080824995L;

    /**
     * SPEC코드
     */
    private String sSpecCd;

    /**
     * SPEC명
     */
    private String sSpecNm;

    /**
     * 등록시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartRegDt;

    /**
     * 등록종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndRegDt;


    /**
     * SPEC유형명
     */
    private String sSpecTpNm;



    /**
     * @param sSpecCd the sSpecCd to set
     */
    public void setsSpecCd(String sSpecCd) {
        this.sSpecCd = sSpecCd;
    }

    /**
     * @return the sSpecCd
     */
    public String getsSpecCd() {
        return sSpecCd;
    }

    /**
     * @param sSpecNm the sSpecNm to set
     */
    public void setsSpecNm(String sSpecNm) {
        this.sSpecNm = sSpecNm;
    }

    /**
     * @return the sSpecNm
     */
    public String getsSpecNm() {
        return sSpecNm;
    }

    /**
     * @param sStartRegDt the sStartRegDt to set
     */
    public void setsStartRegDt(Date sStartRegDt) {
        this.sStartRegDt = sStartRegDt;
    }

    /**
     * @return the sStartRegDt
     */
    public Date getsStartRegDt() {
        return sStartRegDt;
    }

    /**
     * @param sEndRegDt the sEndRegDt to set
     */
    public void setsEndRegDt(Date sEndRegDt) {
        this.sEndRegDt = sEndRegDt;
    }

    /**
     * @return the sEndRegDt
     */
    public Date getsEndRegDt() {
        return sEndRegDt;
    }

    /**
     * @param sSpecTpNm the sSpecTpNm to set
     */
    public void setsSpecTpNm(String sSpecTpNm) {
        this.sSpecTpNm = sSpecTpNm;
    }

    /**
     * @return the sSpecTpNm
     */
    public String getsSpecTpNm() {
        return sSpecTpNm;
    }



}
