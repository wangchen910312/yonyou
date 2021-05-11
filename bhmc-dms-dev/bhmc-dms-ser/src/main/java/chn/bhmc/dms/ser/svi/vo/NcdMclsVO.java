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
 * @ClassName   : NcdMclsVO.java
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
    @ValidField(field="mClsCd", mesgKey="ser.lbl.middleGrpCd")
})
public class NcdMclsVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5347095150928271675L;

    @NotEmpty
    private String mClsCd;

    private String mCdNm;

    /**
     * @return the mClsCd
     */
    public String getmClsCd() {
        return mClsCd;
    }

    /**
     * @param mClsCd the mClsCd to set
     */
    public void setmClsCd(String mClsCd) {
        this.mClsCd = mClsCd;
    }

    /**
     * @return the mCdNm
     */
    public String getmCdNm() {
        return mCdNm;
    }

    /**
     * @param mCdNm the mCdNm to set
     */
    public void setmCdNm(String mCdNm) {
        this.mCdNm = mCdNm;
    }





}
