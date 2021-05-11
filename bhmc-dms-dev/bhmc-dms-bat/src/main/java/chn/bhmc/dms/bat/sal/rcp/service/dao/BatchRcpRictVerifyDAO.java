package chn.bhmc.dms.bat.sal.rcp.service.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchRcpReceiptVO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchRcpRictVerifyVO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchVehicleMasterVO;

/**
 * <p>Title: 机动车发票定时调用集中式接口验证真伪</p>
 * @author Gongrs 2021年3月30日 下午5:10:53
 */
@Mapper("batchRcpRictVerifyDAO")
public interface BatchRcpRictVerifyDAO {
    
    /**
     * <p>Title: 根据发票号码和发票代码查询机动车统一发票</p>
     * @author Gongrs 2021年4月2日 下午5:00:57
     * @param 发票号码/发票代码
     */
    public List<BatchRcpReceiptVO> selectReceipts(Map<String, Object> param) throws Exception;
    
    /**
     * <p>Title: 批量新增机动车发票数据(SA_0501T)</p>
     * @author Gongrs 2021年4月1日 下午8:02:03
     * @param data:机动车发票VO
     */
    public void insertRcpReceipts(List<BatchRcpReceiptVO> list) throws Exception;
    
    /**
     * <p>Title: 查询开票日期非当前日期，验证状态为待验证的机动车发票数据</p>
     * @author Gongrs 2021年4月1日 下午8:02:07
     * @param currentYMD:当前年月日
     */
    public List<BatchRcpRictVerifyVO> selectVerifyList(String currentYMD) throws Exception;
	
    /**
     * <p>Title: 批量更新APP扫码发票验证状态(SA_0510T)</p>
     * @author Gongrs 2021年4月1日 下午8:02:12
     * @param data:发票上传信息
     */
    public void updateRcpAppReceiptVerifys(List<BatchRcpRictVerifyVO> data) throws Exception;
    
    /**
     * <p>Title: 批量更新机动车统一发票验证状态(SA_0501T)</p>
     * @author Gongrs 2021年4月2日 下午5:52:18
     * @param 
     * @return
     */
    public void updateRcpReceiptVerifys(List<BatchRcpReceiptVO> data) throws Exception;
    
    /**
     * <p>Title: 更新车辆绑定发票标识</p>
     * @author Gongrs 2021年4月12日 下午5:39:54
     * @param vinNo：车辆VIN码；bindingReceiptFlag：绑定发票标识(01.未绑定、02.机动车发票、03.增值税发票)
     */
    public int updateCarAfterVerify(BatchVehicleMasterVO vo) throws Exception;
    
    /**
     * <p>Title: 根据carId查询车辆信息</p>
     * @author Gongrs 2021年4月13日 下午5:18:27
     * @param carId:车辆主键
     * @return
     */
    public BatchVehicleMasterVO selectCarInfoByCarId(String carId);

}