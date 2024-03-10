package com.example.demo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.example.demo.Config.S3Config;
import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.StockDTO;
import com.example.demo.dto.cartDTO;
import com.example.demo.mapper.ProductMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
    private ProductMapper productMapper;
    private S3Config s3Config;
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    @Autowired
    public ProductService(ProductMapper productmapper, S3Config s3Config, @Value("${cloud.aws.s3.bucket}") String bucket) {
		this.productMapper = productmapper;
    	this.s3Config = s3Config;
    	 this.bucket = bucket + "/uploads/";
    }
    
    public String uploadFile(MultipartFile file, String path) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String newFilename = UUID.randomUUID().toString() + extension; //고유번호 + 확장자로 이름 리네임

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(file.getSize()); // 파일 크기 설정

        // 	S3에 파일 업로드
        s3Config.amazonS3Client().putObject(new PutObjectRequest(bucket + "/" + path, newFilename, file.getInputStream(), metadata));
        
        // 올바른 경로의 URL 주소를 생성하여 저장
        String s3Url = s3Config.amazonS3Client().getUrl(bucket + "/"+path, newFilename).toString();
        return s3Url; //db에 url 저장을 위해 return
    }
    
    public int product_id(ProductDTO product) {
    	return productMapper.findProduct_id(product);
    }
    
    
    public List<ProductDTO> getProductsByCategory(int categoryId) {
        return productMapper.getProductsByCategory(categoryId);
    }
    
    public String addProduct(ProductDTO product) {
    	if(productMapper.addProduct(product)) {
        	productMapper.addStock(product);
        }
        else return "/";
        return "/";
    }
    public ProductDTO getProductById(int product_id) {
        return productMapper.findById(product_id);
    }
    public List<cartDTO> getlistProductById(@Param("product_id") List<Integer> product_id,  @Param("email") String email) {
        return productMapper.getlistProductById(product_id, email);
    }
    public List<ProductDTO> allProduct() {
    	return productMapper.getAllProductList();
    }
    public StockDTO getProductStock(int product_id) {
    	return productMapper.getProductStock(product_id);
    }
    public cartDTO getcartdto(int product_id) {
    	return productMapper.getcartdto(product_id);
    }
    public String addToCart(cartDTO cartdto) {
    	if(productMapper.findcartitem(cartdto)) {
    		return "추가막음";
    	}
    	productMapper.addCart(cartdto);
		return "성공";
    }
    public List<cartDTO> getCartItemsByEmail(String email) {
        // 이메일을 기반으로 장바구니 목록을 데이터베이스에서 조회합니다.
        return productMapper.getCartItemsByEmail(email);
    }
    
    public List<ProductDTO> ProductSearch(String search){
    	return productMapper.ProductSearch(search);
    }
}
