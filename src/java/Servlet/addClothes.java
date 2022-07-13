/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Config.DBConnection;
import Controller.ProductController;
import Model.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
                                
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String gender = request.getParameter("gender_type");
            String edition = request.getParameter("edition_id");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");
            String admin_id = request.getParameter("admin_id");
                                
            ProductModel model = new ProductModel();
            model.setName(name);
            model.setDescription(description);
            model.setGender(gender);
            model.setEdition(edition);
            model.setPrice(price);
            model.setStock(stock);
            model.setAdmin_id(admin_id);

            ProductController pc = new ProductController(); //masalah dari sini (method ini ga bisa nagkep, isinya null pas dijalanin)
            Boolean res = pc.createClothes(model);
            
            if (res) {
                response.sendRedirect("/clothes");
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

}
