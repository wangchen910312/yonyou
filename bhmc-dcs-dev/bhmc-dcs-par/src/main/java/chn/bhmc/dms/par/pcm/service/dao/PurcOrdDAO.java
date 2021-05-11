package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.par.pcm.vo.DBPartsAccSupVO;
import chn.bhmc.dms.par.pcm.vo.InvcStatisticsVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;

/**
 * 구매오더 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee     최초 생성
 * </pre>
 */
@Mapper("purcOrdDAO")
public interface PurcOrdDAO {

    /**
     * 조회 조건에 해당하는 구매오더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매오더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매헤더 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매헤더 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusDetailByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdStatusDetailByConditionCnt(PurcOrdSearchVO searchVO);
    /**
     * 事业部汇总
     * @param searchVO
     * @return
     */
    public List<InvcStatisticsVO> selectPurcOrdStatisticsByCondition(PurcOrdSearchVO searchVO);
    /**
     * 经销商汇总
     * @param searchVO
     * @return
     */
    public List<InvcStatisticsVO>selectPurcOrdStatisticsByDlr(PurcOrdSearchVO searchVO);
    
    /**
     * 查询配件编号是否存在
     * JiaMing 2020-11-18
     * @param itemCd
     * @return
     */
    public DBPartsAccSupVO selectDBPartsAccSupVOInfo(@Param("itemCd") String itemCd);
   
    /**
     * 写入配件对应供应商 
     * JiaMing 2020-11-18
     * @param dbPartsAccSupVO
     * @return
     */
    public int insertDBPartsAccSup(DBPartsAccSupVO dbPartsAccSupVO);
    
    /**
     * 更新配件对应供应商
     * JiaMing 2020-11-18
     * @param dbPartsAccSupVO
     * @return
     */
    public int updateDBPartsAccSup(DBPartsAccSupVO dbPartsAccSupVO);
    
    /**
     * 待货升级查询
     * @param searchVO
     * @return
     */
    public List<PurcOrdItemVO>selectOrdBoInfoByCondition(PurcOrdSearchVO searchVO);
    
    /**
     * 待货升级查询
     * @param searchVO
     * @return
     */
    public int selectOrdBoInfoByConditionCnt(PurcOrdSearchVO searchVO);
    
    /**
     * 待货升级提报
     * @param searchVO
     * @return
     */
    public List<PurcOrdItemVO> selectPurcOrdBoByCondition(PurcOrdSearchVO searchVO);

    /**
     * 待货升级提报
     * @param searchVO
     * @return
     */
    public int selectPurcOrdBoByConditionCnt(PurcOrdSearchVO searchVO);
    /**
     * 待货升级查询下载
     * @param searchVO
     * @return
     */
    public List<PurcOrdItemVO>selectOrdBoInfoExcelByCondition(PurcOrdSearchVO searchVO);
    
    
    /**
     * 回复查询
     * @param searchVO
     * @return
     */
    public List<PurcOrdItemVO> selectPurcOrdReplyByCondition(PurcOrdSearchVO searchVO);

    /**
     * 回复查询
     * @param searchVO
     * @return
     */
    public int selectPurcOrdReplyByConditionCnt(PurcOrdSearchVO searchVO);
    
    /**
     * 回复下载
     * @param searchVO
     * @return
     */
    public List<PurcOrdItemVO>selectPurcOrdReplyExcelByCondition(PurcOrdSearchVO searchVO);
}
