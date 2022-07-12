package Controller;
import Helper.StringHelper;
import Model.ProductModel;
import Query.ProductQuery;
import java.sql.*;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

public class ProductController extends BaseController{
    ProductQuery query = new ProductQuery();
    
    public ResultSet get(){
        String sql = this.query.get;
        return this.get(sql);
    }
    
    public ResultSet getUser(){
        String sql = this.query.getUser;
        return this.get(sql);
    }
    
    public ResultSet getByName(String name) {
        String sql = this.query.getByName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(name));
        
        return this.getWithParameter(map, sql);
    }
    
    public ResultSet getUserName(String u_name) {
        String sql = this.query.getUserName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(u_name));
        
        return this.getWithParameter(map, sql);
    }
    public boolean createClothes(ProductModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getName());
        map.put(2, model.getDescription());
        map.put(3, model.getGender());
        map.put(4, model.getEdition());
        map.put(5, model.getPrice());
        map.put(6, model.getStock());
        map.put(7, model.getAdmin_id());
        map.put(8, model.getImage_name());
        map.put(9, model.getImage_path());

        
        String sql = this.query.createClothes;
        
        return this.preparedStatement(map, sql);
    }
}
