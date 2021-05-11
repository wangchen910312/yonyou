package chn.bhmc.dms.core.support.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;

public class DepthFirstTreeIterator<T> implements Iterator<Node<T>> {
	private LinkedList<Node<T>> list;

    public DepthFirstTreeIterator(HashMap<String, Node<T>> tree, String identifier) {
        list = new LinkedList<Node<T>>();

        if (tree.containsKey(identifier)) {
            this.buildList(tree, identifier);
        }
    }

    private void buildList(HashMap<String, Node<T>> tree, String identifier) {
        list.add(tree.get(identifier));
        ArrayList<NodeData<T>> children = tree.get(identifier).getChildren();
        for (NodeData<T> child : children) {

            this.buildList(tree, child.getIdentifier());
        }
    }

    @Override
    public boolean hasNext() {
        return !list.isEmpty();
    }

    @Override
    public Node<T> next() {
        return list.poll();
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
