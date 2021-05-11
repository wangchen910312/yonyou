package chn.bhmc.dms.cmm.tmp.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 메세지 템플릿 VO
 * </pre>
 *
 * @ClassName   : MessageTemplateVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 22.     Kang Seok Han     최초 생성
 * </pre>
 */


public class MessageTemplateVO extends BaseVO {

    public static final String MESG_TMPL_TP_EMAIL = "E";
    public static final String MESG_TMPL_TP_PUSH = "P";
    public static final String MESG_TMPL_TP_SMS = "S";
    public static final String MESG_TMPL_TP_WEBPUSH = "W";


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3961320525904905341L;

    /**
     * 메세지 템플릿 번호
     */
    private int mesgTmplNo;

    /**
     * 메시지 템플릿 그룹 ID
     */
    @NotBlank
    private String mesgTmplGrpId;

    /**
     * 메시지 템플릿 그룹명
     */

    private String mesgTmplGrpNm;

    /**
     * 메시지 템플릿 유형
     */
    @NotBlank
    private String mesgTmplTp;

    /**
     * 메시지 템플릿명
     */
    @NotBlank
    private String mesgTmplNm;

    /**
     * 메시지 템플릿 내용
     */
    @NotBlank
    private String mesgTmplCont;

    /**
     * 기본여부
     */
    @NotBlank
    private String defaultYn;

    /**
     * 사용여부
     */
    @NotBlank
    private String useYn;

    /**
     * @return the mesgTmplNo
     */
    public int getMesgTmplNo() {
        return mesgTmplNo;
    }

    /**
     * @param mesgTmplNo the mesgTmplNo to set
     */
    public void setMesgTmplNo(int mesgTmplNo) {
        this.mesgTmplNo = mesgTmplNo;
    }

    /**
     * @return the mesgTmplGrpId
     */
    public String getMesgTmplGrpId() {
        return mesgTmplGrpId;
    }

    /**
     * @param mesgTmplGrpId the mesgTmplGrpId to set
     */
    public void setMesgTmplGrpId(String mesgTmplGrpId) {
        this.mesgTmplGrpId = mesgTmplGrpId;
    }

    /**
     * @return the mesgTmplGrpNm
     */
    public String getMesgTmplGrpNm() {
        return mesgTmplGrpNm;
    }

    /**
     * @param mesgTmplGrpNm the mesgTmplGrpNm to set
     */
    public void setMesgTmplGrpNm(String mesgTmplGrpNm) {
        this.mesgTmplGrpNm = mesgTmplGrpNm;
    }

    /**
     * @return the mesgTmplTp
     */
    public String getMesgTmplTp() {
        return mesgTmplTp;
    }

    /**
     * @param mesgTmplTp the mesgTmplTp to set
     */
    public void setMesgTmplTp(String mesgTmplTp) {
        this.mesgTmplTp = mesgTmplTp;
    }

    /**
     * @return the mesgTmplNm
     */
    public String getMesgTmplNm() {
        return mesgTmplNm;
    }

    /**
     * @param mesgTmplNm the mesgTmplNm to set
     */
    public void setMesgTmplNm(String mesgTmplNm) {
        this.mesgTmplNm = mesgTmplNm;
    }

    /**
     * @return the mesgTmplCont
     */
    public String getMesgTmplCont() {
        return mesgTmplCont;
    }

    /**
     * @param mesgTmplCont the mesgTmplCont to set
     */
    public void setMesgTmplCont(String mesgTmplCont) {
        this.mesgTmplCont = mesgTmplCont;
    }

    /**
     * @return the defaultYn
     */
    public String getDefaultYn() {
        return defaultYn;
    }

    /**
     * @param defaultYn the defaultYn to set
     */
    public void setDefaultYn(String defaultYn) {
        this.defaultYn = defaultYn;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

}
