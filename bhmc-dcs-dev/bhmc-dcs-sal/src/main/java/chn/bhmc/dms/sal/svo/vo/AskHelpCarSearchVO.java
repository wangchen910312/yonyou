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
    private  String          sReqCarNo;

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
     * 결재자
     **/
    private String          sUserId;

    /**
     * 사용자 심사여부
     **/
    private String          sUseApproveCd;

    /**
     * 문서의 진행여부
     **/
    private String          sApprovesCd;

    /**
     * 차량등록여부
     **/
    private String          sCarImgYn;

    /**
     * 사업부
     */
    private String          sDiviCd;
    /**
     * 사무소
     */
    private String          sOffCd;

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
     * @return the sReqCarNo
     */
    public String getsReqCarNo() {
        return sReqCarNo;
    }

    /**
     * @param sReqCarNo the sReqCarNo to set
     */
    public void setsReqCarNo(String sReqCarNo) {
        this.sReqCarNo = sReqCarNo;
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
     * @return the sUserId
     */
    public String getsUserId() {
        return sUserId;
    }

    /**
     * @param sUserId the sUserId to set
     */
    public void setsUserId(String sUserId) {
        this.sUserId = sUserId;
    }

    /**
     * @return the sUseApproveCd
     */
    public String getsUseApproveCd() {
        return sUseApproveCd;
    }

    /**
     * @param sUseApproveCd the sUseApproveCd to set
     */
    public void setsUseApproveCd(String sUseApproveCd) {
        this.sUseApproveCd = sUseApproveCd;
    }

    /**
     * @return the sApprovesCd
     */
    public String getsApprovesCd() {
        return sApprovesCd;
    }

    /**
     * @param sApprovesCd the sApprovesCd to set
     */
    public void setsApprovesCd(String sApprovesCd) {
        this.sApprovesCd = sApprovesCd;
    }

    /**
     * @return the sCarImgYn
     */
    public String getsCarImgYn() {
        return sCarImgYn;
    }

    /**
     * @param sCarImgYn the sCarImgYn to set
     */
    public void setsCarImgYn(String sCarImgYn) {
        this.sCarImgYn = sCarImgYn;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
