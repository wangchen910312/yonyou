package chn.bhmc.dms.cmm.tmp.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 메세지 템플릿 그룹 VO
 * </pre>
 *
 * @ClassName   : MessageTemplateGroupVO.java
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

public class MessageTemplateGroupVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2766900058477282402L;

    /**
     * 메시지 템플릿 그룹 구분
     */
    private String mesgTmplGrpTp;

    /**
     * 메시지 템플릿 그룹 ID
     */
    private String mesgTmplGrpId;

    /**
     * 메시지 템플릿그룹명
     */
    private String mesgTmplGrpNm;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * @return the mesgTmplGrpTp
     */
    public String getMesgTmplGrpTp() {
        return mesgTmplGrpTp;
    }

    /**
     * @param mesgTmplGrpTp the mesgTmplGrpTp to set
     */
    public void setMesgTmplGrpTp(String mesgTmplGrpTp) {
        this.mesgTmplGrpTp = mesgTmplGrpTp;
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
