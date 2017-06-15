package org.kosta.healthin.model.vo;

public class FieldVO implements VO{
	private String fieldName;
	private String id;
	private String fieldState;
	private String tName;
	private String tAddress;
	private String tTrainerPhoto;
	private int pushCount;
	public FieldVO() {
		super();
	}
	public FieldVO(String fieldName, String id, String fieldState, String tName, String tAddress, String tTrainerPhoto,
			int pushCount) {
		super();
		this.fieldName = fieldName;
		this.id = id;
		this.fieldState = fieldState;
		this.tName = tName;
		this.tAddress = tAddress;
		this.tTrainerPhoto = tTrainerPhoto;
		this.pushCount = pushCount;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFieldState() {
		return fieldState;
	}
	public void setFieldState(String fieldState) {
		this.fieldState = fieldState;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettAddress() {
		return tAddress;
	}
	public void settAddress(String tAddress) {
		this.tAddress = tAddress;
	}
	public String gettTrainerPhoto() {
		return tTrainerPhoto;
	}
	public void settTrainerPhoto(String tTrainerPhoto) {
		this.tTrainerPhoto = tTrainerPhoto;
	}
	public int getPushCount() {
		return pushCount;
	}
	public void setPushCount(int pushCount) {
		this.pushCount = pushCount;
	}
	@Override
	public String toString() {
		return "FieldVO [fieldName=" + fieldName + ", id=" + id + ", fieldState=" + fieldState + ", tName=" + tName
				+ ", tAddress=" + tAddress + ", tTrainerPhoto=" + tTrainerPhoto + ", pushCount=" + pushCount + "]";
	}
	
}
