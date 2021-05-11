package chn.bhmc.dms.par.pcm.service.dao;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.par.pcm.vo.OrdReplyVO;

/**
 * 待货升级回复
 * @author liuxueying
 *
 */
@Mapper("ordReplyDAO")
public interface OrdReplyDAO {
	public int insertOrdReply(OrdReplyVO ordReplyVO);
	
	public int insertOrdReplys(OrdReplyVO ordReplyVO);
	
	public OrdReplyVO selectAutoReply(String partNo);
	
}
