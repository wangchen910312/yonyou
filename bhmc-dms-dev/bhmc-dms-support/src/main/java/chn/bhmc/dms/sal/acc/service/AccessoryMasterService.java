package chn.bhmc.dms.sal.acc.service;

import java.util.List;

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

public interface AccessoryMasterService {

    public List<AccessoryMasterVO> selectAccessoryMasterList(AccessoryMasterVO searchVO) throws Exception;

    public List<AccessoryMasterVO> selectAccessoryMasterLineList(AccessoryMasterVO searchVO) throws Exception;

}
