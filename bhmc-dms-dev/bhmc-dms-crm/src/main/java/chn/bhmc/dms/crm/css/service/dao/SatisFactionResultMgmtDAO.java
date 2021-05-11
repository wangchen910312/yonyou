package chn.bhmc.dms.crm.css.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

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

@Mapper("satisFactionResultMgmtDAO")
public interface SatisFactionResultMgmtDAO {

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
     * 만족도 조사 결과상세관리 해더 정보 목록을 조회한다.
     */
    public List<String> selectSatisFactionResultDtlHeaderMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

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



}
