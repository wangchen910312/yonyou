package chn.bhmc.dms.sal.lom.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.sal.lom.vo.NewEnergyVSApplicationSearchVO;
import chn.bhmc.dms.sal.lom.vo.NewEnergyVSApplicationVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVO;

/**
 * 
 * @ClassName: NewEnergyVSApplicationDAO 
 * @Description: TODO
 * @author:  huyuansen
 * @date: 2019年4月3日 下午2:41:33
 */

@Mapper("newEnergyVSApplicationDAO")
public interface NewEnergyVSApplicationDAO {

    /**
     * 조회 조건에 해당하는 이월판매취소결과조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CancDeliverySearchVO
     * @return 조회 목록
     */
	public List<NewEnergyVSApplicationVO> selectNewEnergyVSApplicationByCondition(NewEnergyVSApplicationSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 이월판매취소결과조회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CancDeliveryVO
     * @return
     */
	public int selectNewEnergyVSApplicationByConditionCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception;
	
	public void insertNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
	public void updateNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
    public void insertNewEnVSApplicationIs(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;
	
	public void updateNewEnVSApplicationIs(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception;

}
