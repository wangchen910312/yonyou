package chn.bhmc.dms.bat.sal.veh.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchVehicleInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 8. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 14.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Mapper("batchVehicleInfoDAO")
public interface BatchVehicleInfoDAO {

    public void updateVehicleInfo()throws Exception;
}
