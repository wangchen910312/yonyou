package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.par.pcm.vo.OrdAppealSearchVO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealVO;

public interface OrdAppealService {
	public int insertOrdAppeal(OrdAppealVO ordAppealVO)throws Exception;
	
	public List<OrdAppealVO> selectDealList(OrdAppealSearchVO ordAppealVO)throws Exception;
	public int selectDealListCnt(OrdAppealSearchVO ordAppealVO)throws Exception;
	/**
     * 查询是否可以操作催单
     * @return
     * @throws Exception
     */
    public boolean selectIsRemain(OrdAppealSearchVO ordAppealVO)throws Exception;
    
    public int insertOrdRemind(OrdAppealVO ordAppealVO)throws Exception;

}
