package chn.bhmc.dms.security.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.support.tree.KendoTreeSpriteCssClassBuilder;
import chn.bhmc.dms.core.support.tree.TreeModel;
import chn.bhmc.dms.security.vo.MenuVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MenuTreeModel.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 26.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MenuTreeModel implements TreeModel<MenuVO>, Comparable<MenuTreeModel> {

    @SuppressWarnings("unused")
    private static final Logger log = LoggerFactory.getLogger(MenuTreeModel.class);



    String id = null;
    boolean isRoot = false;
    boolean isLeaf = false;
    boolean expanded = false;
    boolean canDeleted = false;
    String spriteCssClass;
    @JsonIgnore
    boolean hasChildren = false;
    @JsonIgnore
    int level = 0;

    @JsonProperty("subNodes")
    List<MenuTreeModel> children = new ArrayList<MenuTreeModel>();

    MenuVO data = null;

    @JsonIgnore
    KendoTreeSpriteCssClassBuilder<MenuTreeModel> kendoTreeSpriteCssClassBuilder;

    @JsonIgnore
    int permViewCount = 0;

    @JsonIgnore
    MenuTreeModel parent = null;

    public MenuTreeModel(String id, MenuTreeModel parent){
        this.id = id;
        this.parent = parent;
    }

    public void setKendoTreeSpriteCssClassBuilder(
            KendoTreeSpriteCssClassBuilder<MenuTreeModel> kendoTreeSpriteCssClassBuilder) {
        this.kendoTreeSpriteCssClassBuilder = kendoTreeSpriteCssClassBuilder;
    }


    public void addChild(MenuTreeModel child){
        children.add(child);
    }

    public void addPermViewCount(){
        this.permViewCount++;

        if(parent != null){
            parent.addPermViewCount();
        }
    }

    public int getPermViewCount() {
        return permViewCount;
    }


    public void setPermViewCount(int permViewCount) {
        this.permViewCount = permViewCount;
    }


    public MenuTreeModel getParent() {
        return parent;
    }


    public void setParent(MenuTreeModel parent) {
        this.parent = parent;
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

    public boolean isExpanded() {
        return expanded;
    }
    public void setExpanded(boolean expanded) {
        this.expanded = expanded;
    }
    public boolean isCanDeleted() {
        return canDeleted;
    }
    public void setCanDeleted(boolean canDeleted) {
        this.canDeleted = canDeleted;
    }



    public boolean isHasChildren() {
        return hasChildren;
    }


    public void setHasChildren(boolean hasChildren) {
        this.hasChildren = hasChildren;
    }

    /**
     * @return the level
     */
    public int getLevel() {
        return level;
    }


    /**
     * @param level the level to set
     */
    public void setLevel(int level) {
        this.level = level;
    }

    public String getSpriteCssClass() {

        if(kendoTreeSpriteCssClassBuilder != null){
            return kendoTreeSpriteCssClassBuilder.build(isRoot, isLeaf, this);
        }

        if(isRoot) return "rootfolder";
        if(isLeaf) return "item";
        return "folder";
    }

    public List<MenuTreeModel> getChildren() {
        Collections.sort(children);
        return children;
    }

    public void setChildren(List<MenuTreeModel> children) {
        this.children = children;
    }

    public MenuVO getData() {
        return data;
    }

    public void setData(MenuVO data) {
        this.data = data;
    }

    @Override
    public int compareTo(MenuTreeModel model) {
        return this.data.getSortOrder() - model.getData().getSortOrder();
    }

    public String toString(){
        return ToStringBuilder.reflectionToString(this);
    }

}
