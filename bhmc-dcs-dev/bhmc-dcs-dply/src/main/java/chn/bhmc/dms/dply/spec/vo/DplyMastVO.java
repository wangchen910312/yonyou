package chn.bhmc.dms.dply.spec.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyMastVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DplyMastVO extends BaseVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5569919592424568482L;



    /**
     * SPEC코드
     **/
    private String specCd                   ;

    /**
     * DEPLOY버전번호
     **/
    private String deployVerNo              ;

    /**
     * ORIGINAL DEPLOY버전번호 (FOR REDEPLOY)
     **/
    private String deployVerNoOrg           ;

    /**
     * 스케줄유형코드
     **/
    private String scheduleTpCd             ;

    /**
     * DEPLOY시작일자
     **/

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployStartDt              ;

    /**
     * DEPLOY종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployEndDt                ;

    /**
     * DEPLOY상태코드
     **/
    private String deployStatCd             ;

    /**
     * DEPLOY재시도횟수
     **/
    private int deployRetryCnt              ;

    /**
     * DEPLOY재시도간격값
     **/
    private int deployRetryIvalVal          ;

    /** 결과수신타임아웃시간
     *
     **/
    private int rsltReceiveTmoutHm          ;

    /**
     * ALIVECHECK실패허용여부
     **/
    private String achkFailAlwYn            ;

    /**
     * ALIVECHECK실패허용건수
     **/
    private int achkFailAlwCnt              ;

    /**
     * 허용실패DMS건수
     **/
    private int alwFailDmsCnt               ;

    /**
     * DMS그룹건수
     **/
    private int dmsGrpCnt                   ;

    /**
     * 처리결과공지여부
     **/
    private String procRsltNotiYn           ;

    /**
     * 등록자ID
     **/
    private String regUsrId                 ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt                      ;

    /**
     * 수정자ID
     **/
    private String updtUsrId                ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt                     ;

    /**
     * DEPLOY유형코드
     **/
    private String deployTpCd               ;

    /**
     * 처리결과공지완료여부
     **/
    private String procRsltNotiEndYn        ;

    /**
     * 처리결과공지완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date procRsltNotiEndDt          ;

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
     * @param scheduleTpCd the scheduleTpCd to set
     */
    public void setScheduleTpCd(String scheduleTpCd) {
        this.scheduleTpCd = scheduleTpCd;
    }

    /**
     * @return the scheduleTpCd
     */
    public String getScheduleTpCd() {
        return scheduleTpCd;
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
     * @param deployStatCd the deployStatCd to set
     */
    public void setDeployStatCd(String deployStatCd) {
        this.deployStatCd = deployStatCd;
    }

    /**
     * @return the deployStatCd
     */
    public String getDeployStatCd() {
        return deployStatCd;
    }

    /**
     * @param deployRetryCnt the deployRetryCnt to set
     */
    public void setDeployRetryCnt(int deployRetryCnt) {
        this.deployRetryCnt = deployRetryCnt;
    }

    /**
     * @return the deployRetryCnt
     */
    public int getDeployRetryCnt() {
        return deployRetryCnt;
    }

    /**
     * @param deployRetryIvalVal the deployRetryIvalVal to set
     */
    public void setDeployRetryIvalVal(int deployRetryIvalVal) {
        this.deployRetryIvalVal = deployRetryIvalVal;
    }

    /**
     * @return the deployRetryIvalVal
     */
    public int getDeployRetryIvalVal() {
        return deployRetryIvalVal;
    }

    /**
     * @param rsltReceiveTmoutHm the rsltReceiveTmoutHm to set
     */
    public void setRsltReceiveTmoutHm(int rsltReceiveTmoutHm) {
        this.rsltReceiveTmoutHm = rsltReceiveTmoutHm;
    }

    /**
     * @return the rsltReceiveTmoutHm
     */
    public int getRsltReceiveTmoutHm() {
        return rsltReceiveTmoutHm;
    }

    /**
     * @param achkFailAlwYn the achkFailAlwYn to set
     */
    public void setAchkFailAlwYn(String achkFailAlwYn) {
        this.achkFailAlwYn = achkFailAlwYn;
    }

    /**
     * @return the achkFailAlwYn
     */
    public String getAchkFailAlwYn() {
        return achkFailAlwYn;
    }

    /**
     * @param achkFailAlwCnt the achkFailAlwCnt to set
     */
    public void setAchkFailAlwCnt(int achkFailAlwCnt) {
        this.achkFailAlwCnt = achkFailAlwCnt;
    }

    /**
     * @return the achkFailAlwCnt
     */
    public int getAchkFailAlwCnt() {
        return achkFailAlwCnt;
    }

    /**
     * @param alwFailDmsCnt the alwFailDmsCnt to set
     */
    public void setAlwFailDmsCnt(int alwFailDmsCnt) {
        this.alwFailDmsCnt = alwFailDmsCnt;
    }

    /**
     * @return the alwFailDmsCnt
     */
    public int getAlwFailDmsCnt() {
        return alwFailDmsCnt;
    }

    /**
     * @param dmsGrpCnt the dmsGrpCnt to set
     */
    public void setDmsGrpCnt(int dmsGrpCnt) {
        this.dmsGrpCnt = dmsGrpCnt;
    }

    /**
     * @return the dmsGrpCnt
     */
    public int getDmsGrpCnt() {
        return dmsGrpCnt;
    }

    /**
     * @param procRsltNotiYn the procRsltNotiYn to set
     */
    public void setProcRsltNotiYn(String procRsltNotiYn) {
        this.procRsltNotiYn = procRsltNotiYn;
    }

    /**
     * @return the procRsltNotiYn
     */
    public String getProcRsltNotiYn() {
        return procRsltNotiYn;
    }

    /**
     * @param deployTpCd the deployTpCd to set
     */
    public void setDeployTpCd(String deployTpCd) {
        this.deployTpCd = deployTpCd;
    }

    /**
     * @return the deployTpCd
     */
    public String getDeployTpCd() {
        return deployTpCd;
    }

    /**
     * @param procRsltNotiEndYn the procRsltNotiEndYn to set
     */
    public void setProcRsltNotiEndYn(String procRsltNotiEndYn) {
        this.procRsltNotiEndYn = procRsltNotiEndYn;
    }

    /**
     * @return the procRsltNotiEndYn
     */
    public String getProcRsltNotiEndYn() {
        return procRsltNotiEndYn;
    }

    /**
     * @param procRsltNotiEndDt the procRsltNotiEndDt to set
     */
    public void setProcRsltNotiEndDt(Date procRsltNotiEndDt) {
        this.procRsltNotiEndDt = procRsltNotiEndDt;
    }

    /**
     * @return the procRsltNotiEndDt
     */
    public Date getProcRsltNotiEndDt() {
        return procRsltNotiEndDt;
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

    /**
     * @param deployVerNoOrg the deployVerNoOrg to set
     */
    public void setDeployVerNoOrg(String deployVerNoOrg) {
        this.deployVerNoOrg = deployVerNoOrg;
    }

    /**
     * @return the deployVerNoOrg
     */
    public String getDeployVerNoOrg() {
        return deployVerNoOrg;
    }



}
