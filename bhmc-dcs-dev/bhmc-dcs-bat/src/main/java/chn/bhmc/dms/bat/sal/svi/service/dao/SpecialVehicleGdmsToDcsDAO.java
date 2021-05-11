package chn.bhmc.dms.bat.sal.svi.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialVehicleGdmsToDcsDAO.java
 * @Description : GDMS 특수차량 정보 DCS 이관 DAO
 * @author Ki hyun Kwon
 * @since 2017. 6. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 28.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Mapper("specialVehicleGdmsToDcsDAO")
public interface SpecialVehicleGdmsToDcsDAO {

    /**
     *
     * gdms data mig
     *
     * @throws Exception
     */
    public void migSalSpecialVehicle()throws Exception;


}
