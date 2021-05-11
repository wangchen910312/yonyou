package chn.bhmc.dms.cmm.sci.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class AwayCustomerSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2798671032008539821L;

    private String  sRevDt;
    private String  sRevStartDt;
    private String  sRevEndDt;
    private String  sUsrId;
    private String  sRevStartHm;
    private String  sRevEndHm;
    private String  sRevCont;
    private List<Integer> sItems;

    /**
     * @return the sRevDt
     */
    public String getsRevDt() {
        return sRevDt;
    }
    /**
     * @param sRevDt the sRevDt to set
     */
    public void setsRevDt(String sRevDt) {
        this.sRevDt = sRevDt;
    }
    /**
     * @return the sRevStartDt
     */
    public String getsRevStartDt() {
        return sRevStartDt;
    }
    /**
     * @param sRevStartDt the sRevStartDt to set
     */
    public void setsRevStartDt(String sRevStartDt) {
        this.sRevStartDt = sRevStartDt;
    }
    /**
     * @return the sRevEndDt
     */
    public String getsRevEndDt() {
        return sRevEndDt;
    }
    /**
     * @param sRevEndDt the sRevEndDt to set
     */
    public void setsRevEndDt(String sRevEndDt) {
        this.sRevEndDt = sRevEndDt;
    }
    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }
    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }
    /**
     * @return the sRevStartHm
     */
    public String getsRevStartHm() {
        return sRevStartHm;
    }
    /**
     * @param sRevStartHm the sRevStartHm to set
     */
    public void setsRevStartHm(String sRevStartHm) {
        this.sRevStartHm = sRevStartHm;
    }
    /**
     * @return the sRevEndHm
     */
    public String getsRevEndHm() {
        return sRevEndHm;
    }
    /**
     * @param sRevEndHm the sRevEndHm to set
     */
    public void setsRevEndHm(String sRevEndHm) {
        this.sRevEndHm = sRevEndHm;
    }
    /**
     * @return the sRevCont
     */
    public String getsRevCont() {
        return sRevCont;
    }
    /**
     * @param sRevCont the sRevCont to set
     */
    public void setsRevCont(String sRevCont) {
        this.sRevCont = sRevCont;
    }
    /**
     * @return the sItems
     */
    public List<Integer> getsItems() {
        return sItems;
    }
    /**
     * @param sItems the sItems to set
     */
    public void setsItems(List<Integer> sItems) {
        this.sItems = sItems;
    }
}