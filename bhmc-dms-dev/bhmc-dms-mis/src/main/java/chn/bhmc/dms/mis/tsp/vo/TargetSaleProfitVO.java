package chn.bhmc.dms.mis.tsp.vo;

import java.util.Date;

import able.com.vo.SearchVO;

/**
 * <pre>
 * [딜러사] 판매이익
 * </pre>
 *
 * @ClassName   : TargetSaleProfitVO.java
 * @Description : [딜러사] 판매이익
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetSaleProfitVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    // 조회조건
    private String rnum;
    private String sSaleTargetYyMm;     // 등록년월
    private String sCarlineYyMm;
    private String sProfitTargetYyMm;

    private String goalYy;
    private String goalMm;
    private String carlineCd;
    private String carlineNm;
    private String productVal;
    private String settingVal;
    private String carProfitVal;
    private String allProfitVal;
    private String goalPrefVal;

    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date updtDt;

    private String targetGubn;
    private String carNo1;
    private String carNo2;
    private String carNo3;
    private String carNo4;
    private String carNo5;
    private String carNo6;
    private String carNo7;
    private String carNo8;
    private String carNo9;
    private String carNo10;
    private String carNo11;
    private String carNo12;
    private String carNo13;
    private String carNo14;
    private String carNo15;
    private String carNo16;
    private String carNo17;
    private String carNo18;
    private String carNo19;
    private String carNo20;
    private String carNo21;

    private String profitCarlineCd;
    private String profitCarlineNm;
    private String baseAmt;
    private String saleAmt;
    private String profitExpcAmt;
    private String subWrkProfitAmt;
    private String totExpcProfitAmt;
    private String saleProfitAmt;

    private String goodsCarQty;
    private String goodsCarRate;
    private String goodsCarVal;
    private String insPassesRate;
    private String insCarProfitQty;
    private String insCarVal;
    private String fncPassesRate;
    private String fncCarProfitQty;
    private String fncCarVal;
    private String etcCarQty;
    private String etcCarVal;


    /**
     * @return the rnum
     */
    public String getRnum() {
        return rnum;
    }
    /**
     * @param rnum the rnum to set
     */
    public void setRnum(String rnum) {
        this.rnum = rnum;
    }
    /**
     * @return the sSaleTargetYyMm
     */
    public String getsSaleTargetYyMm() {
        return sSaleTargetYyMm;
    }
    /**
     * @param sSaleTargetYyMm the sSaleTargetYyMm to set
     */
    public void setsSaleTargetYyMm(String sSaleTargetYyMm) {
        this.sSaleTargetYyMm = sSaleTargetYyMm;
    }
    /**
     * @return the sCarlineYyMm
     */
    public String getsCarlineYyMm() {
        return sCarlineYyMm;
    }
    /**
     * @param sCarlineYyMm the sCarlineYyMm to set
     */
    public void setsCarlineYyMm(String sCarlineYyMm) {
        this.sCarlineYyMm = sCarlineYyMm;
    }
    /**
     * @return the sProfitTargetYyMm
     */
    public String getsProfitTargetYyMm() {
        return sProfitTargetYyMm;
    }
    /**
     * @param sProfitTargetYyMm the sProfitTargetYyMm to set
     */
    public void setsProfitTargetYyMm(String sProfitTargetYyMm) {
        this.sProfitTargetYyMm = sProfitTargetYyMm;
    }
    /**
     * @return the goalYy
     */
    public String getGoalYy() {
        return goalYy;
    }
    /**
     * @param goalYy the goalYy to set
     */
    public void setGoalYy(String goalYy) {
        this.goalYy = goalYy;
    }
    /**
     * @return the goalMm
     */
    public String getGoalMm() {
        return goalMm;
    }
    /**
     * @param goalMm the goalMm to set
     */
    public void setGoalMm(String goalMm) {
        this.goalMm = goalMm;
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
     * @return the productVal
     */
    public String getProductVal() {
        return productVal;
    }
    /**
     * @param productVal the productVal to set
     */
    public void setProductVal(String productVal) {
        this.productVal = productVal;
    }
    /**
     * @return the settingVal
     */
    public String getSettingVal() {
        return settingVal;
    }
    /**
     * @param settingVal the settingVal to set
     */
    public void setSettingVal(String settingVal) {
        this.settingVal = settingVal;
    }
    /**
     * @return the carProfitVal
     */
    public String getCarProfitVal() {
        return carProfitVal;
    }
    /**
     * @param carProfitVal the carProfitVal to set
     */
    public void setCarProfitVal(String carProfitVal) {
        this.carProfitVal = carProfitVal;
    }
    /**
     * @return the allProfitVal
     */
    public String getAllProfitVal() {
        return allProfitVal;
    }
    /**
     * @param allProfitVal the allProfitVal to set
     */
    public void setAllProfitVal(String allProfitVal) {
        this.allProfitVal = allProfitVal;
    }
    /**
     * @return the goalPrefVal
     */
    public String getGoalPrefVal() {
        return goalPrefVal;
    }
    /**
     * @param goalPrefVal the goalPrefVal to set
     */
    public void setGoalPrefVal(String goalPrefVal) {
        this.goalPrefVal = goalPrefVal;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
    /**
     * @return the targetGubn
     */
    public String getTargetGubn() {
        return targetGubn;
    }
    /**
     * @param targetGubn the targetGubn to set
     */
    public void setTargetGubn(String targetGubn) {
        this.targetGubn = targetGubn;
    }
    /**
     * @return the carNo1
     */
    public String getCarNo1() {
        return carNo1;
    }
    /**
     * @param carNo1 the carNo1 to set
     */
    public void setCarNo1(String carNo1) {
        this.carNo1 = carNo1;
    }
    /**
     * @return the carNo2
     */
    public String getCarNo2() {
        return carNo2;
    }
    /**
     * @param carNo2 the carNo2 to set
     */
    public void setCarNo2(String carNo2) {
        this.carNo2 = carNo2;
    }
    /**
     * @return the carNo3
     */
    public String getCarNo3() {
        return carNo3;
    }
    /**
     * @param carNo3 the carNo3 to set
     */
    public void setCarNo3(String carNo3) {
        this.carNo3 = carNo3;
    }
    /**
     * @return the carNo4
     */
    public String getCarNo4() {
        return carNo4;
    }
    /**
     * @param carNo4 the carNo4 to set
     */
    public void setCarNo4(String carNo4) {
        this.carNo4 = carNo4;
    }
    /**
     * @return the carNo5
     */
    public String getCarNo5() {
        return carNo5;
    }
    /**
     * @param carNo5 the carNo5 to set
     */
    public void setCarNo5(String carNo5) {
        this.carNo5 = carNo5;
    }
    /**
     * @return the carNo6
     */
    public String getCarNo6() {
        return carNo6;
    }
    /**
     * @param carNo6 the carNo6 to set
     */
    public void setCarNo6(String carNo6) {
        this.carNo6 = carNo6;
    }
    /**
     * @return the carNo7
     */
    public String getCarNo7() {
        return carNo7;
    }
    /**
     * @param carNo7 the carNo7 to set
     */
    public void setCarNo7(String carNo7) {
        this.carNo7 = carNo7;
    }
    /**
     * @return the carNo8
     */
    public String getCarNo8() {
        return carNo8;
    }
    /**
     * @param carNo8 the carNo8 to set
     */
    public void setCarNo8(String carNo8) {
        this.carNo8 = carNo8;
    }
    /**
     * @return the carNo9
     */
    public String getCarNo9() {
        return carNo9;
    }
    /**
     * @param carNo9 the carNo9 to set
     */
    public void setCarNo9(String carNo9) {
        this.carNo9 = carNo9;
    }
    /**
     * @return the carNo10
     */
    public String getCarNo10() {
        return carNo10;
    }
    /**
     * @param carNo10 the carNo10 to set
     */
    public void setCarNo10(String carNo10) {
        this.carNo10 = carNo10;
    }
    /**
     * @return the carNo11
     */
    public String getCarNo11() {
        return carNo11;
    }
    /**
     * @param carNo11 the carNo11 to set
     */
    public void setCarNo11(String carNo11) {
        this.carNo11 = carNo11;
    }
    /**
     * @return the carNo12
     */
    public String getCarNo12() {
        return carNo12;
    }
    /**
     * @param carNo12 the carNo12 to set
     */
    public void setCarNo12(String carNo12) {
        this.carNo12 = carNo12;
    }
    /**
     * @return the carNo13
     */
    public String getCarNo13() {
        return carNo13;
    }
    /**
     * @param carNo13 the carNo13 to set
     */
    public void setCarNo13(String carNo13) {
        this.carNo13 = carNo13;
    }
    /**
     * @return the carNo14
     */
    public String getCarNo14() {
        return carNo14;
    }
    /**
     * @param carNo14 the carNo14 to set
     */
    public void setCarNo14(String carNo14) {
        this.carNo14 = carNo14;
    }
    /**
     * @return the carNo15
     */
    public String getCarNo15() {
        return carNo15;
    }
    /**
     * @param carNo15 the carNo15 to set
     */
    public void setCarNo15(String carNo15) {
        this.carNo15 = carNo15;
    }
    /**
     * @return the carNo16
     */
    public String getCarNo16() {
        return carNo16;
    }
    /**
     * @param carNo16 the carNo16 to set
     */
    public void setCarNo16(String carNo16) {
        this.carNo16 = carNo16;
    }
    /**
     * @return the carNo17
     */
    public String getCarNo17() {
        return carNo17;
    }
    /**
     * @param carNo17 the carNo17 to set
     */
    public void setCarNo17(String carNo17) {
        this.carNo17 = carNo17;
    }
    /**
     * @return the carNo18
     */
    public String getCarNo18() {
        return carNo18;
    }
    /**
     * @param carNo18 the carNo18 to set
     */
    public void setCarNo18(String carNo18) {
        this.carNo18 = carNo18;
    }
    /**
     * @return the carNo19
     */
    public String getCarNo19() {
        return carNo19;
    }
    /**
     * @param carNo19 the carNo19 to set
     */
    public void setCarNo19(String carNo19) {
        this.carNo19 = carNo19;
    }
    /**
     * @return the carNo20
     */
    public String getCarNo20() {
        return carNo20;
    }
    /**
     * @param carNo20 the carNo20 to set
     */
    public void setCarNo20(String carNo20) {
        this.carNo20 = carNo20;
    }
    /**
     * @return the carNo21
     */
    public String getCarNo21() {
        return carNo21;
    }
    /**
     * @param carNo21 the carNo21 to set
     */
    public void setCarNo21(String carNo21) {
        this.carNo21 = carNo21;
    }
    /**
     * @return the profitCarlineCd
     */
    public String getProfitCarlineCd() {
        return profitCarlineCd;
    }
    /**
     * @param profitCarlineCd the profitCarlineCd to set
     */
    public void setProfitCarlineCd(String profitCarlineCd) {
        this.profitCarlineCd = profitCarlineCd;
    }
    /**
     * @return the profitCarlineNm
     */
    public String getProfitCarlineNm() {
        return profitCarlineNm;
    }
    /**
     * @param profitCarlineNm the profitCarlineNm to set
     */
    public void setProfitCarlineNm(String profitCarlineNm) {
        this.profitCarlineNm = profitCarlineNm;
    }
    /**
     * @return the baseAmt
     */
    public String getBaseAmt() {
        return baseAmt;
    }
    /**
     * @param baseAmt the baseAmt to set
     */
    public void setBaseAmt(String baseAmt) {
        this.baseAmt = baseAmt;
    }
    /**
     * @return the saleAmt
     */
    public String getSaleAmt() {
        return saleAmt;
    }
    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(String saleAmt) {
        this.saleAmt = saleAmt;
    }
    /**
     * @return the profitExpcAmt
     */
    public String getProfitExpcAmt() {
        return profitExpcAmt;
    }
    /**
     * @param profitExpcAmt the profitExpcAmt to set
     */
    public void setProfitExpcAmt(String profitExpcAmt) {
        this.profitExpcAmt = profitExpcAmt;
    }
    /**
     * @return the subWrkProfitAmt
     */
    public String getSubWrkProfitAmt() {
        return subWrkProfitAmt;
    }
    /**
     * @param subWrkProfitAmt the subWrkProfitAmt to set
     */
    public void setSubWrkProfitAmt(String subWrkProfitAmt) {
        this.subWrkProfitAmt = subWrkProfitAmt;
    }
    /**
     * @return the totExpcProfitAmt
     */
    public String getTotExpcProfitAmt() {
        return totExpcProfitAmt;
    }
    /**
     * @param totExpcProfitAmt the totExpcProfitAmt to set
     */
    public void setTotExpcProfitAmt(String totExpcProfitAmt) {
        this.totExpcProfitAmt = totExpcProfitAmt;
    }
    /**
     * @return the saleProfitAmt
     */
    public String getSaleProfitAmt() {
        return saleProfitAmt;
    }
    /**
     * @param saleProfitAmt the saleProfitAmt to set
     */
    public void setSaleProfitAmt(String saleProfitAmt) {
        this.saleProfitAmt = saleProfitAmt;
    }
    /**
     * @return the goodsCarQty
     */
    public String getGoodsCarQty() {
        return goodsCarQty;
    }
    /**
     * @param goodsCarQty the goodsCarQty to set
     */
    public void setGoodsCarQty(String goodsCarQty) {
        this.goodsCarQty = goodsCarQty;
    }
    /**
     * @return the goodsCarRate
     */
    public String getGoodsCarRate() {
        return goodsCarRate;
    }
    /**
     * @param goodsCarRate the goodsCarRate to set
     */
    public void setGoodsCarRate(String goodsCarRate) {
        this.goodsCarRate = goodsCarRate;
    }
    /**
     * @return the goodsCarVal
     */
    public String getGoodsCarVal() {
        return goodsCarVal;
    }
    /**
     * @param goodsCarVal the goodsCarVal to set
     */
    public void setGoodsCarVal(String goodsCarVal) {
        this.goodsCarVal = goodsCarVal;
    }
    /**
     * @return the insPassesRate
     */
    public String getInsPassesRate() {
        return insPassesRate;
    }
    /**
     * @param insPassesRate the insPassesRate to set
     */
    public void setInsPassesRate(String insPassesRate) {
        this.insPassesRate = insPassesRate;
    }
    /**
     * @return the insCarProfitQty
     */
    public String getInsCarProfitQty() {
        return insCarProfitQty;
    }
    /**
     * @param insCarProfitQty the insCarProfitQty to set
     */
    public void setInsCarProfitQty(String insCarProfitQty) {
        this.insCarProfitQty = insCarProfitQty;
    }
    /**
     * @return the insCarVal
     */
    public String getInsCarVal() {
        return insCarVal;
    }
    /**
     * @param insCarVal the insCarVal to set
     */
    public void setInsCarVal(String insCarVal) {
        this.insCarVal = insCarVal;
    }
    /**
     * @return the fncPassesRate
     */
    public String getFncPassesRate() {
        return fncPassesRate;
    }
    /**
     * @param fncPassesRate the fncPassesRate to set
     */
    public void setFncPassesRate(String fncPassesRate) {
        this.fncPassesRate = fncPassesRate;
    }
    /**
     * @return the fncCarProfitQty
     */
    public String getFncCarProfitQty() {
        return fncCarProfitQty;
    }
    /**
     * @param fncCarProfitQty the fncCarProfitQty to set
     */
    public void setFncCarProfitQty(String fncCarProfitQty) {
        this.fncCarProfitQty = fncCarProfitQty;
    }
    /**
     * @return the fncCarVal
     */
    public String getFncCarVal() {
        return fncCarVal;
    }
    /**
     * @param fncCarVal the fncCarVal to set
     */
    public void setFncCarVal(String fncCarVal) {
        this.fncCarVal = fncCarVal;
    }
    /**
     * @return the etcCarQty
     */
    public String getEtcCarQty() {
        return etcCarQty;
    }
    /**
     * @param etcCarQty the etcCarQty to set
     */
    public void setEtcCarQty(String etcCarQty) {
        this.etcCarQty = etcCarQty;
    }
    /**
     * @return the etcCarVal
     */
    public String getEtcCarVal() {
        return etcCarVal;
    }
    /**
     * @param etcCarVal the etcCarVal to set
     */
    public void setEtcCarVal(String etcCarVal) {
        this.etcCarVal = etcCarVal;
    }
}
