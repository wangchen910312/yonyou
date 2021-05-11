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
 * @ClassName   : MembershipPointHisMngSearchVO.java
 * @Description : 포인트 소멸 이력 Search VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 28.     Kim Hyun Ho     최초 생성
 * </pre>
 */


public class MembershipPointHisMngSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2491587747133297651L;


    /**
    * 딜러코드
    **/

    private  String        sDlrCd;

    /**
    * 소멸일련번호
    **/

    private  int           sExtcSeq;

    /**
    * 포인트소멸일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          sPointExtcDt;

    /**
    * 멤버쉽번호
    **/

    private  String        sMembershipNo;

    /**
    * 소멸포인트값
    **/

    private  int           sExtcPointVal;

    /**
    * 잔여포인트값
    **/

    private  int           sRmnPointVal;

    /*
     *  검색조건 추가
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sEndDt;


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
     * @return the sExtcSeq
     */
    public int getsExtcSeq() {
        return sExtcSeq;
    }

    /**
     * @param sExtcSeq the sExtcSeq to set
     */
    public void setsExtcSeq(int sExtcSeq) {
        this.sExtcSeq = sExtcSeq;
    }

    /**
     * @return the sPointExtcDt
     */
    public Date getsPointExtcDt() {
        return sPointExtcDt;
    }

    /**
     * @param sPointExtcDt the sPointExtcDt to set
     */
    public void setsPointExtcDt(Date sPointExtcDt) {
        this.sPointExtcDt = sPointExtcDt;
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
     * @return the sExtcPointVal
     */
    public int getsExtcPointVal() {
        return sExtcPointVal;
    }

    /**
     * @param sExtcPointVal the sExtcPointVal to set
     */
    public void setsExtcPointVal(int sExtcPointVal) {
        this.sExtcPointVal = sExtcPointVal;
    }

    /**
     * @return the sRmnPointVal
     */
    public int getsRmnPointVal() {
        return sRmnPointVal;
    }

    /**
     * @param sRmnPointVal the sRmnPointVal to set
     */
    public void setsRmnPointVal(int sRmnPointVal) {
        this.sRmnPointVal = sRmnPointVal;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }



}
