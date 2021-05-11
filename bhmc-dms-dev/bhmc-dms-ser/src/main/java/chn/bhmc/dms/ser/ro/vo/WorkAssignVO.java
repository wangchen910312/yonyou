package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 작업배정 VO
 * </pre>
 *
 * @ClassName   : WorkAssignVO.java
 * @Description : 작업배정 VO.
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class WorkAssignVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4537327758954400432L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * RO문서번호
     */
    @NotBlank
    private String roDocNo;

    /**
     * RO그룹번호
     */
    private String roGrpNo;

    /**
     * 라인번호
     */
    private String lineNo;

    /**
     * 베이번호
     */
    private String bayNo;

    /**
     * 베이명
     */
    private String bayNm;

    /**
     * 수리유형
     */
    private String rpirTp;

    /**
     * 수리코드
     */
    @NotBlank
    private String rpirCd;

    /**
     * 수리명
     */
    private String rpirNm;

    /**
     * 수리구분코드
     */
    private String rpirDstinCd;

    /**
     * 작업상태코드
     */
    private String wrkStatCd;

    /**
     * 품질검사코드
     */
    private String qtTestCd;

    /**
     * 실TecMan
     */
    private String realTecId;

     /**
     * 실TecMan
     */
    private String realTecNm;

    /**
     * 작업시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrkStartDt;

    /**
     * 작업종료일자
     */
    @NotNull
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrkEndDt;

    /**
     * 배정시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date allocStartDt;

    /**
     * 배정종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date allocEndDt;

    /**
     * 계획시간
     */
    private double planHm;

    /**
     * 배정시간
     */
    private double allocHm;

    /**
     * 배분공임
     */
    private double dstbHm;

    /**
     * 배정자 아이디
     */
    private String saId;

    /**
     * 배정자 아이디
     */
    private String saNm;

    /**
     * 배정상태코드
     */
    private String allocStatCd;

    /**
     * 중지원인코드
     */
    private String pauseCauCd;

    /**
     * 중지비고
     */
    private String pauseCauRmk;

    /**
     * 세차상태코드
     */
    private String carWashStatCd;

    /**
     * 페인트상태코드
     */
    private String paintStatCd;

    /**
     * 품질검사상태코드
     */
    private String qtTestStatCd;

    /**
     * 소조번호
     */
    private String wkgrpNo;

    /**
     * 소조명
     */
    private String wkgrpNm;

    /**
     * 페인트수량
     **/
    private double paintCnt;

    /**
     * 판금수량
     **/
    private double shtCnt;

    /**
     * 공임계수
     **/
    private double lbrCnt;

    /**
     * 난의도
     **/
    private double diffVal;

    /**
     * 페인트색상코드
     **/
    private String paintColorCd;

    /**
     * 차량색상코드
     **/
    private String carColorCd;

    /**
     * 페인트유형
     **/
    private String paintTp;

    /**
     * 배정 비고
     */
    private String allocRemark;

    /**
     * 예정인도시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcDlDt;

    /**
     * 품질검사시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestStartDt;

    /**
     * 품질검사종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestEndDt;

    /**
     * 품질검사자명
     */
    private String qtTestPrsnNm;
    /**
     * 품질검사자코드
     */
    private String qtTestPrsnCd;

    /**
     * 로우 번호
     */
    private int rnum;

    /**
     * 등록자 아이디
     */
    private String regUsrId;

    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정자 아이디
     */
    private String updtUsrId;

    /**
     * 배정 완료 상태여부 : (Y: 전부 완료 , N : 미완료 )
     */
    private String allocYn;

    /**
     * 진도상태  완료 상태여부 : (Y: 전부 완료 , N : 미완료 )
     */
    private String wrkYn;

    /**
     * 품질검사  완료 상태여부 : (Y: 전부 완료 , N : 미완료 )
     */
    private String qtTestYn;

    /**
     * 수정일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 직원번호(시스템번호)
     */
    private String sysNo;

    /**
     * 리워크여부
     */
    private String rwrkStatCd;

    /**
     * 리워크원인
     */
    private String rwrkCd;

    /**
     * 리워크시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rwrkDt;

    /**
     * 리워크자
     */
    private String rwrkerId;
    private String rwrkerNm;

    /**
     * 리워크비고
     */
    private String rwrkRemark;


    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getRoDocNo() {
        return roDocNo;
    }

    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    public String getLineNo() {
        return lineNo;
    }

    public void setLineNo(String lineNo) {
        this.lineNo = lineNo;
    }

    public String getBayNo() {
        return bayNo;
    }

    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }


    public String getWrkStatCd() {
        return wrkStatCd;
    }

    public void setWrkStatCd(String wrkStatCd) {
        this.wrkStatCd = wrkStatCd;
    }

    public String getQtTestCd() {
        return qtTestCd;
    }

    public void setQtTestCd(String qtTestCd) {
        this.qtTestCd = qtTestCd;
    }

    public Date getWrkStartDt() {
        return wrkStartDt;
    }

    public void setWrkStartDt(Date wrkStartDt) {
        this.wrkStartDt = wrkStartDt;
    }

    public Date getWrkEndDt() {
        return wrkEndDt;
    }

    public void setWrkEndDt(Date wrkEndDt) {
        this.wrkEndDt = wrkEndDt;
    }

    public String getRealTecId() {
        return realTecId;
    }

    public void setRealTecId(String realTecId) {
        this.realTecId = realTecId;
    }

    public String getBayNm() {
        return bayNm;
    }

    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
    }

    public String getRealTecNm() {
        return realTecNm;
    }

    public void setRealTecNm(String realTecNm) {
        this.realTecNm = realTecNm;
    }

    public String getSaId() {
        return saId;
    }

    public void setSaId(String saId) {
        this.saId = saId;
    }

    public String getSaNm() {
        return saNm;
    }

    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }

    public double getPlanHm() {
        return planHm;
    }

    public void setPlanHm(double planHm) {
        this.planHm = planHm;
    }

    public String getPauseCauCd() {
        return pauseCauCd;
    }

    public void setPauseCauCd(String pauseCauCd) {
        this.pauseCauCd = pauseCauCd;
    }

    public String getPauseCauRmk() {
        return pauseCauRmk;
    }

    public void setPauseCauRmk(String pauseCauRmk) {
        this.pauseCauRmk = pauseCauRmk;
    }

    public String getCarWashStatCd() {
        return carWashStatCd;
    }

    public void setCarWashStatCd(String carWashStatCd) {
        this.carWashStatCd = carWashStatCd;
    }

    public String getPaintStatCd() {
        return paintStatCd;
    }

    public void setPaintStatCd(String paintStatCd) {
        this.paintStatCd = paintStatCd;
    }

    public String getQtTestStatCd() {
        return qtTestStatCd;
    }

    public void setQtTestStatCd(String qtTestStatCd) {
        this.qtTestStatCd = qtTestStatCd;
    }

    /**
     * @return the roGrpNo
     */
    public String getRoGrpNo() {
        return roGrpNo;
    }

    /**
     * @param roGrpNo the roGrpNo to set
     */
    public void setRoGrpNo(String roGrpNo) {
        this.roGrpNo = roGrpNo;
    }

    public String getWkgrpNo() {
        return wkgrpNo;
    }

    public void setWkgrpNo(String wkgrpNo) {
        this.wkgrpNo = wkgrpNo;
    }

    public String getWkgrpNm() {
        return wkgrpNm;
    }

    public void setWkgrpNm(String wkgrpNm) {
        this.wkgrpNm = wkgrpNm;
    }

    public String getPaintColorCd() {
        return paintColorCd;
    }

    public void setPaintColorCd(String paintColorCd) {
        this.paintColorCd = paintColorCd;
    }

    public String getCarColorCd() {
        return carColorCd;
    }

    public void setCarColorCd(String carColorCd) {
        this.carColorCd = carColorCd;
    }

    public String getPaintTp() {
        return paintTp;
    }

    public void setPaintTp(String paintTp) {
        this.paintTp = paintTp;
    }

    public String getRpirTp() {
        return rpirTp;
    }

    public void setRpirTp(String rpirTp) {
        this.rpirTp = rpirTp;
    }

    public String getRpirCd() {
        return rpirCd;
    }

    public void setRpirCd(String rpirCd) {
        this.rpirCd = rpirCd;
    }

    public String getRpirNm() {
        return rpirNm;
    }

    public void setRpirNm(String rpirNm) {
        this.rpirNm = rpirNm;
    }

    public String getRpirDstinCd() {
        return rpirDstinCd;
    }

    public void setRpirDstinCd(String rpirDstinCd) {
        this.rpirDstinCd = rpirDstinCd;
    }

    public double getAllocHm() {
        return allocHm;
    }

    public void setAllocHm(double allocHm) {
        this.allocHm = allocHm;
    }

    /**
     * @return the allocStartDt
     */
    public Date getAllocStartDt() {
        return allocStartDt;
    }

    /**
     * @param allocStartDt the allocStartDt to set
     */
    public void setAllocStartDt(Date allocStartDt) {
        this.allocStartDt = allocStartDt;
    }

    /**
     * @return the allocEndDt
     */
    public Date getAllocEndDt() {
        return allocEndDt;
    }

    /**
     * @param allocEndDt the allocEndDt to set
     */
    public void setAllocEndDt(Date allocEndDt) {
        this.allocEndDt = allocEndDt;
    }

    /**
     * @return the paintCnt
     */
    public double getPaintCnt() {
        return paintCnt;
    }

    /**
     * @param paintCnt the paintCnt to set
     */
    public void setPaintCnt(double paintCnt) {
        this.paintCnt = paintCnt;
    }

    /**
     * @return the shtCnt
     */
    public double getShtCnt() {
        return shtCnt;
    }

    /**
     * @param shtCnt the shtCnt to set
     */
    public void setShtCnt(double shtCnt) {
        this.shtCnt = shtCnt;
    }

    /**
     * @return the diffVal
     */
    public double getDiffVal() {
        return diffVal;
    }

    /**
     * @param diffVal the diffVal to set
     */
    public void setDiffVal(double diffVal) {
        this.diffVal = diffVal;
    }

    /**
     * @return the allocStatCd
     */
    public String getAllocStatCd() {
        return allocStatCd;
    }

    /**
     * @param allocStatCd the allocStatCd to set
     */
    public void setAllocStatCd(String allocStatCd) {
        this.allocStatCd = allocStatCd;
    }

    /**
     * @return the lbrCnt
     */
    public double getLbrCnt() {
        return lbrCnt;
    }

    /**
     * @param lbrCnt the lbrCnt to set
     */
    public void setLbrCnt(double lbrCnt) {
        this.lbrCnt = lbrCnt;
    }

    /**
     * @return the rwrkCd
     */
    public String getRwrkCd() {
        return rwrkCd;
    }

    /**
     * @param rwrkCd the rwrkCd to set
     */
    public void setRwrkCd(String rwrkCd) {
        this.rwrkCd = rwrkCd;
    }

    /**
     * @return the rwrkRemark
     */
    public String getRwrkRemark() {
        return rwrkRemark;
    }

    /**
     * @param rwrkRemark the rwrkRemark to set
     */
    public void setRwrkRemark(String rwrkRemark) {
        this.rwrkRemark = rwrkRemark;
    }

    /**
     * @return the expcDlDt
     */
    public Date getExpcDlDt() {
        return expcDlDt;
    }

    /**
     * @param expcDlDt the expcDlDt to set
     */
    public void setExpcDlDt(Date expcDlDt) {
        this.expcDlDt = expcDlDt;
    }

    /**
     * @return the qtTestStartDt
     */
    public Date getQtTestStartDt() {
        return qtTestStartDt;
    }

    /**
     * @param qtTestStartDt the qtTestStartDt to set
     */
    public void setQtTestStartDt(Date qtTestStartDt) {
        this.qtTestStartDt = qtTestStartDt;
    }

    /**
     * @return the qtTestEndDt
     */
    public Date getQtTestEndDt() {
        return qtTestEndDt;
    }

    /**
     * @param qtTestEndDt the qtTestEndDt to set
     */
    public void setQtTestEndDt(Date qtTestEndDt) {
        this.qtTestEndDt = qtTestEndDt;
    }

    /**
     * @return the qtTestPrsnNm
     */
    public String getQtTestPrsnNm() {
        return qtTestPrsnNm;
    }

    /**
     * @param qtTestPrsnNm the qtTestPrsnNm to set
     */
    public void setQtTestPrsnNm(String qtTestPrsnNm) {
        this.qtTestPrsnNm = qtTestPrsnNm;
    }

    /**
     * @return the qtTestPrsnCd
     */
    public String getQtTestPrsnCd() {
        return qtTestPrsnCd;
    }

    /**
     * @param qtTestPrsnCd the qtTestPrsnCd to set
     */
    public void setQtTestPrsnCd(String qtTestPrsnCd) {
        this.qtTestPrsnCd = qtTestPrsnCd;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the rnum
     */
    public int getRnum() {
        return rnum;
    }

    /**
     * @param rnum the rnum to set
     */
    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the dstbHm
     */
    public double getDstbHm() {
        return dstbHm;
    }

    /**
     * @param dstbHm the dstbHm to set
     */
    public void setDstbHm(double dstbHm) {
        this.dstbHm = dstbHm;
    }

    /**
     * @return the allocYn
     */
    public String getAllocYn() {
        return allocYn;
    }

    /**
     * @param allocYn the allocYn to set
     */
    public void setAllocYn(String allocYn) {
        this.allocYn = allocYn;
    }

    /**
     * @return the wrkYn
     */
    public String getWrkYn() {
        return wrkYn;
    }

    /**
     * @param wrkYn the wrkYn to set
     */
    public void setWrkYn(String wrkYn) {
        this.wrkYn = wrkYn;
    }

    /**
     * @return the qtTestYn
     */
    public String getQtTestYn() {
        return qtTestYn;
    }

    /**
     * @param qtTestYn the qtTestYn to set
     */
    public void setQtTestYn(String qtTestYn) {
        this.qtTestYn = qtTestYn;
    }

    /**
     * @return the sysNo
     */
    public String getSysNo() {
        return sysNo;
    }

    /**
     * @param sysNo the sysNo to set
     */
    public void setSysNo(String sysNo) {
        this.sysNo = sysNo;
    }

    /**
     * @return the allocRemark
     */
    public String getAllocRemark() {
        return allocRemark;
    }

    /**
     * @param allocRemark the allocRemark to set
     */
    public void setAllocRemark(String allocRemark) {
        this.allocRemark = allocRemark;
    }

    /**
     * @param rwrkStatCd the rwrkStatCd to set
     */
    public void setRwrkStatCd(String rwrkStatCd) {
        this.rwrkStatCd = rwrkStatCd;
    }

    /**
     * @return the rwrkStatCd
     */
    public String getRwrkStatCd() {
        return rwrkStatCd;
    }

    /**
     * @param rwrkDt the rwrkDt to set
     */
    public void setRwrkDt(Date rwrkDt) {
        this.rwrkDt = rwrkDt;
    }

    /**
     * @return the rwrkDt
     */
    public Date getRwrkDt() {
        return rwrkDt;
    }

    /**
     * @param rwrkerNm the rwrkerNm to set
     */
    public void setRwrkerNm(String rwrkerNm) {
        this.rwrkerNm = rwrkerNm;
    }

    /**
     * @return the rwrkerNm
     */
    public String getRwrkerNm() {
        return rwrkerNm;
    }

    /**
     * @param rwrkerId the rwrkerId to set
     */
    public void setRwrkerId(String rwrkerId) {
        this.rwrkerId = rwrkerId;
    }

    /**
     * @return the rwrkerId
     */
    public String getRwrkerId() {
        return rwrkerId;
    }

}
