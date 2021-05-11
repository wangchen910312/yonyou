package chn.bhmc.dms.par.pmm.vo;


import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 품목그룹 VO
 *
 * @ClassName   : ItemGroupVO.java
 * @Description : ItemGroupVO Class
 * @author In Bo Shim
 * @since 2016. 1. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 5.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="itemDstinCd", mesgKey="par.lbl.itemDstinCd")
    ,@ValidField(field="itemDstinNm", mesgKey="par.lbl.itemDstinNm")
    ,@ValidField(field="itemGrpCd", mesgKey="par.lbl.itemGrpCd")
    ,@ValidField(field="itemGrpNm", mesgKey="par.lbl.itemGrpNm")
    ,@ValidField(field="useYn", mesgKey="par.lbl.useYn")
    ,@ValidField(field="dbYn", mesgKey="par.lbl.dbYn")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
})
public class ItemGroupVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1258817078537465874L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 품목구분
     */
    @NotEmpty
    private String itemDstinCd;

    /**
     * 품목구분명
     */
    @NotEmpty
    private String itemDstinNm;

    /**
     * 품목그룹코드
     */
    @NotEmpty
    private String itemGrpCd;

    /**
     * 품목그룹명
     */
    @NotEmpty
    private String itemGrpNm;

    /**
     * 사용여부
     */
    @NotEmpty
    private String useYn = "Y";

    /**
     * DB저장여부
     */
    @NotEmpty
    private String dbYn = "Y";

    /**
     * 비고
     */
    private String remark;

    /**
     * 레벨값
     */
    private int lvlVal = 0;

    /**
     * 부모품목구분코드
     */
    private String pentItemDstinCd;

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
     * @return the itemDstinCd
     */
    public String getItemDstinCd() {
        return itemDstinCd;
    }

    /**
     * @param itemDstinCd the itemDstinCd to set
     */
    public void setItemDstinCd(String itemDstinCd) {
        this.itemDstinCd = itemDstinCd;
    }

    /**
     * @return the itemDstinNm
     */
    public String getItemDstinNm() {
        return itemDstinNm;
    }

    /**
     * @param itemDstinNm the itemDstinNm to set
     */
    public void setItemDstinNm(String itemDstinNm) {
        this.itemDstinNm = itemDstinNm;
    }

    /**
     * @return the itemGrpCd
     */
    public String getItemGrpCd() {
        return itemGrpCd;
    }

    /**
     * @param itemGrpCd the itemGrpCd to set
     */
    public void setItemGrpCd(String itemGrpCd) {
        this.itemGrpCd = itemGrpCd;
    }

    /**
     * @return the itemGrpNm
     */
    public String getItemGrpNm() {
        return itemGrpNm;
    }

    /**
     * @param itemGrpNm the itemGrpNm to set
     */
    public void setItemGrpNm(String itemGrpNm) {
        this.itemGrpNm = itemGrpNm;
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

    /**
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the lvlVal
     */
    public int getLvlVal() {
        return lvlVal;
    }

    /**
     * @param lvlVal the lvlVal to set
     */
    public void setLvlVal(int lvlVal) {
        this.lvlVal = lvlVal;
    }

    /**
     * @return the pentItemDstinCd
     */
    public String getPentItemDstinCd() {
        return pentItemDstinCd;
    }

    /**
     * @param pentItemDstinCd the pentItemDstinCd to set
     */
    public void setPentItemDstinCd(String pentItemDstinCd) {
        this.pentItemDstinCd = pentItemDstinCd;
    }
}
