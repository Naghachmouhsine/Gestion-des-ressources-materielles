package myAppSpringBoot.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import myAppSpringBoot.Models.AppelOffreModel;
@Repository
public interface GestionAppelOffreRepository extends JpaRepository<AppelOffreModel,Integer> {

}