/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.ProductController;
import Model.ProductModel;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.Math.random;
import static java.lang.StrictMath.random;
import static javafx.beans.binding.Bindings.not;
import javafx.scene.control.Hyperlink;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Lattae
 */
@WebServlet(name = "addClothes", urlPatterns = {"/addclothes"})
@MultipartConfig(fileSizeThreshold = 1024 * 502, // 502KB
        maxFileSize = 1024 * 505, // 505KB
        maxRequestSize = 1024 * 505)

public class addClothes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            RequestDispatcher dispatch = request.getRequestDispatcher("/views/addclothes.jsp");
            dispatch.forward(request, response);
        }
    }
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
                try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String gender = request.getParameter("gender_type");
            String edition_id = request.getParameter("edition_id");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");
            String admin_id = request.getParameter("admin_id");
            
                                       System.out.println("ke part file");
            Part part = request.getPart("file");//mendapatkan part file atau bernial null jika nilai tidak ada
            String fileName = extractFileName(part);//Mendapatkan nama dari file name

        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        System.out.println("dapetin absolut path");
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        /*separator digunakan untuk memisahkan nama direktori yang membentuk path 
        ke lokasi tertentu. di dalam hal ini, file.separator didapatkan sebagai string.*/
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
            /*mkdirs digunakan untuk membuat directori baru yang dilambangkan 
            dengan nama path abstrak dan juga semua direktori induk yang 
            tidak ada dari nama path abstrak.*/
        }
        System.out.println("dapetin absolut path 2");
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
                    System.out.println("write part");
        part.write(savePath + File.separator);
                    System.out.println("fileSaveDirl");
        File fileSaveDir1 = new File(savePath);
        System.out.println("berhasil");
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
                    System.out.println("eitss ke sini dulu");
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
ProductModel model = new ProductModel();
            model.setName(name);
            model.setDescription(description);
            model.setEdition(edition_id);
            model.setPrice(price);
            model.setStock(stock);
            model.setAdmin_id(admin_id);
            model.setImage_name(dbFileName);
            model.setImage_path(savePath);

            ProductController pc = new ProductController();
            Boolean res = pc.createClothes(model);

            if (res) {
                response.sendRedirect("index");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        //content-disposition atribut: form dta; name="file"; filename="sample.txt"
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

}
