package chn.bhmc.dms.bat.sal.veh.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSockDailyDAO
 * @Description : VIN RFID Reset
 * @author Lee Seungmin
 * @since 2017. 6. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 7.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("batchVehRfidResetDAO")
public interface BatchVehRfidResetDAO {

    public void updateVehRfidReset() throws Exception;

    // VIn RFID 와 합격증번호를 받아온다.
    public int updateRfidCopyProcess() throws Exception;
}