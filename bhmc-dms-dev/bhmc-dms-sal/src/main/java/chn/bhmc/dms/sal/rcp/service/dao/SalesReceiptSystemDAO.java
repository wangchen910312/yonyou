package chn.bhmc.dms.sal.rcp.service.dao;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.sal.rcp.vo.SalesReceiptSystemVO;

/**
 * <p>Title: 发票管理 -> 经销商上线发票系统</p>
 * @author Gongrs 2021年4月29日 下午2:26:09
 * @param 
 * @return
 */
@Mapper("SalesReceiptSystemDAO")
public interface SalesReceiptSystemDAO {

    /**
     * <p>Title: 查询经销商上线发票系统标识</p>
     * @author Gongrs 2021年4月29日 下午2:27:14
     * @param dlrCd : 经销商代码
     * @return SalesVhclCbinRcitAppScanSaveVO
     */
    public SalesReceiptSystemVO selectSalesReceiptSystemData(String dlrCd) throws Exception;
}
