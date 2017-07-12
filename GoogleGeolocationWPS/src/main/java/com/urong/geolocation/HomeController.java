package com.urong.geolocation;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.urong.geolocation.structure.ResponseJson;
import com.urong.geolocation.structure.WPS;
import com.urong.geolocation.structure.WifiAccessPoints;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/google/wps/multi")
	public ModelAndView callGoogleWPS(ModelAndView mav, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		RestTemplate rest = new RestTemplate();
		ObjectMapper mapper = new ObjectMapper();

		ServletContext context = req.getSession().getServletContext();
		String fullPath = context.getRealPath("/file/test.json");

		WPS wps = mapper.readValue(new File(fullPath), WPS.class);

		String url = "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyBILRy7sQ7lCr6aPQ90sp9V3gLg6zBddVM";
		String returnJson = rest.postForObject(url, wps, String.class);

		ResponseJson jsonOject = mapper.readValue(returnJson, ResponseJson.class);

		double latitude = jsonOject.getLocation().getLat();
		double longitude = jsonOject.getLocation().getLng();

		mav.addObject("latitude", latitude);
		mav.addObject("longitude", longitude);

		mav.addObject("returnJson", returnJson);

		mav.setViewName("google");

		return mav;
	}

	@RequestMapping(value = "/google/wps/single")
	public ModelAndView callSingleWPS(ModelAndView mav) throws JsonParseException, JsonMappingException, IOException {

		RestTemplate rest = new RestTemplate();
		WPS wps = new WPS();

		List<WifiAccessPoints> wpsList = new ArrayList<WifiAccessPoints>();
		WifiAccessPoints wifi = new WifiAccessPoints();

		wifi.setMacAddress("00:1d:93:b0:02:60");
		wifi.setSignalStrength(-87);
		wifi.setSignalToNoiseRatio(0);

		wpsList.add(wifi);

		wps.setWifiAccessPoints(wpsList);

		String url = "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyBILRy7sQ7lCr6aPQ90sp9V3gLg6zBddVM";
		String returnJson = rest.postForObject(url, wps, String.class);

		ObjectMapper mapper = new ObjectMapper();

		ResponseJson jsonOject = mapper.readValue(returnJson, ResponseJson.class);

		double latitude = jsonOject.getLocation().getLat();
		double longitude = jsonOject.getLocation().getLng();

		mav.addObject("latitude", latitude);
		mav.addObject("longitude", longitude);

		mav.addObject("returnJson", returnJson);

		mav.setViewName("google");

		return mav;

	}

	@RequestMapping(value = "/html5")
	public ModelAndView callHtml5(ModelAndView mav) {

		mav.setViewName("html5");

		return mav;
	}

	@RequestMapping(value = "/html5/watch")
	public ModelAndView callHtml5Watch(ModelAndView mav) {

		mav.setViewName("html5_watch");

		return mav;
	}

	@RequestMapping(value = "/html5/detail")
	public ModelAndView callHtml5Detail(ModelAndView mav) {

		mav.setViewName("html5_detail");

		return mav;
	}

}
