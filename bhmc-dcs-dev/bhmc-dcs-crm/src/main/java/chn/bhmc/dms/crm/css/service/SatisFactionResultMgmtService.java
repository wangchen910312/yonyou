package chn.bhmc.dms.crm.css.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO;


/**
 * 만족도 조사 관리에 관한 데이터처리 매퍼 클래스
 *
 *    File Name : SatisFactionResultMgmtDAO
 *    Description : 만족도 조사 결과관리
 *    author LEE Kyo Jin
 *    since 2016. 03. 04.
 *    version 1.0
 *    Modification Information
 *       since          author              description
 *    ===========    =============    ===========================
 *    2016. 03. 04.    LEE Kyo Jin    최초 생성
 */

public interface SatisFactionResultMgmtService {


    /**
     * 만족도 조사 결과관리 목록수를 조회한다.
     */
    public int selectSatisFactionResultMgmtByConditionCnt(SatisFactionResultMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과관리 정보 목록을 조회한다.
     */
    public List<SatisFactionResultMgmtVO> selectSatisFactionResultMgmtByCondition(SatisFactionResultMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과관리 등록한다.
     * @param SatisFactionResultMgmtVO - 등록할 정보가 담긴 SatisFactionResultMgmtVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionResultMgmt(SatisFactionResultMgmtVO satisFactionResultMgmtVO) throws Exception;

    /**
     * 만족도 조사 결과관리 수정한다.
     * @param SatisFactionResultMgmtVO - 수정할 정보가 담긴 SatisFactionResultMgmtVO
     * @return 수정된 목록수
     */
    public int updateSatisFactionResultMgmt(SatisFactionResultMgmtVO satisFactionResultMgmtVO) throws Exception;

    /**
     * 만족도 조사 결과상세관리 목록수를 조회한다.
     */
    public int selectSatisFactionResultDtlMgmtByConditionCnt(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과상세관리 정보 목록을 조회한다.
     */
    public List<SatisFactionResultDtlMgmtVO> selectSatisFactionResultDtlMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과상세관리 등록한다.
     * @param SatisFactionResultDtlMgmtVO - 등록할 정보가 담긴 SatisFactionResultDtlMgmtVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionResultDtlMgmt(SatisFactionResultDtlMgmtVO satisFactionResultDtlMgmtVO) throws Exception;



    //public Map<String, List<SatisFactionResultDtlMgmtVO>> selectSatisFactionResultDtlDataSetMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;
    public Map<String, List> selectSatisFactionResultDtlDataSetMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

    public void multiSatisFactionResultExcelImport(List<SatisFactionResultDtlMgmtVO> satisFactionResultDtlMgmtVO) throws Exception;

    public void multiSatisFactionResultMgmt(BaseSaveVO<SatisFactionResultMgmtVO> saveVO) throws Exception;

    public void selectSatisFactionDcsIfCopy(SatisFactionResultMgmtVO SatisFactionResultMgmtVO) throws Exception;

}
