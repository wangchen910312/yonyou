package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyGrpVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 12.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DplyGrpVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9075508155594128342L;


    /**  SPEC코드                           **/
    private String specCd              ;

    /**  DEPLOY버전번호                    **/
    private String deployVerNo         ;

    /**  DEPLOY그룹ID                 **/
    private String deployGrpId         ;

    /**  DEPLOY우선순위값                  **/
    private int deployProrVal          ;

    /**  등록자ID                     **/
    private String regUsrId            ;

    /**  등록일자                            **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt                 ;

    /**  수정자ID                     **/
    private String updtUsrId           ;

    /**  수정일자                            **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt                ;

    /**  DEPLOY대상딜러건수                **/
    private int deployTargDlrCnt       ;

    /**  DEPLOY완료딜러건수                **/
    private int deployEndDlrCnt       ;

    /**  DEPLOY시작일자                    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployStartDt         ;

    /**  DEPLOY종료일자                    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployEndDt           ;

    /**
     * @param specCd the specCd to set
     */
    public void setSpecCd(String specCd) {
        this.specCd = specCd;
    }

    /**
     * @return the specCd
     */
    public String getSpecCd() {
        return specCd;
    }

    /**
     * @param deployVerNo the deployVerNo to set
     */
    public void setDeployVerNo(String deployVerNo) {
        this.deployVerNo = deployVerNo;
    }

    /**
     * @return the deployVerNo
     */
    public String getDeployVerNo() {
        return deployVerNo;
    }

    /**
     * @param deployGrpId the deployGrpId to set
     */
    public void setDeployGrpId(String deployGrpId) {
        this.deployGrpId = deployGrpId;
    }

    /**
     * @return the deployGrpId
     */
    public String getDeployGrpId() {
        return deployGrpId;
    }

    /**
     * @param deployProrVal the deployProrVal to set
     */
    public void setDeployProrVal(int deployProrVal) {
        this.deployProrVal = deployProrVal;
    }

    /**
     * @return the deployProrVal
     */
    public int getDeployProrVal() {
        return deployProrVal;
    }

    /**
     * @param deployTargDlrCnt the deployTargDlrCnt to set
     */
    public void setDeployTargDlrCnt(int deployTargDlrCnt) {
        this.deployTargDlrCnt = deployTargDlrCnt;
    }

    /**
     * @return the deployTargDlrCnt
     */
    public int getDeployTargDlrCnt() {
        return deployTargDlrCnt;
    }

    /**
     * @param deployEndDlrCnt the deployEndDlrCnt to set
     */
    public void setDeployEndDlrCnt(int deployEndDlrCnt) {
        this.deployEndDlrCnt = deployEndDlrCnt;
    }

    /**
     * @return the deployEndDlrCnt
     */
    public int getDeployEndDlrCnt() {
        return deployEndDlrCnt;
    }

    /**
     * @param deployStartDt the deployStartDt to set
     */
    public void setDeployStartDt(Date deployStartDt) {
        this.deployStartDt = deployStartDt;
    }

    /**
     * @return the deployStartDt
     */
    public Date getDeployStartDt() {
        return deployStartDt;
    }

    /**
     * @param deployEndDt the deployEndDt to set
     */
    public void setDeployEndDt(Date deployEndDt) {
        this.deployEndDt = deployEndDt;
    }

    /**
     * @return the deployEndDt
     */
    public Date getDeployEndDt() {
        return deployEndDt;
    }


    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

}



