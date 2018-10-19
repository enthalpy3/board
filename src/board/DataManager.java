package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import member.MemberInfo;

public class DataManager {
	 Connection con = null;
	    //String url = "jdbc:mysql://localhost:3306/my_site?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	    String url = "jdbc:mysql://localhost:3306/my_site";
	    String user = "jsp_user";
	    String pass = "zxcv1234";

	    private Connection openConnection() {
	        try {
	            //Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	            Class.forName("org.mariadb.jdbc.Driver");
	            con = DriverManager.getConnection(url, user, pass);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return con;
	    }

	    private void closeConnection() {
	        try {
	            if (con != null)
	                con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            con = null;
	        }
	    }

	    /*
	     * 게시글등록
	     */
	    public int insertBoard(BoardInfo board) {
	        PreparedStatement pstmt = null;
	        String query = "INSERT INTO board VALUES(?,?,?,?)";
	        int res = 0;
	        openConnection();
	        try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, board.getNick());
	            pstmt.setString(2, board.getTitle());
	            pstmt.setString(3, board.getText());
	            Timestamp ts = new Timestamp(System.currentTimeMillis());
	            pstmt.setTimestamp(4, ts);
	            res = pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeConnection();
	        }
	        return res;
	    }
	    
	    /*
	     * 삭제
	     */
	    public int removeBoard(String nick) {
	        PreparedStatement pstmt = null;
	        String query = "DELETE FROM board WHERE nick=?";
	        int res = 0;
	        openConnection();
	        try {
	        	pstmt = con.prepareStatement(query);
	        	//pstmt = con.prepareCall(query);
	            pstmt.setString(1, nick);
	            res = pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeConnection();
	        }
	        return res;
	    }
	    
	    /*
	     * 게시글수정
	     */
	    public int updateBoard(BoardInfo board) {
	        PreparedStatement pstmt = null;
	        String query = "UPDATE board SET title=?, text=? WHERE nick=?";
	        int res = 0;
	        openConnection();
	        try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, board.getTitle());
	            pstmt.setString(2, board.getText());
	            res = pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeConnection();
	        }
	        return res;
	    }
	    
	    /*
	     * 게시글확인
	     */
	    public boolean isBoard(String nick, String title) {
	        PreparedStatement pstmt = null;
	        String query = "SELECT * FROM board WHERE nick=? and title=?";
	        boolean res = false;
	        openConnection();
	        try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, nick);
	            pstmt.setString(2, title);
	            ResultSet rs = pstmt.executeQuery();
	            res = rs.next();
	            rs.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeConnection();
	        }
	        return res;
	    }
	    
	    /*
	     * 내가쓴글 확인
	     */
	    public BoardInfo getBoard(String nick) {
	        PreparedStatement pstmt = null;
	        BoardInfo board = new BoardInfo();
	        String query = "SELECT * FROM board WHERE nick=?";
	        openConnection();
	        try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, nick);
	            ResultSet rs = pstmt.executeQuery();
	            rs.next();
	            board.setNick(rs.getString("nick"));
	            board.setTitle(rs.getString("title"));
	            board.setText(rs.getString("text"));
	            board.setReg_date(rs.getTimestamp("reg_date"));
	            rs.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeConnection();
	        }
	        return board;
	    }
}
