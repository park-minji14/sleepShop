package com.sgsg.dra.controller;

import com.sgsg.dra.domain.ExpertApply;
import com.sgsg.dra.service.ExpertApplyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/expertapply/*")
public class ExpertApplyController {

    @Autowired
    private ExpertApplyService expertApplyService;

    @GetMapping("apply")
    public String showApplyForm(Model model) {
        model.addAttribute("expertApply", new ExpertApply());
        return ".expertapply.apply";
    }

    @PostMapping("apply")
    public String submitApplyForm(@ModelAttribute ExpertApply expertApply) {
        expertApplyService.applyExpert(expertApply);
        // return "redirect:/expertapply/submit";
        return ".expertapply.submit";
    }

    /*
    @GetMapping("list")
    public String listAllExpertApplies(Model model) {
        List<ExpertApply> expertApplies = expertApplyService.getAllExpertApplies();
        model.addAttribute("expertApplies", expertApplies);
        return "expertApplyList";
    }

    @GetMapping("view/{apply_num}")
    public String viewExpertApply(@PathVariable long apply_num, Model model) {
        ExpertApply expertApply = expertApplyService.getExpertApplyById(apply_num);
        model.addAttribute("expertApply", expertApply);
        return "expertApplyView";
    }

    @GetMapping("edit/{apply_num}")
    public String showEditForm(@PathVariable long apply_num, Model model) {
        ExpertApply expertApply = expertApplyService.getExpertApplyById(apply_num);
        model.addAttribute("expertApply", expertApply);
        return "expertApplyEditForm";
    }

    @GetMapping("delete/{apply_num}")
    public String deleteExpertApply(@PathVariable long apply_num) {
        expertApplyService.deleteExpertApply(apply_num);
        return "redirect:/expertApply/list";
    }
    */
}
