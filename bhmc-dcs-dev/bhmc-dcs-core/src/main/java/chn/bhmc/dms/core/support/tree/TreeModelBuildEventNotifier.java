package chn.bhmc.dms.core.support.tree;

public interface TreeModelBuildEventNotifier<T> {
	void afterChildBuild(TreeModel<T> model);
}
