package chn.bhmc.dms.crm.css.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : SatisFactionCrmTargExtractVO
 * @Description : 클래스 설명을 기술합니다.
 * @author lee in moon
 * @since 2017.08.01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *   since     author       description
 * ===========  =============  ===========================
 * 2017.08.01.   lee in moon   최초 생성
 * </pre>
 */

@ValidDescriptor({
   @ValidField(field="dlrCd"      , mesgKey="crm.lbl.dlrCd")
  ,@ValidField(field="detlExtrTermCd" , mesgKey="crm.lbl.detlExtrTermCd")
  ,@ValidField(field="termVal1"    , mesgKey="crm.lbl.termVal1")
  ,@ValidField(field="termVal2"    , mesgKey="crm.lbl.termVal2")
  ,@ValidField(field="termVal3"    , mesgKey="crm.lbl.termVal3")
  ,@ValidField(field="termVal4"    , mesgKey="crm.lbl.termVal4")
  ,@ValidField(field="termVal5"    , mesgKey="crm.lbl.termVal5")
})

public class SatisFactionCrmTargExtractVO extends BaseVO {

  /**
   * Statements
   * (long)serialVersionUID
   */
    private static final long serialVersionUID = -7315456847266341425L;

    private String dlrCd;    //딜러코드
    private int seq;     //만족도조사일련번호
    private String detlExtrTermCd;  //상세추출조건코드
    private String termVal1;  //조건값1
    private String termVal2;    //조건값2
    private String termVal3;    //조건값3
    private String termVal4;    //조건값4
    private String termVal5;    //조건값5
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
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }
    /**
     * @return the detlExtrTermCd
     */
    public String getDetlExtrTermCd() {
        return detlExtrTermCd;
    }
    /**
     * @param detlExtrTermCd the detlExtrTermCd to set
     */
    public void setDetlExtrTermCd(String detlExtrTermCd) {
        this.detlExtrTermCd = detlExtrTermCd;
    }
    /**
     * @return the termVal1
     */
    public String getTermVal1() {
        return termVal1;
    }
    /**
     * @param termVal1 the termVal1 to set
     */
    public void setTermVal1(String termVal1) {
        this.termVal1 = termVal1;
    }
    /**
     * @return the termVal2
     */
    public String getTermVal2() {
        return termVal2;
    }
    /**
     * @param termVal2 the termVal2 to set
     */
    public void setTermVal2(String termVal2) {
        this.termVal2 = termVal2;
    }
    /**
     * @return the termVal3
     */
    public String getTermVal3() {
        return termVal3;
    }
    /**
     * @param termVal3 the termVal3 to set
     */
    public void setTermVal3(String termVal3) {
        this.termVal3 = termVal3;
    }
    /**
     * @return the termVal4
     */
    public String getTermVal4() {
        return termVal4;
    }
    /**
     * @param termVal4 the termVal4 to set
     */
    public void setTermVal4(String termVal4) {
        this.termVal4 = termVal4;
    }
    /**
     * @return the termVal5
     */
    public String getTermVal5() {
        return termVal5;
    }
    /**
     * @param termVal5 the termVal5 to set
     */
    public void setTermVal5(String termVal5) {
        this.termVal5 = termVal5;
    }

}