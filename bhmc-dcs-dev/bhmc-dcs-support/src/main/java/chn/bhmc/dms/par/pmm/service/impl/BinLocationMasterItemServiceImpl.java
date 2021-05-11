package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
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

        // 로케이션 마스터 검색 VO
        BinLocationMasterSearchVO searchVO = new BinLocationMasterSearchVO();
        String[] lblList = new String[2];

        // 로케이션 마스터 Update Data
        for(BinLocationMasterItemVO binLocationMasterVO : obj.getInsertList()){

            // 로케이션 레벨 유효성 체크.
            if(binLocationMasterVO.getLvlId() <= 0){
                lblList[0] = messageSource.getMessage("par.lbl.lvlId", null, LocaleContextHolder.getLocale());  // 레벨
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(binLocationMasterVO.getLocId().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale());  // 로케이션

                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(binLocationMasterVO.getLocNm().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.locNm", null, LocaleContextHolder.getLocale());  // 로케이션명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            String sLocCd = "";
            String sParLocCd = "";
            if(binLocationMasterVO.getLocCd().equals("")){
                // LOC CD (상위위치ID+위치ID
                if(binLocationMasterVO.getLvlId() == 1 ){
                    sLocCd = binLocationMasterVO.getLocId();
                }
                else{
                    sLocCd = binLocationMasterVO.getUpperLocId() +"-"+ binLocationMasterVO.getLocId();
                }
            }else{
                if(binLocationMasterVO.getLvlId() == 1 ){
                    sLocCd = binLocationMasterVO.getLocId();
                }else{

                    String[] strParLocCdList =  binLocationMasterVO.getLocCd().split("-");

                    for(String strParLocCd : strParLocCdList){
                        if(binLocationMasterVO.getDbLocId().equals(strParLocCd)){
                            sParLocCd += binLocationMasterVO.getLocId() + "-";
                        }else{
                            sParLocCd += strParLocCd + "-";
                        }
                    }

                    if(strParLocCdList.length > 0){
                        sParLocCd = sParLocCd.substring(0, sParLocCd.length()-1);
                    }

                    sLocCd = sParLocCd;
                }
            }

            binLocationMasterVO.setLocCd(sLocCd);
            binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
            binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
            binLocationMasterVO.setRegUsrId(LoginUtil.getUserId());
            binLocationMasterVO.setUpdtUsrId(LoginUtil.getUserId());

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   //dlrCd
            searchVO.setsLocId(binLocationMasterVO.getLocId());         //locId

            // 로케이션 마스터 카운트 조회.
            if(binLocationMasterItemDAO.selectBinLocationMasterItemsByConditionCnt(searchVO) == 0){

                if(binLocationMasterVO.getDbLocId().equals("")){
                    // 추가.
                    binLocationMasterItemDAO.insertBinLocationMasterItem(binLocationMasterVO);
                }else{
                    // 수정.
                    binLocationMasterItemDAO.updateBinLocationMasterItem(binLocationMasterVO);
                }
            }
            else{

                // 기존 LocID 와 변경 LocID가 같을 때
                if(binLocationMasterVO.getDbLocId().equals(binLocationMasterVO.getLocId())){
                    // 수정.
                    binLocationMasterItemDAO.updateBinLocationMasterItem(binLocationMasterVO);
                }else{
                    lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale()); // Location Id
                    // Location Code Duplicate
                    throw processException("par.info.itemInsertMsg", lblList);
                }
            }
        }

        // 로케이션 마스터 Update Data
        for(BinLocationMasterItemVO binLocationMasterVO : obj.getUpdateList()){

            // 로케이션 레벨 유효성 체크.
            if(binLocationMasterVO.getLvlId() <= 0){
                lblList[0] = messageSource.getMessage("par.lbl.lvlId", null, LocaleContextHolder.getLocale());  // 레벨
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(binLocationMasterVO.getLocId().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale());  // 로케이션

                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(binLocationMasterVO.getLocNm().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.locNm", null, LocaleContextHolder.getLocale());  // 로케이션명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            String sLocCd = "";
            String sParLocCd = "";
            if(binLocationMasterVO.getLocCd().equals("")){
                // LOC CD (상위위치ID+위치ID
                if(binLocationMasterVO.getLvlId() == 1 ){
                    sLocCd = binLocationMasterVO.getLocId();
                }
                else{
                    sLocCd = binLocationMasterVO.getUpperLocId() +"-"+ binLocationMasterVO.getLocId();
                }
            }else{
                if(binLocationMasterVO.getLvlId() == 1 ){
                    sLocCd = binLocationMasterVO.getLocId();
                }else{

                    String[] strParLocCdList =  binLocationMasterVO.getLocCd().split("-");

                    for(String strParLocCd : strParLocCdList){
                        if(binLocationMasterVO.getDbLocId().equals(strParLocCd)){
                            sParLocCd += binLocationMasterVO.getLocId() + "-";
                        }else{
                            sParLocCd += strParLocCd + "-";
                        }
                    }

                    if(strParLocCdList.length > 0){
                        sParLocCd = sParLocCd.substring(0, sParLocCd.length()-1);
                    }

                    sLocCd = sParLocCd;
                }
            }

            binLocationMasterVO.setLocCd(sLocCd);
            binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
            binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
            binLocationMasterVO.setRegUsrId(LoginUtil.getUserId());
            binLocationMasterVO.setUpdtUsrId(LoginUtil.getUserId());

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   //dlrCd
            searchVO.setsLocId(binLocationMasterVO.getLocId());         //locId

            // 로케이션 마스터 카운트 조회.
            if(binLocationMasterItemDAO.selectBinLocationMasterItemsByConditionCnt(searchVO) == 0){

                if(binLocationMasterVO.getDbLocId().equals("")){
                    // 추가.
                    binLocationMasterItemDAO.insertBinLocationMasterItem(binLocationMasterVO);
                }else{
                    // 수정.
                    binLocationMasterItemDAO.updateBinLocationMasterItem(binLocationMasterVO);
                }
            }
            else{

                // 기존 LocID 와 변경 LocID가 같을 때
                if(binLocationMasterVO.getDbLocId().equals(binLocationMasterVO.getLocId())){
                    // 수정.
                    binLocationMasterItemDAO.updateBinLocationMasterItem(binLocationMasterVO);
                }else{
                    lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale()); // Location Id
                    // Location Code Duplicate
                    throw processException("par.info.itemInsertMsg", lblList);
                }
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
