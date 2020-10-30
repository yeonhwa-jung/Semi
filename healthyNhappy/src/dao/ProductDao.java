package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CartDto;
import dto.OrderDto;
import dto.ProductDto;
import dto.QnaBbsDto;
import dto.ReviewBbsDto;

public class ProductDao {
	
	private static ProductDao dao = new ProductDao();
	
	private ProductDao() {	
	}
	
	public static ProductDao getInstance() {
		return dao;
	}
	
	public List<ProductDto> getAllProduct() {
		
		String sql = " SELECT * FROM PRODUCT "
				+ " WHERE PRD_DEL != 1 "
				+ " ORDER BY PRD_NUM ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			System.out.println("getAllProduct success");
			
			while(rs.next()) {
				int i = 1;
				ProductDto dto = new ProductDto(
										rs.getInt(i++), 	// 상품번호
										rs.getString(i++),	// 상품이름
										rs.getInt(i++),		// 상품 가격
										rs.getString(i++),	// 상품 이미지 파일 이름
										rs.getString(i++), 	// 상품 설명
										rs.getInt(i++),  	// 배송비
										rs.getString(i++),  // 규격
										rs.getString(i++), 	// 원산지
										rs.getString(i++),	// 유통기한
										rs.getString(i++),	// 보관방법
										rs.getString(i++));	// 포장상태
				list.add(dto);
			}
			System.out.println("getAllProduct success end");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	public ProductDto getProduct( int prd_num ) {
		String sql = " SELECT * FROM PRODUCT "
				+ " WHERE PRD_NUM = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ProductDto dto = new ProductDto();
	
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, prd_num);
			
			rs = psmt.executeQuery();
			System.out.println("getProduct success");
			
			while(rs.next()) {
				int i = 1;
				dto = new ProductDto(
										rs.getInt(i++), 	// 상품번호
										rs.getString(i++),	// 상품이름
										rs.getInt(i++),		// 상품 가격
										rs.getString(i++),	// 상품 이미지 파일 이름
										rs.getString(i++), 	// 상품 설명
										rs.getInt(i++),  	// 배송비
										rs.getString(i++),  // 규격
										rs.getString(i++), 	// 원산지
										rs.getString(i++),	// 유통기한
										rs.getString(i++),	// 보관방법
										rs.getString(i++));	// 포장상태
			}
			System.out.println("getAllProduct success end");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
	}

