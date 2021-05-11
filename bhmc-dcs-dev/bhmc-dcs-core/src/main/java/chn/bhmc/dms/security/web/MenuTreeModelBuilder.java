package chn.bhmc.dms.security.web;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.core.support.tree.KendoTreeSpriteCssClassBuilder;
import chn.bhmc.dms.core.support.tree.Node;
import chn.bhmc.dms.core.support.tree.NodeData;
import chn.bhmc.dms.core.support.tree.Tree;
import chn.bhmc.dms.core.support.tree.TreeModel;
import chn.bhmc.dms.core.support.tree.TreeModelBuilder;
import chn.bhmc.dms.security.vo.MenuVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MenuTreeModelBuilder.java
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

public class MenuTreeModelBuilder implements TreeModelBuilder<MenuVO> {

    protected final Logger log = LoggerFactory.getLogger(getClass());

    private final static int ROOT = 0;
    private int expendLevel = 0;
    private Tree<MenuVO> tree = null;

    KendoTreeSpriteCssClassBuilder<MenuTreeModel> kendoTreeSpriteCssClassBuilder;

    public MenuTreeModelBuilder(int expendLevel){
        this.expendLevel = expendLevel;
    }

    public void setKendoTreeSpriteCssClassBuilder(KendoTreeSpriteCssClassBuilder<MenuTreeModel> kendoTreeSpriteCssClassBuilder){
        this.kendoTreeSpriteCssClassBuilder = kendoTreeSpriteCssClassBuilder;
    }

    /*
    public Object buildTreeModel(String identifier, Tree<MenuVO> tree) {
        this.tree = tree;

        MenuTreeModel menuTreeModel = new MenuTreeModel(identifier, null);
        build(identifier, menuTreeModel);

        applyPerm(menuTreeModel);

        return menuTreeModel;
    }

    public Object buildTreeModel(TreeModel<MenuVO> model, Tree<MenuVO> tree) {
        this.tree = tree;

        MenuTreeModel menuTreeModel = (MenuTreeModel)model;

        build(model.getId(), menuTreeModel);

        applyPerm(menuTreeModel);

        return menuTreeModel;
    }
    */

    private void build(String identifier, MenuTreeModel model) {
        this.build(identifier, ROOT, model);
    }

    private void build(String identifier, int depth, MenuTreeModel model) {

        Node<MenuVO> node = tree.getNodes().get(identifier);
        ArrayList<NodeData<MenuVO>> children = node.getChildren();

        model.setData(node.getNodeValue());
        model.setLevel(depth);
        model.setKendoTreeSpriteCssClassBuilder(kendoTreeSpriteCssClassBuilder);

        if(depth == ROOT){
            model.setRoot(true);
        }

        if(depth <= expendLevel){
            model.setExpanded(true);
        }

        if(children.size() == 0){

            model.setLeaf(true);
            model.setHasChildren(false);

            if("Y".equals(model.getData().getPermYn())){
                model.addPermViewCount();
            }

        }else{

            model.setHasChildren(true);

            depth++;
            for (NodeData<MenuVO> child : children) {

                MenuTreeModel childModel = new MenuTreeModel(child.getIdentifier(), model);
                childModel.setData(child.getData());

                model.addChild(childModel);

                this.build(child.getIdentifier(), depth, childModel);
            }
        }

    }

    /**
     *
     * @param model
     */
    private void applyPerm(MenuTreeModel model){
        if(model.getPermViewCount() == 0){
            model.setHasChildren(false);
            model.getChildren().clear();
        }else{

            List<MenuTreeModel> children = new ArrayList<MenuTreeModel>();
            for(MenuTreeModel childModel : model.getChildren()){
                if(childModel.getPermViewCount() != 0){
                    children.add(childModel);
                    applyPerm(childModel);
                }
            }

            model.setChildren(children);
        }
    }


    /*
     * @see chn.bhmc.dms.core.support.tree.TreeModelBuilder#buildTreeModel(java.lang.String, chn.bhmc.dms.core.support.tree.TreeModel, chn.bhmc.dms.core.support.tree.Tree)
     */
    @Override
    public Object buildTreeModel(String identifier, TreeModel<MenuVO> treeModel, Tree<MenuVO> tree) {
        this.tree = tree;

        MenuTreeModel menuTreeModel = (MenuTreeModel)treeModel;

        build(treeModel.getId(), menuTreeModel);

        applyPerm(menuTreeModel);

        return menuTreeModel;
    }



}
