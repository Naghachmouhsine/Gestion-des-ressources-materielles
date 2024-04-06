package myAppSpringBoot.Repositories;

import org.springframework.stereotype.Repository;

import myAppSpringBoot.Models.PersonnelAdministrationModel;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface PersonnelAdministrationRepository extends JpaRepository<PersonnelAdministrationModel, String> {

}
