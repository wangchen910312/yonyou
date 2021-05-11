package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.service.dao.RateManageDAO;
import chn.bhmc.dms.ser.svi.vo.RateManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageVO;

/**
 * <pre>
 * 임률관리 구현 서비스
 * </pre>
 *
 * @ClassName   : RateManageServiceImpl.java
 * @Description : 임률관리 ServiceImpl
 * @author Kwon Ki Hyun
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.   Kwon Ki Hyun      최초 생성
 * </pre>
 */

@Service("rateManageService")
public class RateManageServiceImpl extends HService implements RateManageService {

    /**
    * 임률관리 DAO
    */
   @Resource(name="rateManageDAO")
   RateManageDAO rateManageDAO;

    /**
    * 임률관리 SEQ
   */
   @Resource(name="rateDocNoIdgenService")
   TableIdGenService rateDocNoIdgenService;




    /**
     * 임률관리 정보를 수정한다.
     * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
     * @return 삭제된 목록수
     */
    public void multiRateManages(RateManageSaveVO objVO) throws Exception {


        //RateManageVO objVO = saveVO.getRateManageVO();

        //String rteDocNo = "";
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for( RateManageVO rateManageVO : objVO.getInsertList()){

            rateManageVO.setRegUsrId(userId);
            rateManageVO.setDlrCd(rateManageVO.getDstinCd().equals("H") ? "A07AA" : dlrCd);

            /** 중복 체크**/
            getDuplicationCheck(rateManageVO);

            /*
             rteDocNo = rateDocNoIdgenService.getNextStringId();
             rateManageVO.setRteDocNo(rteDocNo);
            */

            insertRateManage(rateManageVO);

        }
        for( RateManageVO rateManageVO : objVO.getUpdateList()){
            rateManageVO.setRegUsrId(userId);
            rateManageVO.setDlrCd(dlrCd);

            /** 중복 체크**/
            //getDuplicationCheck(rateManageVO);

            updateRateManage(rateManageVO);

        }
        for( RateManageVO rateManageVO : objVO.getDeleteList()){
            rateManageVO.setRegUsrId(userId);
            rateManageVO.setDlrCd(dlrCd);
            deleteRateManage(rateManageVO);

        }

    }

    /**
     *
     * 임률 중복 체크 로직
     *
     * @param rateManageVO
     * @return
     * @throws Exception
     */
    public boolean getDuplicationCheck(RateManageVO rateManageVO)throws Exception{


        boolean result = false;
        //임률키 중복 체크
        RateManageSearchVO rateManageKey = new RateManageSearchVO();
        rateManageKey.setsDlrCd(rateManageVO.getDlrCd());
        rateManageKey.setsRpirTp(rateManageVO.getRpirTp());
        rateManageKey.setsDstinCd(rateManageVO.getDstinCd());
     /*   rateManageKey.setsBrandCd(rateManageVO.getBrandCd());
        rateManageKey.setsRteDocNo(rateManageVO.getRteDocNo());
        rateManageKey.setsApplyStartDt(rateManageVO.getApplyStartDt());
        rateManageKey.setsApplyEndDt(rateManageVO.getApplyEndDt());*/
        RateManageVO vo = rateManageDAO.selectRateManageByKey(rateManageKey);
        if(vo != null){

            result = true;
            throw processException("global.err.duplicate");
        }

        return result;

    }

    /**
     * 임률관리 정보를 등록한다.
     * @param rateManageVO - 등록할 정보가 담긴 RateManageVO
     * @return 등록된 목록수
     */
   @Override
   public int insertRateManage(RateManageVO rateManageVO) throws Exception {

        return rateManageDAO.insertRateManage(rateManageVO);
   }


    /**
     * 임률관리 정보를 수정한다.
     * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
     * @return 삭제된 목록수
     */
    public int updateRateManage(RateManageVO rateManageVO) throws Exception {

        return rateManageDAO.updateRateManage(rateManageVO);
    }


    /**
     * 임률관리 정보를 삭제한다.
     * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteAllRateManage(RateManageVO rateManageVO) throws Exception {
        return rateManageDAO.deleteAllRateManage(rateManageVO);
   }


   /**
    * 임률관리 정보를 삭제한다.
    * @param rateManageVO - 삭제할 정보가 담긴 RateManageVO
    * @return 삭제된 목록수
    */
   @Override
   public int deleteRateManage(RateManageVO rateManageVO) throws Exception {
       return rateManageDAO.deleteRateManage(rateManageVO);
   }


    /**
     * 임률 코드 별 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RateManageVO> selectRates(RateManageSearchVO searchVO) throws Exception {


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals(""))
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        if(StringUtil.nullConvert(searchVO.getsBrandCd()).equals(""))
            searchVO.setsBrandCd("HD");

        return rateManageDAO.selectRates(searchVO);
    }


    /**
     * 조회 조건에 해당하는 임률관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RateManageSearchVO
     * @return 조회 목록
     */
    public RateManageVO selectRateManageByKey(RateManageSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals(""))
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        if(StringUtil.nullConvert(searchVO.getsBrandCd()).equals(""))
            searchVO.setsBrandCd("HD");
        return rateManageDAO.selectRateManageByKey(searchVO);
    }

    /**
    * 조회 조건에 해당하는 딜러별 임률관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateManageSearchVO
    * @return 조회 목록
    */
    public RateManageVO selectDlrRateByKey(RateManageSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals(""))
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        if(StringUtil.nullConvert(searchVO.getsBrandCd()).equals(""))
            searchVO.setsBrandCd("HD");
        return rateManageDAO.selectDlrRateByKey(searchVO);
    }

    /**
     * 임률 코드 목록 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RateManageVO> selectRateManageByCondition(RateManageSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals(""))
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        if(StringUtil.nullConvert(searchVO.getsBrandCd()).equals(""))
            searchVO.setsBrandCd("HD");
        return rateManageDAO.selectRateManageByCondition(searchVO);
    }




}

