package chn.bhmc.dms.par.pcm.service;

import java.util.List;





import chn.bhmc.dms.par.pcm.vo.DBPartsAccSupVO;
import chn.bhmc.dms.par.pcm.vo.InvcStatisticsVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;

/**
 * 구매오더 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface PurcOrdService {

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 구매헤더 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 구매헤더 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return
     */
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 구매현황 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusDetailByCondition(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return
     */
    public int selectPurcOrdStatusDetailByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 查询负责的经销商的待货数量
     * @author liuxueying
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectPurcOrdStatusForMeCnt(PurcOrdSearchVO searchVO) throws Exception;
    /**
     * 查询负责的经销商的待货情况
     * @author liuxueying
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusForMe(PurcOrdSearchVO searchVO) throws Exception;
    /**
     * 事业部统计
     * @param searchVO
     * @return
     */
    public List<InvcStatisticsVO> selectPurcOrdStatisticsByCondition(PurcOrdSearchVO searchVO)throws Exception;
    /**
     * 经销商汇总
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<InvcStatisticsVO> selectPurcOrdStatisticsByDlr(PurcOrdSearchVO searchVO)throws Exception;
    
    /**
     * 配件对应供应商导入 保存
     * 2020-11-18 
     * @param list
     * @throws Exception
     */
    public void insertPartsAccSupInfoBatchUpload(List<DBPartsAccSupVO> list) throws Exception;
    
    /**
     * 写入配件对应供应商导入 保存
     * JiaMing 2020-11-18 
     * @param dbPartsAccSupVO
     * @return
     * @throws Exception
     */
    public int insertDBPartsAccSup(DBPartsAccSupVO dbPartsAccSupVO) throws Exception;
   
    /**
     * 更新配件供应商信息
     * jiaMing 2020-11-18 
     * @param dbPartsAccSupVO
     * @return
     * @throws Exception
     */
    public int updateDBPartsAccSup(DBPartsAccSupVO dbPartsAccSupVO) throws Exception;
    
    /**
     * 查询配件对应供应商信息
     * JiaMing 2020-11-18
     * @param itemCd
     * @return
     * @throws Exception
     */
    public DBPartsAccSupVO selectDBPartsAccSupVOInfo(String itemCd) throws Exception;
    
    /**
     * 待货升级查询
     * @return
     * @throws Exception
     */
    public List<PurcOrdItemVO> selectOrdBoInfoByCondition(PurcOrdSearchVO searchVO)throws Exception;
    
    /**
     * 待货升级查询
     * @return
     * @throws Exception
     */
    public int selectOrdBoInfoByConditionCnt(PurcOrdSearchVO searchVO)throws Exception;
    
    /**
     * 回复查询
     * @param searchVO
     * @return
     */
    public List<PurcOrdItemVO> selectPurcOrdReplyByCondition(PurcOrdSearchVO searchVO)throws Exception;

    /**
     * 回复查询
     * @param searchVO
     * @return
     */
    public int selectPurcOrdReplyByConditionCnt(PurcOrdSearchVO searchVO)throws Exception;
}
