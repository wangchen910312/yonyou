package chn.bhmc.dms.core.support.tree;

import java.util.ArrayList;
import java.util.Comparator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class KendoTreeModelBuilder<T> implements TreeModelBuilder<T> {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	private final static int ROOT = 0;
	private Tree<T> tree = null;
	private Boolean expanded = false;
	private Boolean canDeleted = false;
	private int expandTreeLevel = 1;

	Comparator<KendoTreeModel<T>> comparator;
	KendoTreeSpriteCssClassBuilder<KendoTreeModel<T>> kendoTreeSpriteCssClassBuilder;

	public KendoTreeModelBuilder(boolean expanded, boolean canDeleted){
		this.expanded = expanded;
		this.canDeleted = canDeleted;
	}

	public KendoTreeModelBuilder(int expandTreeLevel){
		if(expandTreeLevel >= 0){
			this.expandTreeLevel = expandTreeLevel;
		}
	}

	public void setComparator(Comparator<KendoTreeModel<T>> comparator){
        this.comparator = comparator;
    }

	public void setKendoTreeSpriteCssClassBuilder(KendoTreeSpriteCssClassBuilder<KendoTreeModel<T>> kendoTreeSpriteCssClassBuilder){
	    this.kendoTreeSpriteCssClassBuilder = kendoTreeSpriteCssClassBuilder;
	}

	@Override
	public Object buildTreeModel(String identifier, TreeModel<T> model, Tree<T> tree) {
		this.tree = tree;

		KendoTreeModel<T> kendoTreeModel = null;

		if(model == null) {
		    kendoTreeModel = new KendoTreeModel<T>(identifier, this.expanded, this.canDeleted);
		    kendoTreeModel.setComparator(comparator);
		    kendoTreeModel.setKendoTreeSpriteCssClassBuilder(kendoTreeSpriteCssClassBuilder);
		} else {
		    kendoTreeModel = (KendoTreeModel<T>)model;
		}

		build(identifier, kendoTreeModel);

		return kendoTreeModel;
	}

	private void build(String identifier, KendoTreeModel<T> model) {
        this.build(identifier, ROOT, model);
    }

    private void build(String identifier, int depth, KendoTreeModel<T> model) {

    	Node<T> node = tree.getNodes().get(identifier);
        ArrayList<NodeData<T>> children = node.getChildren();

        model.addPath(identifier);
        model.setData(node.getNodeValue());
        if(depth == ROOT){
        	model.setRoot(true);
        	//applySpriteCssClass(model, true, false);
        }

        if(!expanded && depth <= expandTreeLevel){
        	model.setExpanded(true);
        }

        if(children.size() == 0){
        	model.setLeaf(true);
        	//applySpriteCssClass(model, false, true);
        }else{
            depth++;
            for (NodeData<T> child : children) {

                KendoTreeModel<T> childModel = new KendoTreeModel<T>(child.getIdentifier(), this.expanded, this.canDeleted);
                childModel.setComparator(comparator);
                childModel.setKendoTreeSpriteCssClassBuilder(kendoTreeSpriteCssClassBuilder);
                childModel.setData(child.getData());
                childModel.setPath(model.getPath());
                //applySpriteCssClass(childModel, false, false);

                model.addChild(childModel);

                this.build(child.getIdentifier(), depth, childModel);
            }
        }
    }

//    private void applySpriteCssClass(KendoTreeModel<T> model, boolean isRoot, boolean isLeaf){
//        if(kendoTreeSpriteCssClassBuilder != null){
//            model.setSpriteCssClass(kendoTreeSpriteCssClassBuilder.build(isRoot, isLeaf, model));
//        }else{
//            if(isRoot){
//                model.setSpriteCssClass("rootFolder");
//            }else if(isLeaf){
//                model.setSpriteCssClass("item");
//            }else{
//                model.setSpriteCssClass("folder");
//            }
//        }
//    }
}