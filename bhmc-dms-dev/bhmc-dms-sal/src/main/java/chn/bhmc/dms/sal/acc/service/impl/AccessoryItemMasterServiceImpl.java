package chn.bhmc.dms.sal.acc.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService;
import chn.bhmc.dms.par.pmm.service.impl.ItemMasterServiceImpl;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterVO;
import chn.bhmc.dms.sal.acc.service.AccessoryItemMasterService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryItemMasterDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemMasterServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("accessoryItemMasterService")
public class AccessoryItemMasterServiceImpl extends ItemMasterServiceImpl implements AccessoryItemMasterService {

    /**
     * 용품마스터 관리 DAO
     */
    @Resource(name="accessoryItemMasterDAO")
    private AccessoryItemMasterDAO accessoryItemMasterDAO;

    @Resource(name="partsVenderSalPriceMasterService")
    private PartsVenderSalPriceMasterService partsVenderSalPriceMasterService;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertAccessoryItemMaster(AccessoryItemMasterVO accessoryItemMasterVO) throws Exception {
        int result = 0;

        PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterVO = new PartsVenderSalPriceTargetMasterVO();
        partsVenderSalPriceTargetMasterVO.setDlrCd(accessoryItemMasterVO.getDlrCd());
        partsVenderSalPriceTargetMasterVO.setItemCd(accessoryItemMasterVO.getItemCd());
        partsVenderSalPriceTargetMasterVO.setPrcTp("01");
        partsVenderSalPriceTargetMasterVO.setLineNo(1);
        partsVenderSalPriceTargetMasterVO.setApplyYn("Y");
//        partsVenderSalPriceTargetMasterVO.setSalePrcAmt(accessoryItemMasterVO.getSalePrcAmt());
        partsVenderSalPriceTargetMasterVO.setPrcQty(1);
        partsVenderSalPriceTargetMasterVO.setPrcQtyUnitCd("EA");
        partsVenderSalPriceTargetMasterVO.setStartDt(new Date());
        partsVenderSalPriceTargetMasterVO.setEndDt(DateUtil.convertToDate("9999-12-31", "yyyy-MM-dd"));
        partsVenderSalPriceTargetMasterVO.setDelYn("N");
        partsVenderSalPriceTargetMasterVO.setRegUsrId(accessoryItemMasterVO.getRegUsrId());
        partsVenderSalPriceTargetMasterVO.setRetlPrc(accessoryItemMasterVO.getRetlPrc());
        partsVenderSalPriceTargetMasterVO.setStrgeCd(accessoryItemMasterVO.getGrStrgeCd());
//        partsVenderSalPriceTargetMasterVO.setTaxDdctRetlPrc(accessoryItemMasterVO.getTaxDdctRetlPrc());
//        partsVenderSalPriceTargetMasterVO.setRetlAddTaxRate(accessoryItemMasterVO.getRetlAddTaxRate());

        //용품가격 입력
        partsVenderSalPriceMasterService.insertPartsVenderSalPriceTargetMaster(partsVenderSalPriceTargetMasterVO);

        //용품마스터 입력
        result = super.insertItemMaster(accessoryItemMasterVO);

        return result;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateAccessoryItemMaster(AccessoryItemMasterVO accessoryItemMasterVO) throws Exception {
        int result = 0;

        PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterVO = new PartsVenderSalPriceTargetMasterVO();
        partsVenderSalPriceTargetMasterVO.setDlrCd(accessoryItemMasterVO.getDlrCd());
        partsVenderSalPriceTargetMasterVO.setItemCd(accessoryItemMasterVO.getItemCd());
        partsVenderSalPriceTargetMasterVO.setPrcTp("01");
        partsVenderSalPriceTargetMasterVO.setLineNo(1);
        partsVenderSalPriceTargetMasterVO.setApplyYn("Y");
//        partsVenderSalPriceTargetMasterVO.setSalePrcAmt(accessoryItemMasterVO.getSalePrcAmt());
        partsVenderSalPriceTargetMasterVO.setPrcQty(1);
        partsVenderSalPriceTargetMasterVO.setPrcQtyUnitCd(accessoryItemMasterVO.getStockUnitCd());
        partsVenderSalPriceTargetMasterVO.setStartDt(new Date());
        partsVenderSalPriceTargetMasterVO.setEndDt(DateUtil.convertToDate("9999-12-31", "yyyy-MM-dd"));
        partsVenderSalPriceTargetMasterVO.setDelYn("N");
        partsVenderSalPriceTargetMasterVO.setRegUsrId(accessoryItemMasterVO.getRegUsrId());
        partsVenderSalPriceTargetMasterVO.setRetlPrc(accessoryItemMasterVO.getRetlPrc());
        partsVenderSalPriceTargetMasterVO.setStrgeCd(accessoryItemMasterVO.getGrStrgeCd()); //가격창고
//        partsVenderSalPriceTargetMasterVO.setTaxDdctRetlPrc(accessoryItemMasterVO.getTaxDdctRetlPrc());
//        partsVenderSalPriceTargetMasterVO.setRetlAddTaxRate(accessoryItemMasterVO.getRetlAddTaxRate());

        //용품가격 수정
        partsVenderSalPriceMasterService.updatePartsVenderSalPriceTargetMaster(partsVenderSalPriceTargetMasterVO);

        //용품마스터 수정
        //accessoryItemMasterVO.setItemDstinCd(accessoryItemMasterVO.getItemDstinCd());
        result = super.updateItemMaster(accessoryItemMasterVO);

        return result;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public AccessoryItemMasterVO selectAccessoryItemMasterByKey(String dlrCd, String itemCd)
            throws Exception {
        return accessoryItemMasterDAO.selectAccessoryItemMasterByKey(dlrCd, itemCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemMasterVO> selectAccessoryItemMastersByCondition(AccessoryItemMasterSearchVO searchVO)
            throws Exception {
        return accessoryItemMasterDAO.selectAccessoryItemMastersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemMastersByConditionCnt(AccessoryItemMasterSearchVO searchVO) throws Exception {
        return accessoryItemMasterDAO.selectAccessoryItemMastersByConditionCnt(searchVO);
    }

    @Override
    public String selectVATSearch(String sApplyDate, String sTypeCd) throws Exception{
        return accessoryItemMasterDAO.selectVATSearch(sApplyDate, sTypeCd);
    }
}
