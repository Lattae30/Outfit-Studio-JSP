package Query;

public class ProductQuery {
    //clothes
    public String get = "SELECT clothes.*,ed.edition_name as edition_name "
                        + "FROM clothes INNER JOIN edition ed";
    public String getByName =  "SELECT * FROM clothes where name LIKE ?"; //search clothes
    public String createClothes = "INSERT INTO clothes (name, description, gender_type," + 
                                  "edition_id, price, stock, admin_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
    public String getClothesById = "SELECT * from clothes where id = ?";
    public String updateClothes = "UPDATE clothes SET name = ?, description = ?, gender_type = ?,"
                                    + "edition_id = ?, price = ?, stock = ?, admin_id = ? WHERE id = ?";
    public String deleteClothes = "DELETE FROM clothes WHERE id = ?";   
    
    //user
    public String getUser = "SELECT * FROM users";
    public String getUserName =  "SELECT * FROM users where u_name LIKE ?"; //search user
    public String createUsers = "INSERT INTO users (u_name, username, password) VALUES (?, ?, ?)";
    public String getUsersById = "SELECT * from users WHERE user_id = ?";
    public String updateUsers = "UPDATE users SET u_name = ?, username = ?, password = ? WHERE user_id = ?";
    public String deleteUsers = "DELETE FROM users WHERE user_id = ?";
    
    //edition
    public String getEdition = "SELECT * FROM edition";
    public String getEditionName =  "SELECT * FROM edition where edition_name LIKE ?"; 
    public String createEdition = "INSERT INTO edition (edition_name, launch_date) VALUES (?, ?)";
    public String getEditionById = "SELECT * from edition where edition_id = ?";
    public String updateEdition = "UPDATE edition SET edition_name = ?, launch_date = ? WHERE edition_id = ?";
}
