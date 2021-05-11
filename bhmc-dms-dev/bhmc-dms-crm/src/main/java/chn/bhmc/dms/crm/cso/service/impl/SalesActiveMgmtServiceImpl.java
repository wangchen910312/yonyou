package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesActiveMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveVO;

/**
 * 영업활동 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.04.27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.27         in moon lee            최초 생성
 * </pre>
 */

@Service("salesActiveMgmtService")
public class SalesActiveMgmtServiceImpl extends HService implements SalesActiveMgmtService {

    /**
     * 영업활동 관리 DAO
     */
	@Resource(name="salesActiveMgmtDAO")
	SalesActiveMgmtDAO salesActiveMgmtDAO;

	/**
	 * 시승 관리 DAO
	 */
	@Resource(name="testDriveMgmtService")
	TestDriveMgmtService testDriveMgmtService;

    /**
     * 영업활동 관리 목록 수량 조회
     * @param SalesActiveSearchVO - 판매고문, 고객명, 영업활동유형코드
     */
    @Override
    public int selectSalesActiveMgmtsByConditionCnt(SalesActiveSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesActiveMgmtDAO.selectSalesActiveMgmtsByConditionCnt(searchVO);
    }

    /**
     * 영업활동 관리 목록 조회
     * @param SalesActiveSearchVO - 판매고문, 고객명, 영업활동유형코드
     */
    @Override
    public List<SalesActiveVO> selectSalesActiveMgmtsByCondition(SalesActiveSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesActiveMgmtDAO.selectSalesActiveMgmtsByCondition(searchVO);
    }


    /**
     * 영업활동 관리 상세 조회
     * @param SalesActiveSearchVO - 영업활동번호
     */
    @Override
    public SalesActiveVO selectSalesActiveMgmtByKey(SalesActiveSearchVO searchVO) {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesActiveMgmtDAO.selectSalesActiveMgmtByKey(searchVO);
    }

	/**
	 * 영업활동 관리 저장
	 * @param SalesActiveVO - 영업활동 정보
	 */
    //@Override
    public String multiSalesActiveMgmts(SalesActiveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        saveVO.setDlrCd(dlrCd);
        saveVO.setRegUsrId(userId);
        saveVO.setUpdtUsrId(userId);

        int resultCnt = 0;
        String saleActiveNo = saveVO.getSalesActiveNo();

        // 영업활동 관리 저장
        if(StringUtils.isNotEmpty(saleActiveNo)){
            resultCnt = updateSalesActiveMgmt(saveVO);
        } else {
            resultCnt = insertSalesActiveMgmt(saveVO);
            saleActiveNo = saveVO.getSalesActiveNo();        // selectKey 로 seq 받아온다
        }

        if(resultCnt < 1){
            // 영업활동 관리 등록 실패되었습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.lbl.visitInfo", null, LocaleContextHolder.getLocale())});
        }

        return saleActiveNo;
    }

    /**
     * 영업활동 관리 등록
     * @param SalesActiveVO - 영업활동 정보
     */
    //@Override
    public int insertSalesActiveMgmt(SalesActiveVO salesActiveVO) throws Exception {
        return salesActiveMgmtDAO.insertSalesActiveMgmt(salesActiveVO);
    }

    /**
     * 영업활동 관리 수정
     * @param SalesActiveVO - 영업활동 정보
     */
    //@Override
    public int updateSalesActiveMgmt(SalesActiveVO salesActiveVO) throws Exception {
        return salesActiveMgmtDAO.updateSalesActiveMgmt(salesActiveVO);
    }

    /**
     * 영업활동스케줄 목록(내방/시승/활동)
     * @param
     */
    @Override
    public SearchResult selectSalesTotalActiveCalendars(SalesActiveSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        return result;
    }


}
