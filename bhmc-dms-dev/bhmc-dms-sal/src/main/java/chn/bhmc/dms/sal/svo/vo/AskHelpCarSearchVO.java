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
 * @ClassName   : AskHelpCarSearchVO
 * @Description : 구원차/대부차신청 목록 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23      Kim Jin Suk      최초 생성
 * </pre>
 */

public class AskHelpCarSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8829459671544696510L;

    /**
     * 딜러코드
     **/
    private  String          sDlrCd;

    /**
     * 사용자ID
     **/
    private  String          sUsrId;

    /**
     * 요청일련번호
     **/
    private  int             sReqNo;

    /**
     * 등록일자
     **/
    //private  String            sStartReqDt;
    //private  String            sEndReqDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sStartReqDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sEndReqDt;

    /**
     * 차량유형코드
     **/
    private  String          sTpCd;


    /**
     * 승인상태여부
     **/
    private  String          sApproveCd;

    /**
     * 심사결과
     **/
    private String          sEvalRsltYn;

    /**
     * 심사평가
     **/
    private String          sRemark;


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
    public int getsReqNo() {
        return sReqNo;
    }

    /**
     * @param sReqSeq the sReqSeq to set
     */
    public void setsReqNo(int sReqNo) {
        this.sReqNo = sReqNo;
    }

    /**
     * @return the sStartReqDt
     */
    public Date getsStartReqDt() {
        return sStartReqDt;
    }

    /**
     * @param sStartReqDt the sStartReqDt to set
     */
    public void setsStartReqDt(Date sStartReqDt) {
        this.sStartReqDt = sStartReqDt;
    }

    /**
     * @return the sEndReqDt
     */
    public Date getsEndReqDt() {
        return sEndReqDt;
    }

    /**
     * @param sEndReqDt the sEndReqDt to set
     */
    public void setsEndReqDt(Date sEndReqDt) {
        this.sEndReqDt = sEndReqDt;
    }

    /**
     * @return the sTpCd
     */
    public String getsTpCd() {
        return sTpCd;
    }

    /**
     * @param sTpCd the sTpCd to set
     */
    public void setsTpCd(String sTpCd) {
        this.sTpCd = sTpCd;
    }

    /**
     * @return the sApproveYn
     */
    public String getsApproveCd() {
        return sApproveCd;
    }

    /**
     * @param sApproveYn the sApproveYn to set
     */
    public void setsApproveCd(String sApproveCd) {
        this.sApproveCd = sApproveCd;
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
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
