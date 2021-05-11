package chn.bhmc.dms.mis.tmp.service;

import java.util.List;

import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusVO;

/**
 * <pre>
 * [제조사] 시장현황등록
 * </pre>
 *
 * @ClassName   : TargetMarketStatusService.java
 * @Description : [제조사] 시장현황등록
 * @author chibeom.song
 * @since 2016. 9. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 9.    chibeom.song     최초 생성
 * </pre>
 */

public interface TargetMarketStatusService {

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetMarketStatusVO> selectProvinceInfoList(TargetMarketStatusSearchVO searchVO) throws Exception;

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetMarketStatusVO> selectProvinceInfoList(String provinceCd) throws Exception;

    /**
     * 시(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetMarketStatusVO> selectCityInfoList(TargetMarketStatusSearchVO searchVO) throws Exception;

    /**
     * 시(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetMarketStatusVO> selectCityInfoList(String provinceCd) throws Exception;

    /**
     * 시(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @return
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusCityList(TargetMarketStatusSearchVO searchVO);

    /**
     * 시(우편번호) 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMarketStatusSearchVO
     * @return
     */
    public int selectManuMarketStatusCityCnt(TargetMarketStatusSearchVO searchVO) throws Exception;

    /**
     * 시장현황자료를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusByCondition(TargetMarketStatusSearchVO searchVO) throws Exception;

    /**
     * 시장현황자료 엑셀 일괄 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertManuMarketStatusDataRegUploadSave(List<TargetMarketStatusVO> list) throws Exception;

    /**
     * 시장현황자료 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 targetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertManuMarketStatusReg(TargetMarketStatusVO targetMarketStatusVO) throws Exception;

    /**
     * 시장현황자료 정보를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 targetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateManuMarketStatusReg(TargetMarketStatusVO targetMarketStatusVO) throws Exception;

    /**
     * Key에 해당하는 시장현황자료 정보를 조회한다.
     * @param
     * @return
     */
    public TargetMarketStatusVO selectManuMarketStatusRegByKey(String provinceCd, String cityCd, String regYear, String regMonth) throws Exception;

    /**
     * 조회조건에 해당하는 시장현황자료 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectManuMarketStatusByConditionCnt(TargetMarketStatusSearchVO searchVO) throws Exception;

    /**
     * 시장현황자료를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusRecentByCondition(TargetMarketStatusSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 시장현황 상세 자료 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectManuMarketDetailByConditionCnt(TargetMarketStatusSearchVO searchVO) throws Exception;

    /**
     * 시장현황자료를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketDetailByCondition(TargetMarketStatusSearchVO searchVO) throws Exception;




}
