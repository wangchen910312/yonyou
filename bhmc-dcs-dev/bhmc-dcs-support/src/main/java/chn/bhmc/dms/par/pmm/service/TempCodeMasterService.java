package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.TempCodeVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TempCodeMasterService.java
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

public interface TempCodeMasterService {

    /**
     * 품목구분 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeItemDstinCdByCondition();

    /**
     * 가격유형 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePurcTpByCondition();

    /**
     * 단위 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePrcQtyUnitCdByCondition();

    /**
     * 거래처유형 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeBpTpByCondition();

    /**
     * 국가 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeCntryCdByCondition();

    /**
     * 화폐단위 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeDealCurrUnitCdByCondition();

    /**
     * 지역 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeDistCdByCondition();

    /**
     * 지불유형 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePayTpByCondition();

    /**
     * 지불기간 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePayTermCdByCondition();


    /**
     * 센터코드 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePltCdByCondition();

    /**
     * 구매요청유형 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePurcReqTpByCondition();

    /**
     * 구매요청상태 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePurcReqStatCdByCondition();

    /**
     * 창고 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeStrgeCdByCondition();

    /**
     * 단위 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeUnitCdByCondition();

    /**
     * ABC CLASS 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeAbcIndByCondition();

    /**
     * 차형 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePartsCarTpByCondition();

    /**
     * 구매요청유형 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePartsParReqStatCdByCondition();

    /**
     * 부품출고유형 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePartsParGiTpByCondition();

    /**
     * 취소여부 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodePartsCancYnByCondition();

    /**
     * 출고창고 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeGiStrgeCdByCondition();

    /**
     * 출고위치 사용자코드 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeGiLocCdByCondition();

    /**
     * 로케이션 조회 상태 정보를 조회한다.
     *
     * @return 조회 목록
     */
    public List<TempCodeVO> selectTempCodeLocStatusByCondition();



}
