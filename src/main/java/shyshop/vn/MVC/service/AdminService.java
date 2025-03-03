package shyshop.vn.MVC.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import shyshop.vn.MVC.domain.*;
import shyshop.vn.MVC.repository.*;

@Service
public class AdminService {

    private final AdminRepository adminRepository;

    // Constructor injection
    public AdminService(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    // Save user
    public User save(User user) {
        return adminRepository.save(user);
    }

    // Find all users
    public List<User> findAll() {
        return adminRepository.findAll();
    }

    // Find user by email
    public List<User> findByEmail(String email) {
        return adminRepository.findByEmail(email);
    }

    // Find user by id
    public Optional<User> findById(Long id) {
        return adminRepository.findById(id);
    }

    // Delete user by id
    public void deleteById(Long id) {
        adminRepository.deleteById(id);
    }

    // Delete users by a list of ids
    public void deleteAllByIdInBatch(Iterable<Long> ids) {
        adminRepository.deleteAllByIdInBatch(ids);
    }
}
