package chn.bhmc.dms.cmm.tmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 메세지 템플릿 SearchVO
 * </pre>
 *
 * @ClassName   : MessageTemplateSearchVO.java
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

public class MessageTemplateSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1665124872435619937L;

    /**
     * 메세지 템플릿 그룹 ID
     */
    private String sMesgTmplGrpId;

    /**
     * 메세지 템플릿 그룹명
     */
    private String sMesgTmplGrpNm;

    /**
     * 메세지 템플릿 유형
     */
    private String sMesgTmplTp;

    /**
     * 메세지 템플릿명
     */
    private String sMesgTmplNm;

    /**
     * 기본여부
     */
    private String sDefaultYn;

    /**
     * 사용여부
     */
    private String sUseYn;

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
     * @return the sMesgTmplTp
     */
    public String getsMesgTmplTp() {
        return sMesgTmplTp;
    }

    /**
     * @param sMesgTmplTp the sMesgTmplTp to set
     */
    public void setsMesgTmplTp(String sMesgTmplTp) {
        this.sMesgTmplTp = sMesgTmplTp;
    }

    /**
     * @return the sMesgTmplNm
     */
    public String getsMesgTmplNm() {
        return sMesgTmplNm;
    }

    /**
     * @param sMesgTmplNm the sMesgTmplNm to set
     */
    public void setsMesgTmplNm(String sMesgTmplNm) {
        this.sMesgTmplNm = sMesgTmplNm;
    }


    /**
     * @return the sDefaultYn
     */
    public String getsDefaultYn() {
        return sDefaultYn;
    }

    /**
     * @param sDefaultYn the sDefaultYn to set
     */
    public void setsDefaultYn(String sDefaultYn) {
        this.sDefaultYn = sDefaultYn;
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
