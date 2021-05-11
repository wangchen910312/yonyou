package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;;

/**
 * 이월판매취소결과조회 서비스
 *
 * @author Kim yewon
 * @since 2016. 5. 20.
 * @version 1.0
 
 */

public interface ChargingPileService {

	int selectChargingPileTotal(ChargingPileVO chargingPileVO);

	List<ChargingPileVO> selectChargingPileList(ChargingPileVO chargingPileVO);
	//2019/06/14 qiandelai 修复充电桩发送数据  start
	void updateChargingPile(ChargingPileVO chargingPileVO) throws Exception;
	//2019/06/14 qiandelai 修复充电桩发送数据  end
	void updateStateByVin(ChargingPileVO chargingPileVO);
	//CRS NO 35 申请充电桩时，判断新能源车是不是试乘试驾车，如果试乘试驾车，就无法申请充电桩 试乘试架车不能进行提报 贾明 2019-12-3 
	public ChargingPileVO  selectTescDriveVino(ChargingPileVO chargingPileVO) throws Exception;

}
