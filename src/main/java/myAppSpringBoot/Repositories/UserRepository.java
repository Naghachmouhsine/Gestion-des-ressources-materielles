package myAppSpringBoot.Repositories;

import org.springframework.stereotype.Repository;
import myAppSpringBoot.Models.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface UserRepository extends JpaRepository<UserModel, String> {

	 UserModel findUserByCin(String cin);
	 
	 UserModel findUserByEmail(String email);
}
