package chn.bhmc.dms.sal.com.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.sal.com.vo.CommercialInsuranceVO;

@Mapper("commercialInsuranceDAO")
public interface CommercialInsuranceDAO {

	public List<CommercialInsuranceVO> selectInfoByLicenseNo(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
	
	public List<CommercialInsuranceVO> selectTypeByLicenseNo(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
	
	/**
     * 根据车牌号查询数量
     * @param commercialInsuranceVO 
     * @return
     */
    public int selectcontByCarNo(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
    
    public int deleteIns(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
    
    public int insertInsInfo(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
    
    public List<CommercialInsuranceVO> selectInfoByParams(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
    
	//20190827 修改续保历史表数据 为最新更新日期。
    public int updateData(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
}
