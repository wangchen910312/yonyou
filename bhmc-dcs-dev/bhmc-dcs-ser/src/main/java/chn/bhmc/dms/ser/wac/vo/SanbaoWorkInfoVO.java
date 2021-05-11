package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoWorkInfoVO.java
 * @Description : 삼포 작업 정보
 * @author Kwon ki hyun
 * @since 2016. 7. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 29.     Kwon ki hyun     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="vinNo", mesgKey="ser.lbl.vinNo")
    ,@ValidField(field="dlrCd", mesgKey="ser.lbl.dlrCd")
    ,@ValidField(field="roDocNo", mesgKey="ser.lbl.roDocNo")
})
public class SanbaoWorkInfoVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -943461331177682507L;

    /**
     * 차대번호
     */
    private String vinNo;
    
    /**
     * 딜러코드
     */
    private String dlrCd;
    
    /**
     * RO번호
     */
    private String roDocNo;
    /**
     * 작업시작일
     */
    private Date roStartDt;
    /**
     * 작업종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roEndDt;
    /**
     * 작업소요일수
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private int roWorkHm;
    public String getVinNo() {
        return vinNo;
    }
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
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
    public Date getRoStartDt() {
        return roStartDt;
    }
    public void setRoStartDt(Date roStartDt) {
        this.roStartDt = roStartDt;
    }
    public Date getRoEndDt() {
        return roEndDt;
    }
    public void setRoEndDt(Date roEndDt) {
        this.roEndDt = roEndDt;
    }
    public int getRoWorkHm() {
        return roWorkHm;
    }
    public void setRoWorkHm(int roWorkHm) {
        this.roWorkHm = roWorkHm;
    }

}
