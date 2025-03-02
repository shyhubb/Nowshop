package shyshop.vn.MVC.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import shyshop.vn.MVC.domain.*;
import shyshop.vn.MVC.service.*;

@Controller
public class UserController {

    private UserService userService;

    UserController(UserService userService) {
        this.userService = userService;
    }

    // Trang chủ
    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage";
    }

    // Trang đăng ký, thêm đối tượng "user" vào model
    @GetMapping("/user/register")
    public String getRegister(@ModelAttribute("user") User user) {
        return "client/register"; // Trả về trang đăng ký
    }

    // Trang login
    @GetMapping("/user/login")
    public String login(@ModelAttribute("user") User user) {
        return "client/login"; // Trả về trang đăng ký
    }

    // Xử lý khi form đăng ký được submit
    @PostMapping("/user/register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        // check all truong info
        if (user.getEmail() == null || user.getName() == null || user.getPassword() == null) {
            model.addAttribute("message", "Vui lòng điền đầy đủ thông tin.");
            return "client/register"; // Trả về trang đăng ký nếu thiếu thông tin
        } else {
            // Thử lưu người dùng vào cơ sở dữ liệu
            if (userService.save(user) == null) {
                model.addAttribute("message", "Đăng kí tài khoản thất bại. Tài khoản có thể đã tồn tại.");
            } else {
                model.addAttribute("message", "Đăng kí tài khoản thành công.");
            }
            return "client/login"; // Chuyển đến trang đăng nhập
        }
    }

}
