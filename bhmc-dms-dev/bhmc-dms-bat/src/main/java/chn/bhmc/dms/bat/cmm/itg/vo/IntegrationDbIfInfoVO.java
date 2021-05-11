package chn.bhmc.dms.bat.cmm.itg.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsMessageResultVO.java
 * @Description : SMS 전송을 결과를 저장하기 위한 VO
 * @author Choi Kyung Yong
 * @since 2016. 9. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since           author              description
 *  ===========    =============    ===========================
 *  2016. 9. 1.     Choi KyungYong           최초 생성
 * </pre>
 */

public class IntegrationDbIfInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4329292286228876981L;

    /**
     * 업무 구분 코드
     **/
    private String bizCd;

    /**
     * 반복 횟수
     **/
    private int loopCnt;

    /**
     * Camel 호출 대상 건수
     **/
    private int conditionCnt;

    /**
     * @return the bizCd
     */
    public String getBizCd() {
        return bizCd;
    }

    /**
     * @param bizCd the bizCd to set
     */
    public void setBizCd(String bizCd) {
        this.bizCd = bizCd;
    }

    /**
     * @return the loopCnt
     */
    public int getLoopCnt() {
        return loopCnt;
    }

    /**
     * @param loopCnt the loopCnt to set
     */
    public void setLoopCnt(int loopCnt) {
        this.loopCnt = loopCnt;
    }


    /**
     * @return the conditionCnt
     */
    public int getConditionCnt() {
        return conditionCnt;
    }

    /**
     * @param conditionCnt the conditionCnt to set
     */
    public void setConditionCnt(int conditionCnt) {
        this.conditionCnt = conditionCnt;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "IntegrationDbIfVO [bizCd=" + bizCd + ", loopCnt=" + loopCnt + ", conditionCnt=" + conditionCnt + "]";
    }

}
