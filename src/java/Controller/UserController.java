/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Query.UserQuery;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lattae
 */
public class UserController extends BaseController {
    UserQuery query = new UserQuery();
    
    public ResultSet getByUserName(String username) {
        String sql = this.query.getByUserName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, username);
        
        return this.getWithParameter(map, sql);
    }
}
