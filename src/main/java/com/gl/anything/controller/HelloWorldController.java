package com.gl.anything.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gl.anything.vo.GreetingVo;

@Controller
@RequestMapping("/helloservice")
public class HelloWorldController {
	private static final Logger LOG = LoggerFactory.getLogger(HelloWorldController.class);

	@RequestMapping("/greeting")
	@ResponseBody
	public GreetingVo simplyGreeting(@RequestParam String username) {
		LOG.debug("simplyGreeting : " + username);

		GreetingVo vo = new GreetingVo();
		vo.setId(100);
		vo.setGreetAt(new Date());
		vo.setWords("Hi " + username);

		return vo;
	}
}
