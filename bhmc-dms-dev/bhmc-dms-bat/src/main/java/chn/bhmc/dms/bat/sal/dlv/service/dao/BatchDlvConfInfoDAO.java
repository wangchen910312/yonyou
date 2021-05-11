package chn.bhmc.dms.bat.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.sal.dlv.vo.BatchDlvConfInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchDlvConfInfoDAO
 * @Description : 이월소매취소심사완료알림
 * @author Lee Seungmin
 * @since 2017. 3. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 12.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("batchDlvConfInfoDAO")
public interface BatchDlvConfInfoDAO {

    // 강제출고심사완료알림-승인
    public List<BatchDlvConfInfoVO> selectDlvConfTargetItemList(String flag) throws Exception;

    public boolean updateDlvConfTarget(String flag);

}
