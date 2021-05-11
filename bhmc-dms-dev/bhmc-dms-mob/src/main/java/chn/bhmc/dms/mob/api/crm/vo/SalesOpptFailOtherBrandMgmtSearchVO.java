package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 판매기회실패브랜드 조회 SearchVO
 *
 * @ClassName   : SalesOpptFailBrandMgmtSearchVO
 * @Description : SalesOpptFailBrandMgmtSearchVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07.     kyo jin lee     최초 생성
 * </pre>
 */

public class SalesOpptFailOtherBrandMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1260067018174270905L;

    /**
    * 일련번호
    **/

    private  int                   sSeq;

    /**
    * 선호차종코드
    **/

    private  String                sIntrCarlineCd;

    /**
    * 타브랜드차량명
    **/

    private  String                sOtherBrandCarlineNm;

    /**
    * 사용여부
    **/

    private  String                sUseYn;

    /**
    * 등록자ID
    **/

    private  String                sRegUsrId;

    /**
    * 등록일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sRegDt;

    /**
    * 수정자ID
    **/

    private  String                sUpdtUsrId;

    /**
    * 수정일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sUpdtDt;

    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sIntrCarlineCd
     */
    public String getsIntrCarlineCd() {
        return sIntrCarlineCd;
    }

    /**
     * @param sIntrCarlineCd the sIntrCarlineCd to set
     */
    public void setsIntrCarlineCd(String sIntrCarlineCd) {
        this.sIntrCarlineCd = sIntrCarlineCd;
    }

    /**
     * @return the sOtherBrandCarlineNm
     */
    public String getsOtherBrandCarlineNm() {
        return sOtherBrandCarlineNm;
    }

    /**
     * @param sOtherBrandCarlineNm the sOtherBrandCarlineNm to set
     */
    public void setsOtherBrandCarlineNm(String sOtherBrandCarlineNm) {
        this.sOtherBrandCarlineNm = sOtherBrandCarlineNm;
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
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }



}