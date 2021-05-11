package chn.bhmc.dms.core.support.tree;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.annotation.JsonIgnore;


public class KendoTreeListModel<T> implements TreeModel<T> {

	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(KendoTreeListModel.class);

	String id = null;
	boolean isRoot = false;
	boolean isLeaf = false;

	T data = null;

	@JsonIgnore
	KendoTreeListModel<T> parent;


	public KendoTreeListModel(String id){
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isRoot() {
		return isRoot;
	}

	public void setRoot(boolean isRoot) {
		this.isRoot = isRoot;
	}

	public boolean isLeaf() {
		return isLeaf;
	}

	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public KendoTreeListModel<T> getParent() {
		return parent;
	}

	public void setParent(KendoTreeListModel<T> parent) {
		this.parent = parent;
	}

	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}



}
