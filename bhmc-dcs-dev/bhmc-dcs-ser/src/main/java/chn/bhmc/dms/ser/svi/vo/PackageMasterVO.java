package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 작업Package master VO
 * </pre>
 *
 * @ClassName   : PackageMasterVO.java
 * @Description : 작업Package master VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class PackageMasterVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5137654610907884139L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * package 품목코드
     */
    @NotEmpty
    private String pkgItemCd;
    
    /**
     * package 품목명
     */
    private String pkgItemNm;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getPkgItemCd() {
        return pkgItemCd;
    }

    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the pkgItemNm
     */
    public String getPkgItemNm() {
        return pkgItemNm;
    }

    /**
     * @param pkgItemNm the pkgItemNm to set
     */
    public void setPkgItemNm(String pkgItemNm) {
        this.pkgItemNm = pkgItemNm;
    }

    


}
