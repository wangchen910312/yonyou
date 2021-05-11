package chn.bhmc.dms.core.support.tree;

public class NodeData<T> {

	private String identifier;
	T data;

	public NodeData(String identifier, T data){
		this.identifier = identifier;
		this.data = data;
	}

	public String getIdentifier() {
		return identifier;
	}
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}


}
