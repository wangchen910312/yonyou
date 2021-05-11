package chn.bhmc.dms.crm.cso.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 판매기회 타브랜드 실패 차량 관리 조회 SearchVO
 *
 * @ClassName   : SalesOpptFailBrandMgmtSearchVO.java
 * @Description : SalesOpptFailBrandMgmtSearchVO
 * @author liujing
 * @since 2016.12.12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.12.12.     liu jing     최초 생성
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

}