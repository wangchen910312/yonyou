package chn.bhmc.dms.cmm.mig.service;

import java.util.List;

import chn.bhmc.dms.cmm.mig.vo.MigVO;

import chn.bhmc.dms.cmm.mig.vo.MigCheckSearchVO;

import chn.bhmc.dms.cmm.mig.vo.MigTgtInfoVO;

import chn.bhmc.dms.cmm.mig.vo.MigNdmsComInitLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigProcLogVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface MigService {

    /**
     * 기초정보 프로시저 실행
     * @param dlrCd 딜러코드
     * @param useCenterDmsYn 센터DMS 사용여부
     * @throws Exception
     */
    public void updateMigNdmsComInit(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 프로시저 실행 로그 조회
     * @param dlrCd 딜러코드
     * @param skipRows 로그조회시 스킵할 목록수
     * @return
     * @throws Exception
     */
    public List<MigProcLogVO> selectMigProcLogList(String dlrCd, int skipRows) throws Exception;

    /**
     * 마이그레이션 프로시저 호출
     * DCS DB에서 수행된 마이그레이션 데이터를 신규 딜러로 이관한다.
     * @param dlrCd
     * @throws Exception
     */
    public void updateMigNdmsInsert(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 후행 프로시저 호출
     * DCS DB에서 수행된 마이그레이션 데이터를 보정한다.
     * @param dlrCd
     * @throws Exception
     */
    public void updateMigAfeterProcInsert(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 후행 프로시저 호출(DCS->DMS)
     * DCS DB에서 수행된 마이그레이션 데이터를 전송한다.
     * @param dlrCd
     * @throws Exception
     */
    public void updateMigDcsDmsProcInsert(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 대상 Job List 조회
     * @param
     * @return
     * @throws Exception
     */
    public List<MigTgtInfoVO> selectMigTargetList(MigTgtInfoVO migTgtInfoVO) throws Exception;

    /**
     * 마이그레이션 데이터를 신규 딜러로 이관 실행 로그 조회
     * @param skipRows 로그조회시 스킵할 목록수
     * @return
     * @throws Exception
     */
    public List<MigNdmsComInitLogVO> selectMigNdmsLogList(int skipRows) throws Exception;

    /**
     * 마이그레이션 체크 목록 조회
     * @param MigCheckSearchVO
     * @return MigNdmsComInitLogVO
     * @throws Exception
     */
    public List<MigNdmsComInitLogVO> selectMigCheckList(MigCheckSearchVO searchVO) throws Exception;

    /**
     * 마이그레이션 검증 실행
     * @param MigCheckSearchVO
     * @return MigNdmsComInitLogVO
     * @throws Exception
     */
    public void multiMigCheckInfo(MigVO migVO) throws Exception;
}
