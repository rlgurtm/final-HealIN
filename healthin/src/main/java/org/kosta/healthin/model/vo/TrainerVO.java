package org.kosta.healthin.model.vo;

public class TrainerVO extends MemberVO {
	private String career;
	private int rank;
	private String location;
	private String trainerPhoto;
	private MemberVO membervo;
	
	public TrainerVO() {
		super();
	}

	public TrainerVO(String career, int rank, String location, String trainerPhoto, MemberVO membervo) {
		super();
		this.career = career;
		this.rank = rank;
		this.location = location;
		this.trainerPhoto = trainerPhoto;
		this.membervo = membervo;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTrainerPhoto() {
		return trainerPhoto;
	}

	public void setTrainerPhoto(String trainerPhoto) {
		this.trainerPhoto = trainerPhoto;
	}

	public MemberVO getMembervo() {
		return membervo;
	}

	public void setMembervo(MemberVO membervo) {
		this.membervo = membervo;
	}

	@Override
	public String toString() {
		return "TrainerVO [career=" + career + ", rank=" + rank + ", location=" + location + ", trainerPhoto="
				+ trainerPhoto + ", membervo=" + membervo + "]";
	}
	
	
	
}
