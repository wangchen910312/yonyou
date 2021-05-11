package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationJdgVO
 * @Description : 집단판매신청 상세 차량 심사정보 조회 VO
 * @author Bong
 * @since 2016. 3. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.03.25      Bong              최초 생성
 * </pre>
 */
@ValidDescriptor({

   })
public class GroupSalesApplicationJdgVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2396054457495152808L;

    private  int        reqSeq;         //요청번호
    private  int        reqNo;          //요청 하위 일련번호

    private  String     dlrCd;          //딜러코드
    private  String     usrId;          //사용자ID

    private  String     pevalId;        //심사자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       evalDt;         //심사일자

    private  String     evalRsltYn;     //심사결과
    private  String     remark;         //심사평가

    /**
     * @return the reqSeq
     */
    public int getReqSeq() {
        return reqSeq;
    }
    /**
     * @param reqSeq the reqSeq to set
     */
    public void setReqSeq(int reqSeq) {
        this.reqSeq = reqSeq;
    }
    /**
     * @return the reqNo
     */
    public int getReqNo() {
        return reqNo;
    }
    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(int reqNo) {
        this.reqNo = reqNo;
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
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }
    /**
     * @return the pevalId
     */
    public String getPevalId() {
        return pevalId;
    }
    /**
     * @param pevalId the pevalId to set
     */
    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }
    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }
    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
    }
    /**
     * @return the evalRsltYn
     */
    public String getEvalRsltYn() {
        return evalRsltYn;
    }
    /**
     * @param evalRsltYn the evalRsltYn to set
     */
    public void setEvalRsltYn(String evalRsltYn) {
        this.evalRsltYn = evalRsltYn;
    }
    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
