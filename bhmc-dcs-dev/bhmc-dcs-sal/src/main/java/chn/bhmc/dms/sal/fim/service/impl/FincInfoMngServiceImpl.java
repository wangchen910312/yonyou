package chn.bhmc.dms.sal.fim.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.fim.service.FincInfoMngService;
import chn.bhmc.dms.sal.fim.service.dao.FincInfoMngDAO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngIFVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;

/**
 * <pre>
 * 금융정보관리 서비스
 * </pre>
 *
 * @ClassName   : FincInfoMngServiceImpl
 * @Description : 금융정보관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("fincInfoMngService")
public class FincInfoMngServiceImpl extends HService implements FincInfoMngService {

    /**
     * 계약 DAO 선언
     */
    @Resource(name="fincInfoMngDAO")
    FincInfoMngDAO fincInfoMngDAO;

    /**
     * 중고차 소매판매 주문번호 생성 id gen
     */
    @Resource(name="salFincMngNoIdgenService")
    TableIdGenService salFincMngNoIdgenService;

    /**
     * 금융서비스 - 계약번호로 금융번호를 조회한다.
     */
    public List<FincInfoMngVO> selectFincNoSearch(FincInfoMngVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincNoSearch(searchVO);
    }

    /**
     * 금융서비스를 저장한다.
     */
    public int insertFincMng(FincInfoMngVO saveVO) throws Exception{

        /**
         * 금융서비스 (키생성)
         * FI + 년 + 14자리seq
         */
        String fincNo = salFincMngNoIdgenService.getNextStringId();
        saveVO.setFincNo(fincNo);

        return fincInfoMngDAO.insertFincMng(saveVO);
    }

    /**
     * 금융서비스 내역을 수정한다.
     */
    public int updateFincMng(FincInfoMngVO saveVO) throws Exception{
        return fincInfoMngDAO.updateFincMng(saveVO);
    }

    /**
     * 금융서비스 내역을 삭제한다.
     */
    public int deleteFincMng(FincInfoMngVO saveVO) throws Exception{
        return fincInfoMngDAO.deleteFincMng(saveVO);
    }

    /**
     * 금융서비스 내역 갯수를 조회한다.
     */
    public int selectFincInfoMngsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincInfoMngsByConditionCnt(searchVO);
    }

    /**
     * 금융서비스 내역을 조회한다.
     */
    public List<FincInfoMngVO> selectFincInfoMngsByCondition(FincInfoMngSearchVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincInfoMngsByCondition(searchVO);
    }

    /**
     * 금융서비스 저장한다.
     */
    public String updateFincInfo(FincInfoMngVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
        fincInfoMngDAO.updateFincInfo(saveVO);
        return saveVO.getFincNo();
    }

    /**
     * 금융견적 팝업 내역 갯수를 조회한다.
     */
    public int selectFincInfoPopupsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincInfoPopupsByConditionCnt(searchVO);
    }

    /**
     * 금융견적 팝업 내역을 조회한다.
     */
    public List<FincInfoMngIFVO> selectFincInfoPopupsByCondition(FincInfoMngSearchVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincInfoPopupsByCondition(searchVO);
    }

    /**
     * CRM : 고객의 금융 정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCustFincInfosByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception{
        return fincInfoMngDAO.selectCustFincInfosByConditionCnt(searchVO);
    }
    public List<FincInfoMngVO> selectCustFincInfosByCondition(FincInfoMngSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return fincInfoMngDAO.selectCustFincInfosByCondition(searchVO);
    }

}
