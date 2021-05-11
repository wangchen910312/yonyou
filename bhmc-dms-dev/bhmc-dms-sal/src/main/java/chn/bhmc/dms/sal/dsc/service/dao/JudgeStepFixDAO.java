package chn.bhmc.dms.sal.dsc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dsc.vo.JudgeStepFixVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JudgeStepFixDAO
 * @Description : 일상업무등급관리(씸사단계설정) DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.21     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("judgeStepFixDAO")
public interface JudgeStepFixDAO {

    /**
     * 조회 조건에 해당하는 심사단계설정 목록 정보를 조회한다.
     * @return 조회 목록
     */
    public List<JudgeStepFixVO> selectJudgeStepFixsByCondition() throws Exception;

    /**
     * 심사단계설정이 있는지 유무 확인
     * @return 조회 목록
     */
    public int selectJudgeStepFixCnt(JudgeStepFixVO vo) throws Exception;

    /**
     * 심사단계설정 저장한다.
     * @return 조회 목록
     */
    public int insertJudgeStepFix(JudgeStepFixVO vo) throws Exception;

    /**
     * 심사단계설정 수정한다.
     * @return 조회 목록
     */
    public int updateJudgeStepFix(JudgeStepFixVO vo) throws Exception;

}