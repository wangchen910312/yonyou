package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeHisSearchVO.java
 * @Description : 멤버십 등급이력 검색 VO
 * @author Kim Hyun Ho
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipGradeHisSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1934268090635885311L;

    /**
    * 딜러코드
    **/

    private  String sDlrCd;

    /**
    * 멤버쉽번호
    **/

    private  String sMembershipNo;

    /**
    * 등급변경이력일련번호
    **/

    private  int sGradeChgHisSeq;

    /**
    * 이전등급코드
    **/

    private  String sBefGradeCd;

    /**
    * 이후등급코드
    **/

    private  String sAftGradeCd;

    /**
    * 등급변경일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sGradeChgDt;

    /**
    * 사용여부
    **/
    private  String sUseYn;

    //조회조건 추가
    private  String sCustNo;
    private  String sVinNo;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sMembershipNo
     */
    public String getsMembershipNo() {
        return sMembershipNo;
    }

    /**
     * @param sMembershipNo the sMembershipNo to set
     */
    public void setsMembershipNo(String sMembershipNo) {
        this.sMembershipNo = sMembershipNo;
    }

    /**
     * @return the sGradeChgHisSeq
     */
    public int getsGradeChgHisSeq() {
        return sGradeChgHisSeq;
    }

    /**
     * @param sGradeChgHisSeq the sGradeChgHisSeq to set
     */
    public void setsGradeChgHisSeq(int sGradeChgHisSeq) {
        this.sGradeChgHisSeq = sGradeChgHisSeq;
    }

    /**
     * @return the sBefGradeCd
     */
    public String getsBefGradeCd() {
        return sBefGradeCd;
    }

    /**
     * @param sBefGradeCd the sBefGradeCd to set
     */
    public void setsBefGradeCd(String sBefGradeCd) {
        this.sBefGradeCd = sBefGradeCd;
    }

    /**
     * @return the sAftGradeCd
     */
    public String getsAftGradeCd() {
        return sAftGradeCd;
    }

    /**
     * @param sAftGradeCd the sAftGradeCd to set
     */
    public void setsAftGradeCd(String sAftGradeCd) {
        this.sAftGradeCd = sAftGradeCd;
    }

    /**
     * @return the sGradeChgDt
     */
    public Date getsGradeChgDt() {
        return sGradeChgDt;
    }

    /**
     * @param sGradeChgDt the sGradeChgDt to set
     */
    public void setsGradeChgDt(Date sGradeChgDt) {
        this.sGradeChgDt = sGradeChgDt;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }


}
