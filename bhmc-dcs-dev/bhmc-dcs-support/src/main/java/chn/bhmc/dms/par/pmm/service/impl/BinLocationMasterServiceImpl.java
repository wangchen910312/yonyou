package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.dao.BinLocationMasterDAO;
import chn.bhmc.dms.par.pmm.vo.BinLocationItemVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterTreeListVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;

/**
 * 로케이션 마스터 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("binLocationMasterService")
public class BinLocationMasterServiceImpl extends HService implements BinLocationMasterService {

    @Resource(name="binLocationMasterDAO")
    private BinLocationMasterDAO binLocationMasterDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#insertBinLocationMaster(chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO)
     */
    @Override
    public int insertBinLocationMaster(BinLocationMasterVO binLocationMasterVO) {
        binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
        binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
        binLocationMasterVO.setRegUsrId(LoginUtil.getUserId());
        binLocationMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return binLocationMasterDAO.insertBinLocationMaster(binLocationMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#updateBinLocationMaster(chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO)
     */
    @Override
    public int updateBinLocationMaster(BinLocationMasterVO binLocationMasterVO) {
        binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
        binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
        binLocationMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return binLocationMasterDAO.updateBinLocationMaster(binLocationMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#updateBinLocationItemStock(chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO)
     */
    @Override
    public int updateBinLocationItemStock(BinLocationMasterVO binLocationMasterVO) {
        return binLocationMasterDAO.updateBinLocationItemStock(binLocationMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#deleteBinLocationMaster(chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO)
     */
    @Override
    public int deleteBinLocationMaster(BinLocationMasterVO binLocationMasterVO) {
        binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
        binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
        return binLocationMasterDAO.deleteBinLocationMaster(binLocationMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByKey(java.lang.String, java.lang.String)
     */
    @Override
    public BinLocationMasterVO selectBinLocationMasterByKey(String dlrCd, String fullCd) {
        return binLocationMasterDAO.selectBinLocationMasterByKey(dlrCd, fullCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#multiBinLocationMasters(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiBinLocationMasters(BaseSaveVO<BinLocationMasterVO> obj) throws Exception {

        /*
         * 1. 삭제 시 로케이션 마스터 데이타 사용유무 체크.
         * 2. 추가 시 기 로케이션 마스터 데이타 존재유무 체크.
         * 3. 수정 시 기 로케이션 마스터 데이타 존재유무 체크.
         *
         * */

        // 로케이션 마스터 검색 VO
        BinLocationMasterSearchVO searchVO = new BinLocationMasterSearchVO();
        String[] lblList = new String[2];

        // 로케이션 마스터 삭제 데이타
        for(BinLocationMasterVO binLocationMasterVO : obj.getDeleteList()){
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

            searchVO.setsDlrCd(LoginUtil.getDlrCd());       // 딜러코드
            searchVO.setsPltCd(LoginUtil.getPltCd());       // 센터코드

            String sLocCd = "";
            if(binLocationMasterVO.getLocCd().equals("")){
                // LOC CD (상위위치ID+위치ID
                sLocCd = binLocationMasterVO.getUpperLocId() +"-"+ binLocationMasterVO.getLocId();
            }else{
                sLocCd = binLocationMasterVO.getDbLocCd();
            }

            searchVO.setsLocCd(sLocCd);         // 위치코드
            searchVO.setsStrgeCd(binLocationMasterVO.getStrgeCd()); // 창고코드

            // 로케이션 마스터 카운트 조회.
            if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO) > 0){

                BinLocationMasterSearchVO parentSearchVO = new BinLocationMasterSearchVO();

                parentSearchVO.setsDlrCd(LoginUtil.getDlrCd());         // 딜러코드
                parentSearchVO.setsPltCd(LoginUtil.getPltCd());         // 센터코드
                parentSearchVO.setsUpperLocId(searchVO.getsLocCd());    //상위위치코드

                // 하위 항목 존재 유무
                if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(parentSearchVO) == 0){
                    // 삭제
                    binLocationMasterDAO.deleteBinLocationMaster(binLocationMasterVO);
                }else{
                    lblList[0] = messageSource.getMessage("par.lbl.childLocId", null, LocaleContextHolder.getLocale());  // 하위 로케이션
                    throw processException("par.info.itemInsertUseMsg", lblList);
                }
            }
        }

        // 로케이션 마스터 Insert Data
        for(BinLocationMasterVO binLocationMasterVO : obj.getInsertList()){

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

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   //dlrCd
            searchVO.setsLocId(binLocationMasterVO.getLocId());         //locId

            String sLocCd = "";
            if(binLocationMasterVO.getLocCd().equals("")){
                // LOC CD (상위위치ID+위치ID
                if(binLocationMasterVO.getLvlId() == 1 ){
                    sLocCd = binLocationMasterVO.getLocId();
                }
                else{
                    sLocCd = binLocationMasterVO.getUpperLocId() +"-"+ binLocationMasterVO.getLocId();
                }
            }else{
                sLocCd = binLocationMasterVO.getLocCd();
            }

            binLocationMasterVO.setLocCd(sLocCd);
            binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
            binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
            binLocationMasterVO.setRegUsrId(LoginUtil.getUserId());

            // 로케이션 마스터 카운트 조회.
            if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO) == 0){
                binLocationMasterDAO.insertBinLocationMaster(binLocationMasterVO);
            }
            else{
                lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale()); // Location Id
                // Location Code Duplicate
                throw processException("par.info.itemInsertMsg", lblList);
            }
        }

        // 로케이션 마스터 Update Data
        for(BinLocationMasterVO binLocationMasterVO : obj.getUpdateList()){

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
            if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO) == 0){
                if(binLocationMasterVO.getDbYn().equals("N")){
                    // 추가.
                    binLocationMasterDAO.insertBinLocationMaster(binLocationMasterVO);
                }else{

                    // 하위 로케이션 조회.
                    BinLocationMasterSearchVO childBinLocationSearchVO = new BinLocationMasterSearchVO();
                    childBinLocationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    childBinLocationSearchVO.setsNotLvlId(binLocationMasterVO.getLvlId());
                    childBinLocationSearchVO.setsStrgeCd(binLocationMasterVO.getStrgeCd());

                    List<BinLocationMasterVO> childBinLocationMasterList = binLocationMasterDAO.selectBinLocationMasterChildByCondition(childBinLocationSearchVO);

                    for(BinLocationMasterVO childBinLocationMasterVO: childBinLocationMasterList){
                        BinLocationMasterVO saveBinLocationMasterVO = new BinLocationMasterVO();
                        saveBinLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
                        saveBinLocationMasterVO.setUpdtUsrId(LoginUtil.getUserId());

                        String[] strLocCdList =  childBinLocationMasterVO.getLocCd().split("-");
                        // 하위위치코드
                        String saveLocCd = "";

                        for(String strLocCd : strLocCdList){
                            if(binLocationMasterVO.getDbLocId().equals(strLocCd)){
                                saveLocCd += binLocationMasterVO.getLocId() + "-";
                            }else{
                                saveLocCd += strLocCd + "-";
                            }
                        }

                        if(strLocCdList.length > 0){
                            saveLocCd = saveLocCd.substring(0, saveLocCd.length()-1);
                        }

                        String[] strUpperLocIdList =  childBinLocationMasterVO.getUpperLocId().split("-");
                        // 하위상위트리레벨ID
                        String saveUpperLocId = "";
                        for(String strUpperLocId : strUpperLocIdList){

                            if(binLocationMasterVO.getDbLocId().equals(strUpperLocId)){
                                saveUpperLocId += binLocationMasterVO.getLocId() + "-";
                            }else{
                                saveUpperLocId += strUpperLocId + "-";
                            }
                        }

                        if(strUpperLocIdList.length > 0){
                            saveUpperLocId = saveUpperLocId.substring(0, saveUpperLocId.length()-1);
                        }

                        saveBinLocationMasterVO.setLocCd(saveLocCd);
                        saveBinLocationMasterVO.setUpperLocId(saveUpperLocId);
                        saveBinLocationMasterVO.setLocId(childBinLocationMasterVO.getLocId());
                        saveBinLocationMasterVO.setStrgeCd(childBinLocationMasterVO.getStrgeCd());

                        // 하위 로케이션 수정.
                        binLocationMasterDAO.updateBinLocationMasterChild(saveBinLocationMasterVO);
                    }

                    //TODO [심인보] 소속 하위 레벨 locId 수정처리 해야함.
                    // 현 로케이션 수정
                    binLocationMasterDAO.updateBinLocationMaster(binLocationMasterVO);
                }
            }
            else{
                if(binLocationMasterVO.getDbYn().equals("Y")){
                    // 수정.
                    binLocationMasterDAO.updateBinLocationMaster(binLocationMasterVO);
                }else{
                    lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale()); // Location Id
                    // Location Code Duplicate
                    throw processException("par.info.itemInsertMsg", lblList);
                }
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#multiBinLocationMasterItems(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiBinLocationMasterItems(BaseSaveVO<BinLocationMasterVO> obj) throws Exception {

        /*
         * 1. 삭제 시 로케이션 마스터 데이타 사용유무 체크.
         * 2. 추가 시 기 로케이션 마스터 데이타 존재유무 체크.
         * 3. 수정 시 기 로케이션 마스터 데이타 존재유무 체크.
         *
         * */

        // 로케이션 마스터 검색 VO
        BinLocationMasterSearchVO searchVO = new BinLocationMasterSearchVO();
        String[] lblList = new String[2];

        // 로케이션 마스터 삭제 데이타
        for(BinLocationMasterVO binLocationMasterVO : obj.getDeleteList()){
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

            if(binLocationMasterVO.getItemCd().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());  // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());       // 딜러코드
            searchVO.setsPltCd(LoginUtil.getPltCd());       // 센터코드

            String sLocCd = "";
            if(binLocationMasterVO.getLocCd().equals("")){
                // LOC CD (상위위치ID+위치ID
                sLocCd = binLocationMasterVO.getUpperLocId() +"-"+ binLocationMasterVO.getLocId();
            }else{
                sLocCd = binLocationMasterVO.getDbLocCd();
            }

            searchVO.setsLocCd(sLocCd);         // 위치코드
            searchVO.setsStrgeCd(binLocationMasterVO.getStrgeCd()); // 창고코드

            // 로케이션 마스터 카운트 조회.
            if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO) > 0){

                BinLocationMasterSearchVO parentSearchVO = new BinLocationMasterSearchVO();

                parentSearchVO.setsDlrCd(LoginUtil.getDlrCd());         // 딜러코드
                parentSearchVO.setsPltCd(LoginUtil.getPltCd());         // 센터코드
                parentSearchVO.setsUpperLocId(searchVO.getsLocCd());    //상위위치코드

                // 하위 항목 존재 유무
                if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(parentSearchVO) == 0){
                    // 삭제
                    binLocationMasterDAO.deleteBinLocationMaster(binLocationMasterVO);
                }else{
                    lblList[0] = messageSource.getMessage("par.lbl.childLocId", null, LocaleContextHolder.getLocale());  // 하위 로케이션
                    throw processException("par.info.itemInsertUseMsg", lblList);
                }
            }
        }

        // 로케이션 마스터 Insert Data
        for(BinLocationMasterVO binLocationMasterVO : obj.getInsertList()){

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

            if(binLocationMasterVO.getItemCd().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());  // 부품번호
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   //dlrCd
            searchVO.setsLocId(binLocationMasterVO.getLocId());         //locId

            String sLocCd = "";
            if(binLocationMasterVO.getLocCd().equals("")){
                // LOC CD (상위위치ID+위치ID
                if(binLocationMasterVO.getLvlId() == 1 ){
                    sLocCd = binLocationMasterVO.getLocId();
                }
                else{
                    sLocCd = binLocationMasterVO.getUpperLocId() +"-"+ binLocationMasterVO.getLocId();
                }
            }else{
                sLocCd = binLocationMasterVO.getLocCd();
            }

            binLocationMasterVO.setLocCd(sLocCd);
            binLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
            binLocationMasterVO.setPltCd(LoginUtil.getPltCd());
            binLocationMasterVO.setRegUsrId(LoginUtil.getUserId());

            // 로케이션 마스터 카운트 조회.
            if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO) == 0){
                binLocationMasterDAO.insertBinLocationMaster(binLocationMasterVO);
            }
            else{
                lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale()); // Location Id
                // Location Code Duplicate
                throw processException("par.info.itemInsertMsg", lblList);
            }
        }

        // 로케이션 마스터 Update Data
        for(BinLocationMasterVO binLocationMasterVO : obj.getUpdateList()){

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

            if(binLocationMasterVO.getItemCd().equals("")){
                lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());  // 부품번호
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
            if(binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO) == 0){
                if(binLocationMasterVO.getDbYn().equals("N")){
                    // 추가.
                    binLocationMasterDAO.insertBinLocationMaster(binLocationMasterVO);
                }else{

                    // 하위 로케이션 조회.
                    BinLocationMasterSearchVO childBinLocationSearchVO = new BinLocationMasterSearchVO();
                    childBinLocationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    childBinLocationSearchVO.setsNotLvlId(binLocationMasterVO.getLvlId());
                    childBinLocationSearchVO.setsStrgeCd(binLocationMasterVO.getStrgeCd());

                    List<BinLocationMasterVO> childBinLocationMasterList = binLocationMasterDAO.selectBinLocationMasterChildByCondition(childBinLocationSearchVO);

                    for(BinLocationMasterVO childBinLocationMasterVO: childBinLocationMasterList){
                        BinLocationMasterVO saveBinLocationMasterVO = new BinLocationMasterVO();
                        saveBinLocationMasterVO.setDlrCd(LoginUtil.getDlrCd());
                        saveBinLocationMasterVO.setUpdtUsrId(LoginUtil.getUserId());

                        String[] strLocCdList =  childBinLocationMasterVO.getLocCd().split("-");
                        // 하위위치코드
                        String saveLocCd = "";

                        for(String strLocCd : strLocCdList){
                            if(binLocationMasterVO.getDbLocId().equals(strLocCd)){
                                saveLocCd += binLocationMasterVO.getLocId() + "-";
                            }else{
                                saveLocCd += strLocCd + "-";
                            }
                        }

                        if(strLocCdList.length > 0){
                            saveLocCd = saveLocCd.substring(0, saveLocCd.length()-1);
                        }

                        String[] strUpperLocIdList =  childBinLocationMasterVO.getUpperLocId().split("-");
                        // 하위상위트리레벨ID
                        String saveUpperLocId = "";
                        for(String strUpperLocId : strUpperLocIdList){

                            if(binLocationMasterVO.getDbLocId().equals(strUpperLocId)){
                                saveUpperLocId += binLocationMasterVO.getLocId() + "-";
                            }else{
                                saveUpperLocId += strUpperLocId + "-";
                            }
                        }

                        if(strUpperLocIdList.length > 0){
                            saveUpperLocId = saveUpperLocId.substring(0, saveUpperLocId.length()-1);
                        }

                        saveBinLocationMasterVO.setLocCd(saveLocCd);
                        saveBinLocationMasterVO.setUpperLocId(saveUpperLocId);
                        saveBinLocationMasterVO.setLocId(childBinLocationMasterVO.getLocId());
                        saveBinLocationMasterVO.setStrgeCd(childBinLocationMasterVO.getStrgeCd());

                        // 하위 로케이션 수정.
                        binLocationMasterDAO.updateBinLocationMasterChild(saveBinLocationMasterVO);
                    }

                    //TODO [심인보] 소속 하위 레벨 locId 수정처리 해야함.
                    // 현 로케이션 수정
                    binLocationMasterDAO.updateBinLocationMaster(binLocationMasterVO);
                }
            }
            else{
                if(binLocationMasterVO.getDbYn().equals("Y")){
                    // 수정.
                    binLocationMasterDAO.updateBinLocationMaster(binLocationMasterVO);
                }else{
                    lblList[0] = messageSource.getMessage("par.lbl.locId", null, LocaleContextHolder.getLocale()); // Location Id
                    // Location Code Duplicate
                    throw processException("par.info.itemInsertMsg", lblList);
                }
            }
        }

    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByKey(java.lang.String, java.lang.String)
     */
    @Override
    public BinLocationMasterVO selectBinLocationItemInfo(String dlrCd, String pltCd, String strgeCd, String locCd, String itemCd){
        return binLocationMasterDAO.selectBinLocationItemInfo(dlrCd, pltCd, strgeCd, locCd, itemCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterVO> selectBinLocationMastersByCondition(BinLocationMasterSearchVO searchVO) {
        return binLocationMasterDAO.selectBinLocationMasterByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByConditionCnt(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public int selectBinLocationMastersByConditionCnt(BinLocationMasterSearchVO searchVO) {
        return binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationItemsByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationItemVO> selectBinLocationItemsByCondition(BinLocationMasterSearchVO searchVO)
            throws Exception {
        return binLocationMasterDAO.selectBinLocationItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByItemCd(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterVO> selectBinLocationMasterByItemCd(BinLocationMasterSearchVO searchVO)
            throws Exception {
        return binLocationMasterDAO.selectBinLocationMasterByItemCd(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMastersTreeListByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterTreeListVO> selectBinLocationMastersTreeListByCondition(
            BinLocationMasterSearchVO searchVO) throws Exception {
        return binLocationMasterDAO.selectBinLocationMasterTreeListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterComboByLevel(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterVO> selectBinLocationMasterComboByLevel(BinLocationMasterSearchVO searchVO)
            throws Exception {
        // TODO Auto-generated method stub
        return binLocationMasterDAO.selectBinLocationMasterComboByLevel(searchVO);
    }
}
