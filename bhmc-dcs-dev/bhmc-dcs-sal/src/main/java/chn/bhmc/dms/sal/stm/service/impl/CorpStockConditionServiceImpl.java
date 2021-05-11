package chn.bhmc.dms.sal.stm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.stm.service.CorpStockConditionService;
import chn.bhmc.dms.sal.stm.service.dao.CorpStockConditionDAO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CorpStockConditionServiceImpl
 * @Description : 법인재고현황(전략오더)
 * @author
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("corpStockConditionService")
public class CorpStockConditionServiceImpl extends HService implements CorpStockConditionService {

    /**
     * 법인재고현황(전략오더) DAO 선언
     */
    @Resource(name="corpStockConditionDAO")
    CorpStockConditionDAO corpStockConditionDAO;

    /**
     * 법인재고현황(전략오더) 조회
     */
    @Override
    public int selectCorpStockConditionsByConditionCnt(CorpStockConditionSearchVO searchVO) throws Exception{
        return corpStockConditionDAO.selectCorpStockConditionsByConditionCnt(searchVO);
    }
    @Override
    public List<CorpStockConditionVO> selectCorpStockConditionsByCondition(CorpStockConditionSearchVO searchVO) throws Exception{
        return corpStockConditionDAO.selectCorpStockConditionsByCondition(searchVO);
    }

    /**
     * 엑셀업로드한 data로 모델, 지도가격, 배기등급을 불러온다.
     */
    @Override
    public List<CorpStockConditionVO> selectCorpStockConditionModelPrice(List<CorpStockConditionVO> list) throws Exception{
        for(CorpStockConditionVO vo : list){

            if(vo.getCarlineCd() != null && vo.getOcnCd() != null){
                CorpStockConditionVO corpVO = corpStockConditionDAO.selectCorpStockConditionModelPrice(vo).get(0);
                vo.setModelCd(corpVO.getModelCd());
                vo.setOcnCd(corpVO.getOcnCd());
                vo.setExtColorCd(corpVO.getExtColorCd());
                vo.setIntColorCd(corpVO.getIntColorCd());
                vo.setRetlPrc(corpVO.getRetlPrc());
                vo.setDispGradeCd(corpVO.getDispGradeCd());
            }
        }
        return list;
    }


    /**
     * 일괄등록 데이터를 저장 한다.
     * @param list
     * @throws Exception
     */
    @Override
    public void insertCorpStockConditionUpload(List<CorpStockConditionVO> list) throws Exception{
        String userId = LoginUtil.getUserId();

        //삭제후 삽입
        corpStockConditionDAO.deleteCorpStockCondition();

        for(CorpStockConditionVO corpVO : list){
            corpVO.setUpdtUsrId(userId);
            corpVO.setRegUsrId(userId);

            CorpStockConditionSearchVO searchVO = new CorpStockConditionSearchVO();
            searchVO.setsCarlineCd(corpVO.getCarlineCd());
            searchVO.setsModelCd(corpVO.getModelCd());
            searchVO.setsOcnCd(corpVO.getOcnCd());

            corpStockConditionDAO.insertCorpStockCondition(corpVO);

/*            if(corpStockConditionDAO.selectCorpStockConditionsByConditionCnt(searchVO) > 0 ){
                corpStockConditionDAO.updateCorpStockCondition(corpVO);
            }else{
                corpStockConditionDAO.insertCorpStockCondition(corpVO);
            }*/
        }

        // 인터페이스 테이블에 저장하여 DMS로 해당 Data를 보낸다.
        corpStockConditionDAO.callCorpStockConditionSync();
    }

}
