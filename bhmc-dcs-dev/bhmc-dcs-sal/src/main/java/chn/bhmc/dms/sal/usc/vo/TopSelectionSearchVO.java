package chn.bhmc.dms.sal.usc.vo;


import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TopSelectionSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.      Kim yewon              최초 생성
 * </pre>
 */

public class TopSelectionSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sShenheStat;             //인증정보상태
    private String sVinNo;                  //VIN NO
    private String sCreateStartTime;        //신청시간 - 시작시간
    private String sCreateEndTime;          //신청시간 - 종료시간
    private String sCarId;                  //CAR ID
    private String sId;                     //ID(순번)



    /**
     * @return the sId
     */
    public String getsId() {
        return sId;
    }
    /**
     * @param sId the sId to set
     */
    public void setsId(String sId) {
        this.sId = sId;
    }
    /**
     * @return the sCarId
     */
    public String getsCarId() {
        return sCarId;
    }
    /**
     * @param sCarId the sCarId to set
     */
    public void setsCarId(String sCarId) {
        this.sCarId = sCarId;
    }
    /**
     * @return the sShenheStat
     */
    public String getsShenheStat() {
        return sShenheStat;
    }
    /**
     * @param sShenheStat the sShenheStat to set
     */
    public void setsShenheStat(String sShenheStat) {
        this.sShenheStat = sShenheStat;
    }
    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }
    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }
    /**
     * @return the sCreateStartTime
     */
    public String getsCreateStartTime() {
        return sCreateStartTime;
    }
    /**
     * @param sCreateStartTime the sCreateStartTime to set
     */
    public void setsCreateStartTime(String sCreateStartTime) {
        this.sCreateStartTime = sCreateStartTime;
    }
    /**
     * @return the sCreateEndTime
     */
    public String getsCreateEndTime() {
        return sCreateEndTime;
    }
    /**
     * @param sCreateEndTime the sCreateEndTime to set
     */
    public void setsCreateEndTime(String sCreateEndTime) {
        this.sCreateEndTime = sCreateEndTime;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
