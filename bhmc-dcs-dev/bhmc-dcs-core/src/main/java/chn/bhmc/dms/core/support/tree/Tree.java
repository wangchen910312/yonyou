package chn.bhmc.dms.core.support.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Tree<T> {

	private final static Logger log = LoggerFactory.getLogger(Tree.class);
	private final static int ROOT = 0;

    private HashMap<String, Node<T>> nodes;
    private TraversalStrategy traversalStrategy;

    public Tree() {
        this(TraversalStrategy.DEPTH_FIRST);
    }

    public Tree(TraversalStrategy traversalStrategy) {
        this.nodes = new HashMap<String, Node<T>>();
        this.traversalStrategy = traversalStrategy;
    }

    public HashMap<String, Node<T>> getNodes() {
        return nodes;
    }

    public TraversalStrategy getTraversalStrategy() {
        return traversalStrategy;
    }

    public void setTraversalStrategy(TraversalStrategy traversalStrategy) {
        this.traversalStrategy = traversalStrategy;
    }

    public Node<T> addNode(String identifier, T obj) {
        return this.addNode(identifier, null, obj);
    }

    public Node<T> addNode(String identifier, String parent, T obj) {

    	Node<T> node = nodes.get(identifier);

    	if(node == null){
	        node = new Node<T>(identifier, obj);
	        nodes.put(identifier, node);
    	}else{
    		if(node.getNodeValue() == null){
    			node.setNodeValue(obj);
    		}
    	}

        if (parent != null) {
        	if(nodes.get(parent) == null){
        		Node<T> parentNode = new Node<T>(parent, null);
        		nodes.put(parent, parentNode);
        		parentNode.addChild(identifier, obj);
        	}else{
        		nodes.get(parent).addChild(identifier, obj);
        	}
        }

        return node;
    }

    public void display(String identifier) {
        this.display(identifier, ROOT);
    }

    public void display(String identifier, int depth) {
        ArrayList<NodeData<T>> children = nodes.get(identifier).getChildren();

        if (depth == ROOT) {
            log.debug(nodes.get(identifier).getIdentifier());
        } else {
            String tabs = String.format("%0" + depth + "d", 0).replace("0", "    "); // 4 spaces
            log.debug(tabs + nodes.get(identifier).getIdentifier());
        }
        depth++;
        for (NodeData<T> child : children) {

            this.display(child.getIdentifier(), depth);
        }
    }

    public Iterator<Node<T>> iterator(String identifier) {
        return this.iterator(identifier, traversalStrategy);
    }

    public Iterator<Node<T>> iterator(String identifier, TraversalStrategy traversalStrategy) {
        return traversalStrategy == TraversalStrategy.BREADTH_FIRST ?
                new BreadthFirstTreeIterator<T>(nodes, identifier) :
                new DepthFirstTreeIterator<T>(nodes, identifier);
    }

    public Object buildTreeModel(String identifier, TreeModel<T> model, TreeModelBuilder<T> strategy){

    	if(nodes.isEmpty()) return null;

    	return strategy.buildTreeModel(identifier, model, this);
    }

}
