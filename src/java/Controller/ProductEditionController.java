package Controller;
import Model.ProductEditionModel;
import Helper.StringHelper;
import Query.ProductQuery;
import java.sql.*;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

public class ProductEditionController extends BaseController{
    ProductQuery query = new ProductQuery();
        
    public ResultSet getEdition(){
        String sql = this.query.getEdition;
        return this.get(sql);
    }
           
    public ResultSet getEditionName(String edition_name) {
        String sql = this.query.getEditionName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(edition_name));
        
        return this.getWithParameter(map, sql);
    }
    
    public boolean createEdition(ProductEditionModel model) throws ParseException {       
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getEdition_Name());
        map.put(2, model.getLaunch_date());
        
        String sql = this.query.createEdition;
        
        return this.preparedStatement(map, sql);
    }
    public ResultSet getByEditionId(String edition_id) {
        String sql = this.query.getEditionById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, edition_id);
        
        return this.getWithParameter(map, sql);
    }
    
    public boolean updateEdition(String edition_id, ProductEditionModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getEdition_Name());
        map.put(2, model.getLaunch_date());
        map.put(3, edition_id);
        
        
        String sql = this.query.updateEdition;
        
        return this.preparedStatement(map, sql);
    }
}
