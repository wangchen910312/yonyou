package chn.bhmc.dms.bat.sal.fas.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.sal.fas.vo.BatchFasConfInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchFasConfInfoDAO
 * @Description : 강제출고심사완료알림-승인
 * @author Lee Seungmin
 * @since 2017. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 16.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("batchFasConfInfoDAO")
public interface BatchFasConfInfoDAO {

    // 강제출고심사완료알림-승인
    public List<BatchFasConfInfoVO> selectFasConfTargetItemList(String flag) throws Exception;

    public boolean updateFasConfTarget(String flag);

}
