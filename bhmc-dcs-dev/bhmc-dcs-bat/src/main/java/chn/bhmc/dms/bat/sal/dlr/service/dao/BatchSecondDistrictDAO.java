package chn.bhmc.dms.bat.sal.dlr.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSecondDistrictDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Jin Suk
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.      Kim Jin Suk    최초 생성
 * </pre>
 */
@Mapper("batchSecondDistrictDAO")
public interface BatchSecondDistrictDAO {

    /**
     * 1급 2급 심사자 정보 셋팅
     * @throws Exception
     */
    public void secondDistrictRun() throws Exception;

}
