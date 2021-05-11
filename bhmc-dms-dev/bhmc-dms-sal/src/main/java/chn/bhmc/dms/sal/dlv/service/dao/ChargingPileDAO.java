package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlv.vo.CancDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.CancDeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 20
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("chargingPileDAO")
public interface ChargingPileDAO {

	public List<ChargingPileVO> selectChargingPileList(ChargingPileVO chargingPileVO);

	public int selectChargingPileTotal(ChargingPileVO chargingPileVO);

	public void updateChargingPile(ChargingPileVO chargingPileVO);

	public void insertChargingIs(ChargingPileVO chargingPileVO);

	public ChargingPileVO selectChargingPile(ChargingPileVO chargingPileVO);

	public void updateStateByVin(ChargingPileVO chargingPileVO);
	//CRS NO 35 申请充电桩时，判断新能源车是不是试乘试驾车，如果试乘试驾车，就无法申请充电桩 试乘试架车不能进行提报 贾明 2019-12-3 
    public ChargingPileVO  selectTescDriveVino(ChargingPileVO chargingPileVO) throws Exception;

}
