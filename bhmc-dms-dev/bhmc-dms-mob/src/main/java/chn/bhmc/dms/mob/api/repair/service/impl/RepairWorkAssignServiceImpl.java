package chn.bhmc.dms.mob.api.repair.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairWorkAssignDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairWorkAssignService;
import chn.bhmc.dms.mob.api.repair.vo.WorkAssignSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.WorkAssignVO;


@Service("RepairWorkAssignService")
public class RepairWorkAssignServiceImpl extends HService implements RepairWorkAssignService {

    /**
    * 작업배정 DAO
    */
   @Resource(name="RepairWorkAssignDAO")
   RepairWorkAssignDAO RepairWorkAssignDAO;

   @Override
   public List<WorkAssignVO> selectWorkAssignByCondition(WorkAssignSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       return RepairWorkAssignDAO.selectWorkAssignByCondition(searchVO);
   }

  
   @Override
   public int selectWorkAssignByConditionCnt(WorkAssignSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       return RepairWorkAssignDAO.selectWorkAssignByConditionCnt(searchVO);
   }

}
