package shyshop.vn.MVC.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shyshop.vn.MVC.domain.*;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findByEmail(String email);

    // Các phương thức khác được tự động cung cấp bởi JpaRepository, chẳng hạn như:
    // save(), findAll(), deleteById(), v.v.

}
