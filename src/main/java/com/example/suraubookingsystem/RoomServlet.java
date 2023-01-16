package com.example.suraubookingsystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "RoomServlet", value = "/RoomServlet")
public class RoomServlet extends HttpServlet {
 //   private static final long serialVersionUID = 1L;
    private RoomDao rm;

//    HttpSession session = null;

    public void init() {
        rm = new RoomDao();
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	HttpSession session = request.getSession();
        session.removeAttribute("staffid");
        session.invalidate();
        response.sendRedirect("index.jsp");
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

    /*######################################################(CREATE ROOM)#############################################################*/

    private void createRoom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        String roomname = request.getParameter("roomname");
        int roomcapacity = Integer.parseInt(request.getParameter("roomcapacity"));
        String roomstatus = request.getParameter("roomstatus");
        String roomsoundsystem = request.getParameter("roomsoundsystem");
        int tablequantity = Integer.parseInt(request.getParameter("tablequantity"));
        int chairquantity = Integer.parseInt(request.getParameter("chairquantity"));

        Room room = new Room();

        room.setRoomname(roomname);
        room.setRoomcapacity(roomcapacity);
        room.setRoomstatus(roomstatus);
        room.setRoomsoundsystem(roomsoundsystem);
        room.setTablequantity(tablequantity);
        room.setChairquantity(chairquantity);

        rm.createRoom(room);
        response.sendRedirect("staffViewRoom.jsp");

    }

    /*######################################################( UPDATE )#############################################################*/

    private void updateRoom(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
        HttpSession session = request.getSession();
        int roomid = Integer.parseInt(request.getParameter("roomid"));
        String roomname = request.getParameter("roomname");
        int roomcapacity = Integer.parseInt(request.getParameter("roomcapacity"));
        String roomstatus = request.getParameter("roomstatus");
        String roomsoundsystem = request.getParameter("roomsoundsystem");
        int tablequantity = Integer.parseInt(request.getParameter("tablequantity"));
        int chairquantity = Integer.parseInt(request.getParameter("chairquantity"));

        Room room = new Room();

        room.setRoomid(roomid);
        room.setRoomname(roomname);
        room.setRoomcapacity(roomcapacity);
        room.setRoomstatus(roomstatus);
        room.setRoomsoundsystem(roomsoundsystem);
        room.setTablequantity(tablequantity);
        room.setChairquantity(chairquantity);

        rm.updateRoom(room);

        session.removeAttribute("room");
        session.setAttribute("room", room);
        response.sendRedirect("staffViewRoom.jsp");


    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteRoom(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int roomid = Integer.parseInt(request.getParameter("roomid"));
        rm.deleteRoom(roomid);
        response.sendRedirect("staffViewRoom.jsp");
    }

}
