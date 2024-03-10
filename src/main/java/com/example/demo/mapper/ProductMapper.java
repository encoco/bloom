package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.StockDTO;
import com.example.demo.dto.cartDTO;

@Mapper
public interface ProductMapper {
	public List<ProductDTO> getAllProductList();
	public boolean addProduct(ProductDTO product);
	public boolean addStock(ProductDTO product);
	public int findProduct_id(ProductDTO product);
	public ProductDTO findById(int product_id);
	public List<cartDTO> getlistProductById(@Param("product_id") List<Integer> product_id, @Param("email") String email);
	public StockDTO getProductStock(int product_id);
	public cartDTO getcartdto(int product_id);
	public boolean addCart(cartDTO cartdto);
	public boolean findcartitem(cartDTO cartdto);
	public List<cartDTO> getCartItemsByEmail(String email);
	public List<ProductDTO> getProductsByCategory(int categoryId);
	public List<ProductDTO> ProductSearch(String search);
}
