package chn.bhmc.dms.core.support.tree;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;


public class KendoTreeModel<T> implements TreeModel<T> {

	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(KendoTreeModel.class);

	String id = null;
	Boolean isRoot = false;
	@JsonInclude(Include.NON_NULL)
	Boolean expanded = null;
	Boolean canDeleted = false;
	Boolean isLeaf = false;
	String spriteCssClass;

	String path = "";

	@JsonInclude(Include.NON_EMPTY)
	@JsonProperty("subNodes")
	List<KendoTreeModel<T>> children = new ArrayList<KendoTreeModel<T>>();

	T data = null;

	@JsonIgnore
	Comparator<KendoTreeModel<T>> comparator;

	@JsonIgnore
	KendoTreeSpriteCssClassBuilder<KendoTreeModel<T>> kendoTreeSpriteCssClassBuilder;

	public KendoTreeModel(String id, boolean expanded, boolean canDeleted){
		this.id = id;
		this.expanded = expanded;
		this.canDeleted = canDeleted;
	}

	public void setComparator(Comparator<KendoTreeModel<T>> comparator){
	    this.comparator = comparator;
	}

	/**
     * @param kendoTreeSpriteCssClassBuilder the kendoTreeSpriteCssClassBuilder to set
     */
    public void setKendoTreeSpriteCssClassBuilder(
            KendoTreeSpriteCssClassBuilder<KendoTreeModel<T>> kendoTreeSpriteCssClassBuilder) {
        this.kendoTreeSpriteCssClassBuilder = kendoTreeSpriteCssClassBuilder;
    }

    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public List<KendoTreeModel<T>> getChildren() {
	    if(comparator != null){
	        Collections.sort(children, comparator);
	    }
		return children;
	}
	public void setChildren(List<KendoTreeModel<T>> children) {
		this.children = children;
	}
	public Boolean isExpanded() {
		return expanded;
	}
	public void setExpanded(Boolean expanded) {
		this.expanded = expanded;
	}
	public Boolean isCanDeleted() {
		return canDeleted;
	}
	public void setCanDeleted(Boolean canDeleted) {
		this.canDeleted = canDeleted;
	}
	public void addChild(KendoTreeModel<T> model){
		this.children.add(model);
	}
    public String getSpriteCssClass() {
        if(kendoTreeSpriteCssClassBuilder != null){
            return kendoTreeSpriteCssClassBuilder.build(isRoot, isLeaf, this);
        }

		if(isRoot) return "rootfolder";
		if(isLeaf) return "item";
		return "folder";
	}
	public Boolean isRoot() {
		return isRoot;
	}
	public void setRoot(Boolean isRoot) {
		this.isRoot = isRoot;
	}
	public Boolean isLeaf() {
		return isLeaf;
	}
	public void setLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
    /**
     * @return the path
     */
    public String getPath() {
        return path;
    }

    /**
     * @param path the path to set
     */
    public void setPath(String path) {
        this.path = path;
    }

    public void addPath(String path){
        if(StringUtils.isBlank(this.path)){
            this.path = path;
        }else{
            this.path = this.path + "|" + path;
        }
    }

    public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
