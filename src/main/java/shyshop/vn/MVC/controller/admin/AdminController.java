package shyshop.vn.MVC.controller.admin;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import shyshop.vn.MVC.domain.*;
import shyshop.vn.MVC.service.*;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {
    private AdminService adminService;
    private UserService userService;
    private ProductService productService;

    public AdminController(AdminService adminService, UserService userService, ProductService productService) {
        this.adminService = adminService;
        this.userService = userService;
        this.productService = productService;
    }

    @GetMapping("/admin")
    public String adminDashborad(Model mode) {
        return "/admin/dashboard";
    }

    @GetMapping("/admin/users/viewuser")
    public String showUser(Model model) {
        // Lấy danh sách người dùng từ UserService
        List<User> users = userService.findAll();
        // Thêm danh sách người dùng vào model
        model.addAttribute("users", users);
        // Trả về view (tên trang JSP/HTML mà bạn muốn hiển thị)
        return "admin/users/users";
    }

    @GetMapping("admin/viewoders") // quan li oder
    public String showOders(Model model) {

        return "admin/oders/oders";
    }

    @GetMapping("/admin/products/viewproducts") // trang quan li san pham
    public String showProducts(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        return "admin/products/products"; // dieu huong qua trang san pham
    }

    @PostMapping("/admin/users/delete/{id}") // method xoa user
    public String deleteUser(Model model, @PathVariable long id) {
        userService.deleteById(id);
        return "redirect:/admin/users/viewuser";
    }

    @PostMapping("/admin/user/profile/{id}")
    public String showUserProfile(Model model, @PathVariable long id) {
        Optional<User> userOptional = adminService.findById(id);
        if (userOptional.isPresent()) {
            model.addAttribute("user", userOptional.get()); // chuyen optinal qua User truoc khi truyen qua view
        } else {
            model.addAttribute("error", "Không tìm thấy người dùng!");
        }
        return "admin/users/updateuser";
    }

    @PostMapping("/admin/users/update") // method update user
    public String updateUser(Model model, @ModelAttribute("user") User user) {
        adminService.save(user);
        return "redirect:/admin/users/viewuser";
    }

    @GetMapping("/admin/user/create")
    public String getUserNew(@ModelAttribute("user") User user) {
        return "admin/users/createuser";
    }

}
