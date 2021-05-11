package chn.bhmc.dms.core.datatype;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BaseSearchVO.java
 * @Description : BaseSearchVO Class
 * @author Kang Seok Han
 * @since 2016. 1. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 5.     Kang Seok Han     최초 생성
 * </pre>
 */

public class BaseSearchVO extends SearchVO {
    /**
     * 
     */
    private static final long serialVersionUID = -8499447292541032374L;
    
    private int take = 10;
    private int skip = 0;
    
    public int getTake() {
        return take;
    }
    public void setTake(int take) {
        this.take = take;
        init();
    }
    public int getSkip() {
        return skip;
    }
    public void setSkip(int skip) {
        this.skip = skip;
        init();
    }
    
    @Override
    public void setPageSize(int pageSize){
        super.setRecordCountPerPage(pageSize);
    }
    public void setPage(int page){
        super.setPageIndex(page);
    }
    private void init(){
        super.setFirstIndex(this.skip);
        super.setLastIndex(this.skip + this.take);
    }
}
