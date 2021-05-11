package chn.bhmc.dms.bat.crm.cmm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatDcsDataInVO
 * @Description : 블루멤버십 회원정보(인터페이스) VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BatDcsDataInVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("O_DMS_DATA_UP_DT")
    private String oDmsDataUpDt; //yyyymmdd

    @JsonProperty("O_ALL_YN")
    private String oAllYn; //전체 데이터 요청여부 N : 전체데이터 입력된적 없음. Y : 전체데이터 입력된적 있음.

    @JsonProperty("O_STAT_CD")
    private String oStatCd; //상태 S/F

    @JsonProperty("O_MESG_CONT")
    private String oMesgCont; //오류 메시지

    public BatDcsDataInVO(){}

    /**
     * @return the oDmsDataUpDt
     */
    public String getoDmsDataUpDt() {
        return oDmsDataUpDt;
    }

    /**
     * @param oDmsDataUpDt the oDmsDataUpDt to set
     */
    public void setoDmsDataUpDt(String oDmsDataUpDt) {
        this.oDmsDataUpDt = oDmsDataUpDt;
    }

    /**
     * @return the oAllYn
     */
    public String getoAllYn() {
        return oAllYn;
    }

    /**
     * @param oAllYn the oAllYn to set
     */
    public void setoAllYn(String oAllYn) {
        this.oAllYn = oAllYn;
    }

    /**
     * @return the oStatCd
     */
    public String getoStatCd() {
        return oStatCd;
    }

    /**
     * @param oStatCd the oStatCd to set
     */
    public void setoStatCd(String oStatCd) {
        this.oStatCd = oStatCd;
    }

    /**
     * @return the oMesgCont
     */
    public String getoMesgCont() {
        return oMesgCont;
    }

    /**
     * @param oMesgCont the oMesgCont to set
     */
    public void setoMesgCont(String oMesgCont) {
        this.oMesgCont = oMesgCont;
    }

}
