package chn.bhmc.dms.core.datatype;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SearchVO.java
 * @Description : SearchVO Class
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

public class SearchVO implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 7705757860844320645L;
    
    /**  
     * 페이지 번호
     */
    private int pageIndex = 1;
        
    /** 
     * 페이지번호 출력 목록 수
     * 
     */
    private int pageSize = 10;

    /**
     * 현재 페이지 목록 시작 인덱스 번호
     */
    private int firstIndex = -1;

    /** 
     * 현재 페이지 목록 종료 인덱스 번호 
     */
    private int lastIndex = -1;

    /**  
     * 한페이지당 출력 목록 수
     */
    private int recordCountPerPage = 10;
    
    /**
     * 정렬
     */
    private List<SortDescriptor> sort = null;
    
    /**
     * 검색필드
     */
    private String sField = "";
    
    /**
     * 검색어
     */
    private String sText = "";
    
    /**
     * 언어코드
     */
    private String sLangCd = "";

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getFirstIndex() {
        return firstIndex;
    }

    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

    public int getLastIndex() {
        return lastIndex;
    }

    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    }

    public int getRecordCountPerPage() {
        return recordCountPerPage;
    }

    public void setRecordCountPerPage(int recordCountPerPage) {
        this.recordCountPerPage = recordCountPerPage;
    }
    
    public List<SortDescriptor> getSort() {
        return sort;
    }

    public void setSort(List<SortDescriptor> sort) {
        if(sort != null && sort.size() == 0){
            sort = null;
        }       
        this.sort = sort;
    }

    public String getsField() {
        return sField;
    }

    public void setsField(String sField) {
        this.sField = sField;
    }

    public String getsText() {
        return sText;
    }

    public void setsText(String sText) {
        this.sText = sText;
    }

    public String getsLangCd() {
        return sLangCd;
    }

    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }
    
    public String toString(){
        return ToStringBuilder.reflectionToString(this);
    }

    public static class SortDescriptor {
             

        private String field;
        private String dir;
        
        public String getField() {
            return field;
        }

        public void setField(String field) {
            this.field = field;
        }

        public String getDir() {
            return dir;
        }

        public void setDir(String dir) {
            this.dir = dir;
        }
        
    }
}
