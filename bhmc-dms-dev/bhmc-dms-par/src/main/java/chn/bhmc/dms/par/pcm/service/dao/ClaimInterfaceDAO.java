package chn.bhmc.dms.par.pcm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pcm.vo.ClaimVO;

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
@Mapper("claimInterfaceDAO")
public interface ClaimInterfaceDAO {


    /**
     * 클레임 인터페이스 부품 정보를 등록한다.
     * @param claimVO - 등록할 정보가 담긴 ClaimVO
     * @return 등록된 목록수
     */
    public int insertClaimInterface(ClaimVO claimVO);

}
