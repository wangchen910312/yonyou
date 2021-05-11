package chn.bhmc.dms.core.support.tree;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class KendoTreeListModelBuilder<T> implements TreeModelBuilder<T> {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	private final static int ROOT = 0;
	private Tree<T> tree = null;
	private List<KendoTreeListModel<T>> treeList = new ArrayList<KendoTreeListModel<T>>();
	private TreeModelBuildEventNotifier<T> eventNotifier = null;

	public KendoTreeListModelBuilder(){
	}

	public KendoTreeListModelBuilder(TreeModelBuildEventNotifier<T> eventNotifier){
		this.eventNotifier = eventNotifier;
	}

	public List<KendoTreeListModel<T>> getTreeList() {
		return treeList;
	}

	public void setTreeList(List<KendoTreeListModel<T>> treeList) {
		this.treeList = treeList;
	}

	public TreeModelBuildEventNotifier<T> getEventNotifier() {
		return eventNotifier;
	}

	public void setEventNotifier(TreeModelBuildEventNotifier<T> eventNotifier) {
		this.eventNotifier = eventNotifier;
	}

	@Override
	public Object buildTreeModel(String identifier, TreeModel<T> model, Tree<T> tree) {
		this.tree = tree;

		KendoTreeListModel<T> kendoTreeListModel = null;

		if (model == null) {
		    kendoTreeListModel = new KendoTreeListModel<T>(identifier);
		} else {
		    kendoTreeListModel = (KendoTreeListModel<T>)model;
		}

		build(identifier, kendoTreeListModel);

		return this.treeList;
	}

	private void build(String identifier, KendoTreeListModel<T> parent) {
        this.build(identifier, ROOT, parent);
    }

    private void build(String identifier, int depth, KendoTreeListModel<T> model) {

    	Node<T> node = tree.getNodes().get(identifier);
        ArrayList<NodeData<T>> children = node.getChildren();

        model.setData(node.getNodeValue());
        if(depth == ROOT){
        	model.setRoot(true);
        }

        if(children.size() == 0){
        	model.setLeaf(true);
        }

        treeList.add(model);

        if(this.eventNotifier != null){
    		eventNotifier.afterChildBuild(model);
    	}

        depth++;
        for (NodeData<T> child : children) {

        	KendoTreeListModel<T> childModel = new KendoTreeListModel<T>(child.getIdentifier());
        	childModel.setData(child.getData());
        	childModel.setParent(model);

            this.build(child.getIdentifier(), depth, childModel);


        }




    }



}


