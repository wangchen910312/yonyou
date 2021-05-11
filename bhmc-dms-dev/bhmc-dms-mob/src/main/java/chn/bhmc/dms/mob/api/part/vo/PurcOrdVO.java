package chn.bhmc.dms.mob.api.part.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

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

@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="par.lbl.dlrCd")
   ,@ValidField(field="purcOrdNo"       , mesgKey="par.lbl.purcOrdNo")
   ,@ValidField(field="purcOrdTp"       , mesgKey="par.lbl.purcOrdTp")
   ,@ValidField(field="trsfTp"          , mesgKey="par.lbl.trsfTp")
   ,@ValidField(field="purcOrdStatCd"   , mesgKey="par.lbl.purcOrdStatCd")
   ,@ValidField(field="purcItemStatCd"  , mesgKey="par.lbl.purcItemStatCd")
   ,@ValidField(field="pltCd"           , mesgKey="par.lbl.pltCd")
   ,@ValidField(field="bpCd"            , mesgKey="par.lbl.bpCd")
   ,@ValidField(field="bpNm"            , mesgKey="par.lbl.bpNm")
   ,@ValidField(field="purcRegDt"       , mesgKey="par.lbl.purcRegDt")
   ,@ValidField(field="totPurcAmt"      , mesgKey="par.lbl.totPurcAmt")
   ,@ValidField(field="sendDt"          , mesgKey="par.lbl.sendDt")
   ,@ValidField(field="confirmDt"       , mesgKey="par.lbl.confirmDt")
   ,@ValidField(field="endDt"           , mesgKey="par.lbl.endDt")
   ,@ValidField(field="cancDt"          , mesgKey="par.lbl.cancDt")
   ,@ValidField(field="remark"          , mesgKey="par.lbl.remark")
  })
public class PurcOrdVO extends BaseVO{



        /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

        /**
         * 저장 성공실패 여부
         **/
        private  boolean          resultYn;

        /**
         * 딜러코드
         **/
        private  String          dlrCd;

        /**
         * 구매오더정보
         **/
        @NotEmpty
        private  String          purcOrdNo;

        /**
         * 구매오더유형
         **/
        @NotEmpty
        private  String          purcOrdTp;

        /**
         * 운송유형
         **/
        @NotEmpty
        private  String          trsfTp;

        /**
         * 구매오더상태코드
         **/
        //PURC_ORD_STAT_CD
        private  String          purcOrdStatCd;

        /**
         * 구매오더품목상태코드
         **/
        //PURC_ITEM_STAT_CD
        private  String          purcItemStatCd;  //구매부품 상태 한번에 Update하기 위해 사용되는 항목

        /**
         * 센터코드
         **/
        //PLT_CD
        private  String          pltCd;

        /**
         * 거래처코드
         **/
        //BP_CD
        private  String          bpCd;

        /**
         * 거래처명
         **/
        //BP_CD
        private  String          bpNm;

        /**
         * 거래처유형
         **/
        //BP_CD
        private  String          bpTp;

        /**
         * 등록자명
         **/
        //REG_USR_NM
        private  String          regUsrNm;

        /**
         * 구매등록일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date            purcRegDt;

        /**
         * 품목수
         **/
        //ITEM_CNT
        private  Double             itemCnt;

        /**
         * 품목구매수량합계
         **/
        //ITEM_QTY
        private  Double             itemQty;
        /**
         * 품목구매금액
         **/
        //ITEM_AMT
        private  Double             itemAmt;

        /**
         * 확정건수
         **/
        //CONFIRM_CNT
        private  Double             confirmCnt;

        /**
         * 확정수량
         **/
        //CONFIRM_QTY
        private  Double             confirmQty;

        /**
         * BO건수
         **/
        //BO_CNT
        private  Double             boCnt;

        /**
         * BO 수량
         **/
        //BO_QTY
        private  Double             boQty;

        /**
         * 오더금액
         **/
        //PURC_AMT
        private  Double             purcAmt;

        /**
         * 총구매수량
         **/
        //TOT_PURC_QTY
        private  Double             totPurcQty;

