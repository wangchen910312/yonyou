package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.dao.BinLocationMasterItemDAO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterItemVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;

/**
 * 로케이션 마스터 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 6. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 6. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("binLocationMasterItemService")
public class BinLocationMasterItemServiceImpl extends HService implements BinLocationMasterItemService {

    @Resource(name="binLocationMasterItemDAO")
    private BinLocationMasterItemDAO binLocationMasterItemDAO;

    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService#multiBinLocationMasterItems(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiBinLocationMasterItems(BaseSaveVO<BinLocationMasterItemVO> obj) throws Exception {

        /*
         * 1. 삭제 시 로케이션 마스터 데이타 사용유무 체크.
         * 2. 추가 시 기 로케이션 마스터 데이타 존재유무 체크.
         * 3. 수정 시 기 로케이션 마스터 데이타 존재유무 체크.
         *
         * */

        // 로케이션 마스터 Update Data
        for(BinLocationMasterItemVO binLocationMasterVO : obj.getUpdateList()){

            binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
            binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
            binLocationMasterVO.setRegUsrId(LoginUtil.getUserId());
            binLocationMasterVO.setUpdtUsrId(LoginUtil.getUserId());

            if(StringUtil.isEmpty(binLocationMasterVO.getLocCd())){
                binLocationMasterVO.setLocCd(" ");
            }

            // 로케이션 마스터 카운트 조회.
            if(binLocationMasterItemDAO.selectBinLocationMasterItemsByKeyCnt(binLocationMasterVO) == 0){
                binLocationMasterItemDAO.insertRealBinLocationMasterItem(binLocationMasterVO);
            }
            else{
                binLocationMasterItemDAO.updateRealBinLocationMasterItem(binLocationMasterVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService#selectBinLocationMasterItemsByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterItemVO> selectBinLocationMasterItemsByCondition(BinLocationMasterSearchVO searchVO)
            throws Exception {
        return binLocationMasterItemDAO.selectBinLocationMasterItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService#selectBinLocationMasterItemsByConditionCnt(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public int selectBinLocationMasterItemsByConditionCnt(BinLocationMasterSearchVO searchVO) throws Exception {
        return binLocationMasterItemDAO.selectBinLocationMasterItemsByConditionCnt(searchVO);
    }


}
