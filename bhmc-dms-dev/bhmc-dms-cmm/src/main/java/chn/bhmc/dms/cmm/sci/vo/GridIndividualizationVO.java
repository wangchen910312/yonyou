package chn.bhmc.dms.cmm.sci.vo;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 그리드 개인화 VO
 * </pre>
 *
 * @ClassName   : GridIndividualizationVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="gridId", mesgKey="global.lbl.gridId")
    ,@ValidField(field="usrId", mesgKey="global.lbl.usrId")
    ,@ValidField(field="gridIndvTp", mesgKey="global.lbl.gridIndvTp")
    ,@ValidField(field="gridIndvCont", mesgKey="global.lbl.gridIndvCont")
})
public class GridIndividualizationVO implements Serializable {

    public static final String GRID_INDV_TP_COLUMN_REORDER = "1";
    public static final String GRID_INDV_TP_COLUMN_HIDE = "2";

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 13305143640786102L;

    /**
     * 그리드 ID
     */
    @NotEmpty
    private String gridId;

    /**
     * 사용자 ID
     */
    private String usrId;

    /**
     * 그리드 개인화 구분
     * 1 : 그리드 컬럼 순서
     * 2 : 그리드 컬럼 숨김
     */
    @NotEmpty
    @Pattern(regexp="[1|2]")
    private String gridIndvTp;

    /**
     * 그리드 개인화 정보
     */
    @NotEmpty
    private String gridIndvCont;

    /**
     * @return the gridId
     */
    public String getGridId() {
        return gridId;
    }

    /**
     * @param gridId the gridId to set
     */
    public void setGridId(String gridId) {
        this.gridId = gridId;
    }

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
     * @return the gridIndvTp
     */
    public String getGridIndvTp() {
        return gridIndvTp;
    }

    /**
     * @param gridIndvTp the gridIndvTp to set
     */
    public void setGridIndvTp(String gridIndvTp) {
        this.gridIndvTp = gridIndvTp;
    }

    /**
     * @return the gridIndvCont
     */
    public String getGridIndvCont() {
        return gridIndvCont;
    }

    /**
     * @param gridIndvCont the gridIndvCont to set
     */
    public void setGridIndvCont(String gridIndvCont) {
        this.gridIndvCont = gridIndvCont;
    }

}
