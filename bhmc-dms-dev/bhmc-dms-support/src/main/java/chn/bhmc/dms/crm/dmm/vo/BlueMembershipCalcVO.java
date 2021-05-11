package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcVO.java
 * @Description : 블루멤버십 정산 VO
 * @author Lee In Moon
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Lee In Moon     최초 생성
 * </pre>
 */
    @ValidDescriptor({
        @ValidField(field="dlrCd"            , mesgKey="crm.lbl.dlrCd")
        ,@ValidField(field="pointHisSeq"      , mesgKey="crm.lbl.pointHisSeq")
        ,@ValidField(field="blueMembershipNo" , mesgKey="crm.lbl.blueMembershipNo")
        ,@ValidField(field="custNo"           , mesgKey="crm.lbl.custNo")
        ,@ValidField(field="pointCd"          , mesgKey="crm.lbl.pointCd")
        ,@ValidField(field="pointTp"          , mesgKey="crm.lbl.pointTp")
        ,@ValidField(field="occrPointVal"     , mesgKey="crm.lbl.occrPointVal")
        ,@ValidField(field="occrDt"           , mesgKey="crm.lbl.occrDt")
        ,@ValidField(field="prsnDeptNm"       , mesgKey="crm.lbl.prsnDeptNm")
        ,@ValidField(field="prsnId"           , mesgKey="crm.lbl.prsnId")
        ,@ValidField(field="regUsrId"         , mesgKey="crm.lbl.regUsrId")
        ,@ValidField(field="regDt"            , mesgKey="crm.lbl.regDt")
        ,@ValidField(field="updtUsrId"        , mesgKey="crm.lbl.updtUsrId")
        ,@ValidField(field="updtDt"           , mesgKey="crm.lbl.updtDt")
    })
