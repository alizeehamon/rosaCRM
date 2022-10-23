package com.example.rosacrm.controller;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.entity.Note;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.enumeration.ProspectionStatus;
import com.example.rosacrm.service.CompanyService;
import com.example.rosacrm.service.ProspectService;
import com.example.rosacrm.service.UserService;
import com.example.rosacrm.utils.SortByDate;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequestMapping("/prospects")
public class ProspectController {

    private final ProspectService prospectService;

    private final CompanyService companyService;
    private final UserService userService;

    public ProspectController(ProspectService prospectService, CompanyService companyService, UserService userService) {
        this.prospectService = prospectService;
        this.companyService = companyService;
        this.userService = userService;
    }

    @GetMapping("/all")
    public String displayProspectList(Model model, @Param("prospectName") String prospectName, @Param("filterByStatus") String filterByStatus, Authentication authentication) {
        User user = userService.getCurrentUser(authentication.getName());
        List<CompanyDTO> companyList = companyService.getAllCompanies(null, user);
        List<ProspectDTO> searchProspectsByStatusAndName = prospectService.searchProspectsByStatusAndName(prospectName, filterByStatus, user);
        model.addAttribute("prospects", searchProspectsByStatusAndName);
        model.addAttribute("prospectName", prospectName);
        model.addAttribute("companies", companyList);
        model.addAttribute("prospectStatusList", ProspectionStatus.getValuesWithoutOver());
        return "prospectList";
    }

    @PostMapping("/add")
    public String addProspect(ProspectDTO prospectDTO, Authentication authentication) {
        User user = userService.getCurrentUser(authentication.getName());
        prospectService.addProspect(prospectDTO, user);
        return "redirect:/prospects/all";
    }

    @PostMapping("/delete/{id}")
    public String deleteProspect(@PathVariable Long id) {
        prospectService.deleteProspect(id);
        return "redirect:/prospects/all";
    }

    @GetMapping("/see/{id}")
    public String displayProspectDetails(Model model, @PathVariable Long id) {
        ProspectDTO prospectDTO = prospectService.findProspectById(id);
        model.addAttribute("prospect", prospectDTO);
        List<Note> notes = prospectDTO.getNotesById();
        notes.sort(new SortByDate());
        model.addAttribute("notes", notes);
        model.addAttribute("notStarted", ProspectionStatus.NOT_STARTED.getValue());
        return "prospectPage";
    }

    @PostMapping("/edit")
    public RedirectView postEditProspect(ProspectDTO prospectDTO) {
        prospectService.editProspect(prospectDTO);
        return new RedirectView("/prospects/all");
    }

    @PostMapping("/edit-status-to-contact")
    public RedirectView postEditProspectStatusToContact(ProspectDTO prospectDTO) {
        prospectService.postEditProspectStatusToContact(prospectDTO);
        return new RedirectView("/prospects/see/" + prospectDTO.getId());
    }
}