	// REVIEW 
	public List<ReviewBbsDto> getAllReview(int prd_num) {
		
		String sql = " SELECT * FROM REV_BOARD "
				+ " WHERE REV_PRD_NUM = ? AND REV_DEL = ? "
				+ " ORDER BY REV_SEQ ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReviewBbsDto> list = new ArrayList<ReviewBbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, prd_num);
			psmt.setInt(2, 0);
			
			rs = psmt.executeQuery();
			System.out.println("getAllReview success");
			
			while(rs.next()) {
				int i = 1;
				ReviewBbsDto dto = new ReviewBbsDto(
										rs.getInt(i++), 	// 글번호
										rs.getString(i++),	// id
										rs.getString(i++),	// 제목
										rs.getString(i++), 	// 내용
										rs.getInt(i++),		// 평점
										rs.getString(i++),	// 파일이름
										rs.getString(i++),  // 작성일
										rs.getInt(i++), 	// 삭제
										rs.getInt(i++));	// 상품번호
				list.add(dto);
			}
			System.out.println("getAllProduct success end");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	public boolean findOrder( String id, int prd_num ) {
		String sql = " SELECT CART_ID FROM CART_PRD "
				+ " WHERE CART_ID = ? AND CART_PRD_NUM = ? AND CART_ORDER_SEQ > 1 ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println(sql);
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, prd_num);
			
			count = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
	
	public boolean writeReview( ReviewBbsDto dto ) {
		String sql = " INSERT INTO REV_BOARD ( REV_SEQ, REV_ID, REV_TITLE, REV_CONTENT, REV_SCORE,"
				+ " REV_FILENAME, REV_WDATE, REV_DEL, REV_PRD_NUM ) "
				+ " VALUES ( SEQ_REV.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, 0, ? ) ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getScore());
			psmt.setString(5, dto.getFilename());
			psmt.setInt(6, dto.getPrd_num());
			
			count = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}

	public List<ReviewBbsDto> getRevPagingList( int page, int prd_num ) {
		
		String sql = " SELECT REV_SEQ, REV_ID, REV_TITLE, REV_CONTENT, REV_SCORE, REV_FILENAME, REV_WDATE, REV_DEL, REV_PRD_NUM FROM ";
		
		sql += " (SELECT ROW_NUMBER()OVER(ORDER BY REV_SEQ DESC) AS RNUM, "
				+ " REV_SEQ, REV_ID, REV_TITLE, REV_CONTENT, REV_SCORE, REV_FILENAME, REV_WDATE, REV_DEL, REV_PRD_NUM " 			
				+ " FROM REV_BOARD "
				+ " WHERE REV_PRD_NUM = ? AND REV_DEL = ? ";

		sql += " ORDER BY REV_SEQ DESC) ";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";

		int start, end;
		start = 1 + 5 * page; //시작 글의 번호
		end = 5 + 5 * page; // 끝 번호

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<ReviewBbsDto> list = new ArrayList<ReviewBbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, prd_num);
			psmt.setInt(2, 0);
			psmt.setInt(3, start);
			psmt.setInt(4, end);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				ReviewBbsDto dto = new ReviewBbsDto(
													rs.getInt(i++), 	// 글번호
													rs.getString(i++),	// id
													rs.getString(i++),	// 제목
													rs.getString(i++), 	// 내용
													rs.getInt(i++),		// 평점
													rs.getString(i++),	// 파일이름
													rs.getString(i++),  // 작성일
													rs.getInt(i++), 	// 삭제
													rs.getInt(i++));	// 상품번호
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	public int getRevPagingListSize( int prd_num ) {
		
		String sql = " SELECT COUNT(*) FROM REV_BOARD"
					+ " WHERE REV_PRD_NUM = ? AND REV_DEL = ? "; 
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int num = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, prd_num);
			psmt.setInt(2, 0);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return num;
	}

