package chn.bhmc.dms.bat.cmm.itg.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.cmm.itg.vo.IntegrationDbIfInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IntegrationDbIfDAO
 * @Description : DMS - DCS 통합 DB I/F Batch DAO
 * @author Choi KyungYong
 * @since 2017. 8. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 8. 19.     Choi KyungYong            최초 생성
 * </pre>
 */

@Mapper("integrationDbIfDAO")
public interface IntegrationDbIfDAO {

    /**
     * DMS - DCS 통합 DB I/F 전송을 위해 전송 대상 정보를 I/F 테이블에 적재
     * @param bizCd 업무 구분 코드
     * @param cnt 업데이트 건수
     */
    public void insertIntegrationDbIfInfo(int day);

    /**
     * DMS - DCS 통합 DB I/F 전송을 위한 대상 조회
     * @param null
     * @return Count
     */
    public List<IntegrationDbIfInfoVO> getIntegrationDbIfInfo(IntegrationDbIfInfoVO integrationDbIfInfoVO) throws Exception;

    /**
     * DMS - DCS 통합 DB I/F 전송을 위한 대상을 업우별 100건 단위로 업데이트 후 Camel 호출
     * @param bizCd 업무 구분 코드
     * @param cnt 업데이트 건수
     */
    public void updateIntegrationDbIfInfo(IntegrationDbIfInfoVO integrationDbIfInfoVO);
}
