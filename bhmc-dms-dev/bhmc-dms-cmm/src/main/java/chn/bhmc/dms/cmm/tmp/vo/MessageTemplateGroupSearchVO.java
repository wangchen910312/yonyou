package chn.bhmc.dms.cmm.tmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 메세지 템플릿 그룹 SearchVO
 * </pre>
 *
 * @ClassName   : MessageTemplateGroupSearchVO.java
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

public class MessageTemplateGroupSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3431807540193604845L;

    /**
     * 메시지 템플릿 그룹 구분
     */
    private String sMesgTmplGrpTp;

    /**
     * 메시지 템플릿 그룹 ID
     */
    private String sMesgTmplGrpId;

    /**
     * 메시지 템플릿 그룹명
     */
    private String sMesgTmplGrpNm;

    /**
     * 사용여부
     */
    private String sUseYn = "Y";

    /**
     * @return the sMesgTmplGrpTp
     */
    public String getsMesgTmplGrpTp() {
        return sMesgTmplGrpTp;
    }

    /**
     * @param sMesgTmplGrpTp the sMesgTmplGrpTp to set
     */
    public void setsMesgTmplGrpTp(String sMesgTmplGrpTp) {
        this.sMesgTmplGrpTp = sMesgTmplGrpTp;
    }

    /**
     * @return the sMesgTmplGrpId
     */
    public String getsMesgTmplGrpId() {
        return sMesgTmplGrpId;
    }

    /**
     * @param sMesgTmplGrpId the sMesgTmplGrpId to set
     */
    public void setsMesgTmplGrpId(String sMesgTmplGrpId) {
        this.sMesgTmplGrpId = sMesgTmplGrpId;
    }

    /**
     * @return the sMesgTmplGrpNm
     */
    public String getsMesgTmplGrpNm() {
        return sMesgTmplGrpNm;
    }

    /**
     * @param sMesgTmplGrpNm the sMesgTmplGrpNm to set
     */
    public void setsMesgTmplGrpNm(String sMesgTmplGrpNm) {
        this.sMesgTmplGrpNm = sMesgTmplGrpNm;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

}