        /**
         * 총구매금액
         **/
        //TOT_PURC_AMT
        private  Double             totPurcAmt;

        /**
         * 총구매금액(세금제외)
         **/
        //TOT_TAX_DDCT_AMT
        private  Double             totTaxDdctAmt;


        /**
         * 송장번호
         **/
        //MOBIS_INVC_NO
        private  String          mobisInvcNo;

        /**
         * 전송일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date            sendDt;

        /**
         * 확정일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date            confirmDt;

        /**
         * 완료일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date            endDt;

        /**
         * 취소일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date            cancDt;

        /**
         * 비고
         **/
        //REMARK
        private  String          remark;

        /**
         * 딜러구매번호
         **/
        //DLR_ORD_NO
        private  String           dlrOrdNo;

        /**
         * BMP구매번호
         **/
        //BMP_ORD_NO
        private  String           bmpOrdNo;

        /**
         * 출고장소코드
         **/
        //GI_PLACE_CD
        private  String           giPlaceCd;

        /**
         * 도착일자
         **/
        //ARRV_DT
        private  String           arrvDt;

        /**
         * 도착일자
         **/
        //ARRV_DATE
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date             arrvDate;

        /**
         * 도착시간
         **/
        //ARRV_HM
        private  String           arrvHm;

        /**
         * 구매진행코드
         **/
        //PURC_PGSS_CD
        private  String           purcPgssCd;

        /**
         * 구매진행상세코드
         **/
        //PURC_PGSS_DETL_CD
        private  String           purcPgssDetlCd;

        /**
         * 구매유형
         **/
        //PURC_TP
        private  String           purcTp;

        /**
         * 운송코드
         **/
        //TRSF_CD
        private  String           trsfCd;

        /**
         * 구매부품수
         **/
        //PURC_PAR_CNT
        private  int              purcParCnt;

        /**
         * 구매부품수량
         **/
        //PURC_PAR_QTY
        private  int              purcParQty;

        /**
         * 구매부품금액
         **/
        //PURC_PAR_AMT
        private  Double           purcParAmt;

        /**
         * 확정부품수
         **/
        //CONFIRM_PAR_CNT
        private  int              confirmParCnt;

        /**
         * 확정부품수량
         **/
        //CONFIRM_PAR_QTY
        private  int              confirmParQty;

        /**
         * 확정부품금액
         **/
        //CONFIRM_PAR_AMT
        private  Double           confirmParAmt;

        /**
         * 진행부품수
         **/
        //PGSS_PAR_CNT
        private  int              pgssParCnt;

        /**
         * 진행부품수량
         **/
        //PGSS_PAR_QTY
        private  int              pgssParQty;

        /**
         * 진행부품금액
         **/
        //PGSS_PAR_AMT
        private  Double           pgssParAmt;

        /**
         * 취소부품수
         **/
        //CANC_PAR_CNT
        private  int              cancParCnt;

        /**
         * 취소부품수량
         **/
        //CANC_PAR_QTY
        private  int              cancParQty;

        /**
         * 취소부품금액
         **/
        //CANC_PAR_AMT
        private  Double           cancParAmt;

        /**
         * B/O부품수
         **/
        //BO_PAR_CNT
        private  int              boParCnt;

        /**
         * B/O부품수량
         **/
        //BO_PAR_QTY
        private  int              boParQty;

        /**
         * B/O부품금액
         **/
        //BO_PAR_AMT
        private  Double           boParAmt;

        /**
         * 선적부품수
         **/
        //SHIP_PAR_CNT
        private  int              shipParCnt;

        /**
         * 선적부품수량
         **/
        //SHIP_PAR_QTY
        private  int              shipParQty;

        /**
         * 선적부품금액
         **/
        //SHIP_PAR_AMT
        private  Double           shipParAmt;

        /**
         * 생성일자
         **/
        //CRE_DT
        private  String           creDt;

        /**
         * 생성시간
         **/
        //CRE_HM
        private  String           creHm;

