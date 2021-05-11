package chn.bhmc.dms.mis.tmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.mis.tmp.vo.TargetReferSameBsnsSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetReferSameBsnsVO;
/**
 * <pre>
 * [제조사] 동종업계 참조
 * </pre>
 *
 * @ClassName   : TargetReferSameBsnsDAO.java
 * @Description : [제조사] 동종업계 참조
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Mapper("targetReferSameBsnsDAO")
public interface TargetReferSameBsnsDAO {

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return 조회 목록
     */
    public List<TargetReferSameBsnsVO> selectTargetReferSameBsnsMainSearch(TargetReferSameBsnsSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return
     */
    public int selectTargetReferSameBsnsMainSearchCnt(TargetReferSameBsnsSearchVO searchVO);

    /**
     * Key에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     * @param referDt - [제조사] 동종업계 참조 년월일
     * @return 조회한 [제조사] 동종업계 참조 정보
     */
    public TargetReferSameBsnsVO selectReferSameBsnsByKey(@Param("referDt") String referDt);

    /**
     * [제조사] 동종업계 참조 목록 정보를 등록한다.
     * @param targetReferSameBsnsVO - 등록할 정보가 담긴 TargetReferSameBsnsVO
     * @return 등록된 목록수
     */
    public int insertReferSameBsns(TargetReferSameBsnsVO targetReferSameBsnsVO);

    /**
     * [제조사] 동종업계 참조 목록 정보를 수정한다.
     * @param targetReferSameBsnsVO - 수정할 정보가 담긴 TargetReferSameBsnsVO
     * @return 수정된 목록수
     */
    public int updateReferSameBsns(TargetReferSameBsnsVO targetReferSameBsnsVO);

    /**
     * [제조사] 동종업계 참조 목록 정보를 삭제한다.
     * @param targetReferSameBsnsVO - 삭제할 정보가 담긴 TargetReferSameBsnsVO
     * @return 삭제된 목록수
     */
    public int deleteReferSameBsns(TargetReferSameBsnsVO targetReferSameBsnsVO);


  ///  인터페이스 영역에서 T테이블 -> I 테이블로 데이터가 제대로 내려가지 않아서,
    //    수동으로 I 테이블 전용 서비스를 만들었음 , 서비스이름의 끝에 'I' 를 붙였음 ..


    /**
     * [제조사] 동종업계 참조 목록 정보를 등록한다.
     * @param targetReferSameBsnsVO - 등록할 정보가 담긴 TargetReferSameBsnsVO
     * @return 등록된 목록수
     */
    public int insertReferSameBsnsI(TargetReferSameBsnsVO targetReferSameBsnsVO);

    /**
     * [제조사] 동종업계 참조 목록 정보를 수정한다.
     * @param targetReferSameBsnsVO - 수정할 정보가 담긴 TargetReferSameBsnsVO
     * @return 수정된 목록수
     */
    public int updateReferSameBsnsI(TargetReferSameBsnsVO targetReferSameBsnsVO);

    /**
     * [제조사] 동종업계 참조 목록 정보를 삭제한다.
     * @param targetReferSameBsnsVO - 삭제할 정보가 담긴 TargetReferSameBsnsVO
     * @return 삭제된 목록수
     */
    public int deleteReferSameBsnsI(TargetReferSameBsnsVO targetReferSameBsnsVO);



}