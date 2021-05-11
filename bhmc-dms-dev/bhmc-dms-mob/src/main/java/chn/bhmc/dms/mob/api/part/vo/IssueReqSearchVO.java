package chn.bhmc.dms.mob.api.part.vo;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 출고요청 검색 VO
 *
 * @ClassName   : IssueReqSearchVO.java
 * @Description : IssueReqSearchVO Class
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim     최초 생성
 * </pre>
 */

public class IssueReqSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5130046355150414281L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * 사번코드
     **/
    private String sEmpNo;

    /**
     * 사용자명
     **/
    private String sUsrNm;

    /**
     * 부품요청문서번호
     **/
    private String sParReqDocNo;

    /**
     * 부품요청문서번호 Like
     **/
    private String sParReqDocNoLike;

    /**
     * 부품요청문서라인번호
     **/
    private int sParReqDocLineNo = 0;

    /**
     * 반품시원부품요청문서라인번호
     **/
    private int sParReqDocStockLineNo = 0;

    /**
     * 부품요청문서라인최소번호 조회 여부.
     **/
    private String sMinParReqDocLineNoYn;

    /**
     * 부품출고유형
     **/
    private String sParGiTp;

    /**
     * 부품요청상태코드
     **/
    private String sParReqStatCd;

    /**
     * 취소여부
     **/
    private String sCancYn;

    /**
     * RO일련번호
     **/
    private String sRoDocNo;

    /**
     * RO일련번호 LIKE 검색유무
     **/
    private String sRoDocNoLikeUseYn = "N";

    /**
     * RO일련번호 라인번호
     **/
    private int sRoLineNo;

    /**
     * RO유형
     **/
    private String sRoTp;

    /**
     * RO상태
     **/
    private String sRoStatCd;

    /**
     * RO 기본상태
     **/
    private String sRoStatCdYn;

    /**
     * 예약문서번호
     **/
    private String sResvDocNo;

    /**
     * 예약문서번호 Like
     **/
    private String sResvDocNoLike;

    /**
     * 예약문서번호 라인번호
     **/
    private int sResvDocLineNo;

    /**
     * 예약문서상태(정비)
     **/
    private String sResvStatCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 서비스담당자ID
     **/
    private String sSerPrsnId;

    /**
     * 서비스담당자명
     **/
    private String sSerPrsnNm;

    /**
     * 정비위탁자(RO등록자)
     **/
    private String sInvRoManNm;

    /**
     * SA ID
     **/
    private String sSaId;

    /**
     * SA NM
     **/
    private String sSaNm;

    /**
     * 고객코드
     **/
    private String sCustCd;

    /**
     * 고객명
     **/

    private String sCustNm;

    /**
     * 차대번호
     **/

    private String sVinNo;

    /**
     * 차량번호
     **/
    private String sCarNo;

    /**
     * 예약처리자
     **/
    private String sResvUsrId = "";

    /**
     * 예약처리자명
     **/
    private String sResvUsrNm = "";

    /**
     * 부품예약처리자
     **/
    private String sPartsResvUsrId = "";

    /**
     * 부품예약처리자명
     **/
    private String sPartsResvUsrNm = "";

    /**
     * 부품예류자
     **/
    private String sReadyUsrId = "";

    /**
     * 부품예류자명
     **/
    private String sReadyUsrNm = "";

    /**
     * 부품예류시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReadyReqStartDt;

    /**
     * 부품예류종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReadyReqEndDt;

    /**
     * 부품예류취소시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReadyCancReqStartDt;

    /**
     * 부품예류취소종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReadyCancReqEndDt;

    /**
     * 부품번호
     **/
    private String sItemCd;

    /**
     * 부품번호만
     **/
    private String sItemCdOnly;

    /**
     * 부품명
     **/
    private String sItemNm;

    /**
     * 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqStartDt;

    /**
     * 종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqEndDt;

    /**
     * 출고시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDocReqStartDt;

    /**
     * 출고종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDocReqEndDt;

    /**
     * 수령인ID(출고수령인ID)
     **/
    private String sReceiveId;

    /**
     * 수령인명칭(출고수령인명칭)
     **/
    private String sReceiveNm;

    /**
     * 차용시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sBorrowStartDt;

    /**
     * 차용종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sBorrowEndDt;

    /**
     * 정비작업시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvRoWorkStartDt;

    /**
     * 정비작업종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvRoWorkEndDt;

    /**
     * ABC Class
     **/
    private String sAbcInd;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * 출고문서번호
     **/
    private String sGiDocNo;

    /**
     * 출고문서유형
     **/
    private String sGiDocTp;

    /**
     * 출고문서상태코드
     **/
    private String sGiDocStatCd;

    /**
     * 부품출고유무
     **/
    private String sPartsOutUseYn;

    /**
     * 기타출고상태코드
     **/
    private String sEtcGiTp;

    /**
     * 준비상태코드(그룹)
     **/
    private String sReadyStatCd;

    /**
     * 준비상태코드(단일)
     **/
    private String sReadyStatCdOnly;

    /**
     * 준비문서번호
     **/
    private String sReadyDocNo;

    /**
     * 차용문서번호
     **/
    private String sBorrowDocNo;

    /**
     * 차용문서번호유무
     **/
    private String sBorrowDocNoUseYn = "N";

    /**
     * 차용상태코드
     **/
    private String sBorrowStatCd;

    /**
     * 차용문서부서코드
     **/
    private String sBorrowDeptCd;

    /**
     * 차용문서부서명
     **/
    private String sBorrowDeptNm;

    /**
     * 차용자아이디
     **/
    private String sBorrowUsrId;

    /**
     * 차용자아이디
     **/
    private String sBorrowUsrNm;

    /**
     * 기타예류문서번호
     **/
    private String sEtcRvDocNo;

    /**
     * 기타예류상태코드
     **/
    private String sEtcRvStatCd;

    /**
     * 부품요청세부 부품 카운트 체크.
     **/
    private String sItemCntYn = "Y";

    /**
     * 가격유형
     **/
    private String sPrcTp = "01";

    /**
     * 부품요청창고
     **/
    private String sReqStrgeCd;

    /**
     * 창고코드 리스트
     **/
    private List<String> sStrgeCdList;

    /**
     * 부품출고창고
     **/
    private String sGiStrgeCd;

    /**
     * 부품입고창고
     **/
    private String sGrStrgeCd;

    /**
     * 작업진도 작업자ID
     **/
    private String sRealTecId;

    /**
     * 작업진도 작업자명
     **/
    private String sRealTecNm;

    /**
     * 작업진도 작업소조명
     **/
    private String sWkgrpNm;

    /**
     * 부품가격
     **/
    private double sItemPrc;

    /**
     * RO작업종료여부(위탁확인,수리서비스)
     **/
    private String sRoWorkEndYn;

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
     * @return the sEmpNo
     */
    public String getsEmpNo() {
        return sEmpNo;
    }

    /**
     * @param sEmpNo the sEmpNo to set
     */
    public void setsEmpNo(String sEmpNo) {
        this.sEmpNo = sEmpNo;
    }

    /**
     * @return the sUsrNm
     */
    public String getsUsrNm() {
        return sUsrNm;
    }

    /**
     * @param sUsrNm the sUsrNm to set
     */
    public void setsUsrNm(String sUsrNm) {
        this.sUsrNm = sUsrNm;
    }

    /**
     * @return the sParReqDocNo
     */
    public String getsParReqDocNo() {
        return sParReqDocNo;
    }

    /**
     * @param sParReqDocNo the sParReqDocNo to set
     */
    public void setsParReqDocNo(String sParReqDocNo) {
        this.sParReqDocNo = sParReqDocNo;
    }

    /**
     * @return the sParReqDocNoLike
     */
    public String getsParReqDocNoLike() {
        return sParReqDocNoLike;
    }

    /**
     * @param sParReqDocNoLike the sParReqDocNoLike to set
     */
    public void setsParReqDocNoLike(String sParReqDocNoLike) {
        this.sParReqDocNoLike = sParReqDocNoLike;
    }

    /**
     * @return the sParReqDocLineNo
     */
    public int getsParReqDocLineNo() {
        return sParReqDocLineNo;
    }

    /**
     * @param sParReqDocLineNo the sParReqDocLineNo to set
     */
    public void setsParReqDocLineNo(int sParReqDocLineNo) {
        this.sParReqDocLineNo = sParReqDocLineNo;
    }

    /**
     * @return the sParReqDocStockLineNo
     */
    public int getsParReqDocStockLineNo() {
        return sParReqDocStockLineNo;
    }

    /**
     * @param sParReqDocStockLineNo the sParReqDocStockLineNo to set
     */
    public void setsParReqDocStockLineNo(int sParReqDocStockLineNo) {
        this.sParReqDocStockLineNo = sParReqDocStockLineNo;
    }

    /**
     * @return the sMinParReqDocLineNoYn
     */
    public String getsMinParReqDocLineNoYn() {
        return sMinParReqDocLineNoYn;
    }

    /**
     * @param sMinParReqDocLineNoYn the sMinParReqDocLineNoYn to set
     */
    public void setsMinParReqDocLineNoYn(String sMinParReqDocLineNoYn) {
        this.sMinParReqDocLineNoYn = sMinParReqDocLineNoYn;
    }

    /**
     * @return the sParGiTp
     */
    public String getsParGiTp() {
        return sParGiTp;
    }

    /**
     * @param sParGiTp the sParGiTp to set
     */
    public void setsParGiTp(String sParGiTp) {
        this.sParGiTp = sParGiTp;
    }

    /**
     * @return the sParReqStatCd
     */
    public String getsParReqStatCd() {
        return sParReqStatCd;
    }

    /**
     * @param sParReqStatCd the sParReqStatCd to set
     */
    public void setsParReqStatCd(String sParReqStatCd) {
        this.sParReqStatCd = sParReqStatCd;
    }

    /**
     * @return the sCancYn
     */
    public String getsCancYn() {
        return sCancYn;
    }

    /**
     * @param sCancYn the sCancYn to set
     */
    public void setsCancYn(String sCancYn) {
        this.sCancYn = sCancYn;
    }

    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }

    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sRoDocNoLikeUseYn
     */
    public String getsRoDocNoLikeUseYn() {
        return sRoDocNoLikeUseYn;
    }

    /**
     * @param sRoDocNoLikeUseYn the sRoDocNoLikeUseYn to set
     */
    public void setsRoDocNoLikeUseYn(String sRoDocNoLikeUseYn) {
        this.sRoDocNoLikeUseYn = sRoDocNoLikeUseYn;
    }

    /**
     * @return the sRoLineNo
     */
    public int getsRoLineNo() {
        return sRoLineNo;
    }

    /**
     * @param sRoLineNo the sRoLineNo to set
     */
    public void setsRoLineNo(int sRoLineNo) {
        this.sRoLineNo = sRoLineNo;
    }

    /**
     * @return the sRoTp
     */
    public String getsRoTp() {
        return sRoTp;
    }

    /**
     * @param sRoTp the sRoTp to set
     */
    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

    /**
     * @return the sRoStatCd
     */
    public String getsRoStatCd() {
        return sRoStatCd;
    }

    /**
     * @param sRoStatCd the sRoStatCd to set
     */
    public void setsRoStatCd(String sRoStatCd) {
        this.sRoStatCd = sRoStatCd;
    }

    /**
     * @return the sRoStatCdYn
     */
    public String getsRoStatCdYn() {
        return sRoStatCdYn;
    }

    /**
     * @param sRoStatCdYn the sRoStatCdYn to set
     */
    public void setsRoStatCdYn(String sRoStatCdYn) {
        this.sRoStatCdYn = sRoStatCdYn;
    }

    /**
     * @return the sResvDocNo
     */
    public String getsResvDocNo() {
        return sResvDocNo;
    }

    /**
     * @param sResvDocNo the sResvDocNo to set
     */
    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
    }

    /**
     * @return the sResvDocNoLike
     */
    public String getsResvDocNoLike() {
        return sResvDocNoLike;
    }

    /**
     * @param sResvDocNoLike the sResvDocNoLike to set
     */
    public void setsResvDocNoLike(String sResvDocNoLike) {
        this.sResvDocNoLike = sResvDocNoLike;
    }

    /**
     * @return the sResvDocLineNo
     */
    public int getsResvDocLineNo() {
        return sResvDocLineNo;
    }

    /**
     * @param sResvDocLineNo the sResvDocLineNo to set
     */
    public void setsResvDocLineNo(int sResvDocLineNo) {
        this.sResvDocLineNo = sResvDocLineNo;
    }

    /**
     * @return the sResvStatCd
     */
    public String getsResvStatCd() {
        return sResvStatCd;
    }

    /**
     * @param sResvStatCd the sResvStatCd to set
     */
    public void setsResvStatCd(String sResvStatCd) {
        this.sResvStatCd = sResvStatCd;
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
     * @return the sSerPrsnId
     */
    public String getsSerPrsnId() {
        return sSerPrsnId;
    }

    /**
     * @param sSerPrsnId the sSerPrsnId to set
     */
    public void setsSerPrsnId(String sSerPrsnId) {
        this.sSerPrsnId = sSerPrsnId;
    }

    /**
     * @return the sSerPrsnNm
     */
    public String getsSerPrsnNm() {
        return sSerPrsnNm;
    }

    /**
     * @param sSerPrsnNm the sSerPrsnNm to set
     */
    public void setsSerPrsnNm(String sSerPrsnNm) {
        this.sSerPrsnNm = sSerPrsnNm;
    }

    /**
     * @return the sInvRoManNm
     */
    public String getsInvRoManNm() {
        return sInvRoManNm;
    }

    /**
     * @param sInvRoManNm the sInvRoManNm to set
     */
    public void setsInvRoManNm(String sInvRoManNm) {
        this.sInvRoManNm = sInvRoManNm;
    }

    /**
     * @return the sSaId
     */
    public String getsSaId() {
        return sSaId;
    }

    /**
     * @param sSaId the sSaId to set
     */
    public void setsSaId(String sSaId) {
        this.sSaId = sSaId;
    }

    /**
     * @return the sSaNm
     */
    public String getsSaNm() {
        return sSaNm;
    }

    /**
     * @param sSaNm the sSaNm to set
     */
    public void setsSaNm(String sSaNm) {
        this.sSaNm = sSaNm;
    }

    /**
     * @return the sCustCd
     */
    public String getsCustCd() {
        return sCustCd;
    }

    /**
     * @param sCustCd the sCustCd to set
     */
    public void setsCustCd(String sCustCd) {
        this.sCustCd = sCustCd;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sCarNo
     */
    public String getsCarNo() {
        return sCarNo;
    }

    /**
     * @param sCarNo the sCarNo to set
     */
    public void setsCarNo(String sCarNo) {
        this.sCarNo = sCarNo;
    }

    /**
     * @return the sResvUsrId
     */
    public String getsResvUsrId() {
        return sResvUsrId;
    }

    /**
     * @param sResvUsrId the sResvUsrId to set
     */
    public void setsResvUsrId(String sResvUsrId) {
        this.sResvUsrId = sResvUsrId;
    }

    /**
     * @return the sResvUsrNm
     */
    public String getsResvUsrNm() {
        return sResvUsrNm;
    }

    /**
     * @param sResvUsrNm the sResvUsrNm to set
     */
    public void setsResvUsrNm(String sResvUsrNm) {
        this.sResvUsrNm = sResvUsrNm;
    }

    /**
     * @return the sPartsResvUsrId
     */
    public String getsPartsResvUsrId() {
        return sPartsResvUsrId;
    }

    /**
     * @param sPartsResvUsrId the sPartsResvUsrId to set
     */
    public void setsPartsResvUsrId(String sPartsResvUsrId) {
        this.sPartsResvUsrId = sPartsResvUsrId;
    }

    /**
     * @return the sPartsResvUsrNm
     */
    public String getsPartsResvUsrNm() {
        return sPartsResvUsrNm;
    }

    /**
     * @param sPartsResvUsrNm the sPartsResvUsrNm to set
     */
    public void setsPartsResvUsrNm(String sPartsResvUsrNm) {
        this.sPartsResvUsrNm = sPartsResvUsrNm;
    }

    /**
     * @return the sReadyUsrId
     */
    public String getsReadyUsrId() {
        return sReadyUsrId;
    }

    /**
     * @param sReadyUsrId the sReadyUsrId to set
     */
    public void setsReadyUsrId(String sReadyUsrId) {
        this.sReadyUsrId = sReadyUsrId;
    }

    /**
     * @return the sReadyUsrNm
     */
    public String getsReadyUsrNm() {
        return sReadyUsrNm;
    }

    /**
     * @param sReadyUsrNm the sReadyUsrNm to set
     */
    public void setsReadyUsrNm(String sReadyUsrNm) {
        this.sReadyUsrNm = sReadyUsrNm;
    }

    /**
     * @return the sReadyReqStartDt
     */
    public Date getsReadyReqStartDt() {
        return sReadyReqStartDt;
    }

    /**
     * @param sReadyReqStartDt the sReadyReqStartDt to set
     */
    public void setsReadyReqStartDt(Date sReadyReqStartDt) {
        this.sReadyReqStartDt = sReadyReqStartDt;
    }

    /**
     * @return the sReadyReqEndDt
     */
    public Date getsReadyReqEndDt() {
        return sReadyReqEndDt;
    }

    /**
     * @param sReadyReqEndDt the sReadyReqEndDt to set
     */
    public void setsReadyReqEndDt(Date sReadyReqEndDt) {
        this.sReadyReqEndDt = sReadyReqEndDt;
    }

    /**
     * @return the sReadyCancReqStartDt
     */
    public Date getsReadyCancReqStartDt() {
        return sReadyCancReqStartDt;
    }

    /**
     * @param sReadyCancReqStartDt the sReadyCancReqStartDt to set
     */
    public void setsReadyCancReqStartDt(Date sReadyCancReqStartDt) {
        this.sReadyCancReqStartDt = sReadyCancReqStartDt;
    }

    /**
     * @return the sReadyCancReqEndDt
     */
    public Date getsReadyCancReqEndDt() {
        return sReadyCancReqEndDt;
    }

    /**
     * @param sReadyCancReqEndDt the sReadyCancReqEndDt to set
     */
    public void setsReadyCancReqEndDt(Date sReadyCancReqEndDt) {
        this.sReadyCancReqEndDt = sReadyCancReqEndDt;
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
     * @return the sItemCdOnly
     */
    public String getsItemCdOnly() {
        return sItemCdOnly;
    }

    /**
     * @param sItemCdOnly the sItemCdOnly to set
     */
    public void setsItemCdOnly(String sItemCdOnly) {
        this.sItemCdOnly = sItemCdOnly;
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
     * @return the sReqStartDt
     */
    public Date getsReqStartDt() {
        return sReqStartDt;
    }

    /**
     * @param sReqStartDt the sReqStartDt to set
     */
    public void setsReqStartDt(Date sReqStartDt) {
        this.sReqStartDt = sReqStartDt;
    }

    /**
     * @return the sReqEndDt
     */
    public Date getsReqEndDt() {
        return sReqEndDt;
    }

    /**
     * @param sReqEndDt the sReqEndDt to set
     */
    public void setsReqEndDt(Date sReqEndDt) {
        this.sReqEndDt = sReqEndDt;
    }

    /**
     * @return the sGiDocReqStartDt
     */
    public Date getsGiDocReqStartDt() {
        return sGiDocReqStartDt;
    }

    /**
     * @param sGiDocReqStartDt the sGiDocReqStartDt to set
     */
    public void setsGiDocReqStartDt(Date sGiDocReqStartDt) {
        this.sGiDocReqStartDt = sGiDocReqStartDt;
    }

    /**
     * @return the sGiDocReqEndDt
     */
    public Date getsGiDocReqEndDt() {
        return sGiDocReqEndDt;
    }

    /**
     * @param sGiDocReqEndDt the sGiDocReqEndDt to set
     */
    public void setsGiDocReqEndDt(Date sGiDocReqEndDt) {
        this.sGiDocReqEndDt = sGiDocReqEndDt;
    }

    /**
     * @return the sReceiveId
     */
    public String getsReceiveId() {
        return sReceiveId;
    }

    /**
     * @param sReceiveId the sReceiveId to set
     */
    public void setsReceiveId(String sReceiveId) {
        this.sReceiveId = sReceiveId;
    }

    /**
     * @return the sReceiveNm
     */
    public String getsReceiveNm() {
        return sReceiveNm;
    }

    /**
     * @param sReceiveNm the sReceiveNm to set
     */
    public void setsReceiveNm(String sReceiveNm) {
        this.sReceiveNm = sReceiveNm;
    }

    /**
     * @return the sBorrowStartDt
     */
    public Date getsBorrowStartDt() {
        return sBorrowStartDt;
    }

    /**
     * @param sBorrowStartDt the sBorrowStartDt to set
     */
    public void setsBorrowStartDt(Date sBorrowStartDt) {
        this.sBorrowStartDt = sBorrowStartDt;
    }

    /**
     * @return the sBorrowEndDt
     */
    public Date getsBorrowEndDt() {
        return sBorrowEndDt;
    }

    /**
     * @param sBorrowEndDt the sBorrowEndDt to set
     */
    public void setsBorrowEndDt(Date sBorrowEndDt) {
        this.sBorrowEndDt = sBorrowEndDt;
    }

    /**
     * @return the sInvRoWorkStartDt
     */
    public Date getsInvRoWorkStartDt() {
        return sInvRoWorkStartDt;
    }

    /**
     * @param sInvRoWorkStartDt the sInvRoWorkStartDt to set
     */
    public void setsInvRoWorkStartDt(Date sInvRoWorkStartDt) {
        this.sInvRoWorkStartDt = sInvRoWorkStartDt;
    }

    /**
     * @return the sInvRoWorkEndDt
     */
    public Date getsInvRoWorkEndDt() {
        return sInvRoWorkEndDt;
    }

    /**
     * @param sInvRoWorkEndDt the sInvRoWorkEndDt to set
     */
    public void setsInvRoWorkEndDt(Date sInvRoWorkEndDt) {
        this.sInvRoWorkEndDt = sInvRoWorkEndDt;
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
     * @return the sGiDocNo
     */
    public String getsGiDocNo() {
        return sGiDocNo;
    }

    /**
     * @param sGiDocNo the sGiDocNo to set
     */
    public void setsGiDocNo(String sGiDocNo) {
        this.sGiDocNo = sGiDocNo;
    }

    /**
     * @return the sGiDocTp
     */
    public String getsGiDocTp() {
        return sGiDocTp;
    }

    /**
     * @param sGiDocTp the sGiDocTp to set
     */
    public void setsGiDocTp(String sGiDocTp) {
        this.sGiDocTp = sGiDocTp;
    }

    /**
     * @return the sGiDocStatCd
     */
    public String getsGiDocStatCd() {
        return sGiDocStatCd;
    }

    /**
     * @param sGiDocStatCd the sGiDocStatCd to set
     */
    public void setsGiDocStatCd(String sGiDocStatCd) {
        this.sGiDocStatCd = sGiDocStatCd;
    }

    /**
     * @return the sPartsOutUseYn
     */
    public String getsPartsOutUseYn() {
        return sPartsOutUseYn;
    }

    /**
     * @param sPartsOutUseYn the sPartsOutUseYn to set
     */
    public void setsPartsOutUseYn(String sPartsOutUseYn) {
        this.sPartsOutUseYn = sPartsOutUseYn;
    }

    /**
     * @return the sEtcGiTp
     */
    public String getsEtcGiTp() {
        return sEtcGiTp;
    }

    /**
     * @param sEtcGiTp the sEtcGiTp to set
     */
    public void setsEtcGiTp(String sEtcGiTp) {
        this.sEtcGiTp = sEtcGiTp;
    }

    /**
     * @return the sReadyStatCd
     */
    public String getsReadyStatCd() {
        return sReadyStatCd;
    }

    /**
     * @param sReadyStatCd the sReadyStatCd to set
     */
    public void setsReadyStatCd(String sReadyStatCd) {
        this.sReadyStatCd = sReadyStatCd;
    }

    /**
     * @return the sReadyStatCdOnly
     */
    public String getsReadyStatCdOnly() {
        return sReadyStatCdOnly;
    }

    /**
     * @param sReadyStatCdOnly the sReadyStatCdOnly to set
     */
    public void setsReadyStatCdOnly(String sReadyStatCdOnly) {
        this.sReadyStatCdOnly = sReadyStatCdOnly;
    }

    /**
     * @return the sReadyDocNo
     */
    public String getsReadyDocNo() {
        return sReadyDocNo;
    }

    /**
     * @param sReadyDocNo the sReadyDocNo to set
     */
    public void setsReadyDocNo(String sReadyDocNo) {
        this.sReadyDocNo = sReadyDocNo;
    }

    /**
     * @return the sBorrowDocNo
     */
    public String getsBorrowDocNo() {
        return sBorrowDocNo;
    }

    /**
     * @param sBorrowDocNo the sBorrowDocNo to set
     */
    public void setsBorrowDocNo(String sBorrowDocNo) {
        this.sBorrowDocNo = sBorrowDocNo;
    }

    /**
     * @return the sBorrowDocNoUseYn
     */
    public String getsBorrowDocNoUseYn() {
        return sBorrowDocNoUseYn;
    }

    /**
     * @param sBorrowDocNoUseYn the sBorrowDocNoUseYn to set
     */
    public void setsBorrowDocNoUseYn(String sBorrowDocNoUseYn) {
        this.sBorrowDocNoUseYn = sBorrowDocNoUseYn;
    }

    /**
     * @return the sBorrowStatCd
     */
    public String getsBorrowStatCd() {
        return sBorrowStatCd;
    }

    /**
     * @param sBorrowStatCd the sBorrowStatCd to set
     */
    public void setsBorrowStatCd(String sBorrowStatCd) {
        this.sBorrowStatCd = sBorrowStatCd;
    }

    /**
     * @return the sBorrowDeptCd
     */
    public String getsBorrowDeptCd() {
        return sBorrowDeptCd;
    }

    /**
     * @param sBorrowDeptCd the sBorrowDeptCd to set
     */
    public void setsBorrowDeptCd(String sBorrowDeptCd) {
        this.sBorrowDeptCd = sBorrowDeptCd;
    }

    /**
     * @return the sBorrowDeptNm
     */
    public String getsBorrowDeptNm() {
        return sBorrowDeptNm;
    }

    /**
     * @param sBorrowDeptNm the sBorrowDeptNm to set
     */
    public void setsBorrowDeptNm(String sBorrowDeptNm) {
        this.sBorrowDeptNm = sBorrowDeptNm;
    }

    /**
     * @return the sBorrowUsrId
     */
    public String getsBorrowUsrId() {
        return sBorrowUsrId;
    }

    /**
     * @param sBorrowUsrId the sBorrowUsrId to set
     */
    public void setsBorrowUsrId(String sBorrowUsrId) {
        this.sBorrowUsrId = sBorrowUsrId;
    }

    /**
     * @return the sBorrowUsrNm
     */
    public String getsBorrowUsrNm() {
        return sBorrowUsrNm;
    }

    /**
     * @param sBorrowUsrNm the sBorrowUsrNm to set
     */
    public void setsBorrowUsrNm(String sBorrowUsrNm) {
        this.sBorrowUsrNm = sBorrowUsrNm;
    }

    /**
     * @return the sEtcRvDocNo
     */
    public String getsEtcRvDocNo() {
        return sEtcRvDocNo;
    }

    /**
     * @param sEtcRvDocNo the sEtcRvDocNo to set
     */
    public void setsEtcRvDocNo(String sEtcRvDocNo) {
        this.sEtcRvDocNo = sEtcRvDocNo;
    }

    /**
     * @return the sEtcRvStatCd
     */
    public String getsEtcRvStatCd() {
        return sEtcRvStatCd;
    }

    /**
     * @param sEtcRvStatCd the sEtcRvStatCd to set
     */
    public void setsEtcRvStatCd(String sEtcRvStatCd) {
        this.sEtcRvStatCd = sEtcRvStatCd;
    }

    /**
     * @return the sItemCntYn
     */
    public String getsItemCntYn() {
        return sItemCntYn;
    }

    /**
     * @param sItemCntYn the sItemCntYn to set
     */
    public void setsItemCntYn(String sItemCntYn) {
        this.sItemCntYn = sItemCntYn;
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
     * @return the sReqStrgeCd
     */
    public String getsReqStrgeCd() {
        return sReqStrgeCd;
    }

    /**
     * @param sReqStrgeCd the sReqStrgeCd to set
     */
    public void setsReqStrgeCd(String sReqStrgeCd) {
        this.sReqStrgeCd = sReqStrgeCd;
    }

    /**
     * @return the sStrgeCdList
     */
    public List<String> getsStrgeCdList() {
        return sStrgeCdList;
    }

    /**
     * @param sStrgeCdList the sStrgeCdList to set
     */
    public void setsStrgeCdList(List<String> sStrgeCdList) {
        this.sStrgeCdList = sStrgeCdList;
    }

    /**
     * @return the sGiStrgeCd
     */
    public String getsGiStrgeCd() {
        return sGiStrgeCd;
    }

    /**
     * @param sGiStrgeCd the sGiStrgeCd to set
     */
    public void setsGiStrgeCd(String sGiStrgeCd) {
        this.sGiStrgeCd = sGiStrgeCd;
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
     * @return the sRealTecId
     */
    public String getsRealTecId() {
        return sRealTecId;
    }

    /**
     * @param sRealTecId the sRealTecId to set
     */
    public void setsRealTecId(String sRealTecId) {
        this.sRealTecId = sRealTecId;
    }

    /**
     * @return the sRealTecNm
     */
    public String getsRealTecNm() {
        return sRealTecNm;
    }

    /**
     * @param sRealTecNm the sRealTecNm to set
     */
    public void setsRealTecNm(String sRealTecNm) {
        this.sRealTecNm = sRealTecNm;
    }

    /**
     * @return the sWkgrpNm
     */
    public String getsWkgrpNm() {
        return sWkgrpNm;
    }

    /**
     * @param sWkgrpNm the sWkgrpNm to set
     */
    public void setsWkgrpNm(String sWkgrpNm) {
        this.sWkgrpNm = sWkgrpNm;
    }

    /**
     * @return the sItemPrc
     */
    public double getsItemPrc() {
        return sItemPrc;
    }

    /**
     * @param sItemPrc the sItemPrc to set
     */
    public void setsItemPrc(double sItemPrc) {
        this.sItemPrc = sItemPrc;
    }

    /**
     * @return the sRoWorkEndYn
     */
    public String getsRoWorkEndYn() {
        return sRoWorkEndYn;
    }

    /**
     * @param sRoWorkEndYn the sRoWorkEndYn to set
     */
    public void setsRoWorkEndYn(String sRoWorkEndYn) {
        this.sRoWorkEndYn = sRoWorkEndYn;
    }

}
