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

        private void createRoom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
        
        response.setContentType("text/html");


    		String roomname = request.getParameter("roomname"); 
    		int roomcapacity = Integer.parseInt(request.getParameter("roomcapacity"));
    		String roomstatus = request.getParameter("roomstatus");
    		String soundsystem = request.getParameter("soundsystem");

            Room room = new Room();

            room.setRoomname(roomname);
            room.setRoomcapacity(roomcapacity);
            room.setRoomstatus(roomstatus);
            room.setSoundsystem(soundsystem);

            rm.createRoom(room);

	    }
        
        /*######################################################( UPDATE )#############################################################*/

          private void updateRoom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

                    int roomid = Integer.parseInt(request.getParameter("roomid"));
                	String roomname = request.getParameter("roomname"); 
            		int roomcapacity = Integer.parseInt(request.getParameter("roomcapacity"));
            		String roomstatus = request.getParameter("roomstatus");
            		String soundsystem = request.getParameter("soundsystem");
           
                    Room room = new Room();
                            
                    room.setRoomid(roomid);
                    room.setRoomname(roomname);
                    room.setRoomcapacity(roomcapacity);
                    room.setRoomstatus(roomstatus);
                    room.setSoundsystem(soundsystem);

                    rm.updateRoom(room);
                    response.sendRedirect("viewRoom.jsp");

            }


        /*######################################################( DELETE )#############################################################*/

	    private void deleteRoom(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	        int roomid = Integer.parseInt(request.getParameter("roomid"));
	        rm.deleteRoom(roomid);
	        response.sendRedirect("viewRoom.jsp");
	    }



}
