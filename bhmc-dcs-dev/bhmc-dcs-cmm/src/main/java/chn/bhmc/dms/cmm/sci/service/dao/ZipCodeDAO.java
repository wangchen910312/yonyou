package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.sci.vo.ZipCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeVO;

/**
 * 우편번호에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("zipCodeDAO")
public interface ZipCodeDAO {

    /**
     * 우편번호정보를 등록한다.
     * @param zipCodeVO - 등록할 정보가 담긴 ZipCodeVO
     * @return 등록된 목록수
     */
    public int insertZipCode(ZipCodeVO zipCodeVO);

    /**
     * 우편번호정보를 수정한다.
     * @param zipCodeVO - 수정할 정보가 담긴 ZipCodeVO
     * @return 수정된 목록수
     */
    public int updateZipCode(ZipCodeVO zipCodeVO);

    /**
     * 우편번호정보를 삭제한다.
     * @param zipCodeVO - 삭제할 정보가 담긴 ZipCodeVO
     * @return 삭제된 목록수
     */
    public int deleteZipCode(ZipCodeVO zipCodeVO);

    /**
     * Key에 해당하는 우편번호정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 우편번호정보
     */
    public ZipCodeVO selectZipCodeByKey(@Param("sungCd") String sungCd, @Param("cityCd") String cityCd, @Param("distCd") String distCd);

    /**
     * 조회 조건에 해당하는 우편번호정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return 조회 목록
     */
    public List<ZipCodeVO> selectZipCodesByCondition(ZipCodeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 우편번호총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return
     */
    public int selectZipCodesByConditionCnt(ZipCodeSearchVO searchVO);
    
    /**
     * 성 목록을 조회한다.
     * @return
     */
    public List<ZipCodeVO> selectSungList();
    
    /**
     * 도시 목록을 조회한다.
     * @return
     */
    public List<ZipCodeVO> selectCityList();
    
    /**
     * 구 목록을 조회한다.
     * @return
     */
    public List<ZipCodeVO> selectDistList();
}
