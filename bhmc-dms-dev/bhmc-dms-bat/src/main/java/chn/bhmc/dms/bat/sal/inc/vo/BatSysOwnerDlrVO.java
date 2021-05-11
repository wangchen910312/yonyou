package chn.bhmc.dms.bat.sal.inc.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * @ClassName   : BatSysOwnerDlrVO
 * @Description : 딜러정보 VO
 * @author Kim Jin Suk
 * @since 2017. 04. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 04. 02.    Kim Jin Suk            최초 생성
 */

public class BatSysOwnerDlrVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 611277848105066726L;
    
    private String dlrCd;                   // 딜러코드
    private String dlrNm;                   // 딜러명
    private String insExpAlarmDay;          // 보험만료 알림 일수
    private String sysOwnerYn;              // 단일딜러여부
    private String useCenterDmsYn;          // 멀티딜러여부
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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the insExpAlarmDay
     */
    public String getInsExpAlarmDay() {
        return insExpAlarmDay;
    }
    /**
     * @param insExpAlarmDay the insExpAlarmDay to set
     */
    public void setInsExpAlarmDay(String insExpAlarmDay) {
        this.insExpAlarmDay = insExpAlarmDay;
    }
    /**
     * @return the sysOwnerYn
     */
    public String getSysOwnerYn() {
        return sysOwnerYn;
    }
    /**
     * @param sysOwnerYn the sysOwnerYn to set
     */
    public void setSysOwnerYn(String sysOwnerYn) {
        this.sysOwnerYn = sysOwnerYn;
    }
    /**
     * @return the useCenterDmsYn
     */
    public String getUseCenterDmsYn() {
        return useCenterDmsYn;
    }
    /**
     * @param useCenterDmsYn the useCenterDmsYn to set
     */
    public void setUseCenterDmsYn(String useCenterDmsYn) {
        this.useCenterDmsYn = useCenterDmsYn;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}