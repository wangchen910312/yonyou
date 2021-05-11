package chn.bhmc.dms.cmm.usc.service;

import java.util.List;

import chn.bhmc.dms.cmm.usc.vo.UsedCarStyleListVO;

import chn.bhmc.dms.cmm.usc.vo.UsedCarBrandListVO;
import chn.bhmc.dms.cmm.usc.vo.UsedCarModelListVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi KyungYong
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 3. 3.     Choi KyungYong            최초 생성
 * </pre>
 */

public interface UsedCarService {

    List<UsedCarBrandListVO> selectUsedCarBrandList() throws Exception;

    List<UsedCarModelListVO> selectUsedCarModelList(String carBrandCd) throws Exception;

    List<UsedCarStyleListVO> selectUsedCarStyleList(String carlineCd) throws Exception;
}