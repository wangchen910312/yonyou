package chn.bhmc.dms.sal.orc.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderVO.java
 * @Description : 미배정 주문조회 grid VO
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.       Bong                최초 생성
 * </pre>
 */

public class NotAssignedOrderVO  extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1743838956798043520L;

    private String ordpCndy;            // 주문일자
    private String salesNo;             // 주문번호
    private String sord;                // 주문유형
    private String carlineCd;           // 차종코드
    private String carlineNm;           // 차종명
    private String modelCd;             // 모델코드
    private String modelNm;             // 모델명
    private String ocnCd;               // ocn 코드
    private String ocnNm;               // ocn 명
    private String extColorCd;          // 외장색 코드
    private String extColorNm;          // 외장색명
    private String intColorCd;          // 내장색 코드
    private String intColorNm;          // 내장색 명
    private String chrgCd;              // 주문자
    private String ordpExno;            // 납기예시일

    private double mdpr;                // DC전 가격
    private double aftMdpr;             // DC후 가격
    private double adjp;                // 할인금액
    private double ordpVapr;            // 필요자금
    private int ordpCount;              // 오더수량
    
    /**
     * qian2019-05-17自动化月结开始
     */
    private String ordYymm;             
    private String ordWeek;              
    private int ordSeq;              
    
    public String getOrdYymm() {
		return ordYymm;
	}
	public void setOrdYymm(String ordYymm) {
		this.ordYymm = ordYymm;
	}
	public String getOrdWeek() {
		return ordWeek;
	}
	public void setOrdWeek(String ordWeek) {
		this.ordWeek = ordWeek;
	}
	public int getOrdSeq() {
		return ordSeq;
	}
	public void setOrdSeq(int ordSeq) {
		this.ordSeq = ordSeq;
	}
	/**
     * qian2019-05-17自动化月结结束
     */
	
	
	/**
     * @return the ordpCndy
     */
    public String getOrdpCndy() {
        return ordpCndy;
    }
    /**
     * @param ordpCndy the ordpCndy to set
     */
    public void setOrdpCndy(String ordpCndy) {
        this.ordpCndy = ordpCndy;
    }

    /**
     * @return the salesNo
     */
    public String getSalesNo() {
        return salesNo;
    }
    /**
     * @param salesNo the salesNo to set
     */
    public void setSalesNo(String salesNo) {
        this.salesNo = salesNo;
    }
    /**
     * @return the sord
     */
    public String getSord() {
        return sord;
    }
    /**
     * @param sord the sord to set
     */
    public void setSord(String sord) {
        this.sord = sord;
    }
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }

    /**
     * @return the chrgCd
     */
    public String getChrgCd() {
        return chrgCd;
    }
    /**
     * @param chrgCd the chrgCd to set
     */
    public void setChrgCd(String chrgCd) {
        this.chrgCd = chrgCd;
    }
    /**
     * @return the ordpExno
     */
    public String getOrdpExno() {
        return ordpExno;
    }
    /**
     * @param ordpExno the ordpExno to set
     */
    public void setOrdpExno(String ordpExno) {
        this.ordpExno = ordpExno;
    }
    /**
     * @return the mdpr
     */
    public double getMdpr() {
        return mdpr;
    }
    /**
     * @param mdpr the mdpr to set
     */
    public void setMdpr(double mdpr) {
        this.mdpr = mdpr;
    }

    /**
     * @return the aftMdpr
     */
    public double getAftMdpr() {
        return aftMdpr;
    }
    /**
     * @param aftMdpr the aftMdpr to set
     */
    public void setAftMdpr(double aftMdpr) {
        this.aftMdpr = aftMdpr;
    }
    /**
     * @return the adjp
     */
    public double getAdjp() {
        return adjp;
    }
    /**
     * @param adjp the adjp to set
     */
    public void setAdjp(double adjp) {
        this.adjp = adjp;
    }
    /**
     * @return the ordpVapr
     */
    public double getOrdpVapr() {
        return ordpVapr;
    }
    /**
     * @param ordpVapr the ordpVapr to set
     */
    public void setOrdpVapr(double ordpVapr) {
        this.ordpVapr = ordpVapr;
    }
    /**
     * @return the ordpCount
     */
    public int getOrdpCount() {
        return ordpCount;
    }
    /**
     * @param ordpCount the ordpCount to set
     */
    public void setOrdpCount(int ordpCount) {
        this.ordpCount = ordpCount;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
