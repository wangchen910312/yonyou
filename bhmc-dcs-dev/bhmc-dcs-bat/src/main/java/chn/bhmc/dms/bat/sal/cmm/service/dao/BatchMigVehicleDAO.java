package chn.bhmc.dms.bat.sal.cmm.service.dao;

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
@Mapper("batchMigVehicleDAO")
public interface BatchMigVehicleDAO {

    /**
     * 차량정보 보정 Migration
     * @throws Exception
     */
    public void migVehicleRun() throws Exception;

}
