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
 * @ClassName   : BlueMembershipSearchVO
 * @Description : 블루멤버십 가입 검색 VO
 * @author
 * @since  2017. 9. 20
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 9. 20.                        최초 생성
 * </pre>
 */

public class BlueMembershipSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2668796708125559022L;

    private String sDlrCd;//딜러코드
    private String sCustNm;//고객명
    private String sSsnCrnNo;//증서번호
    private String sHpNo;//핸드폰번호
    private String sBlueGradeNm;//블루멤버십등급
    private String sBlueMembershipJoinDlrCd;//가입출처

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   sBlueMembershipJoinDtFrom;//가입일 From

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   sBlueMembershipJoinDtTo;//가입일 To
    private int    sBlueAvlbPointValFrom = -1;//가용포인트 From
    private int    sBlueAvlbPointValTo = -1;//가용포인트 To
    private String sBlueLoginId;//로그인 아이디

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
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }
    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }
    /**
     * @return the sSsnCrnNo
     */
    public String getsSsnCrnNo() {
        return sSsnCrnNo;
    }
    /**
     * @param sSsnCrnNo the sSsnCrnNo to set
     */
    public void setsSsnCrnNo(String sSsnCrnNo) {
        this.sSsnCrnNo = sSsnCrnNo;
    }
    /**
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }
    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }
    /**
     * @return the sBlueGradeNm
     */
    public String getsBlueGradeNm() {
        return sBlueGradeNm;
    }
    /**
     * @param sBlueGradeNm the sBlueGradeNm to set
     */
    public void setsBlueGradeNm(String sBlueGradeNm) {
        this.sBlueGradeNm = sBlueGradeNm;
    }
    /**
     * @return the sBlueMembershipJoinDlrCd
     */
    public String getsBlueMembershipJoinDlrCd() {
        return sBlueMembershipJoinDlrCd;
    }
    /**
     * @param sBlueMembershipJoinDlrCd the sBlueMembershipJoinDlrCd to set
     */
    public void setsBlueMembershipJoinDlrCd(String sBlueMembershipJoinDlrCd) {
        this.sBlueMembershipJoinDlrCd = sBlueMembershipJoinDlrCd;
    }
    /**
     * @return the sBlueMembershipJoinDtFrom
     */
    public Date getsBlueMembershipJoinDtFrom() {
        return sBlueMembershipJoinDtFrom;
    }
    /**
     * @param sBlueMembershipJoinDtFrom the sBlueMembershipJoinDtFrom to set
     */
    public void setsBlueMembershipJoinDtFrom(Date sBlueMembershipJoinDtFrom) {
        this.sBlueMembershipJoinDtFrom = sBlueMembershipJoinDtFrom;
    }
    /**
     * @return the sBlueMembershipJoinDtTo
     */
    public Date getsBlueMembershipJoinDtTo() {
        return sBlueMembershipJoinDtTo;
    }
    /**
     * @param sBlueMembershipJoinDtTo the sBlueMembershipJoinDtTo to set
     */
    public void setsBlueMembershipJoinDtTo(Date sBlueMembershipJoinDtTo) {
        this.sBlueMembershipJoinDtTo = sBlueMembershipJoinDtTo;
    }
    /**
     * @return the sBlueAvlbPointValFrom
     */
    public int getsBlueAvlbPointValFrom() {
        return sBlueAvlbPointValFrom;
    }
    /**
     * @param sBlueAvlbPointValFrom the sBlueAvlbPointValFrom to set
     */
    public void setsBlueAvlbPointValFrom(int sBlueAvlbPointValFrom) {
        this.sBlueAvlbPointValFrom = sBlueAvlbPointValFrom;
    }
    /**
     * @return the sBlueAvlbPointValTo
     */
    public int getsBlueAvlbPointValTo() {
        return sBlueAvlbPointValTo;
    }
    /**
     * @param sBlueAvlbPointValTo the sBlueAvlbPointValTo to set
     */
    public void setsBlueAvlbPointValTo(int sBlueAvlbPointValTo) {
        this.sBlueAvlbPointValTo = sBlueAvlbPointValTo;
    }
    /**
     * @return the sBlueLoginId
     */
    public String getsBlueLoginId() {
        return sBlueLoginId;
    }
    /**
     * @param sBlueLoginId the sBlueLoginId to set
     */
    public void setsBlueLoginId(String sBlueLoginId) {
        this.sBlueLoginId = sBlueLoginId;
    }





}
