package chn.bhmc.dms.bat.crm.css.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipPointDelVo.java
 * @Description : 멤버십 포인트 소멸 VO.
 * @author Kim Hyun Ho
 * @since 2016. 6. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 24.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BatMembershipPointDelVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5766733761223184990L;
    private String dlrCd; //딜러코드
    private String deptNm; //부서명
    private String prsnId; //담당자id
    private String result; //프로시저 결과값
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
     * @return the deptNm
     */
    public String getDeptNm() {
        return deptNm;
    }
    /**
     * @param deptNm the deptNm to set
     */
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }
    /**
     * @return the prsnId
     */
    public String getPrsnId() {
        return prsnId;
    }
    /**
     * @param prsnId the prsnId to set
     */
    public void setPrsnId(String prsnId) {
        this.prsnId = prsnId;
    }
    /**
     * @return the result
     */
    public String getResult() {
        return result;
    }
    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
