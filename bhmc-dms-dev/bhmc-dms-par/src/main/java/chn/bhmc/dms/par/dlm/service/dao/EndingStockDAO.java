package chn.bhmc.dms.par.dlm.service.dao;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.dlm.vo.EndingStockVO;

/**
 * 기말재고 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */

@Mapper("endingStockDAO")
public interface EndingStockDAO {


    /**
     * Key에 해당하는 수불유형 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형 코드
     * @return 조회한 수불유형 정보
     */
    public EndingStockVO selectEndingStockByKey(@Param("dlrCd") String dlrCd, @Param("pltCd")  String pltCd, @Param("strgeCd") String strgeCd, @Param("itemCd") String itemCd);

}
