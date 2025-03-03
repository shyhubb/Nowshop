package shyshop.vn.MVC.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shyshop.vn.MVC.domain.*;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // method emplememt
}