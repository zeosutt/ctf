/*
 * Decompiled with CFR 0.141.
 * 
 * Could not load the following classes:
 *  javax.servlet.http.HttpServletRequest
 *  javax.servlet.http.HttpSession
 *  org.springframework.beans.factory.annotation.Autowired
 *  org.springframework.stereotype.Controller
 *  org.springframework.ui.Model
 *  org.springframework.web.bind.WebDataBinder
 *  org.springframework.web.bind.annotation.InitBinder
 *  org.springframework.web.bind.annotation.ModelAttribute
 *  org.springframework.web.bind.annotation.RequestMapping
 *  org.springframework.web.bind.annotation.RequestParam
 *  org.springframework.web.servlet.mvc.support.RedirectAttributes
 */
package ru.volgactf.shop.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.volgactf.shop.dao.ProductDao;
import ru.volgactf.shop.dao.UserDao;
import ru.volgactf.shop.models.Product;
import ru.volgactf.shop.models.User;

@Controller
public class ShopController {
    @Autowired
    private UserDao userDao;
    @Autowired
    private ProductDao productDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields(new String[]{"balance"});
    }

    @ModelAttribute(value="user")
    public User getUser(HttpServletRequest request) {
        return request.getAttribute("user") != null ? (User)request.getAttribute("user") : new User();
    }

    @RequestMapping(value={"", "/", "/index"})
    public String index(@ModelAttribute(value="message") String message, @ModelAttribute(value="user") User user, Model templateModel) {
        templateModel.addAttribute("products", this.productDao.geProducts());
        return "shop";
    }

    @RequestMapping(value={"/login"})
    public String login(@ModelAttribute(value="message") String message) {
        return "login";
    }

    @RequestMapping(value={"/registration"})
    public String registration(@ModelAttribute(value="message") String message) {
        return "registration";
    }

    @RequestMapping(value={"/logout"})
    public String registration(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("user_id", null);
        return "redirect:index";
    }

    @RequestMapping(value={"/loginProcess"})
    public String login(@RequestParam String name, @RequestParam String pass, Model templateModel, RedirectAttributes redir, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = this.userDao.login(name, pass);
        if (user != null) {
            session.setAttribute("user_id", (Object)user.getId());
            redir.addFlashAttribute("message", (Object)"Successful login");
            return "redirect:index";
        }
        redir.addFlashAttribute("message", (Object)"Invalid username or password");
        return "redirect:login";
    }

    @RequestMapping(value={"/registrationProcess"})
    public String registration(@RequestParam String name, @RequestParam String pass, Model templateModel, RedirectAttributes redir, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (this.userDao.findByName(name) == null) {
            User user = this.userDao.register(name, pass);
            session.setAttribute("user_id", (Object)user.getId());
            redir.addFlashAttribute("message", (Object)"Successful registration");
            return "redirect:index";
        }
        redir.addFlashAttribute("message", (Object)"User already exists");
        return "redirect:registration";
    }

    @RequestMapping(value={"/profile"})
    public String profile(@ModelAttribute(value="user") User user, Model templateModel, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("user_id") == null) {
            return "redirect:index";
        }
        ArrayList cart = new ArrayList();
        user.getCartItems().forEach(p -> cart.add(this.productDao.geProduct(p.getId())));
        templateModel.addAttribute("cart", cart);
        return "profile";
    }

    /*
     * Enabled aggressive block sorting
     */
    @RequestMapping(value={"/buy"})
    public String buy(@RequestParam Integer productId, @ModelAttribute(value="user") User user, RedirectAttributes redir, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("user_id") == null) {
            return "redirect:index";
        }
        Product product = this.productDao.geProduct(productId);
        if (product == null) {
            redir.addFlashAttribute("message", (Object)"Product not found");
            return "redirect:index";
        }
        if (product.getPrice() > user.getBalance()) {
            redir.addFlashAttribute("message", (Object)"Not enough money");
            return "redirect:index";
        }
        user.setBalance(user.getBalance() - product.getPrice());
        user.getCartItems().add(product);
        this.userDao.update(user);
        redir.addFlashAttribute("message", (Object)"Successful purchase");
        return "redirect:profile";
    }
}
