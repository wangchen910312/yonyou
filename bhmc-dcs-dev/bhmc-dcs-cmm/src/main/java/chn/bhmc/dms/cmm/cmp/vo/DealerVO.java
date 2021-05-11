package chn.bhmc.dms.cmm.cmp.vo;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : DealerVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
//    @ValidField(field = "cmpCd", mesgKey = "global.lbl.cmpCd"),
//    @ValidField(field = "corpCd", mesgKey = "global.lbl.corpCd"),
    @ValidField(field = "dlrCd", mesgKey = "global.lbl.dlrCd")
//    @ValidField(field = "dlrNm", mesgKey = "global.lbl.dlrNm")
//    @ValidField(field = "dlrShtNm", mesgKey = "global.lbl.dlrShtNm"),
//    @ValidField(field = "mainDlrYn", mesgKey = "global.lbl.mainDlrYn"),
//    @ValidField(field = "sdptCd", mesgKey = "global.lbl.sdptCd"),
//    @ValidField(field = "serDlrYn", mesgKey = "global.lbl.serDlrYn"),
//    @ValidField(field = "salDlrYn", mesgKey = "global.lbl.salDlrYn"),
//    @ValidField(field = "parDlrYn", mesgKey = "global.lbl.parDlrYn"),
//    @ValidField(field = "distOfficeCd", mesgKey = "global.lbl.distOfficeCd"),
//    @ValidField(field = "sprDlrCd", mesgKey = "global.lbl.sprDlrCd"),
//    @ValidField(field = "ownRgstNm", mesgKey = "global.lbl.ownRgstNm"),
//    @ValidField(field = "serRgstNm", mesgKey = "global.lbl.serRgstNm"),
//    @ValidField(field = "telNo", mesgKey = "global.lbl.telNo"),
//    @ValidField(field = "telNo1", mesgKey = "global.lbl.telNo1"),
//    @ValidField(field = "telNo2", mesgKey = "global.lbl.telNo2"),
//    @ValidField(field = "hpNo", mesgKey = "global.lbl.hpNo"),
//    @ValidField(field = "emailNm", mesgKey = "global.lbl.emailNm"),
//    @ValidField(field = "faxNo", mesgKey = "global.lbl.faxNo"),
//    @ValidField(field = "callCenTelNo", mesgKey = "global.lbl.callCenTelNo"),
//    @ValidField(field = "emgcCenTelNo", mesgKey = "global.lbl.emgcCenTelNo"),
//    @ValidField(field = "salDlrTelNo", mesgKey = "global.lbl.salDlrTelNo"),
//    @ValidField(field = "serDlrTelNo", mesgKey = "global.lbl.serDlrTelNo"),
//    @ValidField(field = "serDlrHpNo", mesgKey = "global.lbl.serDlrHpNo"),
//    @ValidField(field = "serDlrFaxNo", mesgKey = "global.lbl.serDlrFaxNo"),
//    @ValidField(field = "serDlrEmailNm", mesgKey = "global.lbl.serDlrEmailNm"),
//    @ValidField(field = "serDlrTp", mesgKey = "global.lbl.serDlrTp"),
//    @ValidField(field = "serDlrDistCd", mesgKey = "global.lbl.serDlrDistCd"),
//    @ValidField(field = "serDlrAreaCd", mesgKey = "global.lbl.serDlrAreaCd"),
//    @ValidField(field = "serDlrSungCd", mesgKey = "global.lbl.serDlrSungCd"),
//    @ValidField(field = "serDlrCommNm", mesgKey = "global.lbl.serDlrCommNm"),
//    @ValidField(field = "serDlrCommTelNo", mesgKey = "global.lbl.serDlrCommTelNo"),
//    @ValidField(field = "serDlrZipNo", mesgKey = "global.lbl.serDlrZipNo"),
//    @ValidField(field = "serDlrAddr1Nm", mesgKey = "global.lbl.serDlrAddr1Nm"),
//    @ValidField(field = "serDlrAddr2Nm", mesgKey = "global.lbl.serDlrAddr2Nm"),
//    @ValidField(field = "serDlrAddr3Nm", mesgKey = "global.lbl.serDlrAddr3Nm"),
//    @ValidField(field = "serDlrCityNm", mesgKey = "global.lbl.serDlrCityNm"),
//    @ValidField(field = "parDlrCd", mesgKey = "global.lbl.parDlrCd"),
//    @ValidField(field = "parMainDlrCd", mesgKey = "global.lbl.parMainDlrCd"),
//    @ValidField(field = "parMngDlrNm", mesgKey = "global.lbl.parMngDlrNm"),
//    @ValidField(field = "parDlrTelNo", mesgKey = "global.lbl.parDlrTelNo"),
//    @ValidField(field = "parDlrHpNo", mesgKey = "global.lbl.parDlrHpNo"),
//    @ValidField(field = "parDlrFaxNo", mesgKey = "global.lbl.parDlrFaxNo"),
//    @ValidField(field = "parDlrEmailNm", mesgKey = "global.lbl.parDlrEmailNm"),
//    @ValidField(field = "parDlrScaleVal", mesgKey = "global.lbl.parDlrScaleVal"),
//    @ValidField(field = "parDlrDcRate", mesgKey = "global.lbl.parDlrDcRate"),
//    @ValidField(field = "parDlrVipDcRate", mesgKey = "global.lbl.parDlrVipDcRate"),
//    @ValidField(field = "parDlrWsDcRate", mesgKey = "global.lbl.parDlrWsDcRate"),
//    @ValidField(field = "parDlrEmrDcRate", mesgKey = "global.lbl.parDlrEmrDcRate"),
//    @ValidField(field = "parDlrDcFilterRate", mesgKey = "global.lbl.parDlrDcFilterRate"),
//    @ValidField(field = "parDlrStrgeCnt", mesgKey = "global.lbl.parDlrStrgeCnt"),
//    @ValidField(field = "parDlrPoDt", mesgKey = "global.lbl.parDlrPoDt"),
//    @ValidField(field = "parDlrStartDt", mesgKey = "global.lbl.parDlrStartDt"),
//    @ValidField(field = "parDlrEndDt", mesgKey = "global.lbl.parDlrEndDt"),
//    @ValidField(field = "parDlrZipNo", mesgKey = "global.lbl.parDlrZipNo"),
//    @ValidField(field = "parDlrAddr1Nm", mesgKey = "global.lbl.parDlrAddr1Nm"),
//    @ValidField(field = "parDlrAddr2Nm", mesgKey = "global.lbl.parDlrAddr2Nm"),
//    @ValidField(field = "parDlrAddr3Nm", mesgKey = "global.lbl.parDlrAddr3Nm"),
//    @ValidField(field = "delYn", mesgKey = "global.lbl.delYn"),
//    @ValidField(field = "parExprDt", mesgKey = "global.lbl.parExprDt"),
//    @ValidField(field = "parPdcCd", mesgKey = "global.lbl.parPdcCd"),
//    @ValidField(field = "distCd", mesgKey = "global.lbl.distCd"),
//    @ValidField(field = "dlrGrpCd", mesgKey = "global.lbl.dlrGrpCd"),
//    @ValidField(field = "zipNo", mesgKey = "global.lbl.zipNo"),
//    @ValidField(field = "addr1Nm", mesgKey = "global.lbl.addr1Nm"),
//    @ValidField(field = "addr2Nm", mesgKey = "global.lbl.addr2Nm"),
//    @ValidField(field = "detlAddrNm", mesgKey = "global.lbl.detlAddrNm"),
//    @ValidField(field = "pridStartDt", mesgKey = "global.lbl.pridStartDt"),
//    @ValidField(field = "pridEndDt", mesgKey = "global.lbl.pridEndDt"),
//    @ValidField(field = "serStartDt", mesgKey = "global.lbl.serStartDt"),
//    @ValidField(field = "serEndDt", mesgKey = "global.lbl.serEndDt"),
//    @ValidField(field = "homepageNm", mesgKey = "global.lbl.homepageNm"),
//    @ValidField(field = "lttuVal", mesgKey = "global.lbl.lttuVal"),
//    @ValidField(field = "lotuVal", mesgKey = "global.lbl.lotuVal"),
//    @ValidField(field = "dmsIpNm", mesgKey = "global.lbl.dmsIpNm"),
//    @ValidField(field = "dmsPortNm", mesgKey = "global.lbl.dmsPortNm"),
//    @ValidField(field = "dmsTestUrlNm", mesgKey = "global.lbl.dmsTestUrlNm"),
//    @ValidField(field = "dmsOperEmailNm", mesgKey = "global.lbl.dmsOperEmailNm"),
//    @ValidField(field = "dmsOperTelNo", mesgKey = "global.lbl.dmsOperTelNo"),
//    @ValidField(field = "dmsUseYn", mesgKey = "global.lbl.dmsUseYn"),
//    @ValidField(field = "regUsrId", mesgKey = "global.lbl.regUsrId"),
//    @ValidField(field = "regDt", mesgKey = "global.lbl.regDt"),
//    @ValidField(field = "opUsrId", mesgKey = "global.lbl.opUsrId"),
//    @ValidField(field = "updtUsrId", mesgKey = "global.lbl.updtUsrId"),
//    @ValidField(field = "updtDt", mesgKey = "global.lbl.updtDt"),
//    @ValidField(field = "dlrStatCd", mesgKey = "global.lbl.dlrStatCd"),
//    @ValidField(field = "saleDlrDistCd", mesgKey = "global.lbl.saleDlrDistCd"),
//    @ValidField(field = "saleDlrCityCd", mesgKey = "global.lbl.saleDlrCityCd"),
//    @ValidField(field = "saleDlrSungCd", mesgKey = "global.lbl.saleDlrSungCd"),
//    @ValidField(field = "bankCd", mesgKey = "global.lbl.bankCd"),
//    @ValidField(field = "bankNm", mesgKey = "global.lbl.bankNm"),
//    @ValidField(field = "bankAcNo", mesgKey = "global.lbl.bankAcNo"),
//    @ValidField(field = "stockLocCd", mesgKey = "global.lbl.stockLocCd"),
//    @ValidField(field = "payTermCd", mesgKey = "global.lbl.payTermCd"),
//    @ValidField(field = "leadTimeCd", mesgKey = "global.lbl.leadTimeCd")
    ,@ValidField(field = "bmpBpCd", mesgKey = "global.lbl.bmpBpCd")
    ,@ValidField(field = "prefixCustNo", mesgKey = "global.lbl.prefixCustNo")
    ,@ValidField(field = "membershipPolicy", mesgKey = "global.lbl.membershipPolicy")
    ,@ValidField(field = "membershipPointPeriod", mesgKey = "global.lbl.membershipPointPeriod")
    ,@ValidField(field = "membershipPointExchgPoint", mesgKey = "global.lbl.membershipPointExchgPoint")
    ,@ValidField(field = "membershipPointExchgMoney", mesgKey = "global.lbl.membershipPointExchgMoney")
    ,@ValidField(field = "membershipPointUseMaxPoint", mesgKey = "global.lbl.membershipPointUseMaxPoint")
    ,@ValidField(field = "callcenterMaxCall", mesgKey = "global.lbl.callcenterMaxCall")
    ,@ValidField(field = "sysOwnerYn", mesgKey = "global.lbl.sysOwnerYn")
    ,@ValidField(field = "useCenterDmsYn", mesgKey = "global.lbl.useCenterDmsYn")

    ,@ValidField(field = "obAssignAutoYn", mesgKey = "global.lbl.obAssignAutoYn")
    ,@ValidField(field = "allowSubscriptionSaleYn", mesgKey = "global.lbl.allowSubscriptionSaleYn")
    ,@ValidField(field = "termSpecie", mesgKey = "global.lbl.termSpecie")
    ,@ValidField(field = "insExpAlarmDay", mesgKey = "global.lbl.insExpAlarmDay")

    ,@ValidField(field = "autoTrsfConf", mesgKey = "global.lbl.autoTrsfConf")
    ,@ValidField(field = "autoAssignCd", mesgKey = "crm.lbl.autoAssignStandard")
    ,@ValidField(field = "salesOpptPwYn", mesgKey = "global.lbl.salesOpptPwYn")
    ,@ValidField(field = "membershipGradeNoneAutoYn", mesgKey = "crm.lbl.membershipGradeNoneAutoYn")
    ,@ValidField(field = "rcptAmtsRate", mesgKey = "crm.lbl.rcptAmtsRate")
    ,@ValidField(field = "goodsRate", mesgKey = "crm.lbl.goodsRate")
    ,@ValidField(field = "insuranceNewRate", mesgKey = "crm.lbl.insuranceNewRate")
    ,@ValidField(field = "insuranceExtendedRate", mesgKey = "crm.lbl.insuranceExtendedRate")
    ,@ValidField(field = "fincRate", mesgKey = "crm.lbl.fincRate")
    ,@ValidField(field = "executionRate", mesgKey = "crm.lbl.executionRate")
    ,@ValidField(field = "revPartsRate", mesgKey = "crm.lbl.revPartsRate")
    ,@ValidField(field = "gnlRteRate", mesgKey = "crm.lbl.gnlRteRate")
    ,@ValidField(field = "wartRteRate", mesgKey = "crm.lbl.wartRteRate")
    ,@ValidField(field = "incRteRate", mesgKey = "crm.lbl.incRteRate")
    ,@ValidField(field = "intRteRate", mesgKey = "crm.lbl.intRteRate")
    ,@ValidField(field = "rwrkRteRate", mesgKey = "crm.lbl.rwrkRteRate")
    ,@ValidField(field = "validCheckCallSecond", mesgKey = "crm.lbl.validCheckCallSecond")
})
public class DealerVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5174294731815323228L;

    /**
     * 회사코드
     **/
    private String cmpCd;

    /**
     * 법인코드
     **/
    private String corpCd;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 딜러명
     **/
    private String dlrNm;

    /**
     * 딜러축소명
     **/
    private String dlrShtNm;

    /**
     * 메인딜러여부
     **/
    private String mainDlrYn;

    /**
     * 사업부코드
     **/
    private String sdptCd;

    /**
     * 사업부명
     */
    private String sdptNm;

    /**
     * 정비딜러여부
     **/
    private String serDlrYn;

    /**
     * 판매딜러여부
     **/
    private String salDlrYn;

    /**
     * 부품딜러여부
     **/
    private String parDlrYn;

    /**
     * 사무소코드
     **/
    private String distOfficeCd;

    /**
     * 사무소명
     */
    private String distOfficeNm;

    /**
     * SPR딜러코드
     **/
    private String sprDlrCd;

    /**
     * 대표자명
     **/
    private String ownRgstNm;

    /**
     * 정비사장명
     **/
    private String serRgstNm;

    /**
     * 전화번호
     **/
    private String telNo;

    /**
     * 전화번호1
     **/
    private String telNo1;

    /**
     * 전화번호2
     **/
    private String telNo2;

    /**
     * 휴대폰번호
     **/
    private String hpNo;

    /**
     * 이메일명
     **/
    private String emailNm;

    /**
     * 팩스번호
     **/
    private String faxNo;

    /**
     * 콜센터전화번호
     **/
    private String callCenTelNo;

    /**
     * 구급센터전화번호
     **/
    private String emgcCenTelNo;

    /**
     * 판매딜러전화번호
     **/
    private String salDlrTelNo;

    /**
     * 정비딜러전화번호
     **/
    private String serDlrTelNo;

    /**
     * 정비딜러휴대폰번호
     **/

    private String serDlrHpNo;

    /**
     * 정비딜러팩스번호
     **/
    private String serDlrFaxNo;

    /**
     * 정비딜러이메일명
     **/
    private String serDlrEmailNm;

    /**
     * 정비딜러유형
     **/
    private String serDlrTp;

    /**
     * 정비딜러지역코드
     **/
    private String serDlrDistCd;

    /**
     * 정비딜러광역코드
     **/
    private String serDlrAreaCd;

    /**
     * 정비딜러성코드
     **/
    private String serDlrSungCd;

    /**
     * 정비딜러연락인명
     **/
    private String serDlrCommNm;

    /**
     * 정비딜러연락인전화번호
     **/
    private String serDlrCommTelNo;

    /**
     * 정비딜러우편번호
     **/
    private String serDlrZipNo;

    /**
     * 정비딜러주소1명
     **/
    private String serDlrAddr1Nm;

    /**
     * 정비딜러주소2명
     **/
    private String serDlrAddr2Nm;

    /**
     * 정비딜러주소3명
     **/
    private String serDlrAddr3Nm;

    /**
     * 정비딜러도시명
     **/
    private String serDlrCityNm;

    /**
     * 부품딜러코드
     **/
    private String parDlrCd;

    /**
     * 부품메인딜러코드
     **/
    private String parMainDlrCd;

    /**
     * 부품관리딜러명
     **/
    private String parMngDlrNm;

    /**
     * 부품딜러전화번호
     **/
    private String parDlrTelNo;

    /**
     * 부품딜러휴대폰번호
     **/
    private String parDlrHpNo;

    /**
     * 부품딜러팩스번호
     **/
    private String parDlrFaxNo;

    /**
     * 부품딜러이메일명
     **/
    private String parDlrEmailNm;

    /**
     * 부품딜러범위값
     **/
    private String parDlrScaleVal;

    /**
     * 부품딜러할인율
     **/
    private Double parDlrDcRate;

    /**
     * 부품딜러VIP할인율
     **/
    private Double parDlrVipDcRate;

    /**
     * 부품딜러W/S할인율
     **/
    private int parDlrWsDcRate;

    /**
     * 부품딜러EMR할인율
     **/
    private int parDlrEmrDcRate;

    /**
     * 부품딜러할인필터율
     **/
    private int parDlrDcFilterRate;

    /**
     * 부품딜러창고수
     **/
    private int parDlrStrgeCnt;

    /**
     * 부품딜러PO일자
     **/
    private String parDlrPoDt;

    /**
     * 부품딜러시작일자
     **/
    private String parDlrStartDt;

    /**
     * 부품딜러종료일자
     **/
    private String parDlrEndDt;

    /**
     * 부품딜러우편번호
     **/
    private String parDlrZipNo;

    /**
     * 부품딜러주소1명
     **/
    private String parDlrAddr1Nm;

    /**
     * 부품딜러주소2명
     **/
    private String parDlrAddr2Nm;

    /**
     * 부품딜러주소3명
     **/
    private String parDlrAddr3Nm;

    /**
     * 삭제여부
     **/
    private String delYn;

    /**
     * 부품만기일자
     **/
    private String parExprDt;

    /**
     * 부품PDC코드
     **/
    private String parPdcCd;

    /**
     * 지역코드
     **/
    private String distCd;

    /**
     * 딜러그룹코드
     **/
    private String dlrGrpCd;

    /**
     * 우편번호
     **/
    private String zipNo;

    /**
     * 주소1명
     **/
    private String addr1Nm;

    /**
     * 주소2명
     **/
    private String addr2Nm;

    /**
     * 상세주소명
     **/
    private String detlAddrNm;

    /**
     * 기간시작일자
     **/
    private String pridStartDt;

    /**
     * 기간종료일자
     **/
    private String pridEndDt;

    /**
     * 정비시작일자
     **/
    private String serStartDt;

    /**
     * 정비종료일자
     **/
    private String serEndDt;

    /**
     * 홈페이지명
     **/
    private String homepageNm;

    /**
     * 등록자ID
     **/
    private String regUsrId;

    /**
     * 등록일자
     **/
    private Date regDt;

    /**
     * 조작자ID
     **/
    private String opUsrId;

    /**
     * 수정자ID
     **/
    private String updtUsrId;

    /**
     * 수정일자
     **/
    private Date updtDt;

    /**
     * 딜러상태코드
     **/
    private String dlrStatCd;

    /**
     * 판매딜러지역코드
     **/
    private String saleDlrDistCd;

    /**
     * 판매딜러도시코드
     **/
    private String saleDlrCityCd;

    /**
     * 판매딜러도시명
     */
    private String saleDlrCityNm;

    /**
     * 판매딜러성코드
     **/
    private String saleDlrSungCd;

    /**
     * 판매딜러성명
     */
    private String saleDlrSungNm;

    /**
     * 은행코드
     **/
    private String bankCd;

    /**
     * 은행명
     **/
    private String bankNm;

    /**
     * 은행계좌번호
     **/
    private String bankAcNo;

    /**
     * 재고위치코드
     **/
    private String stockLocCd;

    /**
     * 지불조건코드
     **/
    private String payTermCd;

    /**
     * LEAD시간코드
     **/
    private String leadTimeCd;

    /**
     * 오픈일자
     */
    private String openDt;


    private String bankCountry;
    private String crtfNvalTaxNo;
    private String deopNm;
    private String dlvAddr1;
    private String dlvAddr2;
    private String dlvAgntNm1;
    private String dlvAgntNm2;
    private String dlvCityDvNm;
    private String dlvCpNo1;
    private String dlvCpNo2;
    private String dlvTelNo1;
    private String dlvTelNo2;
    private String dlvZipNo;
    private String fdAgntNm;
    private String fiAddr1;
    private String fiAddr2;
    private String fiCityDvNm;
    private String fiZipNo;
    private String areaCcbzPnm;
    private String migPrgStat;

    /**
     * SMS 잔여 금액
     */
    private Double smsRemainAmount;

    /**
     * SMS 잔여 건수
     */
    private int smsRemainCnt;
    /************************************************************
     * 시스템 옵션
     ************************************************************/
    /**
     * 시스템 딜러여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String sysOwnerYn;

    /**
     * 센터 DMS 사용딜러 여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String useCenterDmsYn;

    /**
     * 위도값
     **/
    private Double lttuVal;

    /**
     * 경도값
     **/
    private Double lotuVal;

    /**
     * DMSIP명
     **/
    private String dmsIpNm;

    /**
     * DMSPORT명
     **/
    private String dmsPortNm;

    /**
     * DMS운영자이메일명
     **/
    private String dmsOperEmailNm;

    /**
     * DMS운영자전화번호
     **/
    private String dmsOperTelNo;

    /**
     * DMS사용여부
     **/
    @NotEmpty
    private String dmsUseYn;

    /**
     * DMS테스트URL명
     **/
    private String dmsTestUrlNm;


    /************************************************************
     * CRM 옵션
     ************************************************************/
    /**
     * 딜러 멤버십 운영기준
     */
    @NotEmpty
    private String membershipPolicy;

    /**
     * 딜러 멤버십 포인트 유효기간
     */
    @Min(0)
    private int membershipPointPeriod;

    /**
     * 딜러 멤버십 포인트환산 기준포인트
     */
    @Min(0)
    private int membershipPointExchgPoint;

    /**
     * 딜러 멤버십 포인트환산 기준금액
     */
    @Min(0)
    private int membershipPointExchgMoney;

    /**
     * 딜러 멤버십 포인트 사용 상한치
     */
    @Min(0)
    private int membershipPointUseMaxPoint;

    /**
     * OB 배정 자동여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String obAssignAutoYn;

    /**
     * 자동배정기준
     */
    @NotEmpty
    private String autoAssignCd;

    /**
     * 자동전출설정(일)
     */
    @NotEmpty
    private String autoTrsfConf = "0";

    /**
     * 딜러 콜센터 Max 콜수
     */
    @Min(0)
    private int callcenterMaxCall;

    /**
     * 판매기회 비밀번호 설정여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String salesOpptPwYn;

    /**
     * 회원등급 수동 변경여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String membershipGradeNoneAutoYn;

    /**
     * 포인트적립율-영수증가격
     */
    @Min(0)
    @Max(100)
    private double rcptAmtsRate;

    /**
     * 포인트적립율-용품
     */
    @Min(0)
    @Max(100)
    private double goodsRate;

    /**
     * 포인트적립율-보험(신규)
     */
    @Min(0)
    @Max(100)
    private double insuranceNewRate;

    /**
     * 포인트적립율-보험(연장)
     */
    @Min(0)
    @Max(100)
    private double insuranceExtendedRate;

    /**
     * 포인트적립율-금융(수수료)
     */
    @Min(0)
    @Max(100)
    private double fincRate;

    /**
     * 포인트적립율-대행
     */
    @Min(0)
    @Max(100)
    private double executionRate;

    /**
     * 포인트적립율-부품판매
     */
    @Min(0)
    @Max(100)
    private double revPartsRate;

    /**
     * 포인트적립율-RO유형-일반
     */
    @Min(0)
    @Max(100)
    private double gnlRteRate;

    /**
     * 포인트적립율-RO유형-보증
     */
    @Min(0)
    @Max(100)
    private double wartRteRate;

    /**
     * 포인트적립율-RO유형-보험현황
     */
    @Min(0)
    @Max(100)
    private double incRteRate;

    /**
     * 포인트적립율-RO유형-내부
     */
    @Min(0)
    @Max(100)
    private double intRteRate;

    /**
     * 포인트적립율-RO유형-리워크
     */
    @Min(0)
    @Max(100)
    private double rwrkRteRate;

    /**
     * 유효통과시간(초)
     */
    @Min(1)
    @Max(60)
    private int validCheckCallSecond;


    /************************************************************
     * 판매 옵션
     ************************************************************/

    /**
     * 예판수납
     */
    private String allowSubscriptionSaleYn;

    /**
     * 정금용어
     */
    private String termSpecie;

    /**
     * 보험만료알람
     */
    private int insExpAlarmDay;


    /************************************************************
     * 부품 옵션
     ************************************************************/
    /**
     * BMP거래처코드
     */
    private String bmpBpCd;

    /**
     * PREFIX고객번호
     */
    private String prefixCustNo;

    /**
     * @return the cmpCd
     */
    public String getCmpCd() {
        return cmpCd;
    }

    /**
     * @param cmpCd the cmpCd to set
     */
    public void setCmpCd(String cmpCd) {
        this.cmpCd = cmpCd;
    }

    /**
     * @return the corpCd
     */
    public String getCorpCd() {
        return corpCd;
    }

    /**
     * @param corpCd the corpCd to set
     */
    public void setCorpCd(String corpCd) {
        this.corpCd = corpCd;
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
     * @return the dlrShtNm
     */
    public String getDlrShtNm() {
        return dlrShtNm;
    }

    /**
     * @param dlrShtNm the dlrShtNm to set
     */
    public void setDlrShtNm(String dlrShtNm) {
        this.dlrShtNm = dlrShtNm;
    }

    /**
     * @return the mainDlrYn
     */
    public String getMainDlrYn() {
        return mainDlrYn;
    }

    /**
     * @param mainDlrYn the mainDlrYn to set
     */
    public void setMainDlrYn(String mainDlrYn) {
        this.mainDlrYn = mainDlrYn;
    }

    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }

    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }

    /**
     * @return the sdptNm
     */
    public String getSdptNm() {
        return sdptNm;
    }

    /**
     * @param sdptNm the sdptNm to set
     */
    public void setSdptNm(String sdptNm) {
        this.sdptNm = sdptNm;
    }

    /**
     * @return the serDlrYn
     */
    public String getSerDlrYn() {
        return serDlrYn;
    }

    /**
     * @param serDlrYn the serDlrYn to set
     */
    public void setSerDlrYn(String serDlrYn) {
        this.serDlrYn = serDlrYn;
    }

    /**
     * @return the salDlrYn
     */
    public String getSalDlrYn() {
        return salDlrYn;
    }

    /**
     * @param salDlrYn the salDlrYn to set
     */
    public void setSalDlrYn(String salDlrYn) {
        this.salDlrYn = salDlrYn;
    }

    /**
     * @return the parDlrYn
     */
    public String getParDlrYn() {
        return parDlrYn;
    }

    /**
     * @param parDlrYn the parDlrYn to set
     */
    public void setParDlrYn(String parDlrYn) {
        this.parDlrYn = parDlrYn;
    }

    /**
     * @return the distOfficeCd
     */
    public String getDistOfficeCd() {
        return distOfficeCd;
    }

    /**
     * @param distOfficeCd the distOfficeCd to set
     */
    public void setDistOfficeCd(String distOfficeCd) {
        this.distOfficeCd = distOfficeCd;
    }

    /**
     * @return the distOfficeNm
     */
    public String getDistOfficeNm() {
        return distOfficeNm;
    }

    /**
     * @param distOfficeNm the distOfficeNm to set
     */
    public void setDistOfficeNm(String distOfficeNm) {
        this.distOfficeNm = distOfficeNm;
    }

    /**
     * @return the sprDlrCd
     */
    public String getSprDlrCd() {
        return sprDlrCd;
    }

    /**
     * @param sprDlrCd the sprDlrCd to set
     */
    public void setSprDlrCd(String sprDlrCd) {
        this.sprDlrCd = sprDlrCd;
    }

    /**
     * @return the ownRgstNm
     */
    public String getOwnRgstNm() {
        return ownRgstNm;
    }

    /**
     * @param ownRgstNm the ownRgstNm to set
     */
    public void setOwnRgstNm(String ownRgstNm) {
        this.ownRgstNm = ownRgstNm;
    }

    /**
     * @return the serRgstNm
     */
    public String getSerRgstNm() {
        return serRgstNm;
    }

    /**
     * @param serRgstNm the serRgstNm to set
     */
    public void setSerRgstNm(String serRgstNm) {
        this.serRgstNm = serRgstNm;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the telNo1
     */
    public String getTelNo1() {
        return telNo1;
    }

    /**
     * @param telNo1 the telNo1 to set
     */
    public void setTelNo1(String telNo1) {
        this.telNo1 = telNo1;
    }

    /**
     * @return the telNo2
     */
    public String getTelNo2() {
        return telNo2;
    }

    /**
     * @param telNo2 the telNo2 to set
     */
    public void setTelNo2(String telNo2) {
        this.telNo2 = telNo2;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }

    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }

    /**
     * @return the faxNo
     */
    public String getFaxNo() {
        return faxNo;
    }

    /**
     * @param faxNo the faxNo to set
     */
    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    /**
     * @return the callCenTelNo
     */
    public String getCallCenTelNo() {
        return callCenTelNo;
    }

    /**
     * @param callCenTelNo the callCenTelNo to set
     */
    public void setCallCenTelNo(String callCenTelNo) {
        this.callCenTelNo = callCenTelNo;
    }

    /**
     * @return the emgcCenTelNo
     */
    public String getEmgcCenTelNo() {
        return emgcCenTelNo;
    }

    /**
     * @param emgcCenTelNo the emgcCenTelNo to set
     */
    public void setEmgcCenTelNo(String emgcCenTelNo) {
        this.emgcCenTelNo = emgcCenTelNo;
    }

    /**
     * @return the salDlrTelNo
     */
    public String getSalDlrTelNo() {
        return salDlrTelNo;
    }

    /**
     * @param salDlrTelNo the salDlrTelNo to set
     */
    public void setSalDlrTelNo(String salDlrTelNo) {
        this.salDlrTelNo = salDlrTelNo;
    }

    /**
     * @return the serDlrTelNo
     */
    public String getSerDlrTelNo() {
        return serDlrTelNo;
    }

    /**
     * @param serDlrTelNo the serDlrTelNo to set
     */
    public void setSerDlrTelNo(String serDlrTelNo) {
        this.serDlrTelNo = serDlrTelNo;
    }

    /**
     * @return the serDlrHpNo
     */
    public String getSerDlrHpNo() {
        return serDlrHpNo;
    }

    /**
     * @param serDlrHpNo the serDlrHpNo to set
     */
    public void setSerDlrHpNo(String serDlrHpNo) {
        this.serDlrHpNo = serDlrHpNo;
    }

    /**
     * @return the serDlrFaxNo
     */
    public String getSerDlrFaxNo() {
        return serDlrFaxNo;
    }

    /**
     * @param serDlrFaxNo the serDlrFaxNo to set
     */
    public void setSerDlrFaxNo(String serDlrFaxNo) {
        this.serDlrFaxNo = serDlrFaxNo;
    }

    /**
     * @return the serDlrEmailNm
     */
    public String getSerDlrEmailNm() {
        return serDlrEmailNm;
    }

    /**
     * @param serDlrEmailNm the serDlrEmailNm to set
     */
    public void setSerDlrEmailNm(String serDlrEmailNm) {
        this.serDlrEmailNm = serDlrEmailNm;
    }

    /**
     * @return the serDlrTp
     */
    public String getSerDlrTp() {
        return serDlrTp;
    }

    /**
     * @param serDlrTp the serDlrTp to set
     */
    public void setSerDlrTp(String serDlrTp) {
        this.serDlrTp = serDlrTp;
    }

    /**
     * @return the serDlrDistCd
     */
    public String getSerDlrDistCd() {
        return serDlrDistCd;
    }

    /**
     * @param serDlrDistCd the serDlrDistCd to set
     */
    public void setSerDlrDistCd(String serDlrDistCd) {
        this.serDlrDistCd = serDlrDistCd;
    }

    /**
     * @return the serDlrAreaCd
     */
    public String getSerDlrAreaCd() {
        return serDlrAreaCd;
    }

    /**
     * @param serDlrAreaCd the serDlrAreaCd to set
     */
    public void setSerDlrAreaCd(String serDlrAreaCd) {
        this.serDlrAreaCd = serDlrAreaCd;
    }

    /**
     * @return the serDlrSungCd
     */
    public String getSerDlrSungCd() {
        return serDlrSungCd;
    }

    /**
     * @param serDlrSungCd the serDlrSungCd to set
     */
    public void setSerDlrSungCd(String serDlrSungCd) {
        this.serDlrSungCd = serDlrSungCd;
    }

    /**
     * @return the serDlrCommNm
     */
    public String getSerDlrCommNm() {
        return serDlrCommNm;
    }

    /**
     * @param serDlrCommNm the serDlrCommNm to set
     */
    public void setSerDlrCommNm(String serDlrCommNm) {
        this.serDlrCommNm = serDlrCommNm;
    }

    /**
     * @return the serDlrCommTelNo
     */
    public String getSerDlrCommTelNo() {
        return serDlrCommTelNo;
    }

    /**
     * @param serDlrCommTelNo the serDlrCommTelNo to set
     */
    public void setSerDlrCommTelNo(String serDlrCommTelNo) {
        this.serDlrCommTelNo = serDlrCommTelNo;
    }

    /**
     * @return the serDlrZipNo
     */
    public String getSerDlrZipNo() {
        return serDlrZipNo;
    }

    /**
     * @param serDlrZipNo the serDlrZipNo to set
     */
    public void setSerDlrZipNo(String serDlrZipNo) {
        this.serDlrZipNo = serDlrZipNo;
    }

    /**
     * @return the serDlrAddr1Nm
     */
    public String getSerDlrAddr1Nm() {
        return serDlrAddr1Nm;
    }

    /**
     * @param serDlrAddr1Nm the serDlrAddr1Nm to set
     */
    public void setSerDlrAddr1Nm(String serDlrAddr1Nm) {
        this.serDlrAddr1Nm = serDlrAddr1Nm;
    }

    /**
     * @return the serDlrAddr2Nm
     */
    public String getSerDlrAddr2Nm() {
        return serDlrAddr2Nm;
    }

    /**
     * @param serDlrAddr2Nm the serDlrAddr2Nm to set
     */
    public void setSerDlrAddr2Nm(String serDlrAddr2Nm) {
        this.serDlrAddr2Nm = serDlrAddr2Nm;
    }

    /**
     * @return the serDlrAddr3Nm
     */
    public String getSerDlrAddr3Nm() {
        return serDlrAddr3Nm;
    }

    /**
     * @param serDlrAddr3Nm the serDlrAddr3Nm to set
     */
    public void setSerDlrAddr3Nm(String serDlrAddr3Nm) {
        this.serDlrAddr3Nm = serDlrAddr3Nm;
    }

    /**
     * @return the serDlrCityNm
     */
    public String getSerDlrCityNm() {
        return serDlrCityNm;
    }

    /**
     * @param serDlrCityNm the serDlrCityNm to set
     */
    public void setSerDlrCityNm(String serDlrCityNm) {
        this.serDlrCityNm = serDlrCityNm;
    }

    /**
     * @return the parDlrCd
     */
    public String getParDlrCd() {
        return parDlrCd;
    }

    /**
     * @param parDlrCd the parDlrCd to set
     */
    public void setParDlrCd(String parDlrCd) {
        this.parDlrCd = parDlrCd;
    }

    /**
     * @return the parMainDlrCd
     */
    public String getParMainDlrCd() {
        return parMainDlrCd;
    }

    /**
     * @param parMainDlrCd the parMainDlrCd to set
     */
    public void setParMainDlrCd(String parMainDlrCd) {
        this.parMainDlrCd = parMainDlrCd;
    }

    /**
     * @return the parMngDlrNm
     */
    public String getParMngDlrNm() {
        return parMngDlrNm;
    }

    /**
     * @param parMngDlrNm the parMngDlrNm to set
     */
    public void setParMngDlrNm(String parMngDlrNm) {
        this.parMngDlrNm = parMngDlrNm;
    }

    /**
     * @return the parDlrTelNo
     */
    public String getParDlrTelNo() {
        return parDlrTelNo;
    }

    /**
     * @param parDlrTelNo the parDlrTelNo to set
     */
    public void setParDlrTelNo(String parDlrTelNo) {
        this.parDlrTelNo = parDlrTelNo;
    }

    /**
     * @return the parDlrHpNo
     */
    public String getParDlrHpNo() {
        return parDlrHpNo;
    }

    /**
     * @param parDlrHpNo the parDlrHpNo to set
     */
    public void setParDlrHpNo(String parDlrHpNo) {
        this.parDlrHpNo = parDlrHpNo;
    }

    /**
     * @return the parDlrFaxNo
     */
    public String getParDlrFaxNo() {
        return parDlrFaxNo;
    }

    /**
     * @param parDlrFaxNo the parDlrFaxNo to set
     */
    public void setParDlrFaxNo(String parDlrFaxNo) {
        this.parDlrFaxNo = parDlrFaxNo;
    }

    /**
     * @return the parDlrEmailNm
     */
    public String getParDlrEmailNm() {
        return parDlrEmailNm;
    }

    /**
     * @param parDlrEmailNm the parDlrEmailNm to set
     */
    public void setParDlrEmailNm(String parDlrEmailNm) {
        this.parDlrEmailNm = parDlrEmailNm;
    }

    /**
     * @return the parDlrScaleVal
     */
    public String getParDlrScaleVal() {
        return parDlrScaleVal;
    }

    /**
     * @param parDlrScaleVal the parDlrScaleVal to set
     */
    public void setParDlrScaleVal(String parDlrScaleVal) {
        this.parDlrScaleVal = parDlrScaleVal;
    }

    /**
     * @return the parDlrDcRate
     */
    public Double getParDlrDcRate() {
        return parDlrDcRate;
    }

    /**
     * @param parDlrDcRate the parDlrDcRate to set
     */
    public void setParDlrDcRate(Double parDlrDcRate) {
        this.parDlrDcRate = parDlrDcRate;
    }

    /**
     * @return the parDlrVipDcRate
     */
    public Double getParDlrVipDcRate() {
        return parDlrVipDcRate;
    }

    /**
     * @param parDlrVipDcRate the parDlrVipDcRate to set
     */
    public void setParDlrVipDcRate(Double parDlrVipDcRate) {
        this.parDlrVipDcRate = parDlrVipDcRate;
    }

    /**
     * @return the parDlrWsDcRate
     */
    public int getParDlrWsDcRate() {
        return parDlrWsDcRate;
    }

    /**
     * @param parDlrWsDcRate the parDlrWsDcRate to set
     */
    public void setParDlrWsDcRate(int parDlrWsDcRate) {
        this.parDlrWsDcRate = parDlrWsDcRate;
    }

    /**
     * @return the parDlrEmrDcRate
     */
    public int getParDlrEmrDcRate() {
        return parDlrEmrDcRate;
    }

    /**
     * @param parDlrEmrDcRate the parDlrEmrDcRate to set
     */
    public void setParDlrEmrDcRate(int parDlrEmrDcRate) {
        this.parDlrEmrDcRate = parDlrEmrDcRate;
    }

    /**
     * @return the parDlrDcFilterRate
     */
    public int getParDlrDcFilterRate() {
        return parDlrDcFilterRate;
    }

    /**
     * @param parDlrDcFilterRate the parDlrDcFilterRate to set
     */
    public void setParDlrDcFilterRate(int parDlrDcFilterRate) {
        this.parDlrDcFilterRate = parDlrDcFilterRate;
    }

    /**
     * @return the parDlrStrgeCnt
     */
    public int getParDlrStrgeCnt() {
        return parDlrStrgeCnt;
    }

    /**
     * @param parDlrStrgeCnt the parDlrStrgeCnt to set
     */
    public void setParDlrStrgeCnt(int parDlrStrgeCnt) {
        this.parDlrStrgeCnt = parDlrStrgeCnt;
    }

    /**
     * @return the parDlrPoDt
     */
    public String getParDlrPoDt() {
        return parDlrPoDt;
    }

    /**
     * @param parDlrPoDt the parDlrPoDt to set
     */
    public void setParDlrPoDt(String parDlrPoDt) {
        this.parDlrPoDt = parDlrPoDt;
    }

    /**
     * @return the parDlrStartDt
     */
    public String getParDlrStartDt() {
        return parDlrStartDt;
    }

    /**
     * @param parDlrStartDt the parDlrStartDt to set
     */
    public void setParDlrStartDt(String parDlrStartDt) {
        this.parDlrStartDt = parDlrStartDt;
    }

    /**
     * @return the parDlrEndDt
     */
    public String getParDlrEndDt() {
        return parDlrEndDt;
    }

    /**
     * @param parDlrEndDt the parDlrEndDt to set
     */
    public void setParDlrEndDt(String parDlrEndDt) {
        this.parDlrEndDt = parDlrEndDt;
    }

    /**
     * @return the parDlrZipNo
     */
    public String getParDlrZipNo() {
        return parDlrZipNo;
    }

    /**
     * @param parDlrZipNo the parDlrZipNo to set
     */
    public void setParDlrZipNo(String parDlrZipNo) {
        this.parDlrZipNo = parDlrZipNo;
    }

    /**
     * @return the parDlrAddr1Nm
     */
    public String getParDlrAddr1Nm() {
        return parDlrAddr1Nm;
    }

    /**
     * @param parDlrAddr1Nm the parDlrAddr1Nm to set
     */
    public void setParDlrAddr1Nm(String parDlrAddr1Nm) {
        this.parDlrAddr1Nm = parDlrAddr1Nm;
    }

    /**
     * @return the parDlrAddr2Nm
     */
    public String getParDlrAddr2Nm() {
        return parDlrAddr2Nm;
    }

    /**
     * @param parDlrAddr2Nm the parDlrAddr2Nm to set
     */
    public void setParDlrAddr2Nm(String parDlrAddr2Nm) {
        this.parDlrAddr2Nm = parDlrAddr2Nm;
    }

    /**
     * @return the parDlrAddr3Nm
     */
    public String getParDlrAddr3Nm() {
        return parDlrAddr3Nm;
    }

    /**
     * @param parDlrAddr3Nm the parDlrAddr3Nm to set
     */
    public void setParDlrAddr3Nm(String parDlrAddr3Nm) {
        this.parDlrAddr3Nm = parDlrAddr3Nm;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the parExprDt
     */
    public String getParExprDt() {
        return parExprDt;
    }

    /**
     * @param parExprDt the parExprDt to set
     */
    public void setParExprDt(String parExprDt) {
        this.parExprDt = parExprDt;
    }

    /**
     * @return the parPdcCd
     */
    public String getParPdcCd() {
        return parPdcCd;
    }

    /**
     * @param parPdcCd the parPdcCd to set
     */
    public void setParPdcCd(String parPdcCd) {
        this.parPdcCd = parPdcCd;
    }

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the dlrGrpCd
     */
    public String getDlrGrpCd() {
        return dlrGrpCd;
    }

    /**
     * @param dlrGrpCd the dlrGrpCd to set
     */
    public void setDlrGrpCd(String dlrGrpCd) {
        this.dlrGrpCd = dlrGrpCd;
    }

    /**
     * @return the zipNo
     */
    public String getZipNo() {
        return zipNo;
    }

    /**
     * @param zipNo the zipNo to set
     */
    public void setZipNo(String zipNo) {
        this.zipNo = zipNo;
    }

    /**
     * @return the addr1Nm
     */
    public String getAddr1Nm() {
        return addr1Nm;
    }

    /**
     * @param addr1Nm the addr1Nm to set
     */
    public void setAddr1Nm(String addr1Nm) {
        this.addr1Nm = addr1Nm;
    }

    /**
     * @return the addr2Nm
     */
    public String getAddr2Nm() {
        return addr2Nm;
    }

    /**
     * @param addr2Nm the addr2Nm to set
     */
    public void setAddr2Nm(String addr2Nm) {
        this.addr2Nm = addr2Nm;
    }

    /**
     * @return the detlAddrNm
     */
    public String getDetlAddrNm() {
        return detlAddrNm;
    }

    /**
     * @param detlAddrNm the detlAddrNm to set
     */
    public void setDetlAddrNm(String detlAddrNm) {
        this.detlAddrNm = detlAddrNm;
    }

    /**
     * @return the pridStartDt
     */
    public String getPridStartDt() {
        return pridStartDt;
    }

    /**
     * @param pridStartDt the pridStartDt to set
     */
    public void setPridStartDt(String pridStartDt) {
        this.pridStartDt = pridStartDt;
    }

    /**
     * @return the pridEndDt
     */
    public String getPridEndDt() {
        return pridEndDt;
    }

    /**
     * @param pridEndDt the pridEndDt to set
     */
    public void setPridEndDt(String pridEndDt) {
        this.pridEndDt = pridEndDt;
    }

    /**
     * @return the serStartDt
     */
    public String getSerStartDt() {
        return serStartDt;
    }

    /**
     * @param serStartDt the serStartDt to set
     */
    public void setSerStartDt(String serStartDt) {
        this.serStartDt = serStartDt;
    }

    /**
     * @return the serEndDt
     */
    public String getSerEndDt() {
        return serEndDt;
    }

    /**
     * @param serEndDt the serEndDt to set
     */
    public void setSerEndDt(String serEndDt) {
        this.serEndDt = serEndDt;
    }

    /**
     * @return the homepageNm
     */
    public String getHomepageNm() {
        return homepageNm;
    }

    /**
     * @param homepageNm the homepageNm to set
     */
    public void setHomepageNm(String homepageNm) {
        this.homepageNm = homepageNm;
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
     * @return the opUsrId
     */
    public String getOpUsrId() {
        return opUsrId;
    }

    /**
     * @param opUsrId the opUsrId to set
     */
    public void setOpUsrId(String opUsrId) {
        this.opUsrId = opUsrId;
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
     * @return the dlrStatCd
     */
    public String getDlrStatCd() {
        return dlrStatCd;
    }

    /**
     * @param dlrStatCd the dlrStatCd to set
     */
    public void setDlrStatCd(String dlrStatCd) {
        this.dlrStatCd = dlrStatCd;
    }

    /**
     * @return the saleDlrDistCd
     */
    public String getSaleDlrDistCd() {
        return saleDlrDistCd;
    }

    /**
     * @param saleDlrDistCd the saleDlrDistCd to set
     */
    public void setSaleDlrDistCd(String saleDlrDistCd) {
        this.saleDlrDistCd = saleDlrDistCd;
    }

    /**
     * @return the saleDlrCityCd
     */
    public String getSaleDlrCityCd() {
        return saleDlrCityCd;
    }

    /**
     * @param saleDlrCityCd the saleDlrCityCd to set
     */
    public void setSaleDlrCityCd(String saleDlrCityCd) {
        this.saleDlrCityCd = saleDlrCityCd;
    }

    /**
     * @return the saleDlrCityNm
     */
    public String getSaleDlrCityNm() {
        return saleDlrCityNm;
    }

    /**
     * @param saleDlrCityNm the saleDlrCityNm to set
     */
    public void setSaleDlrCityNm(String saleDlrCityNm) {
        this.saleDlrCityNm = saleDlrCityNm;
    }

    /**
     * @return the saleDlrSungCd
     */
    public String getSaleDlrSungCd() {
        return saleDlrSungCd;
    }

    /**
     * @param saleDlrSungCd the saleDlrSungCd to set
     */
    public void setSaleDlrSungCd(String saleDlrSungCd) {
        this.saleDlrSungCd = saleDlrSungCd;
    }

    /**
     * @return the saleDlrSungNm
     */
    public String getSaleDlrSungNm() {
        return saleDlrSungNm;
    }

    /**
     * @param saleDlrSungNm the saleDlrSungNm to set
     */
    public void setSaleDlrSungNm(String saleDlrSungNm) {
        this.saleDlrSungNm = saleDlrSungNm;
    }

    /**
     * @return the bankCd
     */
    public String getBankCd() {
        return bankCd;
    }

    /**
     * @param bankCd the bankCd to set
     */
    public void setBankCd(String bankCd) {
        this.bankCd = bankCd;
    }

    /**
     * @return the bankNm
     */
    public String getBankNm() {
        return bankNm;
    }

    /**
     * @param bankNm the bankNm to set
     */
    public void setBankNm(String bankNm) {
        this.bankNm = bankNm;
    }

    /**
     * @return the bankAcNo
     */
    public String getBankAcNo() {
        return bankAcNo;
    }

    /**
     * @param bankAcNo the bankAcNo to set
     */
    public void setBankAcNo(String bankAcNo) {
        this.bankAcNo = bankAcNo;
    }

    /**
     * @return the stockLocCd
     */
    public String getStockLocCd() {
        return stockLocCd;
    }

    /**
     * @param stockLocCd the stockLocCd to set
     */
    public void setStockLocCd(String stockLocCd) {
        this.stockLocCd = stockLocCd;
    }

    /**
     * @return the payTermCd
     */
    public String getPayTermCd() {
        return payTermCd;
    }

    /**
     * @param payTermCd the payTermCd to set
     */
    public void setPayTermCd(String payTermCd) {
        this.payTermCd = payTermCd;
    }

    /**
     * @return the leadTimeCd
     */
    public String getLeadTimeCd() {
        return leadTimeCd;
    }

    /**
     * @param leadTimeCd the leadTimeCd to set
     */
    public void setLeadTimeCd(String leadTimeCd) {
        this.leadTimeCd = leadTimeCd;
    }

    /**
     * @return the openDt
     */
    public String getOpenDt() {
        return openDt;
    }

    /**
     * @param openDt the openDt to set
     */
    public void setOpenDt(String openDt) {
        this.openDt = openDt;
    }

    /**
     * @return the bankCountry
     */
    public String getBankCountry() {
        return bankCountry;
    }

    /**
     * @param bankCountry the bankCountry to set
     */
    public void setBankCountry(String bankCountry) {
        this.bankCountry = bankCountry;
    }

    /**
     * @return the crtfNvalTaxNo
     */
    public String getCrtfNvalTaxNo() {
        return crtfNvalTaxNo;
    }

    /**
     * @param crtfNvalTaxNo the crtfNvalTaxNo to set
     */
    public void setCrtfNvalTaxNo(String crtfNvalTaxNo) {
        this.crtfNvalTaxNo = crtfNvalTaxNo;
    }

    /**
     * @return the deopNm
     */
    public String getDeopNm() {
        return deopNm;
    }

    /**
     * @param deopNm the deopNm to set
     */
    public void setDeopNm(String deopNm) {
        this.deopNm = deopNm;
    }

    /**
     * @return the dlvAddr1
     */
    public String getDlvAddr1() {
        return dlvAddr1;
    }

    /**
     * @param dlvAddr1 the dlvAddr1 to set
     */
    public void setDlvAddr1(String dlvAddr1) {
        this.dlvAddr1 = dlvAddr1;
    }

    /**
     * @return the dlvAddr2
     */
    public String getDlvAddr2() {
        return dlvAddr2;
    }

    /**
     * @param dlvAddr2 the dlvAddr2 to set
     */
    public void setDlvAddr2(String dlvAddr2) {
        this.dlvAddr2 = dlvAddr2;
    }

    /**
     * @return the dlvAgntNm1
     */
    public String getDlvAgntNm1() {
        return dlvAgntNm1;
    }

    /**
     * @param dlvAgntNm1 the dlvAgntNm1 to set
     */
    public void setDlvAgntNm1(String dlvAgntNm1) {
        this.dlvAgntNm1 = dlvAgntNm1;
    }

    /**
     * @return the dlvAgntNm2
     */
    public String getDlvAgntNm2() {
        return dlvAgntNm2;
    }

    /**
     * @param dlvAgntNm2 the dlvAgntNm2 to set
     */
    public void setDlvAgntNm2(String dlvAgntNm2) {
        this.dlvAgntNm2 = dlvAgntNm2;
    }

    /**
     * @return the dlvCityDvNm
     */
    public String getDlvCityDvNm() {
        return dlvCityDvNm;
    }

    /**
     * @param dlvCityDvNm the dlvCityDvNm to set
     */
    public void setDlvCityDvNm(String dlvCityDvNm) {
        this.dlvCityDvNm = dlvCityDvNm;
    }

    /**
     * @return the dlvCpNo1
     */
    public String getDlvCpNo1() {
        return dlvCpNo1;
    }

    /**
     * @param dlvCpNo1 the dlvCpNo1 to set
     */
    public void setDlvCpNo1(String dlvCpNo1) {
        this.dlvCpNo1 = dlvCpNo1;
    }

    /**
     * @return the dlvCpNo2
     */
    public String getDlvCpNo2() {
        return dlvCpNo2;
    }

    /**
     * @param dlvCpNo2 the dlvCpNo2 to set
     */
    public void setDlvCpNo2(String dlvCpNo2) {
        this.dlvCpNo2 = dlvCpNo2;
    }

    /**
     * @return the dlvTelNo1
     */
    public String getDlvTelNo1() {
        return dlvTelNo1;
    }

    /**
     * @param dlvTelNo1 the dlvTelNo1 to set
     */
    public void setDlvTelNo1(String dlvTelNo1) {
        this.dlvTelNo1 = dlvTelNo1;
    }

    /**
     * @return the dlvTelNo2
     */
    public String getDlvTelNo2() {
        return dlvTelNo2;
    }

    /**
     * @param dlvTelNo2 the dlvTelNo2 to set
     */
    public void setDlvTelNo2(String dlvTelNo2) {
        this.dlvTelNo2 = dlvTelNo2;
    }

    /**
     * @return the dlvZipNo
     */
    public String getDlvZipNo() {
        return dlvZipNo;
    }

    /**
     * @param dlvZipNo the dlvZipNo to set
     */
    public void setDlvZipNo(String dlvZipNo) {
        this.dlvZipNo = dlvZipNo;
    }

    /**
     * @return the fdAgntNm
     */
    public String getFdAgntNm() {
        return fdAgntNm;
    }

    /**
     * @param fdAgntNm the fdAgntNm to set
     */
    public void setFdAgntNm(String fdAgntNm) {
        this.fdAgntNm = fdAgntNm;
    }

    /**
     * @return the fiAddr1
     */
    public String getFiAddr1() {
        return fiAddr1;
    }

    /**
     * @param fiAddr1 the fiAddr1 to set
     */
    public void setFiAddr1(String fiAddr1) {
        this.fiAddr1 = fiAddr1;
    }

    /**
     * @return the fiAddr2
     */
    public String getFiAddr2() {
        return fiAddr2;
    }

    /**
     * @param fiAddr2 the fiAddr2 to set
     */
    public void setFiAddr2(String fiAddr2) {
        this.fiAddr2 = fiAddr2;
    }

    /**
     * @return the fiCityDvNm
     */
    public String getFiCityDvNm() {
        return fiCityDvNm;
    }

    /**
     * @param fiCityDvNm the fiCityDvNm to set
     */
    public void setFiCityDvNm(String fiCityDvNm) {
        this.fiCityDvNm = fiCityDvNm;
    }

    /**
     * @return the fiZipNo
     */
    public String getFiZipNo() {
        return fiZipNo;
    }

    /**
     * @param fiZipNo the fiZipNo to set
     */
    public void setFiZipNo(String fiZipNo) {
        this.fiZipNo = fiZipNo;
    }

    /**
     * @return the areaCcbzPnm
     */
    public String getAreaCcbzPnm() {
        return areaCcbzPnm;
    }

    /**
     * @param areaCcbzPnm the areaCcbzPnm to set
     */
    public void setAreaCcbzPnm(String areaCcbzPnm) {
        this.areaCcbzPnm = areaCcbzPnm;
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
     * @return the lttuVal
     */
    public Double getLttuVal() {
        return lttuVal;
    }

    /**
     * @param lttuVal the lttuVal to set
     */
    public void setLttuVal(Double lttuVal) {
        this.lttuVal = lttuVal;
    }

    /**
     * @return the lotuVal
     */
    public Double getLotuVal() {
        return lotuVal;
    }

    /**
     * @param lotuVal the lotuVal to set
     */
    public void setLotuVal(Double lotuVal) {
        this.lotuVal = lotuVal;
    }

    /**
     * @return the dmsIpNm
     */
    public String getDmsIpNm() {
        return dmsIpNm;
    }

    /**
     * @param dmsIpNm the dmsIpNm to set
     */
    public void setDmsIpNm(String dmsIpNm) {
        this.dmsIpNm = dmsIpNm;
    }

    /**
     * @return the dmsPortNm
     */
    public String getDmsPortNm() {
        return dmsPortNm;
    }

    /**
     * @param dmsPortNm the dmsPortNm to set
     */
    public void setDmsPortNm(String dmsPortNm) {
        this.dmsPortNm = dmsPortNm;
    }

    /**
     * @return the dmsOperEmailNm
     */
    public String getDmsOperEmailNm() {
        return dmsOperEmailNm;
    }

    /**
     * @param dmsOperEmailNm the dmsOperEmailNm to set
     */
    public void setDmsOperEmailNm(String dmsOperEmailNm) {
        this.dmsOperEmailNm = dmsOperEmailNm;
    }

    /**
     * @return the dmsOperTelNo
     */
    public String getDmsOperTelNo() {
        return dmsOperTelNo;
    }

    /**
     * @param dmsOperTelNo the dmsOperTelNo to set
     */
    public void setDmsOperTelNo(String dmsOperTelNo) {
        this.dmsOperTelNo = dmsOperTelNo;
    }

    /**
     * @return the dmsUseYn
     */
    public String getDmsUseYn() {
        return dmsUseYn;
    }

    /**
     * @param dmsUseYn the dmsUseYn to set
     */
    public void setDmsUseYn(String dmsUseYn) {
        this.dmsUseYn = dmsUseYn;
    }

    /**
     * @return the dmsTestUrlNm
     */
    public String getDmsTestUrlNm() {
        return dmsTestUrlNm;
    }

    /**
     * @param dmsTestUrlNm the dmsTestUrlNm to set
     */
    public void setDmsTestUrlNm(String dmsTestUrlNm) {
        this.dmsTestUrlNm = dmsTestUrlNm;
    }

    /**
     * @return the membershipPolicy
     */
    public String getMembershipPolicy() {
        return membershipPolicy;
    }

    /**
     * @param membershipPolicy the membershipPolicy to set
     */
    public void setMembershipPolicy(String membershipPolicy) {
        this.membershipPolicy = membershipPolicy;
    }

    /**
     * @return the membershipPointPeriod
     */
    public int getMembershipPointPeriod() {
        return membershipPointPeriod;
    }

    /**
     * @param membershipPointPeriod the membershipPointPeriod to set
     */
    public void setMembershipPointPeriod(int membershipPointPeriod) {
        this.membershipPointPeriod = membershipPointPeriod;
    }

    /**
     * @return the membershipPointExchgPoint
     */
    public int getMembershipPointExchgPoint() {
        return membershipPointExchgPoint;
    }

    /**
     * @param membershipPointExchgPoint the membershipPointExchgPoint to set
     */
    public void setMembershipPointExchgPoint(int membershipPointExchgPoint) {
        this.membershipPointExchgPoint = membershipPointExchgPoint;
    }

    /**
     * @return the membershipPointExchgMoney
     */
    public int getMembershipPointExchgMoney() {
        return membershipPointExchgMoney;
    }

    /**
     * @param membershipPointExchgMoney the membershipPointExchgMoney to set
     */
    public void setMembershipPointExchgMoney(int membershipPointExchgMoney) {
        this.membershipPointExchgMoney = membershipPointExchgMoney;
    }

    /**
     * @return the membershipPointUseMaxPoint
     */
    public int getMembershipPointUseMaxPoint() {
        return membershipPointUseMaxPoint;
    }

    /**
     * @param membershipPointUseMaxPoint the membershipPointUseMaxPoint to set
     */
    public void setMembershipPointUseMaxPoint(int membershipPointUseMaxPoint) {
        this.membershipPointUseMaxPoint = membershipPointUseMaxPoint;
    }

    /**
     * @return the obAssignAutoYn
     */
    public String getObAssignAutoYn() {
        return obAssignAutoYn;
    }

    /**
     * @param obAssignAutoYn the obAssignAutoYn to set
     */
    public void setObAssignAutoYn(String obAssignAutoYn) {
        this.obAssignAutoYn = obAssignAutoYn;
    }

    /**
     * @return the autoAssignCd
     */
    public String getAutoAssignCd() {
        return autoAssignCd;
    }

    /**
     * @param autoAssignCd the autoAssignCd to set
     */
    public void setAutoAssignCd(String autoAssignCd) {
        this.autoAssignCd = autoAssignCd;
    }

    /**
     * @return the autoTrsfConf
     */
    public String getAutoTrsfConf() {
        return autoTrsfConf;
    }

    /**
     * @param autoTrsfConf the autoTrsfConf to set
     */
    public void setAutoTrsfConf(String autoTrsfConf) {
        this.autoTrsfConf = autoTrsfConf;
    }

    /**
     * @return the callcenterMaxCall
     */
    public int getCallcenterMaxCall() {
        return callcenterMaxCall;
    }

    /**
     * @param callcenterMaxCall the callcenterMaxCall to set
     */
    public void setCallcenterMaxCall(int callcenterMaxCall) {
        this.callcenterMaxCall = callcenterMaxCall;
    }

    /**
     * @return the salesOpptPwYn
     */
    public String getSalesOpptPwYn() {
        return salesOpptPwYn;
    }

    /**
     * @param salesOpptPwYn the salesOpptPwYn to set
     */
    public void setSalesOpptPwYn(String salesOpptPwYn) {
        this.salesOpptPwYn = salesOpptPwYn;
    }

    /**
     * @return the membershipGradeNoneAutoYn
     */
    public String getMembershipGradeNoneAutoYn() {
        return membershipGradeNoneAutoYn;
    }

    /**
     * @param membershipGradeNoneAutoYn the membershipGradeNoneAutoYn to set
     */
    public void setMembershipGradeNoneAutoYn(String membershipGradeNoneAutoYn) {
        this.membershipGradeNoneAutoYn = membershipGradeNoneAutoYn;
    }

    /**
     * @return the rcptAmtsRate
     */
    public double getRcptAmtsRate() {
        return rcptAmtsRate;
    }

    /**
     * @param rcptAmtsRate the rcptAmtsRate to set
     */
    public void setRcptAmtsRate(double rcptAmtsRate) {
        this.rcptAmtsRate = rcptAmtsRate;
    }

    /**
     * @return the goodsRate
     */
    public double getGoodsRate() {
        return goodsRate;
    }

    /**
     * @param goodsRate the goodsRate to set
     */
    public void setGoodsRate(double goodsRate) {
        this.goodsRate = goodsRate;
    }

    /**
     * @return the insuranceNewRate
     */
    public double getInsuranceNewRate() {
        return insuranceNewRate;
    }

    /**
     * @param insuranceNewRate the insuranceNewRate to set
     */
    public void setInsuranceNewRate(double insuranceNewRate) {
        this.insuranceNewRate = insuranceNewRate;
    }

    /**
     * @return the insuranceExtendedRate
     */
    public double getInsuranceExtendedRate() {
        return insuranceExtendedRate;
    }

    /**
     * @param insuranceExtendedRate the insuranceExtendedRate to set
     */
    public void setInsuranceExtendedRate(double insuranceExtendedRate) {
        this.insuranceExtendedRate = insuranceExtendedRate;
    }

    /**
     * @return the fincRate
     */
    public double getFincRate() {
        return fincRate;
    }

    /**
     * @param fincRate the fincRate to set
     */
    public void setFincRate(double fincRate) {
        this.fincRate = fincRate;
    }

    /**
     * @return the executionRate
     */
    public double getExecutionRate() {
        return executionRate;
    }

    /**
     * @param executionRate the executionRate to set
     */
    public void setExecutionRate(double executionRate) {
        this.executionRate = executionRate;
    }

    /**
     * @return the revPartsRate
     */
    public double getRevPartsRate() {
        return revPartsRate;
    }

    /**
     * @param revPartsRate the revPartsRate to set
     */
    public void setRevPartsRate(double revPartsRate) {
        this.revPartsRate = revPartsRate;
    }

    /**
     * @return the gnlRteRate
     */
    public double getGnlRteRate() {
        return gnlRteRate;
    }

    /**
     * @param gnlRteRate the gnlRteRate to set
     */
    public void setGnlRteRate(double gnlRteRate) {
        this.gnlRteRate = gnlRteRate;
    }

    /**
     * @return the wartRteRate
     */
    public double getWartRteRate() {
        return wartRteRate;
    }

    /**
     * @param wartRteRate the wartRteRate to set
     */
    public void setWartRteRate(double wartRteRate) {
        this.wartRteRate = wartRteRate;
    }

    /**
     * @return the incRteRate
     */
    public double getIncRteRate() {
        return incRteRate;
    }

    /**
     * @param incRteRate the incRteRate to set
     */
    public void setIncRteRate(double incRteRate) {
        this.incRteRate = incRteRate;
    }

    /**
     * @return the intRteRate
     */
    public double getIntRteRate() {
        return intRteRate;
    }

    /**
     * @param intRteRate the intRteRate to set
     */
    public void setIntRteRate(double intRteRate) {
        this.intRteRate = intRteRate;
    }

    /**
     * @return the rwrkRteRate
     */
    public double getRwrkRteRate() {
        return rwrkRteRate;
    }

    /**
     * @param rwrkRteRate the rwrkRteRate to set
     */
    public void setRwrkRteRate(double rwrkRteRate) {
        this.rwrkRteRate = rwrkRteRate;
    }

    /**
     * @return the validCheckCallSecond
     */
    public int getValidCheckCallSecond() {
        return validCheckCallSecond;
    }

    /**
     * @param validCheckCallSecond the validCheckCallSecond to set
     */
    public void setValidCheckCallSecond(int validCheckCallSecond) {
        this.validCheckCallSecond = validCheckCallSecond;
    }

    /**
     * @return the allowSubscriptionSaleYn
     */
    public String getAllowSubscriptionSaleYn() {
        return allowSubscriptionSaleYn;
    }

    /**
     * @param allowSubscriptionSaleYn the allowSubscriptionSaleYn to set
     */
    public void setAllowSubscriptionSaleYn(String allowSubscriptionSaleYn) {
        this.allowSubscriptionSaleYn = allowSubscriptionSaleYn;
    }

    /**
     * @return the termSpecie
     */
    public String getTermSpecie() {
        return termSpecie;
    }

    /**
     * @param termSpecie the termSpecie to set
     */
    public void setTermSpecie(String termSpecie) {
        this.termSpecie = termSpecie;
    }

    /**
     * @return the insExpAlarmDay
     */
    public int getInsExpAlarmDay() {
        return insExpAlarmDay;
    }

    /**
     * @param insExpAlarmDay the insExpAlarmDay to set
     */
    public void setInsExpAlarmDay(int insExpAlarmDay) {
        this.insExpAlarmDay = insExpAlarmDay;
    }

    /**
     * @return the bmpBpCd
     */
    public String getBmpBpCd() {
        return bmpBpCd;
    }

    /**
     * @param bmpBpCd the bmpBpCd to set
     */
    public void setBmpBpCd(String bmpBpCd) {
        this.bmpBpCd = bmpBpCd;
    }

    /**
     * @return the prefixCustNo
     */
    public String getPrefixCustNo() {
        return prefixCustNo;
    }

    /**
     * @param prefixCustNo the prefixCustNo to set
     */
    public void setPrefixCustNo(String prefixCustNo) {
        this.prefixCustNo = prefixCustNo;
    }

    /**
     * @return the smsRemainAmount
     */
    public Double getSmsRemainAmount() {
        return smsRemainAmount;
    }

    /**
     * @param smsRemainAmount the smsRemainAmount to set
     */
    public void setSmsRemainAmount(Double smsRemainAmount) {
        this.smsRemainAmount = smsRemainAmount;
    }

    /**
     * @return the smsRemainCnt
     */
    public int getSmsRemainCnt() {
        return smsRemainCnt;
    }

    /**
     * @param smsRemainCnt the smsRemainCnt to set
     */
    public void setSmsRemainCnt(int smsRemainCnt) {
        this.smsRemainCnt = smsRemainCnt;
    }

    /**
     * @return the migPrgStat
     */
    public String getMigPrgStat() {
        return migPrgStat;
    }

    /**
     * @param migPrgStat the migPrgStat to set
     */
    public void setMigPrgStat(String migPrgStat) {
        this.migPrgStat = migPrgStat;
    }

}