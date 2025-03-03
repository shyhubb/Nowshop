package shyshop.vn.MVC.controller.admin;

import org.springframework.stereotype.Controller;
import shyshop.vn.MVC.domain.Product;
import shyshop.vn.MVC.service.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ProductController {
    private ProductService productService;

    ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/addproduct")
    public String getRegister(@ModelAttribute("product") Product product) {
        return "client/register"; // Trả về trang đăng ký
    }

}
