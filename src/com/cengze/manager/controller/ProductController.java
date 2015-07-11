package com.cengze.manager.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cengze.entity.Manager;
import com.cengze.entity.Product;
import com.cengze.manager.service.ProductService;
import com.cengze.util.PageUtil;
import com.cengze.util.auth.AuthPassport;

@Controller
@RequestMapping("/manager")
public class ProductController {
	
	@Resource
	private ProductService productService;
	
	 @ModelAttribute
	 public void getProduct(@RequestParam(value="productid", required=false) Integer productid,
			           Map<String, Object> map) {
		 if(productid != null) {
			 map.put("product", productService.getProductById(productid));
		 }
	 }
	
	//加载全部产品
	@AuthPassport(managertype="product")
	@RequestMapping(value="/productlist", method=RequestMethod.GET)
	public String list(HttpSession session) {
		List<Product> list = productService.getProductList();
		PageUtil pageUtil = new PageUtil();
		pageUtil.getPageCount(list, session);
		session.setAttribute("productkinds", productService.getProductKinds());
		session.setAttribute("productlist", list);
		return "/manage/product/list";
	}
	
	//以类别加载产品
	@RequestMapping(value="/productlist/{productkindid}", method=RequestMethod.GET)
	public String listbykind(@PathVariable Integer productkindid, HttpSession session) {
		List<Product> list = productService.getProductList(productkindid);
		session.setAttribute("productlist", list);
		Integer rowSize = list.size();
		Integer pageSize = (Integer) session.getAttribute("pageSize");
		Integer pageCount = (rowSize - 1)/pageSize +1;
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", 1);
		return "/manage/product/list";
	}
	
	//进入添加产品页面
	@AuthPassport(managertype="product")
	@RequestMapping(value="/inputProduct", method=RequestMethod.GET)
	public String input(Map<String, Object> map) {
		map.put("productkinds", productService.getProductKinds());
		map.put("product", new Product());
		return "/manage/product/inputProduct";
	}
	
	//修改产品
	@RequestMapping(value="/inputProduct/{productid} ", method=RequestMethod.GET)
	public String input(@PathVariable Integer productid, Map<String, Object> map) {
		map.put("productkinds", productService.getProductKinds());
		map.put("product", productService.getProductById(productid));
		return "/manage/product/inputProduct";
	}
	
	@RequestMapping(value="/saveOrUpdateProduct", method=RequestMethod.POST)
	public String savaOrUpdate(@Validated Product product, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException{
		if(file.getContentType().equals("image/jpeg") ){
			String imageoldname = file.getOriginalFilename();
			//重命名 文件明
			int index = imageoldname.indexOf(".");
			String prefix = imageoldname.substring(index);
			UUID uuid = UUID.randomUUID();
			String imagenewname = uuid+prefix;
			String path = request.getSession().getServletContext().getRealPath("/") + "/uploadFiles";
			File newfile = new File(path, imagenewname);
			file.transferTo(newfile);
			product.setImagesnewname(imagenewname);
			product.setImagesoldname(imageoldname);
		}
		product.setManager((Manager)request.getSession().getAttribute("man"));
		productService.saveOrUpdate(product);
		return "redirect:/manager/productlist";
	}
	
	//删除产品
	@RequestMapping(value="/deleteProduct", method = RequestMethod.DELETE)
	public String delete(@Param String productid) {
		System.out.println(productid);
		productService.delete(productid);
		return "redirect:/manager/productlist";
	}
	
	@RequestMapping(value="/getProductNow/{pageNow}", method=RequestMethod.GET)
	public String getPageNow(@PathVariable Integer pageNow, Map<String, Object> map) {
		map.put("pageNow", pageNow);
		return "/manage/product/list" ;
	}
	
	@RequestMapping(value="/getProductNow", method = RequestMethod.POST)
	public String getPageNow(Map<String,Object> map, @Param Integer pageNow) {
		map.put("pageNow", pageNow);
		return "/manage/product/list";
	}
	
	@RequestMapping(value="/addProductKind", method = RequestMethod.POST)
	public String saveProductKind(@Param String productkindname) {
		productService.saveProductKind(productkindname);
		return "redirect:/manager/productlist" ;
	}
}
