package com.aug.db.enums;

public enum Status {
	New(1),Submit(2),Approve(3),Cancel(4);
	
	private int value;
	
	private Status(int value){
		this.value = value;
	}
	
	public int getValue(){
		return value;
	}

}
