package chn.bhmc.dms.inf.sal.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.inf.sal.vo.VinCheckResultVO;
import chn.bhmc.dms.inf.sal.vo.VinCheckSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
  * @ClassName   : vinCheckInfDAO
 * @Description : Vin No Check DAO
 * @author : Choi Kyung Yong
 * @since 2017. 03. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author               description
 *  ===========    ===============    ===========================
 *  2017. 03. 19.  Choi Kyung Yong             최초 생성
 * </pre>
 */

@Mapper("vinCheckInfDAO")
public interface VinCheckInfDAO {

    /**
     * 딜러마스터에서 딜러를 조회.
     */
    public List<VinCheckResultVO> selectVinCheckInf(VinCheckSearchVO vinCheckSearchVO) throws Exception;
}
