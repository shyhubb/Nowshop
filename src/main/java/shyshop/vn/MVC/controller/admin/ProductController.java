package shyshop.vn.MVC.controller.admin;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.stereotype.Controller;
import shyshop.vn.MVC.domain.Product;
import shyshop.vn.MVC.service.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {
    private ProductService productService;

    ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/addproduct")
    public String getRegister(@ModelAttribute("product") Product product) {
        return "admin/products/newproduct"; // dieu huong qua trang san pham
    }

    @PostMapping("/admin/products/addproduct")
    public String addProduct(@ModelAttribute("product") Product product) {
        productService.save(product);
        return "redirect:/admin/products/viewproducts";
    }

    @PostMapping("/admin/deleteproduct/{id}")
    public String deleteProduct(@PathVariable long id) {
        productService.deleteById(id);
        return "redirect:/admin/products/viewproducts";
    }

}
