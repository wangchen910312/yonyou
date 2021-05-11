package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationSearchVO
 * @Description : 집단판매신청 목록 설명을 기술합니다.
 * @author Bong
 * @since 2016. 3. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.20      Bong                최초 생성
 * </pre>
 */

public class GroupSalesApplicationSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6810428049133957835L;

    private  String          sDlrCd;       //딜러코드

    private  String          sApplyNo;     //신청번호
    private  String          sCustNm;      //고객명
    private  String          sApproveCd;   //상태

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sApplyDtS;    //신청일자(시작일)

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sApplyDtE;    //신청일자(종료일)
    private  int             sReqSeq;
    private  String          sUsrId;


    //집단판매신청 - 차량팝업
    private  String          sCarlineCd;    //차종
    private  String          sModelCd;      //모델
    private  String          sVinNo;        //VIN NO
    private  String          sCallType; //신청or심사호출구분

    private String           sFileDocId; //파일번호

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date             sConfirmDtS; //심사일자(시작일)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date             sConfirmDtE; //심사일자(종료일)


    /**
     * @return the sFileDocId
     */
    public String getsFileDocId() {
        return sFileDocId;
    }

    /**
     * @param sFileDocId the sFileDocId to set
     */
    public void setsFileDocId(String sFileDocId) {
        this.sFileDocId = sFileDocId;
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

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sReqSeq
     */
    public int getsReqSeq() {
        return sReqSeq;
    }

    /**
     * @param sReqSeq the sReqSeq to set
     */
    public void setsReqSeq(int sReqSeq) {
        this.sReqSeq = sReqSeq;
    }

    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }

    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }

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
     * @return the sApplyNo
     */
    public String getsApplyNo() {
        return sApplyNo;
    }

    /**
     * @param sApplyNo the sApplyNo to set
     */
    public void setsApplyNo(String sApplyNo) {
        this.sApplyNo = sApplyNo;
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
     * @return the sApproveCd
     */
    public String getsApproveCd() {
        return sApproveCd;
    }

    /**
     * @param sApproveCd the sApproveCd to set
     */
    public void setsApproveCd(String sApproveCd) {
        this.sApproveCd = sApproveCd;
    }

    /**
     * @return the sApplyDtS
     */
    public Date getsApplyDtS() {
        return sApplyDtS;
    }

    /**
     * @param sApplyDtS the sApplyDtS to set
     */
    public void setsApplyDtS(Date sApplyDtS) {
        this.sApplyDtS = sApplyDtS;
    }

    /**
     * @return the sApplyDtE
     */
    public Date getsApplyDtE() {
        return sApplyDtE;
    }

    /**
     * @param sApplyDtE the sApplyDtE to set
     */
    public void setsApplyDtE(Date sApplyDtE) {
        this.sApplyDtE = sApplyDtE;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the sCallType
     */
    public String getsCallType() {
        return sCallType;
    }

    /**
     * @param sCallType the sCallType to set
     */
    public void setsCallType(String sCallType) {
        this.sCallType = sCallType;
    }

    /**
     * @return the sConfirmDtS
     */
    public Date getsConfirmDtS() {
        return sConfirmDtS;
    }

    /**
     * @param sConfirmDtS the sConfirmDtS to set
     */
    public void setsConfirmDtS(Date sConfirmDtS) {
        this.sConfirmDtS = sConfirmDtS;
    }

    /**
     * @return the sConfirmDtE
     */
    public Date getsConfirmDtE() {
        return sConfirmDtE;
    }

    /**
     * @param sConfirmDtE the sConfirmDtE to set
     */
    public void setsConfirmDtE(Date sConfirmDtE) {
        this.sConfirmDtE = sConfirmDtE;
    }


}
