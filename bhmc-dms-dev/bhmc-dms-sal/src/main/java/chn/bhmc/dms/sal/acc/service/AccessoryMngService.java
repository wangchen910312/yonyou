package chn.bhmc.dms.sal.acc.service;

import java.util.List;

import chn.bhmc.dms.sal.acc.vo.AccessoryMngItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngVO;


/**
 *  경품판매관리 서비스
 *
 * @author Kim Jin Suk
 * @since 2016. 6. 30.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.30         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface AccessoryMngService {


    /**
     * 경품판매관리 내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryMngsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception;
    public List<AccessoryMngVO> selectAccessoryMngsByCondition(AccessoryMngSearchVO searchVO) throws Exception;

    /**
     * 경품판매관리 아이템 내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryMngItemsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception;
    public List<AccessoryMngItemVO> selectAccessoryMngItemsByCondition(AccessoryMngSearchVO searchVO) throws Exception;

    /**
     * 저장/수정 한다.
     */
    public String multiAccessoryMngs(AccessoryMngSaveVO saveVO) throws Exception;


    /**
     * 출고요청
     */
    public String applyReq(AccessoryMngSaveVO saveVO) throws Exception;

    /**
     * 츨고취소
     */
    public String applyCancel(AccessoryMngSearchVO saveVO) throws Exception;


    /**
     * 소매계약건의 용품내역을 삭제한다.
     */
    public int deleteContractSaleAccessoryMngs(String contractNo) throws Exception;

    /**
     * 용품할인레벨을 조회한다.
     */
    public List<AccessoryMngVO> selectDlrGoodsDcLevel(AccessoryMngSearchVO searchVO) throws Exception;

}
