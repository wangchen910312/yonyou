package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdSearchVO.java
 * @Description : PurcOrdSearchVO.class
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

public class PurcOrdSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5889788098505718469L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 구매오더정보
     **/
    private String sPurcOrdNo;

    /**
     * 구매오더유형
     **/
    private String sPurcOrdTp;

    /**
     * 운송유형
     **/
    private String sTrsfTp;

    /**
     * 거래처
     **/
    private String sBpTp;

    /**
     * 구매오더상태코드리스트
     **/
    private List<String> sPurcOrdStatLst;

    /**
     * 구매거래처코드리스트
     **/
    private List<String> sBpCdList;

    /**
     * 구매오더상태코드
     **/
    private String sPurcOrdStatCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 거래처코드
     **/
    private String sBpCd;

    /**
     * 거래처명
     **/
    private String sBpNm;

    /**
     * 구매등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcRegDt;

    /**
     * 구매금액
     **/
    private int sPurcAmt;

    /**
     * 구매총금액
     **/
    private int sTotPurcAmt;

    /**
     * 구매총금액Fr
     **/
    private Double sTotPurcAmtFr;

    /**
     * 구매총금액To
     **/
    private Double sTotPurcAmtTo;

    /**
     * 전송일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSendDt;

    /**
     * 확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sConfirmDt;

    /**
     * 완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;

    /**
     * 취소일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCancDt;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 등록자ID
     **/
    private String sRegUsrId;

    /**
     * 등록자명
     **/
    private String sRegUsrNm;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    /**
     * 수정자ID
     **/
    private String sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtDt;

    /**
     * 구매오더라인번호
     **/
    private String sPurcOrdLineNo;

    /**
     * 구매품목상태코드
     **/
    private String sPurcItemStatCd;

    /**
     * 구매품목유형
     **/
    private String sPurcItemTp;

    /**
     * 삭제여부
     **/
    private String sDelYn;

    /**
     * 입고완료여부
     **/
    private String sGrEndYn;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 구매수량
     **/
    private Double sPurcQty;

    /**
     * 구매단위코드
     **/
    private String sPurcUnitCd;

    /**
     * 가격유형
     **/
    private String sPrcTp;

    /**
     * 구매단가
     **/
    private Double sPurcPrc;

    /**
     * 구매요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcReqDt;

    /**
     * 입고창고코드
     **/
    private String sGrStrgeCd;

    /**
     * 입고수량
     **/
    private Double sGrQty;


    /**
     * 구매요청번호
     **/
    private String sPurcReqNo;

    /**
     * 구매요청라인번호
     **/
    private int sPurcReqLineNo;

    /**
     * BMP오더번호
     **/
    private String sBmpOrdNo;

    /**
     * BMP확인수량
     **/
    private Double sBmpChkQty;

    /**
     * 취소수량
     **/
    private Double sCancQty;

    /**
     * 삭제포함
     **/
    //REMARK
    private String sCancelImplYn;

    /**
     * 입고완료포함
     **/
    //REMARK
    private String sGrImplYn;

    /**
     * 구매등록일자(시작)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcRegDtFr;

    /**
     * 구매등록일자(종료)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcRegDtTo;

    /**
     * 구매요청일자(시작)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcReqDtFr;

    /**
     * 구매요청일자(종료)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcReqDtTo;

    /**
     * 구매반품일자(시작)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcReturnDtFr;

    /**
     * 구매반품일자(종료)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcReturnDtTo;

    /**
     * 전송일자(시작)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSendDtFr;

    /**
     * 전송일자(종료)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSendDtTo;

    /**
     * 아모스전송일자(시작)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sArrvDtFr;

    /**
     * 아모스전송일자(종료)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sArrvDtTo;

    /**
     * 품목명
     **/
    private String sItemNm;

    /**
     * ABC_IND
     **/
    private String sAbcInd;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * 부품대분류
     **/
    private String sItemLcls;

    /**
     * 품목구분코드
     **/
    private String sItemDstinCd;

    /**
     * B/O검색여부
     **/
    private String sBoYn;

    /**
     * 반품포함여부
     **/
    private String sReturnYn;

    /**
     * 전송일자 (B/O 와 동일 시작)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sConfirmFr;

    /**
     * 전송일자 (B/O 와 동일 종료)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sConfirmTo;

    /**
     * BMP 오더 일자 (시작)
     */
    private String sBmpOrdDtFr;

    /**
     * BMP 오더 일자 (종료)
     */
    private String sBmpOrdDtTo;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPurcOrdNo
     */
    public String getsPurcOrdNo() {
        return sPurcOrdNo;
    }

    /**
     * @param sPurcOrdNo the sPurcOrdNo to set
     */
    public void setsPurcOrdNo(String sPurcOrdNo) {
        this.sPurcOrdNo = sPurcOrdNo;
    }

    /**
     * @return the sPurcOrdTp
     */
    public String getsPurcOrdTp() {
        return sPurcOrdTp;
    }

    /**
     * @param sPurcOrdTp the sPurcOrdTp to set
     */
    public void setsPurcOrdTp(String sPurcOrdTp) {
        this.sPurcOrdTp = sPurcOrdTp;
    }

    /**
     * @return the sTrsfTp
     */
    public String getsTrsfTp() {
        return sTrsfTp;
    }

    /**
     * @param sTrsfTp the sTrsfTp to set
     */
    public void setsTrsfTp(String sTrsfTp) {
        this.sTrsfTp = sTrsfTp;
    }

    /**
     * @return the sPurcOrdStatCd
     */
    public String getsPurcOrdStatCd() {
        return sPurcOrdStatCd;
    }

    /**
     * @param sPurcOrdStatCd the sPurcOrdStatCd to set
     */
    public void setsPurcOrdStatCd(String sPurcOrdStatCd) {
        this.sPurcOrdStatCd = sPurcOrdStatCd;
    }

    /**
     * @return the sPurcOrdStatLst
     */
    public List<String> getsPurcOrdStatLst() {
        return sPurcOrdStatLst;
    }

    /**
     * @param sPurcOrdStatCd the sPurcOrdStatCd to set
     */
    public void setsPurcOrdStatLst(List<String> sPurcOrdStatLst) {
        this.sPurcOrdStatLst = sPurcOrdStatLst;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sPurcRegDt
     */
    public Date getsPurcRegDt() {
        return sPurcRegDt;
    }

    /**
     * @param sPurcRegDt the sPurcRegDt to set
     */
    public void setsPurcRegDt(Date sPurcRegDt) {
        this.sPurcRegDt = sPurcRegDt;
    }

    /**
     * @return the sPurcAmt
     */
    public int getsPurcAmt() {
        return sPurcAmt;
    }

    /**
     * @param sPurcAmt the sPurcAmt to set
     */
    public void setsPurcAmt(int sPurcAmt) {
        this.sPurcAmt = sPurcAmt;
    }

    /**
     * @return the sSendDt
     */
    public Date getsSendDt() {
        return sSendDt;
    }

    /**
     * @param sSendDt the sSendDt to set
     */
    public void setsSendDt(Date sSendDt) {
        this.sSendDt = sSendDt;
    }

    /**
     * @return the sConfirmDt
     */
    public Date getsConfirmDt() {
        return sConfirmDt;
    }

    /**
     * @param sConfirmDt the sConfirmDt to set
     */
    public void setsConfirmDt(Date sConfirmDt) {
        this.sConfirmDt = sConfirmDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

    /**
     * @return the sCancDt
     */
    public Date getsCancDt() {
        return sCancDt;
    }

    /**
     * @param sCancDt the sCancDt to set
     */
    public void setsCancDt(Date sCancDt) {
        this.sCancDt = sCancDt;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sRegUsrNm
     */
    public String getsRegUsrNm() {
        return sRegUsrNm;
    }

    /**
     * @param sRegUsrNm the sRegUsrNm to set
     */
    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }

    /**
     * @return the sPurcOrdLineNo
     */
    public String getsPurcOrdLineNo() {
        return sPurcOrdLineNo;
    }

    /**
     * @param sPurcOrdLineNo the sPurcOrdLineNo to set
     */
    public void setsPurcOrdLineNo(String sPurcOrdLineNo) {
        this.sPurcOrdLineNo = sPurcOrdLineNo;
    }

    /**
     * @return the sPurcItemStatCd
     */
    public String getsPurcItemStatCd() {
        return sPurcItemStatCd;
    }

    /**
     * @param sPurcItemStatCd the sPurcItemStatCd to set
     */
    public void setsPurcItemStatCd(String sPurcItemStatCd) {
        this.sPurcItemStatCd = sPurcItemStatCd;
    }

    /**
     * @return the sPurcItemTp
     */
    public String getsPurcItemTp() {
        return sPurcItemTp;
    }

    /**
     * @param sPurcItemTp the sPurcItemTp to set
     */
    public void setsPurcItemTp(String sPurcItemTp) {
        this.sPurcItemTp = sPurcItemTp;
    }

    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }

    /**
     * @return the sGrEndYn
     */
    public String getsGrEndYn() {
        return sGrEndYn;
    }

    /**
     * @param sGrEndYn the sGrEndYn to set
     */
    public void setsGrEndYn(String sGrEndYn) {
        this.sGrEndYn = sGrEndYn;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sPurcQty
     */
    public Double getsPurcQty() {
        return sPurcQty;
    }

    /**
     * @param sPurcQty the sPurcQty to set
     */
    public void setsPurcQty(Double sPurcQty) {
        this.sPurcQty = sPurcQty;
    }

    /**
     * @return the sPurcUnitCd
     */
    public String getsPurcUnitCd() {
        return sPurcUnitCd;
    }

    /**
     * @param sPurcUnitCd the sPurcUnitCd to set
     */
    public void setsPurcUnitCd(String sPurcUnitCd) {
        this.sPurcUnitCd = sPurcUnitCd;
    }

    /**
     * @return the sPrcTp
     */
    public String getsPrcTp() {
        return sPrcTp;
    }

    /**
     * @param sPrcTp the sPrcTp to set
     */
    public void setsPrcTp(String sPrcTp) {
        this.sPrcTp = sPrcTp;
    }

    /**
     * @return the sPurcPrc
     */
    public Double getsPurcPrc() {
        return sPurcPrc;
    }

    /**
     * @param sPurcPrc the sPurcPrc to set
     */
    public void setsPurcPrc(Double sPurcPrc) {
        this.sPurcPrc = sPurcPrc;
    }

    /**
     * @return the sPurcReqDt
     */
    public Date getsPurcReqDt() {
        return sPurcReqDt;
    }

    /**
     * @param sPurcReqDt the sPurcReqDt to set
     */
    public void setsPurcReqDt(Date sPurcReqDt) {
        this.sPurcReqDt = sPurcReqDt;
    }

    /**
     * @return the sGrStrgeCd
     */
    public String getsGrStrgeCd() {
        return sGrStrgeCd;
    }

    /**
     * @param sGrStrgeCd the sGrStrgeCd to set
     */
    public void setsGrStrgeCd(String sGrStrgeCd) {
        this.sGrStrgeCd = sGrStrgeCd;
    }

    /**
     * @return the sGrQty
     */
    public Double getsGrQty() {
        return sGrQty;
    }

    /**
     * @param sGrQty the sGrQty to set
     */
    public void setsGrQty(Double sGrQty) {
        this.sGrQty = sGrQty;
    }


    /**
     * @return the sPurcReqNo
     */
    public String getsPurcReqNo() {
        return sPurcReqNo;
    }

    /**
     * @param sPurcReqNo the sPurcReqNo to set
     */
    public void setsPurcReqNo(String sPurcReqNo) {
        this.sPurcReqNo = sPurcReqNo;
    }

    /**
     * @return the sPurcReqLineNo
     */
    public int getsPurcReqLineNo() {
        return sPurcReqLineNo;
    }

    /**
     * @param sPurcReqLineNo the sPurcReqLineNo to set
     */
    public void setsPurcReqLineNo(int sPurcReqLineNo) {
        this.sPurcReqLineNo = sPurcReqLineNo;
    }

    /**
     * @return the sBmpOrdNo
     */
    public String getsBmpOrdNo() {
        return sBmpOrdNo;
    }

    /**
     * @param sBmpOrdNo the sBmpOrdNo to set
     */
    public void setsBmpOrdNo(String sBmpOrdNo) {
        this.sBmpOrdNo = sBmpOrdNo;
    }

    /**
     * @return the sBmpChkQty
     */
    public Double getsBmpChkQty() {
        return sBmpChkQty;
    }

    /**
     * @param sBmpChkQty the sBmpChkQty to set
     */
    public void setsBmpChkQty(Double sBmpChkQty) {
        this.sBmpChkQty = sBmpChkQty;
    }

    /**
     * @return the sCancQty
     */
    public Double getsCancQty() {
        return sCancQty;
    }

    /**
     * @param sCancQty the sCancQty to set
     */
    public void setsCancQty(Double sCancQty) {
        this.sCancQty = sCancQty;
    }

    /**
     * @return the sCancelImplYn
     */
    public String getsCancelImplYn() {
        return sCancelImplYn;
    }

    /**
     * @param sCancelImplYn the sCancelImplYn to set
     */
    public void setsCancelImplYn(String sCancelImplYn) {
        this.sCancelImplYn = sCancelImplYn;
    }

    /**
     * @return the sGrImplYn
     */
    public String getsGrImplYn() {
        return sGrImplYn;
    }

    /**
     * @param sGrImplYn the sGrImplYn to set
     */
    public void setsGrImplYn(String sGrImplYn) {
        this.sGrImplYn = sGrImplYn;
    }

    /**
     * @return the sPurcRegDtFr
     */
    public Date getsPurcRegDtFr() {
        return sPurcRegDtFr;
    }

    /**
     * @param sPurcRegDtFr the sPurcRegDtFr to set
     */
    public void setsPurcRegDtFr(Date sPurcRegDtFr) {
        this.sPurcRegDtFr = sPurcRegDtFr;
    }

    /**
     * @return the sPurcRegDtTo
     */
    public Date getsPurcRegDtTo() {
        return sPurcRegDtTo;
    }

    /**
     * @param sPurcRegDtTo the sPurcRegDtTo to set
     */
    public void setsPurcRegDtTo(Date sPurcRegDtTo) {
        this.sPurcRegDtTo = sPurcRegDtTo;
    }

    /**
     * @return the sPurcReqDtFr
     */
    public Date getsPurcReqDtFr() {
        return sPurcReqDtFr;
    }

    /**
     * @param sPurcReqDtFr the sPurcReqDtFr to set
     */
    public void setsPurcReqDtFr(Date sPurcReqDtFr) {
        this.sPurcReqDtFr = sPurcReqDtFr;
    }

    /**
     * @return the sPurcReqDtTo
     */
    public Date getsPurcReqDtTo() {
        return sPurcReqDtTo;
    }

    /**
     * @param sPurcReqDtTo the sPurcReqDtTo to set
     */
    public void setsPurcReqDtTo(Date sPurcReqDtTo) {
        this.sPurcReqDtTo = sPurcReqDtTo;
    }

    /**
     * @return the sBpNm
     */
    public String getsBpNm() {
        return sBpNm;
    }

    /**
     * @param sBpNm the sBpNm to set
     */
    public void setsBpNm(String sBpNm) {
        this.sBpNm = sBpNm;
    }

    /**
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }

    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }

    /**
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sItemLcls
     */
    public String getsItemLcls() {
        return sItemLcls;
    }

    /**
     * @param sItemLcls the sItemLcls to set
     */
    public void setsItemLcls(String sItemLcls) {
        this.sItemLcls = sItemLcls;
    }

    /**
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }

    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }

    /**
     * @return the sBpCdList
     */
    public List<String> getsBpCdList() {
        return sBpCdList;
    }

    /**
     * @param sBpCdList the sBpCdList to set
     */
    public void setsBpCdList(List<String> sBpCdList) {
        this.sBpCdList = sBpCdList;
    }

    /**
     * @return the sTotPurcAmt
     */
    public int getsTotPurcAmt() {
        return sTotPurcAmt;
    }

    /**
     * @param sTotPurcAmt the sTotPurcAmt to set
     */
    public void setsTotPurcAmt(int sTotPurcAmt) {
        this.sTotPurcAmt = sTotPurcAmt;
    }

    /**
     * @return the sBoYn
     */
    public String getsBoYn() {
        return sBoYn;
    }

    /**
     * @param sBoYn the sBoYn to set
     */
    public void setsBoYn(String sBoYn) {
        this.sBoYn = sBoYn;
    }

    /**
     * @return the sReturnYn
     */
    public String getsReturnYn() {
        return sReturnYn;
    }

    /**
     * @param sReturnYn the sReturnYn to set
     */
    public void setsReturnYn(String sReturnYn) {
        this.sReturnYn = sReturnYn;
    }

    /**
     * @return the sPurcReturnDtFr
     */
    public Date getsPurcReturnDtFr() {
        return sPurcReturnDtFr;
    }

    /**
     * @param sPurcReturnDtFr the sPurcReturnDtFr to set
     */
    public void setsPurcReturnDtFr(Date sPurcReturnDtFr) {
        this.sPurcReturnDtFr = sPurcReturnDtFr;
    }

    /**
     * @return the sPurcReturnDtTo
     */
    public Date getsPurcReturnDtTo() {
        return sPurcReturnDtTo;
    }

    /**
     * @param sPurcReturnDtTo the sPurcReturnDtTo to set
     */
    public void setsPurcReturnDtTo(Date sPurcReturnDtTo) {
        this.sPurcReturnDtTo = sPurcReturnDtTo;
    }

    /**
     * @return the sSendDtFr
     */
    public Date getsSendDtFr() {
        return sSendDtFr;
    }

    /**
     * @param sSendDtFr the sSendDtFr to set
     */
    public void setsSendDtFr(Date sSendDtFr) {
        this.sSendDtFr = sSendDtFr;
    }

    /**
     * @return the sSendDtTo
     */
    public Date getsSendDtTo() {
        return sSendDtTo;
    }

    /**
     * @param sSendDtTo the sSendDtTo to set
     */
    public void setsSendDtTo(Date sSendDtTo) {
        this.sSendDtTo = sSendDtTo;
    }

    /**
     * @return the sBpTp
     */
    public String getsBpTp() {
        return sBpTp;
    }

    /**
     * @param sBpTp the sBpTp to set
     */
    public void setsBpTp(String sBpTp) {
        this.sBpTp = sBpTp;
    }

    /**
     * @return the sTotPurcAmtFr
     */
    public Double getsTotPurcAmtFr() {
        return sTotPurcAmtFr;
    }

    /**
     * @param sTotPurcAmtFr the sTotPurcAmtFr to set
     */
    public void setsTotPurcAmtFr(Double sTotPurcAmtFr) {
        this.sTotPurcAmtFr = sTotPurcAmtFr;
    }

    /**
     * @return the sTotPurcAmtTo
     */
    public Double getsTotPurcAmtTo() {
        return sTotPurcAmtTo;
    }

    /**
     * @param sTotPurcAmtTo the sTotPurcAmtTo to set
     */
    public void setsTotPurcAmtTo(Double sTotPurcAmtTo) {
        this.sTotPurcAmtTo = sTotPurcAmtTo;
    }

    /**
     * @return the sArrvDtFr
     */
    public Date getsArrvDtFr() {
        return sArrvDtFr;
    }

    /**
     * @param sArrvDtFr the sArrvDtFr to set
     */
    public void setsArrvDtFr(Date sArrvDtFr) {
        this.sArrvDtFr = sArrvDtFr;
    }

    /**
     * @return the sArrvDtTo
     */
    public Date getsArrvDtTo() {
        return sArrvDtTo;
    }

    /**
     * @param sArrvDtTo the sArrvDtTo to set
     */
    public void setsArrvDtTo(Date sArrvDtTo) {
        this.sArrvDtTo = sArrvDtTo;
    }

    /**
     * @return the sConfirmFr
     */
    public Date getsConfirmFr() {
        return sConfirmFr;
    }

    /**
     * @param sConfirmFr the sConfirmFr to set
     */
    public void setsConfirmFr(Date sConfirmFr) {
        this.sConfirmFr = sConfirmFr;
    }

    /**
     * @return the sConfirmTo
     */
    public Date getsConfirmTo() {
        return sConfirmTo;
    }

    /**
     * @param sConfirmTo the sConfirmTo to set
     */
    public void setsConfirmTo(Date sConfirmTo) {
        this.sConfirmTo = sConfirmTo;
    }

    /**
     * @return the sBmpOrdDtFr
     */
    public String getsBmpOrdDtFr() {
        return sBmpOrdDtFr;
    }

    /**
     * @param sBmpOrdDtFr the sBmpOrdDtFr to set
     */
    public void setsBmpOrdDtFr(String sBmpOrdDtFr) {
        this.sBmpOrdDtFr = sBmpOrdDtFr;
    }

    /**
     * @return the sBmpOrdDtTo
     */
    public String getsBmpOrdDtTo() {
        return sBmpOrdDtTo;
    }

    /**
     * @param sBmpOrdDtTo the sBmpOrdDtTo to set
     */
    public void setsBmpOrdDtTo(String sBmpOrdDtTo) {
        this.sBmpOrdDtTo = sBmpOrdDtTo;
    }
}
