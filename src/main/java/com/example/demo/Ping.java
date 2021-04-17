package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Ping {
	@GetMapping("/ping")
	public String ping() {
		return "ping pong";
	}
}
