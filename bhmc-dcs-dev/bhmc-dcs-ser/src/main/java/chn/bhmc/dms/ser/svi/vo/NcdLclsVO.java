package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NcdLclsVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 1.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="lClsCd", mesgKey="ser.lbl.largeGrpCd")
})
public class NcdLclsVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8996198988891215476L;

    /**
     * 대분류 코드
     */
    @NotEmpty
    private String lClsCd;

    /**
     * 대분류명
     */
    private String lCdNm;

    /**
     * @return the lClsCd
     */
    public String getlClsCd() {
        return lClsCd;
    }

    /**
     * @param lClsCd the lClsCd to set
     */
    public void setlClsCd(String lClsCd) {
        this.lClsCd = lClsCd;
    }

    /**
     * @return the lCdNm
     */
    public String getlCdNm() {
        return lCdNm;
    }

    /**
     * @param lCdNm the lCdNm to set
     */
    public void setlCdNm(String lCdNm) {
        this.lCdNm = lCdNm;
    }



}
