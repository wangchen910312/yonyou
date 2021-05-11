package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 로케이션 구조 정의 VO
 *
 * @ClassName   : BinLocationDefineVO.java
 * @Description : BinLocationDefineVO Class
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim     최초 생성
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
public class BinLocationDefineVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 995256952539865268L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 레벨ID
     **/
    private int lvlId = 0;

    /**
     * 레벨텍스트
     **/
    private String lvlTxt;

    /**
     * 길이수
     **/
    private int lgthCnt = 0;

    /**
     * 코드유형
     **/
    private String cdTp;

    /**
     * 최종레벨여부
     **/
    private String lastLvlYn;

    /**
     * 비고
     **/
    private String remark;

    /**
     * Db 저장유무
     **/
    private String dbYn;

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
     * @return the lvlId
     */
    public int getLvlId() {
        return lvlId;
    }

    /**
     * @param lvlId the lvlId to set
     */
    public void setLvlId(int lvlId) {
        this.lvlId = lvlId;
    }

    /**
     * @return the lvlTxt
     */
    public String getLvlTxt() {
        return lvlTxt;
    }

    /**
     * @param lvlTxt the lvlTxt to set
     */
    public void setLvlTxt(String lvlTxt) {
        this.lvlTxt = lvlTxt;
    }

    /**
     * @return the lgthCnt
     */
    public int getLgthCnt() {
        return lgthCnt;
    }

    /**
     * @param lgthCnt the lgthCnt to set
     */
    public void setLgthCnt(int lgthCnt) {
        this.lgthCnt = lgthCnt;
    }

    /**
     * @return the cdTp
     */
    public String getCdTp() {
        return cdTp;
    }

    /**
     * @param cdTp the cdTp to set
     */
    public void setCdTp(String cdTp) {
        this.cdTp = cdTp;
    }

    /**
     * @return the lastLvlYn
     */
    public String getLastLvlYn() {
        return lastLvlYn;
    }

    /**
     * @param lastLvlYn the lastLvlYn to set
     */
    public void setLastLvlYn(String lastLvlYn) {
        this.lastLvlYn = lastLvlYn;
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
}
