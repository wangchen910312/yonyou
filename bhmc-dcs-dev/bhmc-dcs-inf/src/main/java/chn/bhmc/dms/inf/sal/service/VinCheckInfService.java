package chn.bhmc.dms.inf.sal.service;

import java.util.List;

import chn.bhmc.dms.inf.sal.vo.VinCheckResultVO;

import chn.bhmc.dms.inf.sal.vo.VinCheckSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VinCheckInfService.java
 * @Description : DMS -> DCS VinNo Check Service
 * @author Choi Kyung Yong
 * @since 2017. 03. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author                  description
 *  ===========    =================    ===========================
 *  2017. 03. 19.   Choi Kyung Yong               최초 생성
 * </pre>
 */

public interface VinCheckInfService {

    //Vin No 존재하는지 조회
    public List<VinCheckResultVO> selectVinCheckInf(VinCheckSearchVO vinCheckSearchVO) throws Exception;

}
