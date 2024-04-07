package myAppSpringBoot.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import myAppSpringBoot.Models.PersonnelAdministrationModel;
import myAppSpringBoot.Services.PersonnelAdministrationServiceInterface;

@RestController
@RequestMapping("/backend/personnel-administrations/")
public class PersonnelAdministrationController {
	
	@Autowired
	private PersonnelAdministrationServiceInterface personnelAdministrationService;
	
	@GetMapping
    public List<PersonnelAdministrationModel> getAllPersonnel() {
        return personnelAdministrationService.getAllPersonnel();
    }

}
