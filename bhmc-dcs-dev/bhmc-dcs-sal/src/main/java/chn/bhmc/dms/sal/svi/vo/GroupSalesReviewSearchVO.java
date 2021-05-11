package chn.bhmc.dms.sal.svi.vo;

import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesReviewSearchVO
 * @Description : 집단판매심사 목록 설명을 기술합니다.
 * @author Bong
 * @since 2016. 4. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.08          Bong                최초 생성
 * </pre>
 */

public class GroupSalesReviewSearchVO extends BaseSearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1871621823477142022L;


    private  String          sDiviCd;   //사업부
    private  String          sOffCd;    //사무소
    private  String          sSungCd;   //성
    private  String          sCityCd;   //도시

    private  String          sApplyNo;     //신청번호
    private  String          sCustNm;      //고객명
    private  String          sDlrCd;       //딜러코드
    private  String          sDlrCdNm;     //딜러명
    private  String          sApproveCd;   //상태
    private  String          sAtcDstinCd; //항목

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sApplyDtS;    //신청일자(시작일)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sApplyDtE;    //신청일자(종료일)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sEvalDtS;    //심사일자(시작일)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sEvalDtE;    //심사일자(종료일)

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sLastStartUpdt;    //상신일자(시작일)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sLastEndUpdt;    //상신일자(종료일)

    private  String          sEvalRsltYn;  //심사여부
    private  String          sDistCd;      //딜러지역

    private  String          sApplyDtsS;
    private  String          sApplyDtsE;
    private  String          sEvalDtsS;
    private  String          sEvalDtsE;

    private  int             sUsrEvalGrade;     //로그인USER 심사등급
    private  String          sLoginUsrId;       //로그인USER ID

    private  String          sUsrId;       //USER ID

    private  String          sApporveDlrCd;       // 법인 딜러코드
    private  String          sApporveUsrId;       // 법인 usr id
    private  int             sReqSeq;
    private  String          sWrkDstinCd; //심사 권한여부
    private  String          sFileDocId;




    //집단판매신청 - 차량팝업
    private  String          sCarlineCd;    //차종
    private  String          sModelCd;      //모델
    private  String          sVinNo;        //VIN NO
    private  String          sCallType; //신청or심사호출구분
    
   //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
    private List<String> sOffCdList;
    private List<String> sDistCdList;
    private List<String> sAtcDstinCdList;
    
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
     * @return the sApporveDlrCd
     */
    public String getsApporveDlrCd() {
        return sApporveDlrCd;
    }
    /**
     * @param sApporveDlrCd the sApporveDlrCd to set
     */
    public void setsApporveDlrCd(String sApporveDlrCd) {
        this.sApporveDlrCd = sApporveDlrCd;
    }
    /**
     * @return the sApporveUsrId
     */
    public String getsApporveUsrId() {
        return sApporveUsrId;
    }
    /**
     * @param sApporveUsrId the sApporveUsrId to set
     */
    public void setsApporveUsrId(String sApporveUsrId) {
        this.sApporveUsrId = sApporveUsrId;
    }

    /**
     * @return the sWrkDstinCd
     */
    public String getsWrkDstinCd() {
        return sWrkDstinCd;
    }
    /**
     * @param sWrkDstinCd the sWrkDstinCd to set
     */
    public void setsWrkDstinCd(String sWrkDstinCd) {
        this.sWrkDstinCd = sWrkDstinCd;
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
     * @return the sDiviCd
     */
    public String getsDiviCd() {
        return sDiviCd;
    }
    /**
     * @param sDiviCd the sDiviCd to set
     */
    public void setsDiviCd(String sDiviCd) {
        this.sDiviCd = sDiviCd;
    }
    /**
     * @return the sOffCd
     */
    public String getsOffCd() {
        return sOffCd;
    }
    /**
     * @param sOffCd the sOffCd to set
     */
    public void setsOffCd(String sOffCd) {
        this.sOffCd = sOffCd;
    }
    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }
    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
    }
    /**
     * @return the sCityCd
     */
    public String getsCityCd() {
        return sCityCd;
    }
    /**
     * @param sCityCd the sCityCd to set
     */
    public void setsCityCd(String sCityCd) {
        this.sCityCd = sCityCd;
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
     * @return the sDlrCdNm
     */
    public String getsDlrCdNm() {
        return sDlrCdNm;
    }
    /**
     * @param sDlrCdNm the sDlrCdNm to set
     */
    public void setsDlrCdNm(String sDlrCdNm) {
        this.sDlrCdNm = sDlrCdNm;
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
     * @return the sAtcDstinCd
     */
    public String getsAtcDstinCd() {
        return sAtcDstinCd;
    }
    /**
     * @param sAtcDstinCd the sAtcDstinCd to set
     */
    public void setsAtcDstinCd(String sAtcDstinCd) {
        this.sAtcDstinCd = sAtcDstinCd;
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
     * @return the sEvalDtS
     */
    public Date getsEvalDtS() {
        return sEvalDtS;
    }
    /**
     * @param sEvalDtS the sEvalDtS to set
     */
    public void setsEvalDtS(Date sEvalDtS) {
        this.sEvalDtS = sEvalDtS;
    }
    /**
     * @return the sEvalDtE
     */
    public Date getsEvalDtE() {
        return sEvalDtE;
    }
    /**
     * @param sEvalDtE the sEvalDtE to set
     */
    public void setsEvalDtE(Date sEvalDtE) {
        this.sEvalDtE = sEvalDtE;
    }
    /**
     * @return the sEvalRsltYn
     */
    public String getsEvalRsltYn() {
        return sEvalRsltYn;
    }
    /**
     * @param sEvalRsltYn the sEvalRsltYn to set
     */
    public void setsEvalRsltYn(String sEvalRsltYn) {
        this.sEvalRsltYn = sEvalRsltYn;
    }
    /**
     * @return the sDistCd
     */
    public String getsDistCd() {
        return sDistCd;
    }
    /**
     * @param sDistCd the sDistCd to set
     */
    public void setsDistCd(String sDistCd) {
        this.sDistCd = sDistCd;
    }
    /**
     * @return the sApplyDtsS
     */
    public String getsApplyDtsS() {
        return sApplyDtsS;
    }
    /**
     * @param sApplyDtsS the sApplyDtsS to set
     */
    public void setsApplyDtsS(String sApplyDtsS) {
        this.sApplyDtsS = sApplyDtsS;
    }
    /**
     * @return the sApplyDtsE
     */
    public String getsApplyDtsE() {
        return sApplyDtsE;
    }
    /**
     * @param sApplyDtsE the sApplyDtsE to set
     */
    public void setsApplyDtsE(String sApplyDtsE) {
        this.sApplyDtsE = sApplyDtsE;
    }
    /**
     * @return the sEvalDtsS
     */
    public String getsEvalDtsS() {
        return sEvalDtsS;
    }
    /**
     * @param sEvalDtsS the sEvalDtsS to set
     */
    public void setsEvalDtsS(String sEvalDtsS) {
        this.sEvalDtsS = sEvalDtsS;
    }
    /**
     * @return the sEvalDtsE
     */
    public String getsEvalDtsE() {
        return sEvalDtsE;
    }
    /**
     * @param sEvalDtsE the sEvalDtsE to set
     */
    public void setsEvalDtsE(String sEvalDtsE) {
        this.sEvalDtsE = sEvalDtsE;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sLastStartUpdt
     */
    public Date getsLastStartUpdt() {
        return sLastStartUpdt;
    }
    /**
     * @return the sLastEndUpdt
     */
    public Date getsLastEndUpdt() {
        return sLastEndUpdt;
    }
    /**
     * @param sLastStartUpdt the sLastStartUpdt to set
     */
    public void setsLastStartUpdt(Date sLastStartUpdt) {
        this.sLastStartUpdt = sLastStartUpdt;
    }
    /**
     * @param sLastEndUpdt the sLastEndUpdt to set
     */
    public void setsLastEndUpdt(Date sLastEndUpdt) {
        this.sLastEndUpdt = sLastEndUpdt;
    }
    /**
     * @return the sUsrEvalGrade
     */
    public int getsUsrEvalGrade() {
        return sUsrEvalGrade;
    }
    /**
     * @return the sLoginUsrId
     */
    public String getsLoginUsrId() {
        return sLoginUsrId;
    }
    /**
     * @param sUsrEvalGrade the sUsrEvalGrade to set
     */
    public void setsUsrEvalGrade(int sUsrEvalGrade) {
        this.sUsrEvalGrade = sUsrEvalGrade;
    }
    /**
     * @param sLoginUsrId the sLoginUsrId to set
     */
    public void setsLoginUsrId(String sLoginUsrId) {
        this.sLoginUsrId = sLoginUsrId;
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
	public List<String> getsOffCdList() {
		return sOffCdList;
	}
	public void setsOffCdList(List<String> sOffCdList) {
		this.sOffCdList = sOffCdList;
	}
	public List<String> getsDistCdList() {
		return sDistCdList;
	}
	public void setsDistCdList(List<String> sDistCdList) {
		this.sDistCdList = sDistCdList;
	}
	public List<String> getsAtcDstinCdList() {
		return sAtcDstinCdList;
	}
	public void setsAtcDstinCdList(List<String> sAtcDstinCdList) {
		this.sAtcDstinCdList = sAtcDstinCdList;
	}
    

}