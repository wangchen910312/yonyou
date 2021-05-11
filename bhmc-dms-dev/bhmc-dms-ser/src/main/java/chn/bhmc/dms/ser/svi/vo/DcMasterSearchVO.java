package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 할인관리 조회 SearchVO
 * </pre>
 *
 * @ClassName   : DcMasterSearchVO.java
 * @Description : 할인관리 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class DcMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String  sDlrCd;

    /**
     * 조회조건 - 할인코드
     */
    private String sDcCd;

    /**
     * 조회조건 - 할인명
     */
    private String sDcNm;

    /**
     * 조회조건 - 할인유형코드
     */
    private String sDcTp;

    /**
     * 할인유형코드
     */
    private String sDcPernTp;

    private String sPreFixId;

    /**
     * 할인권한유형
     */
    private String sDcPermTp;

    /**
     * 조회조건 - 할인구분코드
     */
    private String sDcDstinCd;

    private String sDcUseYn;

    private String sSaId;

    private String sCustNo;

    private String sUserId;

    private int sDcSeq;

    /**
     * 할인권한리스트
     **/
    private List<String> sDcPermTpLst;

    private String sDcUseTp;

    private String sVinNo;

    /**
     * 할인적용일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToday;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsDcCd() {
        return sDcCd;
    }

    public void setsDcCd(String sDcCd) {
        this.sDcCd = sDcCd;
    }

    public String getsDcNm() {
        return sDcNm;
    }

    public void setsDcNm(String sDcNm) {
        this.sDcNm = sDcNm;
    }

    public String getsDcTp() {
        return sDcTp;
    }

    public void setsDcTp(String sDcTp) {
        this.sDcTp = sDcTp;
    }


    /**
     * @return the sDcPernTp
     */
    public String getsDcPernTp() {
        return sDcPernTp;
    }

    /**
     * @param sDcPernTp the sDcPernTp to set
     */
    public void setsDcPernTp(String sDcPernTp) {
        this.sDcPernTp = sDcPernTp;
    }

    /**
     * @return the sDcDstinCd
     */
    public String getsDcDstinCd() {
        return sDcDstinCd;
    }

    /**
     * @param sDcDstinCd the sDcDstinCd to set
     */
    public void setsDcDstinCd(String sDcDstinCd) {
        this.sDcDstinCd = sDcDstinCd;
    }

    /**
     * @return the sPreFixId
     */
    public String getsPreFixId() {
        return sPreFixId;
    }

    /**
     * @param sPreFixId the sPreFixId to set
     */
    public void setsPreFixId(String sPreFixId) {
        this.sPreFixId = sPreFixId;
    }

    /**
     * @return the sDcPermTp
     */
    public String getsDcPermTp() {
        return sDcPermTp;
    }

    /**
     * @param sDcPermTp the sDcPermTp to set
     */
    public void setsDcPermTp(String sDcPermTp) {
        this.sDcPermTp = sDcPermTp;
    }

    /**
     * @return the sDcUseYn
     */
    public String getsDcUseYn() {
        return sDcUseYn;
    }

    /**
     * @param sDcUseYn the sDcUseYn to set
     */
    public void setsDcUseYn(String sDcUseYn) {
        this.sDcUseYn = sDcUseYn;
    }

    /**
     * @return the sSaId
     */
    public String getsSaId() {
        return sSaId;
    }

    /**
     * @param sSaId the sSaId to set
     */
    public void setsSaId(String sSaId) {
        this.sSaId = sSaId;
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
     * @return the sDcSeq
     */
    public int getsDcSeq() {
        return sDcSeq;
    }

    /**
     * @param sDcSeq the sDcSeq to set
     */
    public void setsDcSeq(int sDcSeq) {
        this.sDcSeq = sDcSeq;
    }

    public String getsUserId() {
        return sUserId;
    }

    public void setsUserId(String sUserId) {
        this.sUserId = sUserId;
    }

    /**
     * @return the sDcPermTpLst
     */
    public List<String> getsDcPermTpLst() {
        return sDcPermTpLst;
    }

    /**
     * @param sDcPermTpLst the sDcPermTpLst to set
     */
    public void setsDcPermTpLst(List<String> sDcPermTpLst) {
        this.sDcPermTpLst = sDcPermTpLst;
    }

    /**
     * @return the sToday
     */
    public Date getsToday() {
        return sToday;
    }

    /**
     * @param sToday the sToday to set
     */
    public void setsToday(Date sToday) {
        this.sToday = sToday;
    }

    /**
     * @return the sDcUseTp
     */
    public String getsDcUseTp() {
        return sDcUseTp;
    }

    /**
     * @param sDcUseTp the sDcUseTp to set
     */
    public void setsDcUseTp(String sDcUseTp) {
        this.sDcUseTp = sDcUseTp;
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
