package Controller;
import Helper.StringHelper;
import Query.ProductQuery;
import java.sql.*;
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
}
