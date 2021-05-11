package chn.bhmc.dms.bat.sal.inc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * @ClassName   : IncProcessVO
 * @Description : 보험추적 VO
 * @author Kim Jin Suk
 * @since 2017. 02. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 02. 02.    Kim Jin Suk            최초 생성
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="incNo"           , mesgKey="sal.lbl.incNo")
   })
public class BatchIncProcessVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -5662670359448090764L;

    
    /**
     * 딜러코드
     */
    private  String           sDlrCd;
    
    /**
     * 보험알람 일수
     */
    private  int              sIncDay;
    
    
    /**
     * 딜러코드    
     **/
    private  String           dlrCd;           
     
    /**
     * 보험번호    
     **/
    private  String           incNo;           
     
    /**
     * 일련번호    
     **/
    private  String           seq;             
     
    /**
     * 추적내용    
     **/
    private  String           traceCont;       
     
    /**
     * 추적등급코드  
     **/
    private  String           traceGradeCd;    
     
    /**
     * 추적일자    
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             traceDt;         
     
    /**
     * 추적방법코드  
     **/
    private  String           traceMthCd;      
     
    /**
     * 다음추적일자  
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             nextTraceDt;     
     
    /**
     * 다음추적방법코드
     **/
    private  String           nextTraceMthCd;  
     
    /**
     * 유효등급코드  
     **/
    private  String           validGradeCd;    
     
    /**
     * 무효원인코드  
     **/
    private  String           invalidCauCd;    
     
    /**
     * 사용여부    
     **/
    private  String           useYn;
    
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
     * @return the sIncDay
     */
    public int getsIncDay() {
        return sIncDay;
    }

    /**
     * @param sIncDay the sIncDay to set
     */
    public void setsIncDay(int sIncDay) {
        this.sIncDay = sIncDay;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the incNo
     */
    public String getIncNo() {
        return incNo;
    }

    /**
     * @param incNo the incNo to set
     */
    public void setIncNo(String incNo) {
        this.incNo = incNo;
    }

    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the traceCont
     */
    public String getTraceCont() {
        return traceCont;
    }

    /**
     * @param traceCont the traceCont to set
     */
    public void setTraceCont(String traceCont) {
        this.traceCont = traceCont;
    }

    /**
     * @return the traceGradeCd
     */
    public String getTraceGradeCd() {
        return traceGradeCd;
    }

    /**
     * @param traceGradeCd the traceGradeCd to set
     */
    public void setTraceGradeCd(String traceGradeCd) {
        this.traceGradeCd = traceGradeCd;
    }

    /**
     * @return the traceDt
     */
    public Date getTraceDt() {
        return traceDt;
    }

    /**
     * @param traceDt the traceDt to set
     */
    public void setTraceDt(Date traceDt) {
        this.traceDt = traceDt;
    }

    /**
     * @return the traceMthCd
     */
    public String getTraceMthCd() {
        return traceMthCd;
    }

    /**
     * @param traceMthCd the traceMthCd to set
     */
    public void setTraceMthCd(String traceMthCd) {
        this.traceMthCd = traceMthCd;
    }

    /**
     * @return the nextTraceDt
     */
    public Date getNextTraceDt() {
        return nextTraceDt;
    }

    /**
     * @param nextTraceDt the nextTraceDt to set
     */
    public void setNextTraceDt(Date nextTraceDt) {
        this.nextTraceDt = nextTraceDt;
    }

    /**
     * @return the nextTraceMthCd
     */
    public String getNextTraceMthCd() {
        return nextTraceMthCd;
    }

    /**
     * @param nextTraceMthCd the nextTraceMthCd to set
     */
    public void setNextTraceMthCd(String nextTraceMthCd) {
        this.nextTraceMthCd = nextTraceMthCd;
    }

    /**
     * @return the validGradeCd
     */
    public String getValidGradeCd() {
        return validGradeCd;
    }

    /**
     * @param validGradeCd the validGradeCd to set
     */
    public void setValidGradeCd(String validGradeCd) {
        this.validGradeCd = validGradeCd;
    }

    /**
     * @return the invalidCauCd
     */
    public String getInvalidCauCd() {
        return invalidCauCd;
    }

    /**
     * @param invalidCauCd the invalidCauCd to set
     */
    public void setInvalidCauCd(String invalidCauCd) {
        this.invalidCauCd = invalidCauCd;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}