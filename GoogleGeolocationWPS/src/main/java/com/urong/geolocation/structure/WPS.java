package com.urong.geolocation.structure;

import java.util.List;

public class WPS {

	private String considerIp;
	private List<WifiAccessPoints> WifiAccessPoints;

	public WPS() {
		// TODO Auto-generated constructor stub
	}

	public WPS(String considerIp, List<WifiAccessPoints> wifiAccessPoints) {
		this.considerIp = considerIp;
		WifiAccessPoints = wifiAccessPoints;
	}

	public String getConsiderIp() {
		return considerIp;
	}

	public void setConsiderIp(String considerIp) {
		this.considerIp = considerIp;
	}

	public List<WifiAccessPoints> getWifiAccessPoints() {
		return WifiAccessPoints;
	}

	public void setWifiAccessPoints(List<WifiAccessPoints> wifiAccessPoints) {
		WifiAccessPoints = wifiAccessPoints;
	}

}
