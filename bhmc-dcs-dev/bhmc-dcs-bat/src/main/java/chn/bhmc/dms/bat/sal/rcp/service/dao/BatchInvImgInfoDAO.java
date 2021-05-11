package chn.bhmc.dms.bat.sal.rcp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchInvImgInfoVo;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchInvImgOutInfoVo;

@Mapper("batchInvImgInfoDAO")
public interface BatchInvImgInfoDAO {

	/**
	 * 查询发票图片
	 * @return
	 * @throws Exception
	 */
	public List<BatchInvImgInfoVo> selectBatchInvBlobInfo()  throws Exception;

	/**
	 * 修改发票图片状态
	 * @param batchInvImgOutInfoVo
	 * @throws Exception
	 */
	public void updateBatchInvBlobInfo(BatchInvImgOutInfoVo batchInvImgOutInfoVo) throws Exception;

	

}
