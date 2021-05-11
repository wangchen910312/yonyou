package chn.bhmc.dms.sal.acc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.acc.service.AccessoryMngService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryMngDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngVO;

/**
 * <pre>
 * 경품정보관리 서비스
 * </pre>
 *
 * @ClassName   : AccessoryMngServiceImpl
 * @Description : 경품판매관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("accessoryMngService")
public class AccessoryMngServiceImpl extends HService implements AccessoryMngService {

    /**
     * 경품판매관리 DAO 선언
     */
    @Resource(name="accessoryMngDAO")
    AccessoryMngDAO accessoryMngDAO;

    /**
     * 경품 Key 생성 id gen
     */
    @Resource(name="salAccessoryMngIdgenService")
    TableIdGenService salAccessoryMngIdgenService;

    /**
     * 경품판매관리 내역을 조회한다.
     */
    public int selectAccessoryMngsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngsByConditionCnt(searchVO);
    }
    public List<AccessoryMngVO> selectAccessoryMngsByCondition(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngsByCondition(searchVO);
    }


    /**
     * 경품판매관리 내역을 조회한다.
     */
    public int selectAccessoryMngItemsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngItemsByConditionCnt(searchVO);
    }
    public List<AccessoryMngItemVO> selectAccessoryMngItemsByCondition(AccessoryMngSearchVO searchVO) throws Exception{
        return accessoryMngDAO.selectAccessoryMngItemsByCondition(searchVO);
    }

    /**
     * 경품판매관리 생성/저장 한다.
     */
    public String multiAccessoryMngs(AccessoryMngSaveVO saveVO) throws Exception{
        String goodsContractNo = "";        // 오더번호
        AccessoryMngVO cntVO = saveVO.getGoodsMainVO();
        cntVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        cntVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        if( "".equals(cntVO.getGoodsContractNo() ) ){
            goodsContractNo = salAccessoryMngIdgenService.getNextStringId();
            cntVO.setGoodsContractNo(goodsContractNo);

            //SA_0262T : 경품관리 헤더 저장
            accessoryMngDAO.insertAccessoryMng(cntVO);
        }else{
            goodsContractNo = cntVO.getGoodsContractNo();

            //SA_0262T : 경품관리 헤더 저장
            accessoryMngDAO.updateAccessoryMng(cntVO);
        }

        // SA_0262T : item
        for(AccessoryMngItemVO itemVO : saveVO.getInsertList()){
            itemVO.setDlrCd(LoginUtil.getDlrCd());
            itemVO.setGoodsContractNo(goodsContractNo);
            itemVO.setRegUsrId(LoginUtil.getUserId());
            itemVO.setUpdtUsrId(LoginUtil.getUserId());

            accessoryMngDAO.insertAccessoryMngItem(itemVO);
        }
        for(AccessoryMngItemVO itemVO : saveVO.getUpdateList()){
            itemVO.setRegUsrId(LoginUtil.getUserId());
            itemVO.setUpdtUsrId(LoginUtil.getUserId());
            accessoryMngDAO.updateAccessoryMngItem(itemVO);
        }
        for(AccessoryMngItemVO itemVO : saveVO.getDeleteList()){
            accessoryMngDAO.deleteAccessoryMngItem(itemVO);
        }

        return goodsContractNo;
    }

}