        /**
         * 수정일시(UPDATE시 가능여부 체크용)
         **/
        //UPDT_DT_STR
        private  String          updtDtStr;

        /**
         * @return the resultYn
         */
        public boolean getResultYn() {
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
         * @return the purcOrdNo
         */
        public String getPurcOrdNo() {
            return purcOrdNo;
        }

        /**
         * @param purcOrdNo the purcOrdNo to set
         */
        public void setPurcOrdNo(String purcOrdNo) {
            this.purcOrdNo = purcOrdNo;
        }

        /**
         * @return the purcOrdTp
         */
        public String getPurcOrdTp() {
            return purcOrdTp;
        }

        /**
         * @param purcOrdTp the purcOrdTp to set
         */
        public void setPurcOrdTp(String purcOrdTp) {
            this.purcOrdTp = purcOrdTp;
        }

        /**
         * @return the trsfTp
         */
        public String getTrsfTp() {
            return trsfTp;
        }

        /**
         * @param trsfTp the trsfTp to set
         */
        public void setTrsfTp(String trsfTp) {
            this.trsfTp = trsfTp;
        }

        /**
         * @return the purcOrdStatCd
         */
        public String getPurcOrdStatCd() {
            return purcOrdStatCd;
        }

        /**
         * @param purcOrdStatCd the purcOrdStatCd to set
         */
        public void setPurcOrdStatCd(String purcOrdStatCd) {
            this.purcOrdStatCd = purcOrdStatCd;
        }


        /**
         * @return the purcItemStatCd
         */
        public String getPurcItemStatCd() {
            return purcItemStatCd;
        }

        /**
         * @param purcItemStatCd the purcItemStatCd to set
         */
        public void setPurcItemStatCd(String purcItemStatCd) {
            this.purcItemStatCd = purcItemStatCd;
        }

        /**
         * @return the pltCd
         */
        public String getPltCd() {
            return pltCd;
        }

        /**
         * @param pltCd the pltCd to set
         */
        public void setPltCd(String pltCd) {
            this.pltCd = pltCd;
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
         * @return the bpNm
         */
        public String getBpNm() {
            return bpNm;
        }

        /**
         * @param bpNm the bpNm to set
         */
        public void setBpNm(String bpNm) {
            this.bpNm = bpNm;
        }

        /**
         * @return the purcRegDt
         */
        public Date getPurcRegDt() {
            return purcRegDt;
        }

        /**
         * @param purcRegDt the purcRegDt to set
         */
        public void setPurcRegDt(Date purcRegDt) {
            this.purcRegDt = purcRegDt;
        }


        /**
         * @return the totPurcAmt
         */
        public Double getTotPurcAmt() {
            return totPurcAmt;
        }

        /**
         * @param totPurcAmt the totPurcAmt to set
         */
        public void setTotPurcAmt(Double totPurcAmt) {
            this.totPurcAmt = totPurcAmt;
        }

        /**
         * @return the sendDt
         */
        public Date getSendDt() {
            return sendDt;
        }

        /**
         * @param sendDt the sendDt to set
         */
        public void setSendDt(Date sendDt) {
            this.sendDt = sendDt;
        }

        /**
         * @return the confirmDt
         */
        public Date getConfirmDt() {
            return confirmDt;
        }

        /**
         * @param confirmDt the confirmDt to set
         */
        public void setConfirmDt(Date confirmDt) {
            this.confirmDt = confirmDt;
        }

        /**
         * @return the endDt
         */
        public Date getEndDt() {
            return endDt;
        }

        /**
         * @param endDt the endDt to set
         */
        public void setEndDt(Date endDt) {
            this.endDt = endDt;
        }

        /**
         * @return the cancDt
         */
        public Date getCancDt() {
            return cancDt;
        }

        /**
         * @param cancDt the cancDt to set
         */
        public void setCancDt(Date cancDt) {
            this.cancDt = cancDt;
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
         * @return the bpTp
         */
        public String getBpTp() {
            return bpTp;
        }

        /**
         * @param bpTp the bpTp to set
         */
        public void setBpTp(String bpTp) {
            this.bpTp = bpTp;
        }

        /**
         * @return the totPurcQty
         */
        public Double getTotPurcQty() {
            return totPurcQty;
        }

        /**
         * @param totPurcQty the totPurcQty to set
         */
        public void setTotPurcQty(Double totPurcQty) {
            this.totPurcQty = totPurcQty;
        }

        /**
         * @return the itemCnt
         */
        public Double getItemCnt() {
            return itemCnt;
        }

        /**
         * @param itemCnt the itemCnt to set
         */
        public void setItemCnt(Double itemCnt) {
            this.itemCnt = itemCnt;
        }

        /**
         * @return the confirmCnt
         */
        public Double getConfirmCnt() {
            return confirmCnt;
        }

        /**
         * @param confirmCnt the confirmCnt to set
         */
        public void setConfirmCnt(Double confirmCnt) {
            this.confirmCnt = confirmCnt;
        }

        /**
         * @return the confirmQty
         */
        public Double getConfirmQty() {
            return confirmQty;
        }

        /**
         * @param confirmQty the confirmQty to set
         */
        public void setConfirmQty(Double confirmQty) {
            this.confirmQty = confirmQty;
        }

        /**
         * @return the boCnt
         */
        public Double getBoCnt() {
            return boCnt;
        }

        /**
         * @param boCnt the boCnt to set
         */
        public void setBoCnt(Double boCnt) {
            this.boCnt = boCnt;
        }

        /**
         * @return the boQty
         */
        public Double getBoQty() {
            return boQty;
        }

        /**
         * @param boQty the boQty to set
         */
        public void setBoQty(Double boQty) {
            this.boQty = boQty;
        }

        /**
         * @return the purcAmt
         */
        public Double getPurcAmt() {
            return purcAmt;
        }

        /**
         * @param purcAmt the purcAmt to set
         */
        public void setPurcAmt(Double purcAmt) {
            this.purcAmt = purcAmt;
        }


        /**
         * @return the dlrOrdNo
         */
        public String getDlrOrdNo() {
            return dlrOrdNo;
        }

        /**
         * @param dlrOrdNo the dlrOrdNo to set
         */
        public void setDlrOrdNo(String dlrOrdNo) {
            this.dlrOrdNo = dlrOrdNo;
        }

        /**
         * @return the bmpOrdNo
         */
        public String getBmpOrdNo() {
            return bmpOrdNo;
        }

        /**
         * @param bmpOrdNo the bmpOrdNo to set
         */
        public void setBmpOrdNo(String bmpOrdNo) {
            this.bmpOrdNo = bmpOrdNo;
        }

        /**
         * @return the giPlaceCd
         */
        public String getGiPlaceCd() {
            return giPlaceCd;
        }

        /**
         * @param giPlaceCd the giPlaceCd to set
         */
        public void setGiPlaceCd(String giPlaceCd) {
            this.giPlaceCd = giPlaceCd;
        }

        /**
         * @return the arrvDt
         */
        public String getArrvDt() {
            return arrvDt;
        }

        /**
         * @param arrvDt the arrvDt to set
         */
        public void setArrvDt(String arrvDt) {
            this.arrvDt = arrvDt;
        }

        /**
         * @return the arrvHm
         */
        public String getArrvHm() {
            return arrvHm;
        }

        /**
         * @param arrvHm the arrvHm to set
         */
        public void setArrvHm(String arrvHm) {
            this.arrvHm = arrvHm;
        }

        /**
         * @return the purcPgssCd
         */
        public String getPurcPgssCd() {
            return purcPgssCd;
        }

        /**
         * @param purcPgssCd the purcPgssCd to set
         */
        public void setPurcPgssCd(String purcPgssCd) {
            this.purcPgssCd = purcPgssCd;
        }

        /**
         * @return the purcPgssDetlCd
         */
        public String getPurcPgssDetlCd() {
            return purcPgssDetlCd;
        }

        /**
         * @param purcPgssDetlCd the purcPgssDetlCd to set
         */
        public void setPurcPgssDetlCd(String purcPgssDetlCd) {
            this.purcPgssDetlCd = purcPgssDetlCd;
        }

        /**
         * @return the purcTp
         */
        public String getPurcTp() {
            return purcTp;
        }

        /**
         * @param purcTp the purcTp to set
         */
        public void setPurcTp(String purcTp) {
            this.purcTp = purcTp;
        }

        /**
         * @return the trsfCd
         */
        public String getTrsfCd() {
            return trsfCd;
        }

        /**
         * @param trsfCd the trsfCd to set
         */
        public void setTrsfCd(String trsfCd) {
            this.trsfCd = trsfCd;
        }

        /**
         * @return the purcParCnt
         */
        public int getPurcParCnt() {
            return purcParCnt;
        }

        /**
         * @param purcParCnt the purcParCnt to set
         */
        public void setPurcParCnt(int purcParCnt) {
            this.purcParCnt = purcParCnt;
        }

        /**
         * @return the purcParQty
         */
        public int getPurcParQty() {
            return purcParQty;
        }

        /**
         * @param purcParQty the purcParQty to set
         */
        public void setPurcParQty(int purcParQty) {
            this.purcParQty = purcParQty;
        }

        /**
         * @return the purcParAmt
         */
        public Double getPurcParAmt() {
            return purcParAmt;
        }

        /**
         * @param purcParAmt the purcParAmt to set
         */
        public void setPurcParAmt(Double purcParAmt) {
            this.purcParAmt = purcParAmt;
        }

        /**
         * @return the confirmParCnt
         */
        public int getConfirmParCnt() {
            return confirmParCnt;
        }

        /**
         * @param confirmParCnt the confirmParCnt to set
         */
        public void setConfirmParCnt(int confirmParCnt) {
            this.confirmParCnt = confirmParCnt;
        }

        /**
         * @return the confirmParQty
         */
        public int getConfirmParQty() {
            return confirmParQty;
        }

        /**
         * @param confirmParQty the confirmParQty to set
         */
        public void setConfirmParQty(int confirmParQty) {
            this.confirmParQty = confirmParQty;
        }

        /**
         * @return the confirmParAmt
         */
        public Double getConfirmParAmt() {
            return confirmParAmt;
        }

        /**
         * @param confirmParAmt the confirmParAmt to set
         */
        public void setConfirmParAmt(Double confirmParAmt) {
            this.confirmParAmt = confirmParAmt;
        }

        /**
         * @return the pgssParCnt
         */
        public int getPgssParCnt() {
            return pgssParCnt;
        }

        /**
         * @param pgssParCnt the pgssParCnt to set
         */
        public void setPgssParCnt(int pgssParCnt) {
            this.pgssParCnt = pgssParCnt;
        }

        /**
         * @return the pgssParQty
         */
        public int getPgssParQty() {
            return pgssParQty;
        }

        /**
         * @param pgssParQty the pgssParQty to set
         */
        public void setPgssParQty(int pgssParQty) {
            this.pgssParQty = pgssParQty;
        }

        /**
         * @return the pgssParAmt
         */
        public Double getPgssParAmt() {
            return pgssParAmt;
        }

        /**
         * @param pgssParAmt the pgssParAmt to set
         */
        public void setPgssParAmt(Double pgssParAmt) {
            this.pgssParAmt = pgssParAmt;
        }

        /**
         * @return the cancParCnt
         */
        public int getCancParCnt() {
            return cancParCnt;
        }

        /**
         * @param cancParCnt the cancParCnt to set
         */
        public void setCancParCnt(int cancParCnt) {
            this.cancParCnt = cancParCnt;
        }

        /**
         * @return the cancParQty
         */
        public int getCancParQty() {
            return cancParQty;
        }

        /**
         * @param cancParQty the cancParQty to set
         */
        public void setCancParQty(int cancParQty) {
            this.cancParQty = cancParQty;
        }

        /**
         * @return the cancParAmt
         */
        public Double getCancParAmt() {
            return cancParAmt;
        }

        /**
         * @param cancParAmt the cancParAmt to set
         */
        public void setCancParAmt(Double cancParAmt) {
            this.cancParAmt = cancParAmt;
        }

        /**
         * @return the boParCnt
         */
        public int getBoParCnt() {
            return boParCnt;
        }

        /**
         * @param boParCnt the boParCnt to set
         */
        public void setBoParCnt(int boParCnt) {
            this.boParCnt = boParCnt;
        }

        /**
         * @return the boParQty
         */
        public int getBoParQty() {
            return boParQty;
        }

        /**
         * @param boParQty the boParQty to set
         */
        public void setBoParQty(int boParQty) {
            this.boParQty = boParQty;
        }

        /**
         * @return the boParAmt
         */
        public Double getBoParAmt() {
            return boParAmt;
        }

        /**
         * @param boParAmt the boParAmt to set
         */
        public void setBoParAmt(Double boParAmt) {
            this.boParAmt = boParAmt;
        }

        /**
         * @return the shipParCnt
         */
        public int getShipParCnt() {
            return shipParCnt;
        }

        /**
         * @param shipParCnt the shipParCnt to set
         */
        public void setShipParCnt(int shipParCnt) {
            this.shipParCnt = shipParCnt;
        }

        /**
         * @return the shipParQty
         */
        public int getShipParQty() {
            return shipParQty;
        }

        /**
         * @param shipParQty the shipParQty to set
         */
        public void setShipParQty(int shipParQty) {
            this.shipParQty = shipParQty;
        }

        /**
         * @return the shipParAmt
         */
        public Double getShipParAmt() {
            return shipParAmt;
        }

        /**
         * @param shipParAmt the shipParAmt to set
         */
        public void setShipParAmt(Double shipParAmt) {
            this.shipParAmt = shipParAmt;
        }

        /**
         * @return the creDt
         */
        public String getCreDt() {
            return creDt;
        }

        /**
         * @param creDt the creDt to set
         */
        public void setCreDt(String creDt) {
            this.creDt = creDt;
        }

        /**
         * @return the creHm
         */
        public String getCreHm() {
            return creHm;
        }

        /**
         * @param creHm the creHm to set
         */
        public void setCreHm(String creHm) {
            this.creHm = creHm;
        }

        /**
         * @return the itemQty
         */
        public Double getItemQty() {
            return itemQty;
        }

        /**
         * @param itemQty the itemQty to set
         */
        public void setItemQty(Double itemQty) {
            this.itemQty = itemQty;
        }

        /**
         * @return the itemAmt
         */
        public Double getItemAmt() {
            return itemAmt;
        }

        /**
         * @param itemAmt the itemAmt to set
         */
        public void setItemAmt(Double itemAmt) {
            this.itemAmt = itemAmt;
        }

        /**
         * @return the regUsrNm
         */
        public String getRegUsrNm() {
            return regUsrNm;
        }

        /**
         * @param regUsrNm the regUsrNm to set
         */
        public void setRegUsrNm(String regUsrNm) {
            this.regUsrNm = regUsrNm;
        }

        /**
         * @return the totTaxDdctAmt
         */
        public Double getTotTaxDdctAmt() {
            return totTaxDdctAmt;
        }

        /**
         * @param totTaxDdctAmt the totTaxDdctAmt to set
         */
        public void setTotTaxDdctAmt(Double totTaxDdctAmt) {
            this.totTaxDdctAmt = totTaxDdctAmt;
        }

        /**
         * @return the arrvDate
         */
        public Date getArrvDate() {
            return arrvDate;
        }

        /**
         * @param arrvDate the arrvDate to set
         */
        public void setArrvDate(Date arrvDate) {
            this.arrvDate = arrvDate;
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

        /**
         * @return the mobisInvcNo
         */
        public String getMobisInvcNo() {
            return mobisInvcNo;
        }

        /**
         * @param mobisInvcNo the mobisInvcNo to set
         */
        public void setMobisInvcNo(String mobisInvcNo) {
            this.mobisInvcNo = mobisInvcNo;
        }

}
