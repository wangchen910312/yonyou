package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.LocalOptionMappingService;
import chn.bhmc.dms.sal.veh.service.LocalOptionService;
import chn.bhmc.dms.sal.veh.service.dao.LocalOptionDAO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LocalOptionServiceImpl
 * @Description : 로컬옵션
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("localOptionService")
public class LocalOptionServiceImpl extends HService implements LocalOptionService {

    /**
     * 로컬옵션 DAO 선언
     */
    @Resource(name="localOptionDAO")
    LocalOptionDAO localOptionDAO;


    @Resource(name="localOptionMappingService")
    LocalOptionMappingService localOptionMappingService;


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<LocalOptionVO> selectLocalOptionsByCondition(LocalOptionSearchVO searchVO) throws Exception{
        return localOptionDAO.selectLocalOptionsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectLocalOptionsByConditionCnt(LocalOptionSearchVO searchVO) throws Exception{
        return localOptionDAO.selectLocalOptionsByConditionCnt(searchVO);
    }

    @Override
    public void multiLocalOptions(BaseSaveVO<LocalOptionVO> obj) throws Exception{
        LocalOptionSearchVO searchVO = null;

        for(LocalOptionVO LocalVO : obj.getInsertList()){
            LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
            LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            // (sa_0118) 로컬옵션 테이블에 옵션명이 같을 경우에도 입력불가.
            searchVO = new LocalOptionSearchVO();
            searchVO.setDlrCd(LoginUtil.getDlrCd());
            searchVO.setOptionNm(LocalVO.getOptionNm());

            if(localOptionDAO.selectLocalOptionsByConditionCnt(searchVO) > 0){
                throw processException("sal.err.validation");   // msg : 해당내역은 사용중입니다.
            }

            localOptionDAO.insertLocalOptions(LocalVO);
        }

        for(LocalOptionVO LocalVO : obj.getUpdateList()){
            LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
            LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            // (sa_0118) 로컬옵션 테이블에 옵션명이 같을 경우에도 입력불가.
            searchVO = new LocalOptionSearchVO();
            searchVO.setDlrCd(LoginUtil.getDlrCd());
            searchVO.setOptionNm(LocalVO.getOptionNm());
            searchVO.setUpdateIsOptionCd(LocalVO.getOptionCd());

            if(localOptionDAO.selectLocalOptionsByConditionCnt(searchVO) > 0){
                throw processException("sal.err.validation");   // msg : 해당내역은 사용중입니다.
            }

            localOptionDAO.updateLocalOptions(LocalVO);
        }

        for(LocalOptionVO LocalVO : obj.getDeleteList()){
            LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
            LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            // sa_0111T 로컬옵션 맵핑에 데이터가 있을 경우 ProcessException 발생.
            LocalOptionMappingSearchVO mappingSearch = new LocalOptionMappingSearchVO();
            mappingSearch.setDlrCd(LoginUtil.getDlrCd());
            mappingSearch.setDlrCd(LocalVO.getOptionCd());

            if(localOptionMappingService.selectLocalOptionMappingsByConditionCnt(mappingSearch) > 0){
                throw processException("sal.err.validation");   // msg : 해당내역은 사용중입니다.

            }

            localOptionDAO.deleteLocalOptions(LocalVO);
        }
    }

}
