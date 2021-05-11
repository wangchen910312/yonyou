package chn.bhmc.dms.sal.acc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.acc.vo.AccessoryMasterVO;

@Mapper("accessoryMasterDAO")
public interface AccessoryMasterDAO {

    public List<AccessoryMasterVO> selectAccessoryMasterList(AccessoryMasterVO searchVO) throws Exception;

    public List<AccessoryMasterVO> selectAccessoryMasterLineList(AccessoryMasterVO searchVO) throws Exception;

}