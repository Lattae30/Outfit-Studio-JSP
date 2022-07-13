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
        
        String sql = this.query.createClothes;
        
        return this.preparedStatement(map, sql);
    }
    
    public ResultSet getClothesById(String id) {
        String sql = this.query.getClothesById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        return this.getWithParameter(map, sql);
    }
    
    public boolean updateClothes(String id, ProductModel model) throws ParseException {        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getName());
        map.put(2, model.getDescription());
        map.put(3, model.getGender());
        map.put(4, model.getEdition());
        map.put(5, model.getPrice());
        map.put(6, model.getStock());
        map.put(7, model.getAdmin_id());
        map.put(8, id);
        
        String sql = this.query.updateClothes;
        
        return this.preparedStatement(map, sql);
    }
    
    public boolean deleteClothes(String id) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        String sql = this.query.deleteClothes;
        return this.preparedStatement(map, sql);
    }
    
    public boolean createUsers(ProductModel model) throws ParseException {        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getU_name());
        map.put(2, model.getUsername());
        map.put(3, model.getPassword());
        

        String sql = this.query.createUsers;
        
        return this.preparedStatement(map, sql);
    }
    
        public ResultSet getUsersById(String users_id) {
        String sql = this.query.getUsersById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, users_id);
        
        return this.getWithParameter(map, sql);
    }
        
        public boolean updateUsers(String user_id, ProductModel model) throws ParseException {        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getU_name());
        map.put(2, model.getUsername());
        map.put(3, model.getPassword());
        map.put(4, user_id);
        
        String sql = this.query.updateUsers;
        
        return this.preparedStatement(map, sql);
    }
    
    public boolean deleteUsers(String user_id) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, user_id);
        
        String sql = this.query.deleteUsers;
        return this.preparedStatement(map, sql);
    }
}
