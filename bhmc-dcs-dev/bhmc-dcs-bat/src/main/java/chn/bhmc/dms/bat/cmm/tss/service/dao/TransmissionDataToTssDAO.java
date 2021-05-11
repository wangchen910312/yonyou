package chn.bhmc.dms.bat.cmm.tss.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TransmissionDataToTssDAO
 * @Description : DCS往TSS通过DBlink传输数据.
 * @author Jia Ming
 * @since 2019. 4. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.      Jia Ming                
 * </pre>
 */
@Mapper("transmissionDataToTssDAO")
public interface TransmissionDataToTssDAO {

    /**
     * 从DCS获取数据给TSS
     * @throws Exception
     */
    public void getDCSDataToTSS() throws Exception;

}
