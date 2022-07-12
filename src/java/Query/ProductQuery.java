package Query;

public class ProductQuery {
    public String get = "SELECT * FROM clothes";
    public String getByName =  "SELECT * FROM clothes where name LIKE ?";
    public String getUser = "SELECT * FROM users";
    public String getUserName =  "SELECT * FROM users where u_name LIKE ?";
    public String createClothes = "INSERT INTO clothes (image_name,image_path, " + 
            "name, description, gender_type, edition_id, price, stock, admin_id) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
}
