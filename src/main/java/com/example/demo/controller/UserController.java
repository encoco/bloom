package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.ReviewDTO;
import com.example.demo.dto.UserDTO;
import com.example.demo.dto.orderDTO;
import com.example.demo.service.ProductService;
import com.example.demo.service.ReviewService;
import com.example.demo.service.UserService;
import com.example.demo.service.orderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private UserService service;
	private ProductService Pservice;
	private orderService oservice;
	private ReviewService rService;
	public UserController(UserService service, ProductService pservice, orderService oservice, ReviewService rservice) {
		this.service = service;
		this.Pservice = pservice;
		this.oservice = oservice;
		this.rService = rservice;
	}

	@GetMapping("/")
	public String index(Model model) {
		List<ProductDTO> products = Pservice.allProduct();
        model.addAttribute("products", products);
        return "index";
	}

	@GetMapping("/checkEmailDuplication")
	@ResponseBody
	public Map<String, Boolean> checkEmailDuplication(@RequestParam String email) {
		boolean isDuplicated = service.isEmailDuplicated(email); // 이메일이 중복인지 확인하는 서비스 메소드
		Map<String, Boolean> response = new HashMap<>();
		response.put("isDuplicated", isDuplicated);
		return response;
	}
	@GetMapping("/logincheck")
	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> logincheck(HttpSession session) {
	    Map<String, Boolean> response = new HashMap<>();
	    boolean isLoggedIn = session.getAttribute("email") != null;
	    response.put("loggedIn", isLoggedIn);
	    return ResponseEntity.ok(response);
	}

	// 회원가입
	@GetMapping("/register")
	public String register(HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("email");
		if (id == null) {
			return "/register";
		} else { // 이미 로그인되어있을 때
			request.setAttribute("msg", "이미 로그인 중입니다.");
			request.setAttribute("url", "/");

			return "alert";
		}
	}

	@PostMapping("/register")
	public String registerUser(UserDTO user) {
		service.register(user);
		return "redirect:/login";
	}

	// 로그인
	@GetMapping("/login")
	public String login(HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("email");
		if (id == null) {
			return "/login";
		} else { // 이미 로그인되어있을 때
			request.setAttribute("msg", "이미 로그인 중입니다.");
			request.setAttribute("url", "/");

			return "alert";
		}
	}
	
	@PostMapping("/login")
	public String login(String email, String userpwd, HttpSession session, HttpServletRequest request) {
		int login_yn = service.getuserpwd(email, userpwd);
		if (login_yn == 0) {
			request.setAttribute("msg", "아이디가 존재하지 않습니다.");
			request.setAttribute("url", "/login");
			return "alert";
		} else if (login_yn == 1) {
			request.setAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "/login");
			return "alert";
		} else if (login_yn == 2) {
			session.setAttribute("email", email);
			if (service.EmailReq(email) == 9) {
                session.setAttribute("isAdmin", true);
            }
			request.setAttribute("msg", "로그인되었습니다.");
			request.setAttribute("url", "/");
			return "alert";
		} else {
			request.setAttribute("msg", "database error.");
			request.setAttribute("url", "/login");
			return "alert";
		}
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		request.setAttribute("msg", "로그아웃되었습니니다.");
		request.setAttribute("url", "/");
		session.invalidate();
		return "alert";
	}

	// 내정보
	@GetMapping("/MyPage")
	public String MyPage(HttpSession session, Model model , HttpServletRequest request) {

		String userEmail = (String) session.getAttribute("email");
		if (userEmail != null) {
			UserDTO user = service.findUserByEmail(userEmail);
			List<orderDTO> buy = oservice.allbuyproduct(userEmail);
			List<ProductDTO> review = rService.NoReivew(userEmail);
			System.out.println(review);
			List<ReviewDTO> clreview = rService.YesReview(userEmail);
			if (user != null) {
				model.addAttribute("review", review);
				model.addAttribute("clreview", clreview);
				model.addAttribute("user", user);
				model.addAttribute("myBuy", buy);
			}
			return "MyPage";
		}
		else {
			request.setAttribute("msg", "로그인해주세요.");
			request.setAttribute("url", "/login");
			return "alert";
		}
	}

	@GetMapping("/header")
	public String header(){
		return "header";
	}

	@GetMapping("/changePwd")
	public String change_Pwd(){
		return "changePwd";
	}
	@PostMapping("/changePwd")
	public String changePwd(String userpwd,String ch_Pwd, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		int login_yn = service.getuserpwd(email, userpwd);
		if (login_yn == 1) {
			request.setAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "/changePwd");
			return "alert";
		} else if (login_yn == 2) {
			if(service.changepwd(email,ch_Pwd)) {
				request.setAttribute("msg", "변경 완료하였습니다.");
				request.setAttribute("url", "/MyPage");
			}
			else {
				request.setAttribute("msg", "database error.");
				request.setAttribute("url", "/login");
			}
			return "alert";
		} else {
			request.setAttribute("msg", "database error.");
			request.setAttribute("url", "/login");
			return "redirect:/MyPage";
		}
	}

	@GetMapping("/Change_my_information")
	public String showChange_my_information() {
		return "Change_my_information";
	}

	@GetMapping("/FinePwd")
	public String FinePwd() {
		return "FinePwd";
	}

	@PostMapping("/FinePwd")
	public String FinePwd2(String email, String ch_Pwd, HttpServletRequest request) {
		if(service.changepwd(email,ch_Pwd)) {
			request.setAttribute("msg", "변경 완료하였습니다.");
			request.setAttribute("url", "/login");
		}
		else {
			request.setAttribute("msg", "변경 실패.");
			request.setAttribute("url", "/FinePwd");
		}
		return "alert";
	}
	
	
}