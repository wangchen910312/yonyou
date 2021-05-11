package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 시승 예약 캘린더 VO
 *
 * @ClassName   : TestDriveCalendarVO.java
 * @Description : TestDriveCalendarVO Class
 * @author in moon lee
 * @since 2016.05.10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.10.     in moon lee     최초 생성
 * </pre>
 */

public class TestDriveCalendarVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4475886711785328490L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                start;                 // 예약일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                end;                   //예약종료시간

    private  int            resvCnt;                 //예약수량
    private  int            cancelCnt;               //취소수량
    private  int            testDriveCnt;           //시승수량
    /**
     * @return the start
     */
    public Date getStart() {
        return start;
    }
    /**
     * @param start the start to set
     */
    public void setStart(Date start) {
        this.start = start;
    }
    /**
     * @return the end
     */
    public Date getEnd() {
        return end;
    }
    /**
     * @param end the end to set
     */
    public void setEnd(Date end) {
        this.end = end;
    }
    /**
     * @return the resvCnt
     */
    public int getResvCnt() {
        return resvCnt;
    }
    /**
     * @param resvCnt the resvCnt to set
     */
    public void setResvCnt(int resvCnt) {
        this.resvCnt = resvCnt;
    }
    /**
     * @return the cancelCnt
     */
    public int getCancelCnt() {
        return cancelCnt;
    }
    /**
     * @param cancelCnt the cancelCnt to set
     */
    public void setCancelCnt(int cancelCnt) {
        this.cancelCnt = cancelCnt;
    }
    /**
     * @return the testDriveCnt
     */
    public int getTestDriveCnt() {
        return testDriveCnt;
    }
    /**
     * @param testDriveCnt the testDriveCnt to set
     */
    public void setTestDriveCnt(int testDriveCnt) {
        this.testDriveCnt = testDriveCnt;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "TestDriveCalendarVO [start=" + start + ", end=" + end + ", resvCnt=" + resvCnt + ", cancelCnt="
                + cancelCnt + ", testDriveCnt=" + testDriveCnt + "]";
    }

}