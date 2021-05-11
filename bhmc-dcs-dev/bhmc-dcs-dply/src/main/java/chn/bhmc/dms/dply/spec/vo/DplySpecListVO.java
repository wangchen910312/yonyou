package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplySpecListVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DplySpecListVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4064751221290834229L;

    private String specCd;

    private String specTp;

    private String specNm;

    private String specCont;

    private int dmsCnt;

    private int bdlCnt;

    private int sqlCnt;

    private int propCnt;

    private int fileCnt;

    private int commandCnt;

    private String dplyList;

    private int workCnt    ;

    private int readyCnt   ;

    private int runCnt     ;

    private int endCnt     ;


    /**
     * 등록일
     **/
    //REG_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정일
     **/
    //UPDATE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 수정일
     **/
    //UPDATE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date schdlDt;



    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        // TODO Auto-generated method stub

    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        // TODO Auto-generated method stub
        return null;
    }

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
     * @param specTp the specTp to set
     */
    public void setSpecTp(String specTp) {
        this.specTp = specTp;
    }

    /**
     * @return the specTp
     */
    public String getSpecTp() {
        return specTp;
    }

    /**
     * @param specNm the specNm to set
     */
    public void setSpecNm(String specNm) {
        this.specNm = specNm;
    }

    /**
     * @return the specNm
     */
    public String getSpecNm() {
        return specNm;
    }

    /**
     * @param specCont the specCont to set
     */
    public void setSpecCont(String specCont) {
        this.specCont = specCont;
    }

    /**
     * @return the specCont
     */
    public String getSpecCont() {
        return specCont;
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
     * @param schdlDt the schdlDt to set
     */
    public void setSchdlDt(Date schdlDt) {
        this.schdlDt = schdlDt;
    }

    /**
     * @return the schdlDt
     */
    public Date getSchdlDt() {
        return schdlDt;
    }

    /**
     * @param dmsCnt the dmsCnt to set
     */
    public void setDmsCnt(int dmsCnt) {
        this.dmsCnt = dmsCnt;
    }

    /**
     * @return the dmsCnt
     */
    public int getDmsCnt() {
        return dmsCnt;
    }

    /**
     * @param bdlCnt the bdlCnt to set
     */
    public void setBdlCnt(int bdlCnt) {
        this.bdlCnt = bdlCnt;
    }

    /**
     * @return the bdlCnt
     */
    public int getBdlCnt() {
        return bdlCnt;
    }

    /**
     * @param sqlCnt the sqlCnt to set
     */
    public void setSqlCnt(int sqlCnt) {
        this.sqlCnt = sqlCnt;
    }

    /**
     * @return the sqlCnt
     */
    public int getSqlCnt() {
        return sqlCnt;
    }

    /**
     * @param propCnt the propCnt to set
     */
    public void setPropCnt(int propCnt) {
        this.propCnt = propCnt;
    }

    /**
     * @return the propCnt
     */
    public int getPropCnt() {
        return propCnt;
    }

    /**
     * @param dplyList the dplyList to set
     */
    public void setDplyList(String dplyList) {
        this.dplyList = dplyList;
    }

    /**
     * @return the dplyList
     */
    public String getDplyList() {
        return dplyList;
    }

    /**
     * @param fileCnt the fileCnt to set
     */
    public void setFileCnt(int fileCnt) {
        this.fileCnt = fileCnt;
    }

    /**
     * @return the fileCnt
     */
    public int getFileCnt() {
        return fileCnt;
    }

    /**
     * @param commandCnt the commandCnt to set
     */
    public void setCommandCnt(int commandCnt) {
        this.commandCnt = commandCnt;
    }

    /**
     * @return the commandCnt
     */
    public int getCommandCnt() {
        return commandCnt;
    }

    /**
     * @param workCnt the workCnt to set
     */
    public void setWorkCnt(int workCnt) {
        this.workCnt = workCnt;
    }

    /**
     * @return the workCnt
     */
    public int getWorkCnt() {
        return workCnt;
    }

    /**
     * @param readyCnt the readyCnt to set
     */
    public void setReadyCnt(int readyCnt) {
        this.readyCnt = readyCnt;
    }

    /**
     * @return the readyCnt
     */
    public int getReadyCnt() {
        return readyCnt;
    }

    /**
     * @param runCnt the runCnt to set
     */
    public void setRunCnt(int runCnt) {
        this.runCnt = runCnt;
    }

    /**
     * @return the runCnt
     */
    public int getRunCnt() {
        return runCnt;
    }

    /**
     * @param endCnt the endCnt to set
     */
    public void setEndCnt(int endCnt) {
        this.endCnt = endCnt;
    }

    /**
     * @return the endCnt
     */
    public int getEndCnt() {
        return endCnt;
    }


}
