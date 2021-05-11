package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdVO.java
 * @Description : PurcOrdVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class ToolGiVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 저장 성공실패 여부
     **/
    private  boolean      resultYn;

    /**
     * 딜러코드
     **/
    private  String       dlrCd;

    /**
     * 상태코드
     **/
    //STAT_CD
    private  String       statCd;

    /**
     * 거래처코드
     **/
    //BP_CD
    private  String       bpCd;

    /**
     * 비고
     **/
    //REMARK
    private  String       remark;

    /**
     * 항목 수
     **/
    //ITEM_CNT
    private  int          itemCnt;

    /**
     * 공구출고문서번호
     **/
    private  String        toolGiDocNo;

    /**
     * 참조문서번호
     **/
    private  String        refDocNo;

    /**
     * RO번호
     **/
    private  String        roDocNo;

    /**
     * 공구출고유형
     **/
    //TOOL_GI_TP

    private  String        toolGiTp;

    /**
     * 수리공ID
     **/
    //TECH_ID

    private  String             techId;

    /**
     * 수리공명
     **/
    //TECH_NM

    private  String             techNm;

    /**
     * 담당ID
     **/
    //PRSN_ID

    private  String             prsnId;

    /**
     * 담당명
     **/
    //PRSN_NM

    private  String             prsnNm;

    /**
     * 출고일자
     **/
    //GI_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              giDt;

    /**
     * 반품일자
     **/
    //RETURN_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              returnDt;

    /**
     * 수불문서년월일자
     **/
    //MVT_DOC_YY_MM
    private  String          mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    //MVT_DOC_NO
    private  String          mvtDocNo;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //UPDT_DT_STR
    private  String          updtDtStr;

    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
    }

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
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the itemCnt
     */
    public int getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(int itemCnt) {
        this.itemCnt = itemCnt;
    }

    /**
     * @return the toolGiDocNo
     */
    public String getToolGiDocNo() {
        return toolGiDocNo;
    }

    /**
     * @param toolGiDocNo the toolGiDocNo to set
     */
    public void setToolGiDocNo(String toolGiDocNo) {
        this.toolGiDocNo = toolGiDocNo;
    }

    /**
     * @return the toolGiTp
     */
    public String getToolGiTp() {
        return toolGiTp;
    }

    /**
     * @param toolGiTp the toolGiTp to set
     */
    public void setToolGiTp(String toolGiTp) {
        this.toolGiTp = toolGiTp;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the techId
     */
    public String getTechId() {
        return techId;
    }

    /**
     * @param techId the techId to set
     */
    public void setTechId(String techId) {
        this.techId = techId;
    }

    /**
     * @return the techNm
     */
    public String getTechNm() {
        return techNm;
    }

    /**
     * @param techNm the techNm to set
     */
    public void setTechNm(String techNm) {
        this.techNm = techNm;
    }

    /**
     * @return the prsnId
     */
    public String getPrsnId() {
        return prsnId;
    }

    /**
     * @param prsnId the prsnId to set
     */
    public void setPrsnId(String prsnId) {
        this.prsnId = prsnId;
    }

    /**
     * @return the prsnNm
     */
    public String getPrsnNm() {
        return prsnNm;
    }

    /**
     * @param prsnNm the prsnNm to set
     */
    public void setPrsnNm(String prsnNm) {
        this.prsnNm = prsnNm;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the returnDt
     */
    public Date getReturnDt() {
        return returnDt;
    }

    /**
     * @param returnDt the returnDt to set
     */
    public void setReturnDt(Date returnDt) {
        this.returnDt = returnDt;
    }

    /**
     * @return the refDocNo
     */
    public String getRefDocNo() {
        return refDocNo;
    }

    /**
     * @param refDocNo the refDocNo to set
     */
    public void setRefDocNo(String refDocNo) {
        this.refDocNo = refDocNo;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }

}
