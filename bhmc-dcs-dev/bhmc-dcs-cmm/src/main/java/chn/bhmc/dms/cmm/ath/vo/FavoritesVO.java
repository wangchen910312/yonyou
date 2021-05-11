package chn.bhmc.dms.cmm.ath.vo;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 즐겨찾기 VO
 * </pre>
 *
 * @ClassName   : FavoritesVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 28.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="usrId", mesgKey="global.lbl.usrId")
    ,@ValidField(field="viewId", mesgKey="global.lbl.viewId")
    ,@ValidField(field="viewNm", mesgKey="global.lbl.viewNm")
    ,@ValidField(field="viewUrl", mesgKey="global.lbl.viewUrl")
    ,@ValidField(field="mesgKey", mesgKey="global.lbl.mesgKey")
})
public class FavoritesVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    /**
     * 사용자ID
     */
    private String usrId;

    /**
     * 화면ID
     */
    @NotBlank
    private String viewId;

    /**
     * 화면명
     */
    private String viewNm;

    /**
     * 화면URL
     */
    private String viewUrl;

    /**
     * 메세지코드
     */
    private String mesgKey;

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the viewId
     */
    public String getViewId() {
        return viewId;
    }

    /**
     * @param viewId the viewId to set
     */
    public void setViewId(String viewId) {
        this.viewId = viewId;
    }

    /**
     * @return the viewNm
     */
    public String getViewNm() {
        return viewNm;
    }

    /**
     * @param viewNm the viewNm to set
     */
    public void setViewNm(String viewNm) {
        this.viewNm = viewNm;
    }

    /**
     * @return the viewUrl
     */
    public String getViewUrl() {
        return viewUrl;
    }

    /**
     * @param viewUrl the viewUrl to set
     */
    public void setViewUrl(String viewUrl) {
        this.viewUrl = viewUrl;
    }

    /**
     * @return the mesgKey
     */
    public String getMesgKey() {
        return mesgKey;
    }

    /**
     * @param mesgKey the mesgKey to set
     */
    public void setMesgKey(String mesgKey) {
        this.mesgKey = mesgKey;
    }

}