	// REVIEW UPDATE
	public ReviewBbsDto getReview(int seq) {
		String sql = " SELECT * FROM REV_BOARD "
					+ " WHERE REV_SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ReviewBbsDto dto = new ReviewBbsDto();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				 dto = new ReviewBbsDto(
										rs.getInt(i++), 	// 글번호
										rs.getString(i++),	// id
										rs.getString(i++),	// 제목
										rs.getString(i++), 	// 내용
										rs.getInt(i++),		// 평점
										rs.getString(i++),	// 파일이름
										rs.getString(i++),  // 작성일
										rs.getInt(i++), 	// 삭제
										rs.getInt(i++));	// 상품번호
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println("daodaodao" + dto.toString());
		return dto;
	}

	public boolean updateReview( ReviewBbsDto dto, int seq) {
		String sql = " UPDATE REV_BOARD "
				+ " SET REV_TITLE = ?, REV_CONTENT = ?, REV_SCORE = ?, REV_FILENAME = ? "
				+ " WHERE REV_SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getScore());
			psmt.setString(4, dto.getFilename());
			psmt.setInt(5, seq);
			
			count = psmt.executeUpdate();
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(psmt, conn, null);			
		}
		return count>0?true:false;
		
	}

	public boolean deleteReview( int seq) {
		String sql=" UPDATE REV_BOARD "
				+ " SET REV_DEL = ? "
				+ " WHERE REV_SEQ = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, 1);
			psmt.setInt(2, seq);
			count = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;	
	}

	public List<ProductDto> searchProduct( String searchword ) {
		String sql=" SELECT * FROM PRODUCT " +
					" WHERE PRD_NAME LIKE ? AND PRD_DEL != 1 " +
					" ORDER BY PRD_NUM ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + searchword + "%");
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				ProductDto dto = new ProductDto(
										rs.getInt(i++), 	// 상품번호
										rs.getString(i++),	// 상품이름
										rs.getInt(i++),		// 상품 가격
										rs.getString(i++),	// 상품 이미지 파일 이름
										rs.getString(i++), 	// 상품 설명
										rs.getInt(i++),  	// 배송비
										rs.getString(i++),  // 규격
										rs.getString(i++), 	// 원산지
										rs.getString(i++),	// 유통기한
										rs.getString(i++),	// 보관방법
										rs.getString(i++));	// 포장상태
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	//-----------------------------------------------------------------------------고동완님
	
	//TODO
		//카트 중복 확인
		public boolean checkCart(String id, int prd_num) {
			String sql = " SELECT * FROM CART_PRD "
					   + "WHERE EXISTS "
					   + " (SELECT * FROM CART_PRD "
					   + " WHERE CART_ID = ? "
					   + " AND CART_PRD_NUM = ? "
					   + " AND CART_ORDER_SEQ = 1 ) ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			boolean isS = false;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 checkCart success");
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setInt(2, prd_num);
				System.out.println("2/6 checkCart success");
				
				rs = psmt.executeQuery();
				System.out.println("3/6 checkCart success");
				
				while(rs.next()) {
					isS = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}
			return isS;
		}
		
		public boolean addCart(CartDto dto) {
			String sql = " INSERT INTO CART_PRD ( CART_ID, CART_PRD_NUM, CART_AMOUNT, CART_PRICE, CART_ORDER_SEQ ) "
					+ " VALUES ( ?, ?, ?, ?, 1 ) ";

			Connection conn = null;
			PreparedStatement psmt = null;

			int count = 0;

			try {
				conn = DBConnection.getConnection();

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setInt(2, dto.getPrd_num());
				psmt.setInt(3, dto.getAmount());
				psmt.setInt(4, dto.getPrice());

				count = psmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, null);
			}
			return count > 0 ? true : false;
		}

		// 고동완...위에 addcart확인

		// ------------------------------
		// 장바구니 내용 불러오는
		public List<CartDto> getCartList(String id) {

			String sql = " SELECT * " + " FROM CART_PRD " + " WHERE CART_ID=? " + " AND CART_ORDER_SEQ=1 "
					+ " ORDER BY CART_PRD_NUM ";

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<CartDto> list = new ArrayList<CartDto>();

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getCartList success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id); // 아이디값 확인
				System.out.println("2/6 getCartList success");

				rs = psmt.executeQuery();
				System.out.println("3/6 getCartList success");

				while (rs.next()) {
					int i = 1;
					CartDto dto = new CartDto(rs.getString(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++),
							rs.getInt(i++));
					list.add(dto);
				}
				System.out.println("4/6 getCartList success" + list.toString());

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return list;
		}

		public List<ProductDto> getGoodCartList(String id) {

			String sql = " SELECT P.PRD_NUM, P.PRD_NAME, P.PRD_PRICE , P.PRD_IMG_NAME , P.PRD_INFO , P.PRD_DELIVERY_PRICE , P.PRD_SIZE , P.PRD_ORIGIN , P.PRD_EXPDATE , P.PRD_KEEP , P.PRD_PACK "
					+ " FROM PRODUCT P LEFT OUTER JOIN  CART_PRD C " + " ON P.PRD_NUM = C.CART_PRD_NUM "
					+ " WHERE C.CART_ID=? " + " AND C.CART_ORDER_SEQ=1 " + " ORDER BY P.PRD_NUM ";

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<ProductDto> list = new ArrayList<ProductDto>();

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getGoodCartList success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				System.out.println("2/6 getGoodCartList success");

				rs = psmt.executeQuery();
				System.out.println("3/6 getGoodCartList success");

				while (rs.next()) {
					int i = 1;
					ProductDto dto = new ProductDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++),
							rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
							rs.getString(i++), rs.getString(i++));

					list.add(dto);

				}
				System.out.println("4/6 getGoodCartList success" + list.toString());

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return list;
		}
		// -----
		// 장바구니 업데이트 기능

		public boolean updateCartList(String amount, String total, String id, String num) {

			String sql = " UPDATE CART_PRD " + " SET CART_AMOUNT=?, CART_PRICE=? " + " WHERE CART_ID=? AND CART_PRD_NUM=? "
					+ " AND CART_ORDER_SEQ=1 ";

			Connection conn = null;
			PreparedStatement psmt = null;
			int count = 0;

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 updateOrderList success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, amount);
				psmt.setString(2, total);
				psmt.setString(3, id);
				psmt.setString(4, num);
				System.out.println("2/6 updateOrderList success");

				count = psmt.executeUpdate();
				System.out.println("3/6 updateOrderList success");

			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, null);
			}
			return count > 0 ? true : false;

		}

		// -----------------------------------------------------
		// 장바구니 삭제 기능
		public boolean deleteCartGoods(String id[], String seq[]) {

			String sql = " DELETE FROM CART_PRD " + " WHERE CART_ID=? AND CART_PRD_NUM=? ";

			Connection conn = null;
			PreparedStatement psmt = null;

			int count[] = new int[seq.length];

			try {
				conn = DBConnection.getConnection();
				conn.setAutoCommit(false);

				psmt = conn.prepareStatement(sql);

				for (int i = 0; i < seq.length; i++) {
					psmt.setString(1, id[i]);
					psmt.setString(2, seq[i]);
					psmt.addBatch();
				}

				count = psmt.executeBatch();

				conn.commit();

			} catch (Exception e) {
				e.printStackTrace();
				try {
					conn.rollback();
				} catch (Exception e2) {

				}
			} finally {
				try {
					conn.setAutoCommit(true);
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				DBClose.close(psmt, conn, null);
			}

			boolean isS = true;

			for (int i = 0; i < count.length; i++) {
				if (count[i] != -2) {
					isS = false;
					break;
				}
			}
			return isS;

		}

		// 주문 페이지
		public CartDto getReceipt(String id, String proNum) {

			String sql = " SELECT * " + " FROM CART_PRD " + " WHERE CART_ID=? AND CART_PRD_NUM=?  "
					+ " AND CART_ORDER_SEQ=1 " + " ORDER BY CART_PRD_NUM ";
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			CartDto dto = null;

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getReceipt success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, proNum);

				System.out.println("2/6 getReceipt success");

				rs = psmt.executeQuery();
				System.out.println("3/6 getReceipt success");

				if (rs.next()) {
					dto = new CartDto(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
				}
				System.out.println("4/6 getProductList success");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, null);
			}

			return dto;
		}

		public ProductDto getReceiptProduct(String id, String proNum) {

			String sql = " SELECT P.PRD_NUM, P.PRD_NAME, P.PRD_PRICE , P.PRD_IMG_NAME , P.PRD_INFO , P.PRD_DELIVERY_PRICE , P.PRD_SIZE , P.PRD_ORIGIN , P.PRD_EXPDATE , P.PRD_KEEP , P.PRD_PACK "
					+ " FROM PRODUCT P LEFT OUTER JOIN  CART_PRD C " + " ON P.PRD_NUM = C.CART_PRD_NUM "
					+ " WHERE C.CART_ID=? AND C.CART_PRD_NUM=? " + " AND C.CART_ORDER_SEQ=1 " + " ORDER BY P.PRD_NUM ";
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			ProductDto dto = null;

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getProductList success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, proNum);

				System.out.println("2/6 getOrderList success");

				rs = psmt.executeQuery();
				System.out.println("3/6 getProductList success");

				if (rs.next()) {
					int i = 1;
					dto = new ProductDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++),
							rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
							rs.getString(i++), rs.getString(i++));
				}
				System.out.println("4/6 getProductList success");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, null);
			}

			return dto;
		}
		// ---------------------------------------------------------------------------------
		// 결제 기능1

		public boolean payList1(String id, String orderRequest, String orderAddress, String orderMoney) {

			String sql = " INSERT INTO ORDER_PRD " + " VALUES (SEQ_ORDER.NEXTVAL, ?, ?, SYSDATE, ?, ? + 2500, 0) ";
			// id, requset, address, 총가격	

			Connection conn = null;
			PreparedStatement psmt = null;
			// 한글 꺠짐
			int count = 0;

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 payList1 success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, orderRequest);
				psmt.setString(3, orderAddress);
				psmt.setString(4, orderMoney);
				System.out.println("2/6 payList1 success");

				count = psmt.executeUpdate();
				System.out.println("3/6 payList1 success");
				System.out.println(sql);

			} catch (Exception e) {
				System.out.println("payList1 fail");
				e.printStackTrace();
			} finally {

				DBClose.close(psmt, conn, null);
			}
			return count > 0 ? true : false;
		}

		// 결제 기능2
		public void payList2(String ids, String productNum) {

			String sql = " UPDATE CART_PRD " + " SET CART_ORDER_SEQ=(SELECT MAX(ORDER_SEQ) FROM ORDER_PRD) "
					+ " WHERE CART_ID=? AND CART_PRD_NUM=? " + " AND CART_ORDER_SEQ=1 ";
			// id, pronum

			Connection conn = null;
			PreparedStatement psmt = null;

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 payList2 success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, ids);
				psmt.setString(2, productNum);
				System.out.println("2/6 payList2 success");

				psmt.executeUpdate();
				System.out.println("3/6 payList2 success");

			} catch (Exception e) {
				System.out.println("payList2 fail");
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, null);
			}
		}

	//---------------------------------------------------------------------------------------------
		// 마이페이지 시작
		// TODO
		public List<OrderDto> getPageOrderList(String id) {
			String sql = " SELECT *	" + " FROM (SELECT * " + " FROM ORDER_PRD " + " ORDER BY ORDER_SEQ DESC) "
					+ " WHERE ORDER_ID=? AND ROWNUM <= 10 ";

			/*
			 * select * from table where type='1' limit 5
			 * 
			 */
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<OrderDto> list = new ArrayList<OrderDto>();

			try {
				conn = DBConnection.getConnection();

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);

				rs = psmt.executeQuery();

				while (rs.next()) {
					int i = 1;
					OrderDto dto = new OrderDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
							rs.getString(i++), rs.getInt(i++));
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return list;
		}

		public List<CartDto> getPageCartList(String id, String seq) {

			String sql = " SELECT CART_ID, CART_PRD_NUM, CART_AMOUNT, CART_PRICE, CART_ORDER_SEQ " + " FROM CART_PRD "
					+ " WHERE CART_ID=? AND CART_ORDER_SEQ=? " + " ORDER BY CART_PRD_NUM DESC ";

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<CartDto> list = new ArrayList<CartDto>();

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getPageCartList success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, seq);
				System.out.println("2/6 getPageCartList success");

				rs = psmt.executeQuery();
				System.out.println("3/6 getPageCartList success");

				while (rs.next()) {
					int i = 1;
					CartDto dto = new CartDto(rs.getString(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++),
							rs.getInt(i++));

					list.add(dto);
				}
				System.out.println("4/6 getPageCartList success");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return list;
		}

		public List<ProductDto> getPageProductList(String id, String seq) {

			String sql = " SELECT P.PRD_NUM, P.PRD_NAME, P.PRD_PRICE, P.PRD_IMG_NAME, P.PRD_INFO, P.PRD_DELIVERY_PRICE, P.PRD_SIZE, P.PRD_ORIGIN, P.PRD_EXPDATE, P.PRD_KEEP, P.PRD_PACK "
					+ " FROM PRODUCT P LEFT OUTER JOIN CART_PRD C " + " ON P.PRD_NUM = C.CART_PRD_NUM "
					+ " WHERE C.CART_ID=? AND C.CART_ORDER_SEQ=? " + " ORDER BY C.CART_PRD_NUM DESC ";

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<ProductDto> list = new ArrayList<ProductDto>();

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getPageProductList success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, seq);
				System.out.println("2/6 getPageProductList success");

				rs = psmt.executeQuery();
				System.out.println("3/6 getPageProductList success");
				while (rs.next()) {
					int i = 1;
					ProductDto dto = new ProductDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++),
							rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
							rs.getString(i++), rs.getString(i++));

					list.add(dto);

				}
				System.out.println("4/6 getPageProductList success");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return list;
		}

		// -----------------------------------------------------
		// 마이페이지에 리뷰
		public List<ProductDto> myPageReview1(int page, String id) {

			String sql = " SELECT PRD_NUM, PRD_NAME, PRD_PRICE , PRD_IMG_NAME , PRD_INFO , PRD_DELIVERY_PRICE , PRD_SIZE , PRD_ORIGIN , PRD_EXPDATE , PRD_KEEP , PRD_PACK "
					+ " FROM (SELECT ROW_NUMBER()OVER(ORDER BY REV_SEQ DESC) AS RNUM, "
					+ " P.PRD_NUM, P.PRD_NAME, P.PRD_PRICE , P.PRD_IMG_NAME , P.PRD_INFO , P.PRD_DELIVERY_PRICE , P.PRD_SIZE , P.PRD_ORIGIN , P.PRD_EXPDATE , P.PRD_KEEP , P.PRD_PACK "
					+ " FROM PRODUCT P LEFT OUTER JOIN  REV_BOARD R " + " ON P.PRD_NUM = R.REV_PRD_NUM "
					+ " WHERE R.REV_ID=? AND R.REV_DEL = ? " + " ORDER BY R.REV_SEQ DESC) ";
			sql += " WHERE RNUM >= ? AND RNUM <= ? ";

			int start, end;
			start = 1 + 5 * page; // 시작 글의 번호
			end = 5 + 5 * page; // 끝 번호

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<ProductDto> list = new ArrayList<ProductDto>();

			try {
				conn = DBConnection.getConnection();

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setInt(2, 0);
				psmt.setInt(3, start);
				psmt.setInt(4, end);

				rs = psmt.executeQuery();

				while (rs.next()) {
					int i = 1;
					ProductDto dto = new ProductDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++),
							rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
							rs.getString(i++), rs.getString(i++));
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return list;
		}

		public List<ReviewBbsDto> myPageReview2(String id, int page) {
			String sql = " SELECT REV_SEQ, REV_ID, REV_TITLE, REV_CONTENT, REV_SCORE, REV_FILENAME, REV_WDATE, REV_DEL, REV_PRD_NUM "
					+ " FROM (SELECT ROW_NUMBER()OVER(ORDER BY REV_SEQ DESC) AS RNUM, REV_SEQ, REV_ID, REV_TITLE, REV_CONTENT, REV_SCORE, REV_FILENAME, REV_WDATE, REV_DEL, REV_PRD_NUM "
					+ " FROM REV_BOARD R LEFT OUTER JOIN  PRODUCT P " + " ON R.REV_PRD_NUM = P.PRD_NUM "
					+ " WHERE R.REV_ID=? AND R.REV_DEL = ? " + " ORDER BY R.REV_SEQ DESC) ";
			sql += " WHERE RNUM >= ? AND RNUM <= ? ";

			int start, end;
			start = 1 + 5 * page; // 시작 글의 번호
			end = 5 + 5 * page; // 끝 번호

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<ReviewBbsDto> list = new ArrayList<ReviewBbsDto>();

			try {
				conn = DBConnection.getConnection();

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setInt(2, 0);
				psmt.setInt(3, start);
				psmt.setInt(4, end);

				rs = psmt.executeQuery();

				while (rs.next()) {
					int i = 1;

					ReviewBbsDto dto = new ReviewBbsDto(rs.getInt(i++), // 글번호
							rs.getString(i++), // id
							rs.getString(i++), // 제목
							rs.getString(i++), // 내용
							rs.getInt(i++), // 평점
							rs.getString(i++), // 파일이름
							rs.getString(i++), // 작성일
							rs.getInt(i++), // 삭제
							rs.getInt(i++)); // 상품번호)
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return list;
		}

		// TODO
		// 마이페이지 QNA 추가--------------------------------------------------------
		public List<QnaBbsDto> getMyPageQAlist(String id, int nowPage, String qnaSearch, String qnaSword) {

			String sql = " SELECT QNA_SEQ, QNA_ID, QNA_TITLE, QNA_CONTENT, QNA_WDATE, QNA_FILE_NAME, QNA_DEL, QNA_READCOUNT, QNA_OPEN, QNA_STATUS "
					+ " FROM "
					+ " ( SELECT ROW_NUMBER()OVER(ORDER BY QNA_SEQ DESC) AS RNUM, "
					+ " QNA_SEQ, QNA_ID, QNA_TITLE, QNA_CONTENT, QNA_WDATE, QNA_FILE_NAME, QNA_DEL, QNA_READCOUNT, QNA_OPEN, QNA_STATUS  "
					+ " FROM QNA_BOARD " 
					+ " WHERE QNA_ID = ? ";

			String searchFunction = "";

			// 확인
			if (qnaSearch.equals("tit")) {
				searchFunction += " AND QNA_TITLE LIKE '%" + qnaSword.trim() + "%' AND QNA_DEL=0 ";
			} else if (qnaSearch.equals("ctt")) {
				searchFunction += " AND QNA_CONTENT LIKE '%" + qnaSword.trim() + "%' AND QNA_DEL=0 ";
			}
			sql += searchFunction
				+ " ORDER BY QNA_SEQ DESC ) "
				+ " WHERE RNUM >= ? AND RNUM <= ? ";

			int start, end;
			start = 1 + 10 * nowPage; // 1, 11, 21
			end = 10 + 10 * nowPage; // 10, 20, 30

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<QnaBbsDto> list = new ArrayList<QnaBbsDto>();

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getQAlist success");
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setInt(2, start);
				psmt.setInt(3, end);
				
				System.out.println(id+ " " +start+ " " +end);
				
				rs = psmt.executeQuery();
				System.out.println(sql);
				System.out.println("2/6 getQAlist success");

				while (rs.next()) {
					int i = 1;

					QnaBbsDto dto = new QnaBbsDto(rs.getInt(i++), // seq
							rs.getString(i++), // id
							rs.getString(i++), // title
							rs.getString(i++), // content
							rs.getString(i++), // wadate
							rs.getString(i++), // fileName
							rs.getInt(i++), // del
							rs.getInt(i++), // readcount
							rs.getInt(i++), // open
							rs.getInt(i++)); // status

					// 파일이름 null처리
					if (dto.getFilename() == null || dto.getFilename().equals("")) {

						dto.setFilename("");
					}

					list.add(dto);
				}
				System.out.println("3/6 getQAlist success");

			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}
			return list;
		}

		// 여기값확인
		public int getMyPageQnaLeng(String id, String category, String keyword) {

			String sql = " SELECT COUNT(*) " + " FROM QNA_BOARD " + " WHERE QNA_ID=? ";

			String searchFunction = "";

			if (category.equals("tit")) {
				searchFunction += " AND QNA_TITLE LIKE " + "'%" + keyword + "%'" + " AND QNA_DEL=0 ";
			} else if (category.equals("CONTENT")) {
				searchFunction += " AND QNA_CONTENT LIKE " + "'%" + keyword + "%'" + " AND QNA_DEL=0 ";
			}

			sql += searchFunction;

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			int count = 0;

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getQABbsAmount success");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);

				System.out.println("2/6 getQABbsAmount success");

				rs = psmt.executeQuery();
				System.out.println("3/6 getQABbsAmount success");

				if (rs.next()) {

					count = rs.getInt(1);
				}
				System.out.println("4/6 getQABbsAmount success");

			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}
			return count;
		}

		// 마이페이지 리뷰 추가-------------------------------------------------------
		public List<ReviewBbsDto> getMyRevPagingList(int page, String id) {

			String sql = " SELECT REV_SEQ, REV_ID, REV_TITLE, REV_CONTENT, REV_SCORE, REV_FILENAME, REV_WDATE, REV_DEL, REV_PRD_NUM FROM ";

			sql += " (SELECT ROW_NUMBER()OVER(ORDER BY REV_SEQ DESC) AS RNUM, "
					+ " REV_SEQ, REV_ID, REV_TITLE, REV_CONTENT, REV_SCORE, REV_FILENAME, REV_WDATE, REV_DEL, REV_PRD_NUM "
					+ " FROM REV_BOARD " + " WHERE REV_ID = ? AND REV_DEL = ? ";

			sql += " ORDER BY REV_SEQ DESC) ";
			sql += " WHERE RNUM >= ? AND RNUM <= ? ";

			int start, end;
			start = 1 + 5 * page; // 시작 글의 번호
			end = 5 + 5 * page; // 끝 번호

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<ReviewBbsDto> list = new ArrayList<ReviewBbsDto>();

			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setInt(2, 0);
				psmt.setInt(3, start);
				psmt.setInt(4, end);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int i = 1;
					ReviewBbsDto dto = new ReviewBbsDto(rs.getInt(i++), // 글번호
							rs.getString(i++), // id
							rs.getString(i++), // 제목
							rs.getString(i++), // 내용
							rs.getInt(i++), // 평점
							rs.getString(i++), // 파일이름
							rs.getString(i++), // 작성일
							rs.getInt(i++), // 삭제
							rs.getInt(i++)); // 상품번호
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}
			return list;
		}

		public int getMyRevPagingListSize(String id) {

			String sql = " SELECT COUNT(*) FROM REV_BOARD" + " WHERE REV_ID = ? AND REV_DEL = ? ";

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			int num = 0;
			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setInt(2, 0);
				rs = psmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}
			return num;
		}
				// 결제 기능전 재고 확인
				public String checkStock(String prd_num, String prd_amount) {
					String sql = " SELECT CASE "
								+" WHEN PRD_AMOUNT - ? <= 0 then '무' "	//부족
								+" else '유' end "					//충분
								+" FROM PRODUCT "
								+" WHERE PRD_NUM=? ";

					Connection conn = null;
					PreparedStatement psmt = null;
					ResultSet rs = null;

					String stockCheck = "";

					try {
						conn = DBConnection.getConnection();
						System.out.println("1/6 checkCart success");

						psmt = conn.prepareStatement(sql);
						psmt.setString(1, prd_amount);
						psmt.setString(2, prd_num);
						System.out.println("2/6 checkCart success");

						rs = psmt.executeQuery();
						System.out.println("3/6 checkCart success");

						while(rs.next()) {
							int i = 1;
							stockCheck = rs.getString(i++);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						DBClose.close(psmt, conn, rs);
					}
					return stockCheck;
				}

				// 결제 기능3 (역할은 재고 관리
				public void payList3(String productNum, String amount) {

					String sql = " UPDATE PRODUCT "
							    +" SET PRD_AMOUNT = PRD_AMOUNT - ? , " 
								+" PRD_SELL = PRD_SELL + ? "
								+" WHERE PRD_NUM = ? AND PRD_DEL = 0 ";

					Connection conn = null;
					PreparedStatement psmt = null;

					try {
						conn = DBConnection.getConnection();
						System.out.println("1/6 payList2 success");

						psmt = conn.prepareStatement(sql);
						psmt.setString(1, amount);
						psmt.setString(2, amount);
						psmt.setString(3, productNum);
						System.out.println("2/6 payList3 success");

						psmt.executeUpdate();
						System.out.println("3/6 payList3 success");

					} catch (Exception e) {
						System.out.println("payList3 fail");
						e.printStackTrace();
					} finally {
						DBClose.close(psmt, conn, null);
					}
				}

				//---------------------------------------------------------------------------------------------
}
