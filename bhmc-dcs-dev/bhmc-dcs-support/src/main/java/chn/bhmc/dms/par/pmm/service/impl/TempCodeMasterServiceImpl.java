package chn.bhmc.dms.par.pmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.TempCodeMasterService;
import chn.bhmc.dms.par.pmm.vo.TempCodeVO;

/**
 * 테스트용 코드 관리 구현 클래스
 *
 * @ClassName   : TempCodeMasterServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("tempCodeMasterService")
public class TempCodeMasterServiceImpl extends HService implements TempCodeMasterService {

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeitemDstinCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeItemDstinCdByCondition(){

        // TODO [심인보] 품목구분 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("완성차");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("부품");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("04");
        tempCodeVO.setUsrNm("FRS");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("05");
        tempCodeVO.setUsrNm("작업패키지");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("06");
        tempCodeVO.setUsrNm("악세서리");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("07");
        tempCodeVO.setUsrNm("FMS쿠폰");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("08");
        tempCodeVO.setUsrNm("옵션");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("09");
        tempCodeVO.setUsrNm("서비스쿠폰북");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePurcTpByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePurcTpByCondition(){
        // TODO [심인보] 가격유형 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("현금");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("카드");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodepurcQtyUtByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePrcQtyUnitCdByCondition(){
        // TODO [심인보] 단위 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("BOX");
        tempCodeVO.setUsrNm("BOX");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("EA");
        tempCodeVO.setUsrNm("EA");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("KG");
        tempCodeVO.setUsrNm("KG");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePartnerTypeByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeBpTpByCondition() {
        // TODO [심인보] 거래처유형 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("BHMC");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("로컬");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("타딜러");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeCntryCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeCntryCdByCondition() {
        // TODO [심인보] 국가 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("한국");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("중국");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("미국");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeDealCurrByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeDealCurrUnitCdByCondition() {
        // TODO [심인보] 화폐단위 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("KRW");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("CHN");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("Dallar");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeAreaCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeDistCdByCondition() {
        // TODO [심인보] 화폐단위 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("지역1");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("지역2");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("지역3");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePaymentTypeByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePayTpByCondition() {
        // TODO [심인보] 지불방법 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("지불방법1");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("지불방법2");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("지불방법3");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePaymentTermByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePayTermCdByCondition() {
        // TODO [심인보] 지불방법 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("지불조건1");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("지불조건2");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("지불조건3");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePltCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePltCdByCondition() {
        // TODO [심인보] 센터 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("센터1");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("센터2");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("센터3");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePurcReqTpByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePurcReqTpByCondition() {
        // TODO [심인보] 구매요청유형 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("구매요청유형1");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("구매요청유형2");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("구매요청유형3");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePurcReqStatCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePurcReqStatCdByCondition() {
        // TODO [심인보] 구매요청상태 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("구매요청상태1");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("구매요청상태2");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("구매요청상태3");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePurcStrgeCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeStrgeCdByCondition() {
        // TODO [심인보] 창고 코드
        List<TempCodeVO> itemDstinCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("A07AA-01");
        tempCodeVO.setUsrNm("창고1");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("A07AA-02");
        tempCodeVO.setUsrNm("창고2");
        itemDstinCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("A07AA-03");
        tempCodeVO.setUsrNm("창고3");
        itemDstinCdDs.add(tempCodeVO);

        return itemDstinCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeUnitCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeUnitCdByCondition() {

        List<TempCodeVO> unitCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("EA");
        tempCodeVO.setUsrNm("EA");
        unitCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("BOX");
        tempCodeVO.setUsrNm("BOX");
        unitCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("CAN");
        tempCodeVO.setUsrNm("CAN");
        unitCdDs.add(tempCodeVO);

        return unitCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeAbcIndByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeAbcIndByCondition() {

        List<TempCodeVO> abcIndCdDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("ABC Class1");
        abcIndCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("ABC Class2");
        abcIndCdDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("ABC Class3");
        abcIndCdDs.add(tempCodeVO);

        return abcIndCdDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePartsCarTypeByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePartsCarTpByCondition() {

        List<TempCodeVO> partsCarTypeDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("차종1");
        partsCarTypeDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("차종2");
        partsCarTypeDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("차종3");
        partsCarTypeDs.add(tempCodeVO);

        return partsCarTypeDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePartsReqTpByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePartsParReqStatCdByCondition() {

        List<TempCodeVO> partsReqTpDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("서비스예약");
        partsReqTpDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("서비스RO");
        partsReqTpDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("부품판매");
        partsReqTpDs.add(tempCodeVO);

        return partsReqTpDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePartsParGiTpByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePartsParGiTpByCondition() {

        List<TempCodeVO> parGiTpDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("부품요청");
        parGiTpDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("구매완료");
        parGiTpDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("출고요청");
        parGiTpDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("04");
        tempCodeVO.setUsrNm("출고확정");
        parGiTpDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("05");
        tempCodeVO.setUsrNm("출고완료");
        parGiTpDs.add(tempCodeVO);

        return parGiTpDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodePartsCanYnByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodePartsCancYnByCondition() {

        List<TempCodeVO> canYnDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("N");
        tempCodeVO.setUsrNm("미취소");
        canYnDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("Y");
        tempCodeVO.setUsrNm("취소");
        canYnDs.add(tempCodeVO);

        return canYnDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeGiStrgeCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeGiStrgeCdByCondition() {
        List<TempCodeVO> giStrgeDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("창고1");
        giStrgeDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("창고2");
        giStrgeDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("창고3");
        giStrgeDs.add(tempCodeVO);

        return giStrgeDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeGiLocCdByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeGiLocCdByCondition() {
        List<TempCodeVO> giLocDs = new ArrayList<TempCodeVO>();
        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("위치1");
        giLocDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("위치2");
        giLocDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("위치3");
        giLocDs.add(tempCodeVO);

        return giLocDs;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.TempCodeMasterService#selectTempCodeLocStatusByCondition()
     */
    @Override
    public List<TempCodeVO> selectTempCodeLocStatusByCondition() {
        List<TempCodeVO> locStatusDs = new ArrayList<TempCodeVO>();

        TempCodeVO tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("01");
        tempCodeVO.setUsrNm("BLANK LOCATION");
        locStatusDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("02");
        tempCodeVO.setUsrNm("PART MATCHING");
        locStatusDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("03");
        tempCodeVO.setUsrNm("LOC_QTY = 0");
        locStatusDs.add(tempCodeVO);

        tempCodeVO = new TempCodeVO();
        tempCodeVO.setUsrCd("04");
        tempCodeVO.setUsrNm("LOC_QTY big 0");
        locStatusDs.add(tempCodeVO);

        return locStatusDs;
    }

}
