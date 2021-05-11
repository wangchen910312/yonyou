package chn.bhmc.dms.bat.crm.dmm.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipGradeChgSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 8. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BatMembershipGradeChgVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1303487977266476370L;

    private String dlrCd;          //딜러코드
    private String stdPridMonth;   //기준최근
    private String result;         //결과
    private String cnt;            //결과수


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
     * @return the stdPridMonth
     */
    public String getStdPridMonth() {
        return stdPridMonth;
    }
    /**
     * @param stdPridMonth the stdPridMonth to set
     */
    public void setStdPridMonth(String stdPridMonth) {
        this.stdPridMonth = stdPridMonth;
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
    /**
     * @return the cnt
     */



    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
    /**
     * @return the cnt
     */
    public String getCnt() {
        return cnt;
    }
    /**
     * @param cnt the cnt to set
     */
    public void setCnt(String cnt) {
        this.cnt = cnt;
    }




}
