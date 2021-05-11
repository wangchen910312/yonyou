package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.sal.dlv.vo.NewEnVSApplicationVehicleNetworkingSystemVo;
import chn.bhmc.dms.sal.dlv.vo.NewEnerVSApplicationOutOfStockVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationSearchVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationVO;

/**
 * 
 * @ClassName: NewEnergyVSApplicationDAO 
 * @Description: TODO
 * @author:  huyuansen
 * @date: 2019年4月3日 下午2:41:33
 */

@Mapper("newEnergyVSApplicationDAO")
public interface NewEnergyVSApplicationDAO {

   
	public List<NewEnergyVSApplicationVO> selectNewEnergyVSApplicationByCondition(NewEnergyVSApplicationSearchVO searchVO) throws Exception;

	public int selectNewEnergyVSApplicationByConditionCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public void insertNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
	public void updateNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
    public void insertNewEnVSApplicationIs(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
	public void updateNewEnVSApplicationIs(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
	public int checkVinNoIfContainCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public int checkVinNoContInT(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public int checkAppNoContInIS(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public void insertNewEnVSApplicationOutOfStock(NewEnerVSApplicationOutOfStockVO newEnerVSApplicationOutOfStockVO) throws Exception;
	
	public String selectSaleDateFrCarMain(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public void insertNewEnVSApplicationVehicleNetworkingSystem(NewEnVSApplicationVehicleNetworkingSystemVo newEnVSApplicationVehicleNetworkingSystemVo) throws Exception;
	
	public void callIfMergeCommit(String ifId) throws Exception;
}
