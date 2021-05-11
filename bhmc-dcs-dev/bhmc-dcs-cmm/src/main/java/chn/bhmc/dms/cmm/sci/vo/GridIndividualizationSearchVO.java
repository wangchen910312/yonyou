package chn.bhmc.dms.cmm.sci.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GridIndividualizationSearchVO.java
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
    @ValidField(field="sGridId", mesgKey="global.lbl.gridId")
    ,@ValidField(field="sUsrId", mesgKey="global.lbl.usrId")
    ,@ValidField(field="sGridIndvTp", mesgKey="global.lbl.gridIndvTp")
})
public class GridIndividualizationSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -505591790638954489L;

    /**
     * 그리드 ID
     */
    @NotEmpty
    private String sGridId;

    /**
     * 사용자 ID
     */
    private String sUsrId;

    /**
     * 그리드 개인화 구분
     * 1 : 그리드 컬럼 순서
     * 2 : 그리드 컬럼 숨김
     */
    @Pattern(regexp="[1|2]")
    private String sGridIndvTp;

    /**
     * @return the sGridId
     */
    public String getsGridId() {
        return sGridId;
    }
    /**
     * @param sGridId the sGridId to set
     */
    public void setsGridId(String sGridId) {
        this.sGridId = sGridId;
    }
    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }
    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }
    /**
     * @return the sGridIndvTp
     */
    public String getsGridIndvTp() {
        return sGridIndvTp;
    }
    /**
     * @param sGridIndvTp the sGridIndvTp to set
     */
    public void setsGridIndvTp(String sGridIndvTp) {
        this.sGridIndvTp = sGridIndvTp;
    }
    /*
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((sGridId == null) ? 0 : sGridId.hashCode());
        result = prime * result + ((sGridIndvTp == null) ? 0 : sGridIndvTp.hashCode());
        result = prime * result + ((sUsrId == null) ? 0 : sUsrId.hashCode());
        return result;
    }
    /*
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        GridIndividualizationSearchVO other = (GridIndividualizationSearchVO) obj;
        if (sGridId == null) {
            if (other.sGridId != null)
                return false;
        } else if (!sGridId.equals(other.sGridId))
            return false;
        if (sGridIndvTp == null) {
            if (other.sGridIndvTp != null)
                return false;
        } else if (!sGridIndvTp.equals(other.sGridIndvTp))
            return false;
        if (sUsrId == null) {
            if (other.sUsrId != null)
                return false;
        } else if (!sUsrId.equals(other.sUsrId))
            return false;
        return true;
    }
}
