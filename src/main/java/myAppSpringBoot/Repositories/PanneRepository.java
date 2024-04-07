package myAppSpringBoot.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import myAppSpringBoot.Models.PanneModel;

@Repository
public interface PanneRepository extends JpaRepository<PanneModel, Integer>  {

}
