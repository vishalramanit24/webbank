package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CustomerDao;
import model.Customer;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CustomerDao customerDao = new CustomerDao();
        
        if ("create".equals(action)) {
            Customer customer = new Customer();
            customer.setFullName(request.getParameter("fullName"));
            customer.setAddress(request.getParameter("address"));
            customer.setMobileNo(request.getParameter("mobileNo"));
            customer.setEmailId(request.getParameter("emailId"));
            customer.setAccountType(request.getParameter("accountType"));
            customer.setBalance(Double.parseDouble(request.getParameter("initialBalance")));
            customer.setDateOfBirth(request.getParameter("dateOfBirth"));
            customer.setIdProof(request.getParameter("idProof"));
            customer.setAccountNo(generateAccountNo());
            customer.setTempPassword(generateTempPassword());
            
            if (customerDao.addCustomer(customer)) {
                request.setAttribute("newCustomer", customer);
                request.getRequestDispatcher("/customerCreated.jsp").forward(request, response);
            } else {
                response.sendRedirect("adminDashboard.jsp?error=CreationFailed");
            }
        }else if ("edit".equals(action)) {
            String accountNo = request.getParameter("accountNo");
            Customer customer = customerDao.getCustomerByAccno(accountNo);
            if (customer != null) {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("/updateCustomer.jsp").forward(request, response);
            } else {
                response.sendRedirect("adminDashboard.jsp?error=CustomerNotFound");
            }
        }
        
        
        else if ("update".equals(action)) {
            String accountNo = request.getParameter("accountNo");
            Customer customer = new Customer();
            customer.setAccountNo(accountNo);
            customer.setFullName(request.getParameter("fullName"));
            customer.setAddress(request.getParameter("address"));
            customer.setMobileNo(request.getParameter("mobileNo"));
            customer.setEmailId(request.getParameter("emailId"));
            customer.setAccountType(request.getParameter("accountType"));
            customer.setDateOfBirth(request.getParameter("dateOfBirth"));
            customer.setIdProof(request.getParameter("idProof"));
            
            if (customerDao.updateCustomer(customer)) {
                response.sendRedirect("adminDashboard.jsp?success=CustomerUpdated");
            } else {
                response.sendRedirect("adminDashboard.jsp?error=UpdateFailed");
            }
        }
        }
 
        
        // Implement update, d

    private String generateAccountNo() {
        // Generate a 10-digit account number
        // Format: YYYY + MM + 5 random digits
        java.time.LocalDate currentDate = java.time.LocalDate.now();
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        int randomDigits = (int) (Math.random() * 100000);  // 5-digit random number

        return String.format("%04d%02d%05d", year, month, randomDigits);
    }

    private String generateTempPassword() {
        // List of common, easy-to-remember words
        String[] words = {"cat", "dog", "sun", "moon", "star", "tree", "book", "bird", "fish", "home"};
        
        // Generate a random number between 1000 and 9999
        int randomNum = 1000 + (int)(Math.random() * 9000);
        
        // Select a random word from the array
        String word = words[(int)(Math.random() * words.length)];
        
        // Capitalize the first letter of the word
        word = word.substring(0, 1).toUpperCase() + word.substring(1);
        
        // Combine the word and the number
        return word + randomNum;
    }
}