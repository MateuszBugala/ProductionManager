package pl.coderslab.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/quotations/add/*", "/quotations/addItem/*" , "/quotations/delete/*" ,
        "/quotationItems/add/*", "/quotationItems/delete/*"})
public class ProductionFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);

        Long userGroupId = (Long) session.getAttribute("userGroup");
        boolean loggedIn = (userGroupId != 2);


        if (loggedIn) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect("/noAccess");
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
