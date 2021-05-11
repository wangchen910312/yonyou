package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponHisVO.java
 * @Description : 패키지쿠폰 이력 VO
 * @author Kim Hyun Ho
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Kim Hyun Ho     최초 생성
 * </pre>
 */
    @ValidDescriptor({
        @ValidField(field="dlrCd"       , mesgKey="crm.lbl.dlrCd")
        ,@ValidField(field="seq"         , mesgKey="crm.lbl.seq")
        ,@ValidField(field="membershipNo", mesgKey="crm.lbl.membershipNo")
        ,@ValidField(field="pkgSeq"      , mesgKey="crm.lbl.pkgSeq")
        ,@ValidField(field="pkgNm"       , mesgKey="crm.lbl.pkgNm")
        ,@ValidField(field="pkgAmt"      , mesgKey="crm.lbl.pkgAmt")
        ,@ValidField(field="pkgCont"     , mesgKey="crm.lbl.pkgCont")
        ,@ValidField(field="cupnSeq"     , mesgKey="crm.lbl.cupnSeq")
        ,@ValidField(field="cupnNm"      , mesgKey="crm.lbl.cupnNm")
        ,@ValidField(field="cupnCont"    , mesgKey="crm.lbl.cupnCont")
        ,@ValidField(field="cupnDestDt"  , mesgKey="crm.lbl.cupnDestDt")
        ,@ValidField(field="cupnUseYn"   , mesgKey="crm.lbl.cupnUseYn")
        ,@ValidField(field="cupnUseDt"   , mesgKey="crm.lbl.cupnUseDt")
        ,@ValidField(field="useDeptNm"   , mesgKey="crm.lbl.useDeptNm")
        ,@ValidField(field="usePrsnId"   , mesgKey="crm.lbl.usePrsnId")
    })
public class PackageCouponHisSaveVO extends BaseSaveVO<PackageCouponHisVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6258762665796413050L;

    private String dlrCd;
    private int pkgSeq;
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the pkgSeq
     */
    public int getPkgSeq() {
        return pkgSeq;
    }
    /**
     * @param pkgSeq the pkgSeq to set
     */
    public void setPkgSeq(int pkgSeq) {
        this.pkgSeq = pkgSeq;
    }


}
