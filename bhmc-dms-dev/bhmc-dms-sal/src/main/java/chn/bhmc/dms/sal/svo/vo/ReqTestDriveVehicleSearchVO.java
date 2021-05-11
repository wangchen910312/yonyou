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
 * @ClassName   : ReqTestDriveVehicleSearchVO
 * @Description : 시승차량신청 목록 설명을 기술합니다.
 * @author Bong
 * @since 2016. 3. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.03      Bong                최초 생성
 * </pre>
 */

public class ReqTestDriveVehicleSearchVO extends SearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1871621823477142022L;

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
     * 심사일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sStartEvalDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sEndEvalDt;

    /**
     * 심사여부
     **/
    private  String          sEvalRsltYn;

    /**
     * 합격여부
     */
    private  String          sFsdmAgrYn;

    /**
     * 보충자료 여부
     **/
    private  String          sFileYn;



    private String sCarlineCd;                      //차종코드
    private String sFscCd;                          //차관코드
    private String sModelCd;                        //모델코드
    private String sOcnCd;                          //OCN코드
    private String sExtColorCd;                     //외장색코드
    private String sIntColorCd;                     //내장색코드

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   sLastApproveDt;                  //최종심사일자


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
     * @return the sFscCd
     */
    public String getsFscCd() {
        return sFscCd;
    }

    /**
     * @param sFscCd the sFscCd to set
     */
    public void setsFscCd(String sFscCd) {
        this.sFscCd = sFscCd;
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
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }

    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }

    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }

    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }

    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }

    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }
    
    /**
     * @return the sLastApproveDt
     */
    public Date getsLastApproveDt() {
        return sLastApproveDt;
    }

    /**
     * @param sLastApproveDt the sLastApproveDt to set
     */
    public void setsLastApproveDt(Date sLastApproveDt) {
        this.sLastApproveDt = sLastApproveDt;
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
     * @return the sReqNo
     */
    public int getsReqNo() {
        return sReqNo;
    }

    /**
     * @param sReqNo the sReqNo to set
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
     * @return the sStartEvalDt
     */
    public Date getsStartEvalDt() {
        return sStartEvalDt;
    }

    /**
     * @param sStartEvalDt the sStartEvalDt to set
     */
    public void setsStartEvalDt(Date sStartEvalDt) {
        this.sStartEvalDt = sStartEvalDt;
    }

    /**
     * @return the sEndEvalDt
     */
    public Date getsEndEvalDt() {
        return sEndEvalDt;
    }

    /**
     * @param sEndEvalDt the sEndEvalDt to set
     */
    public void setsEndEvalDt(Date sEndEvalDt) {
        this.sEndEvalDt = sEndEvalDt;
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
     * @return the sFsdmAgrYn
     */
    public String getsFsdmAgrYn() {
        return sFsdmAgrYn;
    }

    /**
     * @param sFsdmAgrYn the sFsdmAgrYn to set
     */
    public void setsFsdmAgrYn(String sFsdmAgrYn) {
        this.sFsdmAgrYn = sFsdmAgrYn;
    }

    /**
     * @return the sFileYn
     */
    public String getsFileYn() {
        return sFileYn;
    }

    /**
     * @param sFileYn the sFileYn to set
     */
    public void setsFileYn(String sFileYn) {
        this.sFileYn = sFileYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
