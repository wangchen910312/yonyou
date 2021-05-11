package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.NewEnVSApplicationVehicleNetworkingSystemVo;
import chn.bhmc.dms.sal.dlv.vo.NewEnerVSApplicationOutOfStockVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationSearchVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationVO;

/**
 * 
 * @ClassName: NewEnergyVSApplicationService 
 * @Description: TODO
 * @author: huyuansen
 * @date: 2019年4月3日 下午2:02:16
 */

public interface NewEnergyVSApplicationService {


	
	public List<NewEnergyVSApplicationVO> selectNewEnergyVSApplicationByCondition(NewEnergyVSApplicationSearchVO searchVO) throws Exception;

	public int selectNewEnergyVSApplicationByConditionCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception;

	public void insertNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
	public void updateNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
	public void updateNewEnVSApplicationTc(String vinNo) throws Exception;
	
	public int checkVinNoIfContainCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public int checkVinNoContInT(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public int checkAppNoContInIS(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public void insertNewEnVSApplicationOutOfStock(NewEnerVSApplicationOutOfStockVO newEnerVSApplicationOutOfStockVO) throws Exception;
	
	public String selectSaleDateFrCarMain(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public void insertNewEnVSApplicationVehicleNetworkingSystem(NewEnVSApplicationVehicleNetworkingSystemVo newEnVSApplicationVehicleNetworkingSystemVo) throws Exception;
}
