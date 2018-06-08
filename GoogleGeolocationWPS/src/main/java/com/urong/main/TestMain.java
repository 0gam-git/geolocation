package com.urong.main;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TestMain {

	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {

		Map<String, Object> hashMap = new LinkedHashMap<String, Object>();
		hashMap.put("k", "v1");
		hashMap.put("k", "v2");

		// this key duplicate.
		if (hashMap.values().contains("v1")) {
			System.out.println("true");
		} else {
			System.out.println("false");
		}

		/* ----------------------------------------- */

		String json = "{\n" + "  \"root\": [\n" + "   {\"k\":\"v1\"},\n" + "   {\"k\":\"v2\"}\n" + "  ]\n" + "}";

		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readValue(json, JsonNode.class);

		if (node.findPath("k").asText().matches("v1")) {
			System.out.println("true");
		} else {
			System.out.println("false");
		}
	}

}
