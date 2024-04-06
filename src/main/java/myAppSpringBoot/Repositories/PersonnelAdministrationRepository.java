package myAppSpringBoot.Repositories;

import myAppSpringBoot.Models.PersonnelAdministrationModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import myAppSpringBoot.Models.PersonnelAdministrationModel;
@Repository
public interface PersonnelAdministrationRepository extends JpaRepository<PersonnelAdministrationModel, String> {

}
