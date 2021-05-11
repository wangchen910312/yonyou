package chn.bhmc.dms.mis.tmp.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegVO;
/**
 * <pre>
 * [제조사] 월간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetMonthRegService.java
 * @Description : [제조사] 월간 목표 등록
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

public interface TargetMonthRegService {

    /**
     * 조회 조건에 해당하는 월간 목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return 조회 목록
     */
    public List<TargetMonthAllRegVO> selectTargetMonthAllRegByCondition(TargetMonthRegSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 월간 목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectTargetMonthAllRegByConditionCnt(TargetMonthRegSearchVO searchVO) throws Exception;


    /**
     * [제조사] 월간 목표 등록 엑셀 전체 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertTargetAllMonthRegUploadSave(List<TargetMonthAllRegVO> list, TargetMonthRegSearchVO targetMonthRegSearchVO) throws Exception;

    /**
     * [제조사] 월간 목표 등록 엑셀 전체 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertTargetPartMonthRegUploadSave(List<TargetMonthPartRegVO> list) throws Exception;

    /**
     * Key에 해당하는 월간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetMonthAllRegVO selectTargetMonthAllRegByKey(String goalYyMm, String goalYy, String goalMm,String sdptCd, String officeCd, String dlrCd, String carLineCd) throws Exception;

    /**
     * 월간 목표 정보를 등록한다.
     * @param targetMonthAllRegVO - 등록할 정보가 담긴 TargetMonthAllRegVO
     * @return 등록된 목록수
     */
    public int insertTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception;

    /**
     * 월간 목표 정보를 수정한다.
     * @param targetMonthAllRegVO - 수정할 정보가 담긴 TargetMonthAllRegVO
     * @return 수정된 목록수
     */
    public int updateTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception;

    /**
     * 월간 목표 정보를 삭제한다.
     * @param targetMonthAllRegVO - 삭제할 정보가 담긴 TargetMonthAllRegVO
     * @return 삭제된 목록수
     */
    public int deleteTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception;

    /**
     * 월간 목표 정보를 임시 처리한다.
     * @param TargetMonthRegSaveVO
     */
    public void multiTargetMonthRegTempSave(BaseSaveVO<TargetMonthAllRegVO> targetMonthRegSaveVO) throws Exception;

    /**
     * 월간 목표 정보를 확정 처리한다.
     * @param TargetMonthRegSaveVO
     */
    public void multiTargetMonthRegCompleteSave(BaseSaveVO<TargetMonthAllRegVO> targetMonthRegSaveVO) throws Exception;

    /**
     * 월간 목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetMonthAllRegVO
     * @return 수정된 목록수
     */
    public int multiTargetMonthRegCompleteSave(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception;

    /**
     * [제조사] Key에 해당하는 월간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetMonthPartRegVO selectTargetMonthPartRegByKey(String goalYy, String goalMm, String dlrCd, String carLineCd) throws Exception;

    /**
     * [제조사] 월간 목표 정보를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 TargetMonthAllRegVO
     * @return 등록된 목록수
     */
    public int insertTargetMonthPartReg(TargetMonthPartRegVO targetMonthPartRegVO) throws Exception;

    /**
     * [제조사] 월간 목표 정보를 수정한다.
     * @param dbMessageSourceVO - 수정할 정보가 담긴 TargetMonthAllRegVO
     * @return 수정된 목록수
     */
    public int updateTargetMonthPartReg(TargetMonthPartRegVO targetYearPartRegVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectSdptList(TargetMonthRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectOfficeList(TargetMonthRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectDealerList(TargetMonthRegSearchVO searchVO);

    /**
     * [제조사] 월간 목표 등록 사업부에 따른 사무소 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public List<TargetMonthRegVO> selectMonthOfficeList(TargetMonthRegSearchVO searchVO);

    /**
     * [제조사] 월간 목표 등록 사업부에 따른 사무소 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public int selectOfficeListCnt(TargetMonthRegSearchVO searchVO) throws Exception;

    /**
     * [제조사] 월간 목표 등록 사무소에 따른 딜러사 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public List<TargetMonthRegVO> selectMonthDealerList(TargetMonthRegSearchVO searchVO);

    /**
     * [제조사] 월간 목표 등록 사무소에 따른 딜러사 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public int selectDealerListCnt(TargetMonthRegSearchVO searchVO) throws Exception;


}
