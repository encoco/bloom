package com.example.demo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.ReviewDTO;
import com.example.demo.dto.StockDTO;
import com.example.demo.dto.cartDTO;

import com.example.demo.service.ProductService;
import com.example.demo.service.ReviewService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller

public class ProductController {
    private ProductService service;
    private ReviewService rservice;
    @Autowired
    public ProductController(ProductService service, ReviewService rservice) {
		this.service = service;
		this.rservice = rservice;
    }
    
    @GetMapping("/ProductRegistration")
    public String ProductRegistration() {
        return "ProductRegistration";
    }

    @PostMapping("/ProductRegistration")
    public String postRegistration(ProductDTO product) throws IOException {
        if(!product.getImg1Path().isEmpty()) {
            product.setImg1(service.uploadFile(product.getImg1Path(), "uploads"));
        }
        if(!product.getImg2Path().isEmpty()) {
            product.setImg2(service.uploadFile(product.getImg2Path(), "uploads"));
        }
        if(!product.getImg3Path().isEmpty()) {
            product.setImg3(service.uploadFile(product.getImg3Path(), "uploads"));
        }
        if(!product.getImg4Path().isEmpty()) {
            product.setImg4(service.uploadFile(product.getImg4Path(), "uploads"));
        }
        service.addProduct(product);
        return "redirect:/";
    }

    @GetMapping("/product_all")
    public String product_all(Model model) {
        List<ProductDTO> products = service.allProduct();
        model.addAttribute("products", products);
        return "product_all";
    }
    @GetMapping("/product_detail")
    public String productDetail(Model model, int product_id) {
        ProductDTO product = service.getProductById(product_id);
        StockDTO stock = service.getProductStock(product_id);
        List<ReviewDTO> review = rservice.getReview(product_id);
        long nonNullReviewImgCount = review.stream()
        	    .filter(item -> item.getReview_img() != null)
        	    .count();
        long NullReviewImgCount = review.stream()
        	    .filter(item -> item.getReview_img() == null)
        	    .count();
        model.addAttribute("textreview" ,NullReviewImgCount);
        model.addAttribute("imgreview" ,nonNullReviewImgCount);
        model.addAttribute("review" ,review);
        model.addAttribute("product", product);
        model.addAttribute("stock", stock);
        return "product_detail";
    }
    
    
    @PostMapping("/addcart")
    @ResponseBody
    public ResponseEntity<?> addCart(@RequestBody cartDTO cartDto, HttpSession session) {
        String email = (String) session.getAttribute("email");
        cartDto.setEmail(email);
        if (email == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인을 해야합니다."));
        } else {
            String result = service.addToCart(cartDto);
            if (result.equals("추가막음")) {
                return ResponseEntity.ok(Map.of("success", false, "message", "이미 장바구니에 존재합니다."));
            } else {
                return ResponseEntity.ok(Map.of("success", true, "message", "상품이 장바구니에 추가되었습니다."));
            }
        }
    }
    
    @GetMapping("/cart")
    public String viewCart(Model model, HttpSession session ,HttpServletRequest request) {
        // 세션에서 로그인한 사용자의 이메일을 가져옴
        String email = (String) session.getAttribute("email");
        if(email == null) {
        	request.setAttribute("msg", "로그인해야합니다.");
			request.setAttribute("url", "login");
			return "alert";
        }
        // 이메일을 기반으로 장바구니 목록을 조회
        List<cartDTO> cartItems = service.getCartItemsByEmail(email);
        // 조회한 장바구니 목록을 모델에 추가하여 뷰로 전달
        model.addAttribute("cart", cartItems);
        return "cart"; // 장바구니 목록을 표시할 JSP 페이지로 이동
    }
   
    @PostMapping("/solobuy")
    public String order(Model model,@RequestParam("selectedItems")int product_id, HttpSession session, HttpServletRequest request,
    						@RequestParam String size, @RequestParam int quantityInput) {
    	String email = (String) session.getAttribute("email");
    	if(email == null) {
        	request.setAttribute("msg", "로그인해야합니다.");
			request.setAttribute("url", "login");
			return "alert";
        }
    	cartDTO temp = service.getcartdto(product_id);
    	temp.setSize(size);
    	temp.setQuantity(quantityInput);
    	int totalAmount = temp.getPrice() * temp.getQuantity();
    	List<cartDTO> product = new ArrayList<cartDTO>();
    	product.add(temp);
    	model.addAttribute("product",product);
    	model.addAttribute("totalAmount",totalAmount);
    	return "buy";
    }
    
    @PostMapping("/buy")
    public String submitOrder(Model model, HttpSession session,
                              @RequestParam("selectedItems") List<Integer> selectedItems , HttpServletRequest request) {
        String email = (String) session.getAttribute("email");
        if(email == null) {
        	request.setAttribute("msg", "로그인해야합니다.");
			request.setAttribute("url", "login");
			return "alert";
        }
        List<cartDTO> product = service.getlistProductById(selectedItems, email);

        int totalAmount = product.stream()
                              .mapToInt(item -> item.getPrice() * item.getQuantity())
                              .sum();
        model.addAttribute("product", product);
        
        model.addAttribute("totalAmount", totalAmount);
        return "buy";
    }
    
    
    
    @GetMapping("/category")
    public String category(@RequestParam int category, Model model) {
    	System.out.println(category);
    	List<ProductDTO> products = service.getProductsByCategory(category);
        model.addAttribute("products", products);
    	return "product_all";
    }
    
    @GetMapping("/search")
    public String search(@RequestParam String search, Model model) {
    	List<ProductDTO> products = service.ProductSearch(search);
    	model.addAttribute("products",products);
    	return "product_all";
    }
}

