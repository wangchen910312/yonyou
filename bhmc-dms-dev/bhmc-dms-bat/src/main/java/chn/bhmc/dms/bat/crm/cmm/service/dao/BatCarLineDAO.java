package chn.bhmc.dms.bat.crm.cmm.service.dao;

import java.util.HashMap;

import able.com.mybatis.Mapper;

//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;
//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatLeadInfoDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE     최초 생성
 * </pre>
 */

@Mapper("batCarLineDAO")
public interface BatCarLineDAO {

    /**
     * DMS - DCS로 전송하기위한 관심차종 정보 수집
     * @param null
     * @return Count
     */
    public void selectCarLineDmsDcs(HashMap<String, Object> map) throws Exception;

}
