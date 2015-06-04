package com.aug.db.enums;

public enum Attitude {
	D(1),I(2),S(3),C(3);
	
	private int value;
	
	private Attitude(int value){
		this.value = value;
	}
	
	public int getValue(){
		return value;
	}

}
