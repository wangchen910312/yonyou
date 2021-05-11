package chn.bhmc.dms.mis.tmp.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegVO;
/**
 * <pre>
 * [제조사] 년간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetYearRegService.java
 * @Description : [제조사] 년간 목표 등록
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

public interface TargetYearRegService {

    /**
     * [제조사] 년간 목표 등록 엑셀 전체 데이터 저장 한다.
     *
     * @param list
     * @param object
     * @throws Exception
     */
    public void insertTargetAllYearRegUploadSave(List<TargetYearAllRegVO> list, TargetYearRegSearchVO targetYearRegSearchVO) throws Exception;

    /**
     * [제조사] 년간 목표 등록 엑셀 전체 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertTargetPartYearRegUploadSave(List<TargetYearPartRegVO> list) throws Exception;

    /**
     * [제조사] Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetYearAllRegVO selectTargetYearAllRegByKey(String goalYy, String sdptCd, String officeCd, String dlrCd, String carLineCd) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 TargetYearAllRegVO
     * @return 등록된 목록수
     */
    public int insertTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int updateTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 삭제한다.
     * @param targetYearAllRegVO - 삭제할 정보가 담긴 TargetYearAllRegVO
     * @return 삭제된 목록수
     */
    public int deleteTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * [제조사] Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetYearPartRegVO selectTargetYearPartRegByKey(String goalYy, String dlrCd, String carLineCd) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 TargetYearAllRegVO
     * @return 등록된 목록수
     */
    public int insertTargetYearPartReg(TargetYearPartRegVO targetYearPartRegVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 수정한다.
     * @param dbMessageSourceVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int updateTargetYearPartReg(TargetYearPartRegVO targetYearPartRegVO) throws Exception;

    /**
     * 조회 조건에 해당하는 년간 목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetYearAllRegVO> selectTargetYearAllRegByCondition(TargetYearRegSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 년간 목표 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectTargetYearAllRegByConditionCnt(TargetYearRegSearchVO searchVO) throws Exception;

    /**
     * 년간 목표 정보를 임시 처리한다.
     * @param TargetYearRegSaveVO
     */
    public void multiTargetYearRegTempSave(BaseSaveVO<TargetYearAllRegVO> targetYearRegSaveVO) throws Exception;

    /**
     * 년간 목표 정보를 확정 처리한다.
     * @param TargetYearRegSaveVO
     */
    public void multiTargetYearRegCompleteSave(BaseSaveVO<TargetYearAllRegVO> targetYearRegSaveVO) throws Exception;

    /**
     * 년간 목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int multiTargetYearRegCompleteSave(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetYearRegVO> selectSdptList(TargetYearRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetYearRegVO> selectOfficeList(TargetYearRegSearchVO searchVO);

    /**
     * [제조사] 년간 목표 등록 사업부에 따른 사무소 조회
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectOfficeListCnt(TargetYearRegSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetYearRegVO> selectYearOfficeList(TargetYearRegSearchVO searchVO);

    /**
     * 년간 목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int multiTargetYearRegCompleteSaveCnt(TargetYearAllRegVO targetYearAllRegVO) throws Exception;



}
