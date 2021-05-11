package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrReqSpVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 7.     HG                      최초 생성
 * </pre>
 */

public class LogisticsTpAddrReqSpVO extends BaseVO {
    
     /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -5763237737062394199L;

    private String eaiId;
     
    private String dlrCd;
 
    private String usrId;
 
    private Integer reqNo;
 
    private Date reqDt;

    public String getEaiId() {
        return eaiId;
    }

    public void setEaiId(String eaiId) {
        this.eaiId = eaiId;
    }

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getUsrId() {
        return usrId;
    }

    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    public Integer getReqNo() {
        return reqNo;
    }

    public void setReqNo(Integer reqNo) {
        this.reqNo = reqNo;
    }

    public Date getReqDt() {
        return reqDt;
    }

    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

}
