package chn.bhmc.dms.core.support.tree;


public interface TreeModelBuilder<T> {

	public Object buildTreeModel(String identifier, TreeModel<T> treeModel, Tree<T> tree);

}
