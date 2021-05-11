package chn.bhmc.dms.bat.mis.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.mis.vo.BatchSystemDlrVO;
/**
 * <pre>
 * [BatchJob] 판매정보(MS_1002T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleInfosJobDAO.java
 * @Description : [BatchJob] 판매정보(MS_1002T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   chibeom.song     최초 생성
 * </pre>
 */
@Mapper("batchDaySaleInfosJobDAO")
public interface BatchDaySaleInfosJobDAO {

    /**
     * [BatchJob] 판매정보(MS_1001T)
     * @param null
     * @return Count
     */

    public List<BatchSystemDlrVO> selectSystemUseDlrList();

    /**
     * Statements
     *
     * @param batchDaySaleInfosJobVO
     */
    public void insertSaleInfosJob();

}
