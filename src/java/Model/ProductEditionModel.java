package Model;

public class ProductEditionModel {
    private String edition_id;
    private String edition_name;
    private String launch_date;

    public String getEdition_id() {
        return edition_id;
    }

    public void setEdition_id(String edition_id) {
        this.edition_id = edition_id;
    }

    public String getEdition_Name() {
        return edition_name;
    }

    public void setEdition_Name(String edition_name) {
        this.edition_name = edition_name;
    }

    public String getLaunch_date() {
        return launch_date;
    }

    public void setLaunch_date(String launch_date) {
        String[] splitted = launch_date.split("/");
        launch_date = splitted[2] + "-" + splitted[0] + "-" + splitted[1];
        this.launch_date = launch_date;
    }
    
    
}
