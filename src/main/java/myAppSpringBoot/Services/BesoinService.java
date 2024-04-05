package myAppSpringBoot.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myAppSpringBoot.Models.BesoinModel;
import myAppSpringBoot.Repositories.BesoinRepository;

@Service
public class BesoinService implements BesoinServiceInterface {
    private final BesoinRepository besoinRepository;

    @Autowired
    public BesoinService(BesoinRepository besoinRepository) {
        this.besoinRepository = besoinRepository;
    }

    // Méthode pour récupérer tous les besoins
    @Override
    public List<BesoinModel> getAllBesoins() {
        return besoinRepository.findAll();
    }
}
