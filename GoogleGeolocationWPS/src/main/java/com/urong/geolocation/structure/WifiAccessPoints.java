package com.urong.geolocation.structure;

public class WifiAccessPoints {

	private String macAddress;
	private int signalStrength;
	private int signalToNoiseRatio;

	public WifiAccessPoints() {
		// TODO Auto-generated constructor stub
	}

	public WifiAccessPoints(String macAddress, int signalStrength, int signalToNoiseRatio) {
		this.macAddress = macAddress;
		this.signalStrength = signalStrength;
		this.signalToNoiseRatio = signalToNoiseRatio;
	}

	public String getMacAddress() {
		return macAddress;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}

	public int getSignalStrength() {
		return signalStrength;
	}

	public void setSignalStrength(int signalStrength) {
		this.signalStrength = signalStrength;
	}

	public int getSignalToNoiseRatio() {
		return signalToNoiseRatio;
	}

	public void setSignalToNoiseRatio(int signalToNoiseRatio) {
		this.signalToNoiseRatio = signalToNoiseRatio;
	}

}
