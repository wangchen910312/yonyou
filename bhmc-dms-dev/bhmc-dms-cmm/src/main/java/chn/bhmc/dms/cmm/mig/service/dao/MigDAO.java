package chn.bhmc.dms.cmm.mig.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

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
 * @ClassName   : MigDAO.java
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
@Mapper("migDAO")
public interface MigDAO {

    /**
     * 기초정보 프로시저 실행
     * @param dlrCd 딜러코드
     * @param useCenterDmsYn 센터DMS 사용여부
     */
    public void updateMigNdmsComInit(MigVO migVO);

    /**
     * 마이그레이션 프로시저 실행 로그 조회
     * @param dlrCd 딜러코드
     * @param skipRows 로그조회시 스킵할 목록수
     * @return
     */
    public List<MigProcLogVO> selectMigProcLogList(@Param("dlrCd") String dlrCd, @Param("skipRows") int skipRows);

    /**
     * 마이그레이션 프로시저 호출
     * DCS DB에서 수행된 마이그레이션 데이터를 신규 딜러로 이관한다.
     * @param dlrCd
     */
    public void updateMigNdmsInsert(MigVO migVO);

    /**
     * 마이그레이션 진행상태를 조회
     * @param
     * @return
     */
    public String selectMigPrgStat(String dlrCd);

    /**
     * 마이그레이션 후행 프로시저 호출
     * DCS DB에서 수행된 마이그레이션 데이터를 보정한다.
     * @param dlrCd
     */
    public void updateMigAfeterProcInsert(MigVO migVO);

    /**
     * 마이그레이션 후행 프로시저 호출(DCS->DMS)
     * DCS DB에서 수행된 마이그레이션 데이터를 전송한다.
     * @param dlrCd
     */
    public void updateMigDcsDmsProcInsert(MigVO migVO);

    /**
     * 마이그레이션 대상 Job List 조회
     * @param
     * @return
     */
    public List<MigTgtInfoVO> selectMigTargetList(MigTgtInfoVO migTgtInfoVO);

    /**
     * 기초정보 프로시저 실행 로그 조회
     * @param skipRows 로그조회시 스킵할 목록수
     * @return
     */
    public List<MigNdmsComInitLogVO> selectMigNdmsLogList(int skipRows);

    /**
     * 마이그레이션 체크 목록 조회
     * @param MigCheckSearchVO
     * @return MigNdmsComInitLogVO
     */
    public List<MigNdmsComInitLogVO> selectMigCheckList(MigCheckSearchVO searchVO);


    /**
     * 마이그레이션 검증 실행
     * @param migVO
     * @return void
     */
    public void multiMigCheckInfo(MigVO migVO);
}
