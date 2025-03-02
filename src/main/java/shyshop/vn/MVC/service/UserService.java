package shyshop.vn.MVC.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import shyshop.vn.MVC.domain.*;
import shyshop.vn.MVC.repository.*;

@Service
public class UserService {

    private final UserRepository userRepository;

    // Constructor injection
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Các phương thức của UserService sẽ gọi trực tiếp các phương thức từ
    // UserRepository

    // Save user
    public User save(User user) {
        return userRepository.save(user);
    }

    // Find all users
    public List<User> findAll() {
        return userRepository.findAll();
    }

    // Find user by email
    public List<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // Find user by id
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    // Delete user by id
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    // Delete users by a list of ids
    public void deleteAllByIdInBatch(Iterable<Long> ids) {
        userRepository.deleteAllByIdInBatch(ids);
    }
}
