package chn.bhmc.dms.bat.crm.css.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipPointExpVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 6. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BatMembershipPointExpVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3653670191209562763L;

    private String dlrCd;
    private int batAddDay;
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
     * @return the batAddDay
     */
    public int getBatAddDay() {
        return batAddDay;
    }
    /**
     * @param batAddDay the batAddDay to set
     */
    public void setBatAddDay(int batAddDay) {
        this.batAddDay = batAddDay;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