public class BlueMembershipCalcVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3748605650112461947L;


        /**
        * 딜러코드
        **/
        private  String            dlrCd;

        /**
        * 포인트이력일련번호
        **/
        private  int               pointHisSeq;

        /**
        * 블루멤버쉽번호
        **/
        private  String            blueMembershipNo;

        /**
        * 고객번호
        **/
        private  String            custNo;

        /**
        * 포인트코드
        **/
        private  String            pointCd;

        /**
         * 포인트코드이름
         **/
        private  String            pointCdNm;

        /**
        * 포인트유형
        **/
        private  String            pointTp;

        /**
        * 발생포인트값
        **/
        private  int               occrPointVal;

        /**
         * 발생포인트값 (부호포함) OCCR_POINT_VALADD
         **/
        private  String               occrPointValadd;

        /**
        * 발생일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date              occrDt;

        /**
        * 담당부서명
        **/
        private  String            prsnDeptNm;

        /**
        * 담당자ID
        **/
        private  String            prsnId;
        private  String            prsnNm;

        private int totalSavePointVal;//총 적립포인트
        private int totalEmployPointVal;//총 사용포인트
        private String calculateMonth;//정산월
        private String custNm;//고객명
        private String blueGradeCd;//블루멤버십 등급

        private String roDocNo;//RO문서번호
        private String contractNo;//계약번호

        private int accuPointVal;//적립포인트
        private int lastPointVal;//최종포인트
        private Double totAmt;//총비용

        private String cupnTp;//쿠폰 유형
        private String cupnCertNo;//쿠폰 번호
        private String cupnUseCost;//쿠폰 사용 금액
        private String cupnCost;//쿠폰 금액
        private String vinNo;//VIN 번호
        private int runDistVal;//주행거리

        private String orderNo;//블루멤버십 주문번호
        private double occrPointCost;//발생포인트비용(금액)

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
         * @return the pointHisSeq
         */
        public int getPointHisSeq() {
            return pointHisSeq;
        }

        /**
         * @param pointHisSeq the pointHisSeq to set
         */
        public void setPointHisSeq(int pointHisSeq) {
            this.pointHisSeq = pointHisSeq;
        }

        /**
         * @return the blueMembershipNo
         */
        public String getBlueMembershipNo() {
            return blueMembershipNo;
        }

        /**
         * @param blueMembershipNo the blueMembershipNo to set
         */
        public void setBlueMembershipNo(String blueMembershipNo) {
            this.blueMembershipNo = blueMembershipNo;
        }

        /**
         * @return the custNo
         */
        public String getCustNo() {
            return custNo;
        }

        /**
         * @param custNo the custNo to set
         */
        public void setCustNo(String custNo) {
            this.custNo = custNo;
        }

        /**
         * @return the pointCd
         */
        public String getPointCd() {
            return pointCd;
        }

        /**
         * @param pointCd the pointCd to set
         */
        public void setPointCd(String pointCd) {
            this.pointCd = pointCd;
        }

        /**
         * @return the pointCdNm
         */
        public String getPointCdNm() {
            return pointCdNm;
        }

        /**
         * @param pointCdNm the pointCdNm to set
         */
        public void setPointCdNm(String pointCdNm) {
            this.pointCdNm = pointCdNm;
        }

        /**
         * @return the pointTp
         */
        public String getPointTp() {
            return pointTp;
        }

        /**
         * @param pointTp the pointTp to set
         */
        public void setPointTp(String pointTp) {
            this.pointTp = pointTp;
        }

        /**
         * @return the occrPointVal
         */
        public int getOccrPointVal() {
            return occrPointVal;
        }

        /**
         * @param occrPointVal the occrPointVal to set
         */
        public void setOccrPointVal(int occrPointVal) {
            this.occrPointVal = occrPointVal;
        }

        /**
         * @return the occrDt
         */
        public Date getOccrDt() {
            return occrDt;
        }

        /**
         * @param occrDt the occrDt to set
         */
        public void setOccrDt(Date occrDt) {
            this.occrDt = occrDt;
        }

        /**
         * @return the prsnDeptNm
         */
        public String getPrsnDeptNm() {
            return prsnDeptNm;
        }

        /**
         * @param prsnDeptNm the prsnDeptNm to set
         */
        public void setPrsnDeptNm(String prsnDeptNm) {
            this.prsnDeptNm = prsnDeptNm;
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
         * @return the totalSavePointVal
         */
        public int getTotalSavePointVal() {
            return totalSavePointVal;
        }

        /**
         * @param totalSavePointVal the totalSavePointVal to set
         */
        public void setTotalSavePointVal(int totalSavePointVal) {
            this.totalSavePointVal = totalSavePointVal;
        }

        /**
         * @return the totalEmployPointVal
         */
        public int getTotalEmployPointVal() {
            return totalEmployPointVal;
        }

        /**
         * @param totalEmployPointVal the totalEmployPointVal to set
         */
        public void setTotalEmployPointVal(int totalEmployPointVal) {
            this.totalEmployPointVal = totalEmployPointVal;
        }



        /**
         * @return the calculateMonth
         */
        public String getCalculateMonth() {
            return calculateMonth;
        }

        /**
         * @param calculateMonth the calculateMonth to set
         */
        public void setCalculateMonth(String calculateMonth) {
            this.calculateMonth = calculateMonth;
        }



        /**
         * @return the custNm
         */
        public String getCustNm() {
            return custNm;
        }

        /**
         * @param custNm the custNm to set
         */
        public void setCustNm(String custNm) {
            this.custNm = custNm;
        }

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

        /**
         * @param prsnNm the prsnNm to set
         */
        public void setPrsnNm(String prsnNm) {
            this.prsnNm = prsnNm;
        }

        /**
         * @return the prsnNm
         */
        public String getPrsnNm() {
            return prsnNm;
        }

        /**
         * @param occrPointValadd the occrPointValadd to set
         */
        public void setOccrPointValadd(String occrPointValadd) {
            this.occrPointValadd = occrPointValadd;
        }

        /**
         * @return the occrPointValadd
         */
        public String getOccrPointValadd() {
            return occrPointValadd;
        }

        /**
         * @return the blueGradeCd
         */
        public String getBlueGradeCd() {
            return blueGradeCd;
        }

        /**
         * @param blueGradeCd the blueGradeCd to set
         */
        public void setBlueGradeCd(String blueGradeCd) {
            this.blueGradeCd = blueGradeCd;
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
         * @return the contractNo
         */
        public String getContractNo() {
            return contractNo;
        }

        /**
         * @param contractNo the contractNo to set
         */
        public void setContractNo(String contractNo) {
            this.contractNo = contractNo;
        }

        /**
         * @return the accuPointVal
         */
        public int getAccuPointVal() {
            return accuPointVal;
        }

        /**
         * @param accuPointVal the accuPointVal to set
         */
        public void setAccuPointVal(int accuPointVal) {
            this.accuPointVal = accuPointVal;
        }

        /**
         * @return the lastPointVal
         */
        public int getLastPointVal() {
            return lastPointVal;
        }

        /**
         * @param lastPointVal the lastPointVal to set
         */
        public void setLastPointVal(int lastPointVal) {
            this.lastPointVal = lastPointVal;
        }

        /**
         * @return the totAmt
         */
        public Double getTotAmt() {
            return totAmt;
        }

        /**
         * @param totAmt the totAmt to set
         */
        public void setTotAmt(Double totAmt) {
            this.totAmt = totAmt;
        }

        /**
         * @return the cupnTp
         */
        public String getCupnTp() {
            return cupnTp;
        }

        /**
         * @param cupnTp the cupnTp to set
         */
        public void setCupnTp(String cupnTp) {
            this.cupnTp = cupnTp;
        }

        /**
         * @return the cupnCertNo
         */
        public String getCupnCertNo() {
            return cupnCertNo;
        }

        /**
         * @param cupnCertNo the cupnCertNo to set
         */
        public void setCupnCertNo(String cupnCertNo) {
            this.cupnCertNo = cupnCertNo;
        }

        /**
         * @return the vinNo
         */
        public String getVinNo() {
            return vinNo;
        }

        /**
         * @param vinNo the vinNo to set
         */
        public void setVinNo(String vinNo) {
            this.vinNo = vinNo;
        }

        /**
         * @return the runDistVal
         */
        public int getRunDistVal() {
            return runDistVal;
        }

        /**
         * @param runDistVal the runDistVal to set
         */
        public void setRunDistVal(int runDistVal) {
            this.runDistVal = runDistVal;
        }

        /**
         * @return the cupnUseCost
         */
        public String getCupnUseCost() {
            return cupnUseCost;
        }

        /**
         * @param cupnUseCost the cupnUseCost to set
         */
        public void setCupnUseCost(String cupnUseCost) {
            this.cupnUseCost = cupnUseCost;
        }

        /**
         * @return the cupnCost
         */
        public String getCupnCost() {
            return cupnCost;
        }

        /**
         * @param cupnCost the cupnCost to set
         */
        public void setCupnCost(String cupnCost) {
            this.cupnCost = cupnCost;
        }

        /**
         * @return the orderNo
         */
        public String getOrderNo() {
            return orderNo;
        }

        /**
         * @param orderNo the orderNo to set
         */
        public void setOrderNo(String orderNo) {
            this.orderNo = orderNo;
        }

        /**
         * @return the occrPointCost
         */
        public double getOccrPointCost() {
            return occrPointCost;
        }

        /**
         * @param occrPointCost the occrPointCost to set
         */
        public void setOccrPointCost(double occrPointCost) {
            this.occrPointCost = occrPointCost;
        }



}