package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UnitInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Kang Seok Han     최초 생성
 * </pre>
 */

public class UnitInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5767805028719274141L;

    /**
     * 단위일련번호
     */
    private int unitSeq;

    /**
     * 단위코드
     */
    private String unitCd;

    /**
     * 단위외부코드
     */
    private String unitExtCd;

    /**
     * 단위유형
     */
    private String unitTp;

    /**
     * 단위명
     */
    private String unitNm;

    /**
     * 단위기준여부
     */
    private String unitStdYn;

    /**
     * 분자값
     */
    private long nmrtrVal;

    /**
     * 분모값
     */
    private long denmntrVal;

    /**
     * 단위사용여부
     */
    private String useYn;

    /**
     * @return the unitSeq
     */
    public int getUnitSeq() {
        return unitSeq;
    }
    /**
     * @param unitSeq the unitSeq to set
     */
    public void setUnitSeq(int unitSeq) {
        this.unitSeq = unitSeq;
    }
    /**
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }
    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }
    /**
     * @return the unitExtCd
     */
    public String getUnitExtCd() {
        return unitExtCd;
    }
    /**
     * @param unitExtCd the unitExtCd to set
     */
    public void setUnitExtCd(String unitExtCd) {
        this.unitExtCd = unitExtCd;
    }
    /**
     * @return the unitTp
     */
    public String getUnitTp() {
        return unitTp;
    }
    /**
     * @param unitTp the unitTp to set
     */
    public void setUnitTp(String unitTp) {
        this.unitTp = unitTp;
    }
    /**
     * @return the unitNm
     */
    public String getUnitNm() {
        return unitNm;
    }
    /**
     * @param unitNm the unitNm to set
     */
    public void setUnitNm(String unitNm) {
        this.unitNm = unitNm;
    }
    /**
     * @return the unitStdYn
     */
    public String getUnitStdYn() {
        return unitStdYn;
    }
    /**
     * @param unitStdYn the unitStdYn to set
     */
    public void setUnitStdYn(String unitStdYn) {
        this.unitStdYn = unitStdYn;
    }
    /**
     * @return the nmrtrVal
     */
    public long getNmrtrVal() {
        return nmrtrVal;
    }
    /**
     * @param nmrtrVal the nmrtrVal to set
     */
    public void setNmrtrVal(long nmrtrVal) {
        this.nmrtrVal = nmrtrVal;
    }
    /**
     * @return the denmntrVal
     */
    public long getDenmntrVal() {
        return denmntrVal;
    }
    /**
     * @param denmntrVal the denmntrVal to set
     */
    public void setDenmntrVal(long denmntrVal) {
        this.denmntrVal = denmntrVal;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }




}
