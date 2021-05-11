package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.par.pcm.vo.OrdAppealSearchVO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealVO;
/**
 * 申诉信息
 * @author lxy
 *
 */
@Mapper("ordAppealDAO")
public interface OrdAppealDAO {
	/**
	 * 插入申诉
	 * @param ordAppealVO
	 * @return
	 */
	public int insertOrdAppeal(OrdAppealVO ordAppealVO);
	public List<OrdAppealVO> selectDealList(OrdAppealSearchVO ordAppealVO);
	public int selectDealListCnt(OrdAppealSearchVO ordAppealVO);
	
	public int updateOrdAppeal(OrdAppealVO ordAppealVO);
	/**
	 * 根据条件查询数量
	 * @param ordAppealVO
	 * @return
	 */
	public int selectAppealCnt(OrdAppealVO ordAppealVO);
	/**
	 * 根据条件查询列表
	 * @param ordAppealVO
	 * @return
	 */
	public List<OrdAppealVO> selectAppealByCondition(OrdAppealSearchVO ordAppealVO);
	
	/**
	 *  依据配件且未关闭状态的问题修改为已处理状态
	 * @param partNo
	 * @return
	 */
	public int updateAppealByPartNo(@Param(value ="partNo")String partNo);
}
