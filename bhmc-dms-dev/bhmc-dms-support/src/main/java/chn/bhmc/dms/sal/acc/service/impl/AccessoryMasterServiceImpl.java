package chn.bhmc.dms.sal.acc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.acc.service.AccessoryMasterService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryMasterDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMasterVO;

/**
 * 용품 마스터
 *
 * @author HG Lee
 * @since 2017. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.18           HG Lee            최초 생성
 * </pre>
 */

@Service("accessoryMasterService")
public class AccessoryMasterServiceImpl extends HService implements AccessoryMasterService {

    /**
     * 용품마스터 DAO 선언
     */
    @Resource(name="accessoryMasterDAO")
    AccessoryMasterDAO accessoryMasterDAO;

    @Override
    public List<AccessoryMasterVO> selectAccessoryMasterList(AccessoryMasterVO searchVO) throws Exception{
        return accessoryMasterDAO.selectAccessoryMasterList(searchVO);
    }

    @Override
    public List<AccessoryMasterVO> selectAccessoryMasterLineList(AccessoryMasterVO searchVO) throws Exception{
        return accessoryMasterDAO.selectAccessoryMasterLineList(searchVO);
    }

}
