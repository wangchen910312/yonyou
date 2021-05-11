package chn.bhmc.dms.bat.ser.svi.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PDIChkManageDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("pdiChkManageDAO")
public interface PdiChkManageDAO {


    /**
     *
     * Pdi점검관리 데이터 인터페이스 테이블 등록
     *
     * @throws Exception
     */
    public void insertPdiChkList()throws Exception;

}
