package chn.bhmc.dms.bat.crm.css.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.crq.vo.BatCrmTargExtractVO;

import chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageSearchVO;
import chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatSatisFactionManageDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("batSatisFactionManageDAO")
public interface BatSatisFactionManageDAO {

    /**
     *
     * 1. 만족도 조사에 등록된 스케줄러 조회
     * 2. 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행
     * 3. 추출된 대상자를 콜센터로 이관
     * 4. 해당 tmp table에서 data삭제
     * 5. 만족도조사 의 마지막 추출일 update
     *
     */

    /**
     * 만족도 조사 대상자 추출을 위한 조건을 조회한다
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return 만족도조사관리의 "대상자추출" 버튼과 동일한 기능(/crm/css/satisFactionManage/selectCallRcpeExtrMapping.do)
     */
    public List<BatSatisFactionManageVO> stsfScheduleCondition(BatSatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 대상자를 추출한다.
     * @param batSatisFactionManageVO - BatSatisFactionManageVO
     * @return
     */
    public BatSatisFactionManageVO selectTargetExtractSaveExcel(BatSatisFactionManageVO saveVO) throws Exception;

    /**
     * 추출한 대상자를 등록한다.
     * @param batSatisFactionManageVO - 등록할 정보가 담긴 BatSatisFactionManageVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionManageTargExtUsr(BatSatisFactionManageVO batSatisFactionManageVO) throws Exception;


    /**
     * 대상자 정보를 콜센터로 전송한다.
     */
    public BatSatisFactionManageVO selectCallCenterSends(BatSatisFactionManageVO callSenProc) throws Exception;

    /**
     * TEMP01 대상자 정보를 삭제한다.
     * @param CrmTargExtractSearchVO - 삭제할 정보가 담긴 searchVO
     * @return 삭제된 목록수
     */
    public int deleteTemp01(BatSatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * TEMP02 대상자 정보를 삭제한다.
     * @param CrmTargExtractSearchVO - 삭제할 정보가 담긴 searchVO
     * @return 삭제된 목록수
     */
    public int deleteTemp02(BatSatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 마지막 추출 정보를 수정한다.
     * @param batSatisFactionManageVO - 수정할 정보가 담긴 BatSatisFactionManageVO
     * @return 수정된 목록수
     */
    public int updateLastExtrDt(BatSatisFactionManageVO batSatisFactionManageVO) throws Exception;

    /**
     * 만족도 조사 - 정비 대상자를 추출한다.
     * @param BatCrmTargExtractVO - saveVO
     * @return 프로시저 결과
     */
    public void selectTargetExtractSaveFromService(BatCrmTargExtractVO saveVO);
}
