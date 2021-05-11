package chn.bhmc.dms.sal.ctl.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngSearchVO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OneShotCtrlMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 11. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 10.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("oneShotCtrlMngDAO")
public interface OneShotCtrlMngDAO {

    /**
     * 좌측 전략출고를 조회한다.
     */
    public List<OneShotCtrlMngVO> selectOneShotLeftByCondition(OneShotCtrlMngSearchVO searchVO);

    /**
     * 좌측 전략출고 갯수를 조회한다.
     */
    public int selectOneShotLeftByConditionCnt(OneShotCtrlMngSearchVO searchVO);

    /**
     * 우측 전략출고를 조회한다.
     */
    public List<OneShotCtrlMngVO> selectOneShotRightByCondition(OneShotCtrlMngSearchVO searchVO);

    /**
     * 우측 전략출고 갯수를 조회한다.
     */
    public int selectOneShotRightByConditionCnt(OneShotCtrlMngSearchVO searchVO);

    /**
     * 좌측 원샷 정보를 등록전 삭제한다.
     * @param OneShotCtrlMngVO - 등록할 정보가 담긴 OneShotCtrlMngVO
     * @return 수정된 목록수
     */
    public int deleteDeadlineCtrlMngHd(OneShotCtrlMngVO vo) throws Exception;
    public int deleteDeadlineCtrlMngHdIf(OneShotCtrlMngVO vo) throws Exception;

    /**
     * 좌측 원샷 정보를 등록전 삭제한다.
     * @param OneShotCtrlMngVO - 등록할 정보가 담긴 OneShotCtrlMngVO
     * @return 수정된 목록수
     */
    public int deleteTargetDealerDt(OneShotCtrlMngVO vo) throws Exception;
    public int deleteTargetDealerDtIf(OneShotCtrlMngVO vo) throws Exception;

    /**
     * 좌측 원샷 정보를 수정한다.
     * @param OneShotCtrlMngVO - 등록할 정보가 담긴 OneShotCtrlMngVO
     * @return 수정된 목록수
     */
    public int insertDeadlineCtrlMngHd(OneShotCtrlMngVO codeVO) throws Exception;
    public int insertDeadlineCtrlMngHdIf(OneShotCtrlMngVO codeVO) throws Exception;

    /**
     * 좌측 원샷 정보를 등록한다.
     * @param OneShotCtrlMngVO - 등록할 정보가 담긴 OneShotCtrlMngVO
     * @return 수정된 목록수
     */
    public int insertTargetDealerDt(OneShotCtrlMngVO vo) throws Exception;
    public int insertTargetDealerDtIf(OneShotCtrlMngVO vo) throws Exception;

    /**
     * 엑셀업로드한 지역 사무소를 불러온다.
     * @param list
     * @return
     * @throws Exception
     */
    public List<OneShotCtrlMngVO> selectSungCityCondition(OneShotCtrlMngVO searchVO) throws Exception;

}
