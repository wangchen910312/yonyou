package chn.bhmc.dms.sal.inv.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inv.service.InventoryDueDiligenceService;
import chn.bhmc.dms.sal.inv.service.dao.InventoryDueDiligenceDAO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceSaveVO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceSearchVO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InventoryDueDiligenceServiceServiceImpl
 * @Description : 재고실사
 * @author : Bong
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.14         Bong                 최초 생성
 * </pre>
 */

@Service("inventoryDueDiligenceService")
public class InventoryDueDiligenceServiceImpl extends HService implements InventoryDueDiligenceService {

    /**
     * 재고실사 DAO 선언
     */
    @Resource(name="inventoryDueDiligenceDAO")
    InventoryDueDiligenceDAO inventoryDueDiligenceDAO;


    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InventoryDueDiligenceSearchVO
     * @return
     */
    @Override
    public int selectInventoryDueDiligenceByConditionCnt(InventoryDueDiligenceSearchVO searchVO) throws Exception{
        return inventoryDueDiligenceDAO.selectInventoryDueDiligenceByConditionCnt(searchVO);
    }
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InventoryDueDiligenceSearchVO
     * @return 조회 목록
     */
    @Override
    public List<InventoryDueDiligenceVO> selectInventoryDueDiligenceByCondition(InventoryDueDiligenceSearchVO searchVO) throws Exception{
        return inventoryDueDiligenceDAO.selectInventoryDueDiligenceByCondition(searchVO);
    }

    /**
     * 재무실사 확인여부/사진파일 저장
     */
    @Override
    public int updateInventoryDueDiligence(InventoryDueDiligenceVO saveVO) throws Exception{

        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        inventoryDueDiligenceDAO.updateInventoryDueDiligence(saveVO);

        return 1;
    }



    /**
     * 재고실사 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     */
    @Override
    public List<InventoryDueDiligenceVO> retVehicleInfo(InventoryDueDiligenceSaveVO obj) throws Exception {


        List<String> barcodeList = new ArrayList<String>();

        for(InventoryDueDiligenceVO inventoryDueDiligenceVO : obj.getInsertList()){
            String barcode = inventoryDueDiligenceVO.getBarcodeNo();
            barcodeList.add(barcode);
        }

        InventoryDueDiligenceSearchVO searchVO = new InventoryDueDiligenceSearchVO();
        searchVO.setBarcodeList(barcodeList);

        List<InventoryDueDiligenceVO> retObj = inventoryDueDiligenceDAO.retVehicleInfo(searchVO);

        return retObj;
    }


}
