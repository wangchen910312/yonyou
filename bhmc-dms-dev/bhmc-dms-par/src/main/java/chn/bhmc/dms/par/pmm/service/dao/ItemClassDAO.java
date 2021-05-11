package chn.bhmc.dms.par.pmm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.ItemClassSearchVO;

/**
 * <pre>
 * 부품등급 데이터처리 매퍼 클래스
 * </pre>
 *
 * @ClassName   : ItemClassDAO
 * @author In Bo Shim
 * @since 2016. 12. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 01.     In Bo Shim     최초 생성
 * </pre>
 */

@Mapper("itemClassDAO")
public interface ItemClassDAO {

    /**
     *부품등급 수정 프로시져를 호출한다.
     * @param certificationVO - 등록할 정보가 담긴 certificationVO
     * @return 등록된 목록수
     */
    public void updateItemClassProcedure(ItemClassSearchVO seachVO) throws Exception;

}
