package chn.bhmc.dms.core.support.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;

public class BreadthFirstTreeIterator<T> implements Iterator<Node<T>> {
	 private static final int ROOT = 0;

	    private LinkedList<Node<T>> list;
	    private HashMap<Integer, ArrayList<NodeData<T>>> levels;

	    public BreadthFirstTreeIterator(HashMap<String, Node<T>> tree, String identifier) {
	        list = new LinkedList<Node<T>>();
	        levels = new HashMap<Integer, ArrayList<NodeData<T>>>();

	        if (tree.containsKey(identifier)) {
	            this.buildList(tree, identifier, ROOT);

	            for (Map.Entry<Integer, ArrayList<NodeData<T>>> entry : levels.entrySet()) {
	                for (NodeData<T> child : entry.getValue()) {
	                    list.add(tree.get(child.getIdentifier()));
	                }
	            }
	        }
	    }

	    private void buildList(HashMap<String, Node<T>> tree, String identifier, int level) {
	        if (level == ROOT) {
	            list.add(tree.get(identifier));
	        }

	        ArrayList<NodeData<T>> children = tree.get(identifier).getChildren();

	        if (!levels.containsKey(level)) {
	            levels.put(level, new ArrayList<NodeData<T>>());
	        }
	        for (NodeData<T> child : children) {
	            levels.get(level).add(child);

	            this.buildList(tree, child.getIdentifier(), level + 1);
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
