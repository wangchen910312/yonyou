package chn.bhmc.dms.bat.sal.usc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.sal.usc.vo.BatchSalesPurcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesUsedVehiclePurcServiceDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("batchSalesPurcDAO")
public interface BatchSalesPurcDAO {

    public List<BatchSalesPurcVO> selectUscTargetItemList() throws Exception;
    /**
     * 生成二手车收购信息接口数据
     * @throws Exception
     */
    public void insertPurcInterfaceData()throws Exception;
}
