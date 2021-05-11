package chn.bhmc.dms.core.support.tree;

import java.util.ArrayList;

public class Node<T> {

	private T nodeValue;
	private String identifier;
    private ArrayList<NodeData<T>> children;

    public Node(String identifier, T nodeValue) {
        this.identifier = identifier;
        this.nodeValue = nodeValue;
        children = new ArrayList<NodeData<T>>();
    }

    public String getIdentifier() {
        return identifier;
    }

    public ArrayList<NodeData<T>> getChildren() {
        return children;
    }

	public T getNodeValue() {
		return nodeValue;
	}

	public void setNodeValue(T nodeValue) {
		this.nodeValue = nodeValue;
	}

	public void addChild(String identifier, T data) {
        children.add(new NodeData<T>(identifier, data));
    }

    public boolean hasChildren(){
    	return children.size()==0 ? false:true;
    }
}
