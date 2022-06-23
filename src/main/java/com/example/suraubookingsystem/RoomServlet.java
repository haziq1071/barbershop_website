package com.example.suraubookingsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "RoomServlet", value = "/RoomServlet")
public class RoomServlet extends HttpServlet {

	private RoomDao rm;
    public void init() {
        rm = new RoomDao();    
    }

    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "createRoom":
                    createRoom(request, response);
                    break;
                case "deleteRoom":
                    deleteRoom(request, response);
                    break;
                case "updateRoom":
                    updateRoom(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }   
        
        /*######################################################( CREATE ROOM )#############################################################*/

      //private void createroom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException {
        private void createRoom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
        //int staffid = Integer.parseInt(request.getParameter("staffid"));
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();/*

        request.setAttribute("thiss", "surau-ar-rahman.herokuapp.com");
        String appPath = getServletContext().getRealPath("");
        Part f = request.getPart("hPic");
        String host = request.getScheme()+ "://" + request.getAttribute("thiss")+"/";
        String imageFileName = f.getSubmittedFileName();
        String urlPathforDB=host + "pic/" + imageFileName;
        String savePath = appPath + "pic" + File.separator + imageFileName;
        new File(appPath + "pic").mkdir();
        f.write(savePath);
        */
        try {

    		String roomname = request.getParameter("roomname"); 
    		int roomcapacity = Integer.parseInt(request.getParameter("roomcapacity"));
    		String roomstatus = request.getParameter("roomstatus");
    		String soundsystem = request.getParameter("soundsystem");
            //int staffid = Integer.parseInt(request.getParameter("staffid"));
            //int roomid = Integer.parseInt(request.getParameter("roomid"));

            Room room = new Room();
            Staff staff = new Staff();
            //room.setRoomid(roomid);
            room.setRoomname(roomname);
            room.setRoomcapacity(roomcapacity);
            room.setRoomstatus(roomstatus);
            room.setSoundsystem(soundsystem);
            //room.setStaffid(staffid);
    		
    		//rm.createroom(room,imageFileName,urlPathforDB);
            rm.createRoom(room,staff);/*
            response.sendRedirect("displayRoomList.jsp");
		    out.println("<script type=\"text/javascript\">");
            out.println("alert('Your details succesfully create a room.');");
            out.println("location='displayRoomList.jsp';");
            out.println("</script>");*/

            response.sendRedirect("homepage.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

	}
        
        /*######################################################( UPDATE )#############################################################*/


        //private void updateRoom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException {
          private void updateRoom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
        	/*
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            
            request.setAttribute("thiss", "surau-ar-rahman.herokuapp.com");
            String appPath = getServletContext().getRealPath("");
            Part f = request.getPart("hPic");
            String host = request.getScheme()+ "://" + request.getAttribute("thiss")+"/";
            String imageFileName = f.getSubmittedFileName();
            String urlPathforDB=host + "pic/" + imageFileName;
            String savePath = appPath + "pic" + File.separator + imageFileName;
            new File(appPath + "pic").mkdir();
            f.write(savePath);
            */
            //int roomid = Integer.parseInt(request.getParameter("roomid"));

              //try{
                    //HttpSession session = request.getSession();
                    int roomid = Integer.parseInt(request.getParameter("roomid"));
                	String roomname = request.getParameter("roomname"); 
            		int roomcapacity = Integer.parseInt(request.getParameter("roomcapacity"));
            		String roomstatus = request.getParameter("roomstatus");
            		String soundsystem = request.getParameter("soundsystem");
                    //int staffid = Integer.parseInt(request.getParameter("staffid"));

                    Room room = new Room();
                    //Staff staff = new Staff();
                    
                    room.setRoomid(roomid);
                    room.setRoomname(roomname);
                    room.setRoomcapacity(roomcapacity);
                    room.setRoomstatus(roomstatus);
                    room.setSoundsystem(soundsystem);
                    //staff.setStaffid(staffid);
                    /*
                    session.removeAttribute("roomid");
                    session.removeAttribute("roomname");
                    session.removeAttribute("roomcapacity");
                    session.removeAttribute("roomstatus");
                    session.removeAttribute("soundsystem");                
                    
                    session.setAttribute("roomid", roomid);
                    session.setAttribute("roomname", roomname);
                    session.setAttribute("roomcapacity", roomcapacity);
                    session.setAttribute("roomstatus", roomstatus);
                    session.setAttribute("soundsystem",soundsystem);
                    */
                    rm.updateRoom(room);
                    response.sendRedirect("viewRoom.jsp");/*
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Dewan berjaya dikemaskini!');");
                    out.println("location='viewRoom.jsp';");
                    out.println("</script>");
                    /*
                    rm.updateroom(room,imageFileName,urlPathforDB);
                    response.sendRedirect("displayRoomList.jsp");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your room succesfully updated.');");
                    out.println("location='displayRoomList.jsp';");
                    out.println("</script>");*/
                    /*
                }catch (Exception e) {
                    e.printStackTrace();
                }*/
            }




        /*######################################################( DELETE )#############################################################*/

	    private void deleteRoom(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	        int roomid = Integer.parseInt(request.getParameter("roomid"));
	        rm.deleteRoom(roomid);
	        response.sendRedirect("viewRoom.jsp");
	    }



}
