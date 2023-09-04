package com.packt.cardatabase.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.packt.cardatabase.domain.AccountCredentials;
import com.packt.cardatabase.service.JwtService;

@RestController
public class LoginController {
	@Autowired
	private JwtService jwtService;
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ResponseEntity<?> getToken(@RequestBody AccountCredentials credentials) {
		// 토큰을 생성하고 응답의 Authorization 헤더로 보냄 
		UsernamePasswordAuthenticationToken creds = 
				new UsernamePasswordAuthenticationToken(
						credentials.getUsername(), credentials.getPassword());
		
		Authentication auth = authenticationManager.authenticate(creds);
		
		// 토큰 생성 
		String jwts = jwtService.getToken(auth.getName());
		
		// 생성된 토큰으로 응답을 설정 
		return ResponseEntity.ok()
				.header(HttpHeaders.AUTHORIZATION, "Bearer"+jwts)
				.header(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, "Authorization")
				.build();
	}
}
