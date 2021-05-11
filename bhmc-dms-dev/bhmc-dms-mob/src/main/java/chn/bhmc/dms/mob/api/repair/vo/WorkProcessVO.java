package chn.bhmc.dms.mob.api.repair.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * 작업진도관리 VO
 * </pre>
 *
 * @ClassName   : WorkProcessVO.java
 * @Description : 작업진도관리 VO.
 * @author Yin Xueyuan
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class WorkProcessVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5363296548305687455L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * RO문서번호
     */
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
    private String rpirCd;

    /**
     * 수리명
     */
    private String rpirNm;

    /**
     * 조작일자
     **/
    private Date rpirDt;

    /**
     * 수리구분코드
     */
    private String rpirDstinCd;

    /**
     * 작업상태코드
     */
    private String wrkStatCd;

    /**
     * 작업상태명
     */
    private String wrkStatNm;

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
     * 예정인도일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcDlDt;

    /**
     * 변경된예정인도일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date chgExpcDlDt;

    /**
     * 배정상태코드
     */
    private String allocStatCd;


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
     * 계획시간
     */
    private double planHm;

    /**
     * 배정시간
     */
    private double allocHm;

    /**
     * 배정자 아이디
     */
    private String saId;

    /**
     * 배정자 아이디
     */
    private String saNm;

    /**
     * 배정자 명칭
     */
    private String pauseCauCd;

    /**
     * 배정자 명칭
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
    private int paintQty;

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
     * 일련번호
     */
    private int seq;

    /**
     * 유형
     */
    private String type;
    /**
     * 세차자명
     */
    private String carWashPrsnNm;
    /**
     * 세차자코드
     */
    private String carWashPrsnCd;
    /**
     * 세차시작시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carWashStartDt;
    /**
     * 세차완료시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carWashEndDt;
    /**
     * 품질검사자명
     */
    private String qtTestPrsnNm;
    /**
     * 품질검사자코드
     */
    private String qtTestPrsnCd;
    /**
     * 품질검사 시작시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestStartDt;
    /**
     * 품질검사 완료시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestEndDt;

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

    private double dstbHm;

    /**
     * 세차취소원인코드
     */
    private String carWashCancReasonCd;

    /**
     * 세차취소원인내용
     */
    private String carWashCancReasonCont;

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

    private String sysNo;

    private String allocRemark;

    public int getSeq() {
        return seq;
    }


    public void setSeq(int seq) {
        this.seq = seq;
    }


    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }


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


    public String getRoGrpNo() {
        return roGrpNo;
    }


    public void setRoGrpNo(String roGrpNo) {
        this.roGrpNo = roGrpNo;
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


    public String getBayNm() {
        return bayNm;
    }


    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
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


    public String getRealTecId() {
        return realTecId;
    }


    public void setRealTecId(String realTecId) {
        this.realTecId = realTecId;
    }


    public String getRealTecNm() {
        return realTecNm;
    }


    public void setRealTecNm(String realTecNm) {
        this.realTecNm = realTecNm;
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


    public double getPlanHm() {
        return planHm;
    }


    public void setPlanHm(double planHm) {
        this.planHm = planHm;
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


    public int getPaintQty() {
        return paintQty;
    }


    public void setPaintQty(int paintQty) {
        this.paintQty = paintQty;
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
     * @return the chgExpcDlDt
     */
    public Date getChgExpcDlDt() {
        return chgExpcDlDt;
    }

    /**
     * @param chgExpcDlDt the chgExpcDlDt to set
     */
    public void setChgExpcDlDt(Date chgExpcDlDt) {
        this.chgExpcDlDt = chgExpcDlDt;
    }

    /**
     * @return the carWashPrsnNm
     */
    public String getCarWashPrsnNm() {
        return carWashPrsnNm;
    }


    /**
     * @param carWashPrsnNm the carWashPrsnNm to set
     */
    public void setCarWashPrsnNm(String carWashPrsnNm) {
        this.carWashPrsnNm = carWashPrsnNm;
    }


    /**
     * @return the carWashPrsnCd
     */
    public String getCarWashPrsnCd() {
        return carWashPrsnCd;
    }


    /**
     * @param carWashPrsnCd the carWashPrsnCd to set
     */
    public void setCarWashPrsnCd(String carWashPrsnCd) {
        this.carWashPrsnCd = carWashPrsnCd;
    }


    /**
     * @return the carWashStartDt
     */
    public Date getCarWashStartDt() {
        return carWashStartDt;
    }


    /**
     * @param carWashStartDt the carWashStartDt to set
     */
    public void setCarWashStartDt(Date carWashStartDt) {
        this.carWashStartDt = carWashStartDt;
    }


    /**
     * @return the carWashEndDt
     */
    public Date getCarWashEndDt() {
        return carWashEndDt;
    }


    /**
     * @param carWashEndDt the carWashEndDt to set
     */
    public void setCarWashEndDt(Date carWashEndDt) {
        this.carWashEndDt = carWashEndDt;
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
     * @return the carWashCancReasonCd
     */
    public String getCarWashCancReasonCd() {
        return carWashCancReasonCd;
    }


    /**
     * @param carWashCancReasonCd the carWashCancReasonCd to set
     */
    public void setCarWashCancReasonCd(String carWashCancReasonCd) {
        this.carWashCancReasonCd = carWashCancReasonCd;
    }


    /**
     * @return the carWashCancReasonCont
     */
    public String getCarWashCancReasonCont() {
        return carWashCancReasonCont;
    }


    /**
     * @param carWashCancReasonCont the carWashCancReasonCont to set
     */
    public void setCarWashCancReasonCont(String carWashCancReasonCont) {
        this.carWashCancReasonCont = carWashCancReasonCont;
    }


    public String getAllocYn() {
        return allocYn;
    }


    public void setAllocYn(String allocYn) {
        this.allocYn = allocYn;
    }


    public String getWrkYn() {
        return wrkYn;
    }


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


    /**
     * @param rpirDt the rpirDt to set
     */
    public void setRpirDt(Date rpirDt) {
        this.rpirDt = rpirDt;
    }


    /**
     * @return the rpirDt
     */
    public Date getRpirDt() {
        return rpirDt;
    }


    /**
     * @param wrkStatNm the wrkStatNm to set
     */
    public void setWrkStatNm(String wrkStatNm) {
        this.wrkStatNm = wrkStatNm;
    }


    /**
     * @return the wrkStatNm
     */
    public String getWrkStatNm() {
        return wrkStatNm;
    }

}
