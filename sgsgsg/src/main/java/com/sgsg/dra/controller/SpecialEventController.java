package com.sgsg.dra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/specialEvent/*")
public class SpecialEventController {
    
    @GetMapping("list")
    public String list() {
        return ".specialEvent.list";
    }
}