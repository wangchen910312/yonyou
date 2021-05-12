package chn.bhmc.dms.bat.sal.orc.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSockDailyDAO
 * @Description : 재고일배치
 * @author Lee Seungmin
 * @since 2017. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("batchOrcMngDAO")
public interface BatchOrcMngDAO {

    public void updateOrcMng() throws Exception;

}