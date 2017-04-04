package com.urong.geolocation.structure;

public class ResponseJson {

	private double accuracy;
	private Location location;

	public ResponseJson() {
		// TODO Auto-generated constructor stub
	}

	public ResponseJson(double accuracy, Location location) {
		this.accuracy = accuracy;
		this.location = location;
	}

	public double getAccuracy() {
		return accuracy;
	}

	public void setAccuracy(double accuracy) {
		this.accuracy = accuracy;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

}
