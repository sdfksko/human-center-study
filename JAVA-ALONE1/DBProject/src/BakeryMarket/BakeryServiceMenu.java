package BakeryMarket;

import java.sql.*;
import java.util.Scanner;
import bakery.util.BakeryManager;

public class BakeryServiceMenu {
	Scanner scanner = new Scanner(System.in);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void allMenu() {
		System.out.println("메뉴번호    빵 이름           빵 가격     빵 재고         "
							+ "케이크 이름             케이크 가격     케이크 재고        "
							+ "음료 이름                음료 가격         음료 재고"
							);
		Connection conn = BakeryManager.getDBConnection();
		
		String allMenuSql = "SELECT * FROM bakery ORDER BY menuNo";
		
		try {
			pstmt = conn.prepareStatement(allMenuSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(
						String.format("%-9s", rs.getInt("menuNo")) +
						String.format("%-17s", rs.getString("bread_name")) +
						String.format("%-12s", rs.getInt("bread_price")) +
						String.format("%-10s", rs.getInt("bread_inventory")) +
						String.format("%-25s", rs.getString("cake_name")) +
						String.format("%-15s", rs.getInt("cake_price")) +
						String.format("%-10s", rs.getInt("cake_inventory")) +
						String.format("%-26s", rs.getString("drink_name")) +
						String.format("%-18s", rs.getInt("drink_price")) +
						String.format("%-10s", rs.getInt("drink_inventory"))
				);
			}
		} catch(SQLException se) {
			System.out.println("매장 내 품목 목록 보기에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, rs);
		}
	}
	
	public int addBreadMenu() {
		String name; 
		int price = 0;
		int inventory = 0;
		
		Connection conn = BakeryManager.getDBConnection();
		int resultRows= 0;		
		
		qwe:while(true) {
			System.out.println("새롭게 추가할 빵의 이름을 입력해주십시오.(메뉴로 돌아가기: exit)");
			name = scanner.nextLine();
			if (name.equals("exit")) {
				System.out.println("메뉴로 돌아갑니다.");
				return -1;
			}
			try{
				String bread_nameSql = "SELECT COUNT(*) FROM bakery WHERE bread_name = ?";
				pstmt = conn.prepareStatement(bread_nameSql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				if(rs.next() && rs.getInt(1) > 0) {
					System.out.println("이미 존재하는 빵입니다. 다른 이름을 입력해주십시오");
					continue;
				}
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
			
			System.out.println("새롭게 추가할 빵의 이름은 " + name + "입니다");
			while(true) {
				System.out.println("새롭게 추가할 빵의 가격을 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
				try{
					price = Integer.parseInt(scanner.nextLine());				
					if (price == -1) {
						System.out.println("뒤로가기에 성공하였습니다.");
						break;
					}	
					else if (price == -2) {
						System.out.println("메뉴로 돌아갑니다.");
						return -1;
					}
					
					if (price > 0) {
						System.out.println("새롭게 추가할 빵의 가격은 " + price + "입니다");
					}else {
						System.out.println("새롭게 추가할 빵의 가격은 0보다 커야합니다");
						continue;
					}
				}catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
				}
				
				while(true) {
					System.out.println("새롭게 추가할 빵의 재고를 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
					try{
						inventory = Integer.parseInt(scanner.nextLine());
						if(inventory == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(inventory == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return -1;
						} else if(inventory==-3) {
							continue qwe;
						}
						if (0 <= inventory) {
							System.out.println("새롭게 추가할 빵의 재고량은 " + inventory + "개입니다");
							break;
						}else {
							System.out.println("새롭게 추가할 빵의 재고량은 0과 같거나 커야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
				}
				
				if(inventory == -1) {
					continue;
				}
				break;
			}
			if(price == -1) {
				continue;
			}
			break;
		}
		
		String insertSql = """
				INSERT INTO bakery(menuNo, bread_name, bread_price, bread_inventory)
			    VALUES(menuNo_board_no.NEXTVAL, ?, ?, ?)
				""";
		
		try {
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			
			resultRows = pstmt.executeUpdate();
			
			System.out.println("메뉴 추가에 성공하였습니다");
			
		} catch(SQLException se) {
			System.out.println("메뉴 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		return resultRows;
	}
	
	
	public int addCakeMenu() {
		String name; 
		int price = 0;
		int inventory = 0;
		
		Connection conn = BakeryManager.getDBConnection();
		int resultRows= 0;		
		
		while(true) {
			System.out.println("새롭게 추가할 케이크의 이름을 입력해주십시오.(메뉴로 돌아가기: exit)");
			name = scanner.nextLine();
			if (name.equals("exit")) {
				System.out.println("메뉴로 돌아갑니다.");
				return -1;
			}
			try{
				String cake_nameSql = "SELECT COUNT(*) FROM bakery WHERE cake_name = ?";
				pstmt = conn.prepareStatement(cake_nameSql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				if(rs.next() && rs.getInt(1) > 0) {
					System.out.println("이미 존재하는 케이크입니다. 다른 이름을 입력해주십시오");
					continue;
				}
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
			
			System.out.println("새롭게 추가할 케이크의 이름은 " + name + "입니다");
			while(true) {
				System.out.println("새롭게 추가할 케이크의 가격을 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
				try{
					price = Integer.parseInt(scanner.nextLine());
					if (price == -1) {
						System.out.println("뒤로가기에 성공하였습니다.");
						break;
					}	
					if (price == -2) {
						System.out.println("메뉴로 돌아갑니다.");
						return -1;
					}
					if(0 < price) {
						System.out.println("새롭게 추가할 케이크의 가격은 " + price + "원입니다");
					} else {
						System.out.println("새롭게 추가할 케이크의 가격은 0보다 커야합니다");
						continue;
					}
				}catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
				}
				while(true) {
					System.out.println("새롭게 추가할 케이크의 재고를 입력해주십시오.( 뒤로가기: -1 (메뉴로 돌아가기: -2)");
					try{
						inventory = Integer.parseInt(scanner.nextLine());
						if (inventory == -1) {
							System.out.println("뒤로가기에 성공하였습니다.");
							break;
						}	
						if (inventory == -2) {
							System.out.println("메뉴로 돌아갑니다.");
							return -1;
						}
						if (0 <= inventory) {
							System.out.println("새롭게 추가할 케이크의 재고량은 " + inventory + "개입니다");
							break;
						}else {
							System.out.println("새롭게 추가할 케이크의 재고량은 0과 같거나 커야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}	
				}
				if(inventory == -1) {
					continue;
				}break;
			}
			if(price == -1) {
				continue;
			}break;
		}
		
		String insertSql2 = """
				INSERT INTO bakery(menuNo, cake_name, cake_price, cake_inventory)
			    VALUES(menuNo_board_no.NEXTVAL, ?, ?, ?)
				""";
		
		try {
			pstmt = conn.prepareStatement(insertSql2);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			
			resultRows = pstmt.executeUpdate();
			
			System.out.println("메뉴 추가에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		return resultRows;
	}
	
	public int addDrinkMenu() {
		String name; 
		int price = 0;
		int inventory = 0;

		Connection conn = BakeryManager.getDBConnection();
		int resultRows= 0;		
		while(true) {
			System.out.println("새롭게 추가할 음료의 이름을 입력해주십시오.(메뉴로 돌아가기: exit)");
			name = scanner.nextLine();
			if (name.equals("exit")) {
				System.out.println("메뉴로 돌아갑니다.");
				return -1;
			}
			String drink_nameSql = "SELECT COUNT(*) FROM bakery WHERE drink_name = ?";
			try {
				pstmt = conn.prepareStatement(drink_nameSql);
				pstmt.setInt(1, price);
				rs = pstmt.executeQuery();
				if(rs.next() && rs.getInt(1) > 0) {
					System.out.println("이미 존재하는 음료입니다. 다른 이름을 입력해주십시오");
					continue;
				}
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		
			System.out.println("새롭게 추가할 음료의 이름은 " + name + "입니다");
			while(true) {
				System.out.println("새롭게 추가할 음료의 가격을 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
				
				try{ 
					price = Integer.parseInt(scanner.nextLine());
					if (price == -1) {
						System.out.println("뒤로가기에 성공하였습니다.");
						break;
					}	
					if (price == -2) {
						System.out.println("메뉴로 돌아갑니다.");
						return -1;
					}
					if(0 < price) {
						System.out.println("새롭게 추가할 음료의 가격은 " + price + "원입니다");
					} else {
						System.out.println("새롭게 추가할 음료의 가격은 0보다 커야합니다");
						continue;
					}
				}catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력하십시오");
				}
				
				while(true) {
					System.out.println("새롭게 추가할 음료의 재고를 입력해주십시오.( 뒤로가기: -1 (메뉴로 돌아가기: -2)");
					try{
						inventory = Integer.parseInt(scanner.nextLine());
						if (inventory == -1) {
							System.out.println("뒤로가기에 성공하였습니다.");
							break;
						}	
						if (inventory == -2) {
							System.out.println("메뉴로 돌아갑니다.");
							return -1;
						}
						if(0 <= inventory) {
							System.out.println("새롭게 추가할 음료의 재고량은 " + inventory + "개입니다");
							break;
						} else {
							System.out.println("새롭게 추가할 음료의 재고량은 0과 같거나 커야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}	
				}
				if(inventory == -1) {
					continue;
				}
				break;
			}
			if(price == -1) {
				continue;
			}
			break;
		}

		String insertSql3 = """
				INSERT INTO bakery(menuNo, drink_name, drink_price, drink_inventory)
			    VALUES(menuNo_board_no.NEXTVAL, ?, ?, ?)
				""";
		
		try {
			pstmt = conn.prepareStatement(insertSql3);;
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			
			resultRows = pstmt.executeUpdate();
			
			System.out.println("메뉴 추가에 성공하였습니다");
			
		} catch(SQLException se) {
			System.out.println("메뉴 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		return resultRows;
	}
	
	public int addAllMenu() {
		String name; 
		int price = 0;
		int inventory = 0;
		String leon = null;
		int price2 = 0;
		int inventory2 = 0;
		String tiger = null;
		int price3 = 0;
		int inventory3 = 0;
		
		while(true) {
			System.out.println("새롭게 추가할 빵의 이름을 입력해주십시오.(메뉴로 돌아가기: exit)");
			name = scanner.nextLine();
			if (name.equals("exit")) {
				System.out.println("메뉴로 돌아갑니다.");
				return -1;
			}
			System.out.println("새롭게 추가할 빵의 이름은 " + name + "입니다");
			while(true) {
				System.out.println("새롭게 추가할 빵의 가격을 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
				try{
					price = Integer.parseInt(scanner.nextLine());
					if (price == -1) {
						System.out.println("뒤로가기에 성공하였습니다.");
						break;
					}	
					if (price == -2) {
						System.out.println("메뉴로 돌아갑니다.");
						return -1;
					}
					if (0 < price) {
						System.out.println("새롭게 추가할 빵의 가격은 " + price + "입니다");
					}else {
						System.out.println("새롭게 추가할 빵의 가격은 0보다 커야합니다");
						continue;
					}
				}catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
				}
				
				while(true) {
					System.out.println("새롭게 추가할 빵의 재고를 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
					try{
						inventory = Integer.parseInt(scanner.nextLine());
						if(inventory == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(inventory == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return -1;
						} 
						
						if (0 <= inventory) {
							System.out.println("새롭게 추가할 빵의 재고량은 " + inventory + "개입니다");
						}else {
							System.out.println("새롭게 추가할 빵의 재고량은 0과 같거나 커야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
					
					while(true) {
						System.out.println("새롭게 추가할 케이크의 이름을 입력해주십시오.(메뉴로 돌아가기: exit)");
						leon = scanner.nextLine();
						if (leon.equals("exit")) {
							System.out.println("메뉴로 돌아갑니다.");
							return -1;
						}
						
						System.out.println("새롭게 추가할 케이크의 이름은 " + leon + "입니다");
						while(true) {
							System.out.println("새롭게 추가할 케이크의 가격을 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
							try{
								price2 = Integer.parseInt(scanner.nextLine());
								if (price2 == -1) {
									System.out.println("뒤로가기에 성공하였습니다.");
									break;
								}	
								if (price2 == -2) {
									System.out.println("메뉴로 돌아갑니다.");
									return -1;
								}
								if(0 < price2) {
									System.out.println("새롭게 추가할 케이크의 가격은 " + price2 + "원입니다");
								} else {
									System.out.println("새롭게 추가할 케이크의 가격은 0보다 커야합니다");
									continue;
								}
							}catch(NumberFormatException e) {
								System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
							}
							
							while(true) {
								System.out.println("새롭게 추가할 케이크의 재고를 입력해주십시오.( 뒤로가기: -1 (메뉴로 돌아가기: -2)");
								try{
									inventory2 = Integer.parseInt(scanner.nextLine());
									if (inventory2 == -1) {
										System.out.println("뒤로가기에 성공하였습니다.");
										break;
									}	
									if (inventory2 == -2) {
										System.out.println("메뉴로 돌아갑니다.");
										return -1;
									}
									if (0 <= inventory2) {
										System.out.println("새롭게 추가할 케이크의 재고량은 " + inventory2 + "개입니다");
									}else {
										System.out.println("새롭게 추가할 케이크의 재고량은 0과 같거나 커야합니다");
										continue;
									}
								}catch(NumberFormatException e) {
									System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
								}
								
								while(true) {
									System.out.println("새롭게 추가할 음료의 이름을 입력해주십시오.(메뉴로 돌아가기: exit)");
									tiger = scanner.nextLine();
									if (tiger.equals("exit")) {
										System.out.println("메뉴로 돌아갑니다.");
										return -1;
									}
									System.out.println("새롭게 추가할 음료의 이름은 " + tiger + "입니다");
									
									while(true) {
										System.out.println("새롭게 추가할 음료의 가격을 입력해주십시오.(뒤로가기: -1 (메뉴로 돌아가기: -2)");
										try{ 
											price3 = Integer.parseInt(scanner.nextLine());
											if (price3 == -1) {
												System.out.println("뒤로가기에 성공하였습니다.");
												break;
											}	
											if (price3 == -2) {
												System.out.println("메뉴로 돌아갑니다.");
												return -1;
											}
											if(0 < price3) {
												System.out.println("새롭게 추가할 음료의 가격은 " + price3 + "원입니다");
											} else {
												System.out.println("새롭게 추가할 음료의 가격은 0보다 커야합니다");
												continue;
											}
										}catch(NumberFormatException e) {
											System.out.println("올바른 값이 아닙니다. 숫자로 입력하십시오");
										}
										
										while(true) {
											System.out.println("새롭게 추가할 음료의 재고를 입력해주십시오.( 뒤로가기: -1 (메뉴로 돌아가기: -2)");
											try{
												inventory3 = Integer.parseInt(scanner.nextLine());
												if (inventory3 == -1) {
													System.out.println("뒤로가기에 성공하였습니다.");
													break;
												}	
												if (inventory3 == -2) {
													System.out.println("메뉴로 돌아갑니다.");
													return -1;
												}
												if(0 <= inventory3) {
													System.out.println("새롭게 추가할 음료의 재고량은 " + inventory3 + "개입니다");
													break;
												} else {
													System.out.println("새롭게 추가할 음료의 재고량은 0과 같거나 커야합니다");
													continue;
												}
											}catch(NumberFormatException e) {
												System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
											}	
										}
										
										if(inventory3 == -1) {
											continue;
										}
										break;
									}
									if(price3 == -1) {
										continue;
									}break;
								}
								if(tiger.equals("exit")) {
									continue;
								}break;
							}
							if(inventory2 ==- 1) {
								continue;
							}break;
						}
						if(price2 == -1) {
							continue;
						}break;
					}
					if(leon.equals("exit")) {
						continue;
					}break;
				}
				if(inventory == -1) {
					continue;
				}break;
			}
			if(price == -1) {
				continue;
			}break;
		}
			
		Connection conn = BakeryManager.getDBConnection();
		
		String insertSql = """
				INSERT INTO bakery VALUES(menuNo_board_no.NEXTVAL, ? , ?, ?, ? , ?, ?, ? , ?, ?) 
				""";
		int resultRow = 0;
		try {
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			pstmt.setString(4, leon);
			pstmt.setInt(5, price2);
			pstmt.setInt(6, inventory2);
			pstmt.setString(7, tiger);
			pstmt.setInt(8, price3);
			pstmt.setInt(9, inventory3);
			
			resultRow = pstmt.executeUpdate();
			
			System.out.println("메뉴 추가에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 추가에 실패하였습니다");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		return resultRow;
	}
	
	public void updateBreadInventory() {
		String name;
		int inventory = 0;
		
		while(true) {
			System.out.println("재고를 추가할 빵의 이름을 입력해주십시오(메뉴로 돌아가기: exit");
			name = scanner.nextLine();
			if(name.equals("exit")) {
				System.out.println("뒤로가기에 성공하였습니다");
				return;
			}
			System.out.println("재고를 추가할 빵의 이름은 " + name + "입니다");
			while(true) {
				try {
					System.out.println("추가할 재고량을 입력하십시오(뒤로가기: -1(메뉴로돌아가기: -2)");
					inventory = Integer.parseInt(scanner.nextLine());
					if(inventory == -1) {
						System.out.println("뒤로가기에 성공하였습니다");
						break;
					}
					if(inventory == -2) {
						System.out.println("메뉴로 돌아갑니다");
						return;
					}
					if (0 <inventory) {
						System.out.println("추가할 재고량은 " + inventory + "개입니다");
						break;
					} else {
						System.out.println("추가할 재고량은 0보다 큰 값을 입력해야합니다");
						continue;
					}
				} catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
				}
			}
			if(inventory == -1) {
				continue;
			}break;
		}	
		Connection conn = BakeryManager.getDBConnection();
		
		String updateSql = """
				UPDATE bakery set bread_inventory = NVL(bread_inventory, 0) + ? 
				WHERE bread_name = ?""";
		
		int resultRow = 0;
		
		try{
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setInt(1, inventory);
			pstmt.setString(2, name);
			
			resultRow = pstmt.executeUpdate();	// Update 실행
			
			System.out.println("빵 재고 추가에 성공하였습니다.");
		} catch(SQLException se) {
			System.out.println("빵 재고 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
	}
	
	public void updateCakeInventory() {
		String name;
		int inventory = 0;
		
		while(true) {
			System.out.println("재고를 추가할 케이크의 이름을 입력해주십시오(메뉴로 돌아가기: exit");
			name = scanner.nextLine();
			if(name.equals("exit")) {
				System.out.println("뒤로가기에 성공하였습니다");
				return;	
			}
			System.out.println("재고를 추가할 케이크의 이름은 " + name + "입니다");
			while(true) {
				try {
					System.out.println("추가할 재고량을 입력하십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
					inventory = Integer.parseInt(scanner.nextLine());
					if(inventory == -1) {
						System.out.println("뒤로가기에 성공하였습니다");
						break;
					}
					if(inventory == -2) {
						System.out.println("메뉴로 돌아갑니다");
						return;
					}
					if (0 < inventory) {
						System.out.println("추가할 재고량은 " + inventory + "개입니다");
						break;
					} else {
						System.out.println("추가할 재고량은 0보다 큰 값을 입력해야합니다");
						continue;
					}
				} catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
				}
			}
			if(inventory == -1) {
				continue;
			}break;
		}	
		Connection conn = BakeryManager.getDBConnection();
		
		String updateSql = """
				UPDATE bakery set cake_inventory = NVL(cake_inventory, 0) + ? 
				WHERE cake_name = ?""";
		
		int resultRow = 0;
		
		try{
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setInt(1, inventory);
			pstmt.setString(2, name);
			
			resultRow = pstmt.executeUpdate();	// Update 실행
			
			System.out.println("케이크 재고 추가에 성공하였습니다.");
		} catch(SQLException se) {
			System.out.println("케이크 재고 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
	}
	
	public void updateDrinkInventory() {
		String name;
		int inventory = 0;
		while(true) {
			System.out.println("재고를 추가할 음료의 이름을 입력해주십시오(메뉴로 돌아가기: exit)");
			name = scanner.nextLine();
			if(name.equals("exit")) {
				System.out.println("뒤로가기에 성공하였습니다");
				return;
			}
			System.out.println("재고를 추가할 음료의 이름은 " + name + "입니다");
			while(true) {
				try{
					System.out.println("추가할 재고량을 입력하십시오(-1: 뒤로가기(메뉴로 돌아가기: -2)");
					inventory = Integer.parseInt(scanner.nextLine());
					if(inventory == -1) {
						System.out.println("뒤로가기에 성공하였습니다");
						break;
					}
					if(inventory == -2) {
						System.out.println("메뉴로 돌아갑니다");
						return;
					}
					if (0 < inventory) {
						System.out.println("추가할 재고량은 " + inventory + "개입니다");
						break;
					} else {
						System.out.println("재고량은 0보다 큰 값을 입력해야 합니다");
						continue;
					}
				}catch(NumberFormatException e) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
				}
			}
			if(inventory == -1) {
				continue;
			} break;
		}	
		Connection conn = BakeryManager.getDBConnection();
		
		String updateSql = """
				UPDATE bakery set drink_inventory = NVL(drink_inventory, 0) + ?  
				WHERE drink_name = ?""";
		
		int resultRow = 0;
		
		try{
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setInt(1, inventory);
			pstmt.setString(2, name);
			
			resultRow = pstmt.executeUpdate();	// Update 실행
			
			System.out.println("음료 재고 추가에 성공하였습니다.");
		} catch(SQLException se) {
			System.out.println("음료 재고 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
	}
	
	public void updateOneBMenu() {
		int menuNo = 0;
		String name = null;
		int price = 0;
		int inventory = 0;

		Connection conn = BakeryManager.getDBConnection();
		int resultRow = 0;
		while(true) {
			try {
				System.out.println("추가할 기존 메뉴의 번호를 입력해주십시오(메뉴로 돌아가기: -1)");
				menuNo = Integer.parseInt(scanner.nextLine());
				if(menuNo == -1) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				String countSql = "SELECT COUNT(*) FROM bakery WHERE menuNo =? ";
				
				pstmt = conn.prepareStatement(countSql);
				pstmt.setInt(1, menuNo);
				rs = pstmt.executeQuery(); 
				if (rs.next()) {
					resultRow = rs.getInt(1);
				}		
				if (resultRow == 0) {
					System.out.println("추가할 기존 메뉴의 번호가 없습니다. 번호는 1번부터 시작합니다");
					continue;
				}									
				} catch(NumberFormatException se) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					continue;
				} catch(SQLException se) {
					System.out.println("error" + se.getMessage());
				}	
				System.out.println("추가할 기존 메뉴의 번호는 " + menuNo + "번입니다");
			while(true) {
				System.out.println("추가할 메뉴의 이름을 입력해주십시오(뒤로가기: back(메뉴로 돌아가기: exit)");
				name = scanner.nextLine();
				if(name.equals("back")) {
					System.out.println("뒤로가기에 성공하였습니다");
					break;
				}
				if(name.equals("exit")) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				System.out.println("추가할 메뉴의 이름은 " + name + "입니다");
				while(true) {
					try{System.out.println("추가할 메뉴의 가격을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
						price = Integer.parseInt(scanner.nextLine());
						if(price == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(price == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return;
						}
						if(0 < price) {
							System.out.println("추가할 메뉴의 가격은 " + price + "원입니다");
						} else {
							System.out.println("추가할 메뉴의 가격은 0보다 큰 값이어야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
					while(true) {
						try{
							System.out.println("추가할 메뉴의 재고를 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
							inventory = Integer.parseInt(scanner.nextLine());
							if(inventory == -1) {
								System.out.println("뒤로가기에 성공하였습니다");
								break;
							}
							if(inventory == -2) {
								System.out.println("메뉴로 돌아갑니다");
								return;
							}
							if (0 <= inventory) {
								System.out.println("추가할 메뉴의 재고량은 " + inventory + "개입니다");
								break;
							} else {
								System.out.println("추가할 메뉴의 재고량은 0과 같거나 큰 값을 입력해야 합니다");
								continue;
							}
						}catch(NumberFormatException e) {
							System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
						}
					}
					if(inventory == -1) {
						continue;
					}
					if(0 <= inventory) {
						break;
					}
				}
				if(price == -1) {
					continue;
				}
				if(0 <= price) {
					break;
				}
			}
			if(name.equals("back")) {
				continue;
			}
			break;
		}
		
		String updateSql = """
				UPDATE bakery set bread_name = ?, bread_price = ?, bread_inventory = ? 
				WHERE menuNo = ?""";
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			pstmt.setInt(4, menuNo);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("메뉴 추가에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		
	}
	
	public void updateOneCMenu() {
		int menuNo = 0;
		String name = null;
		int price = 0;
		int inventory = 0;
		Connection conn = BakeryManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		while(true) {
			try {
				System.out.println("추가할 기존 메뉴의 번호를 입력해주십시오(메뉴로 돌아가기: -1)");
				menuNo = Integer.parseInt(scanner.nextLine());
				if(menuNo == -1) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				String countSql = "SELECT COUNT(*) FROM bakery WHERE menuNo =? ";
				
				pstmt = conn.prepareStatement(countSql);
				pstmt.setInt(1, menuNo);
				rs = pstmt.executeQuery(); 
				if (rs.next()) {
					resultRow = rs.getInt(1);
				}		
				if (resultRow == 0) {
					System.out.println("추가할 기존 메뉴의 번호가 없습니다. 번호는 1번부터 시작합니다");
					continue;
				}									
				} catch(NumberFormatException se) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					continue;
				} catch(SQLException se) {
					System.out.println("error" + se.getMessage());
				}	
				System.out.println("추가할 기존 메뉴의 번호는 " + menuNo + "번입니다");
			while(true) {
				System.out.println("추가할 메뉴의 이름을 입력해주십시오(뒤로가기: back(메뉴로 돌아가기: exit)");
				name = scanner.nextLine();
				if(name.equals("back")) {
					System.out.println("뒤로가기에 성공하였습니다");
					break;
				}
				if(name.equals("exit")) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				System.out.println("추가할 메뉴의 이름은 " + name + "입니다");
				while(true) {
					try{System.out.println("추가할 메뉴의 가격을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
						price = Integer.parseInt(scanner.nextLine());
						if(price == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(price == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return;
						}
						if(0 < price) {
							System.out.println("추가할 메뉴의 가격은 " + price + "원입니다");
						} else {
							System.out.println("추가할 메뉴의 가격은 0보다 큰 값이어야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
					while(true) {
						try{
							System.out.println("추가할 메뉴의 재고를 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
							inventory = Integer.parseInt(scanner.nextLine());
							if(inventory == -1) {
								System.out.println("뒤로가기에 성공하였습니다");
								break;
							}
							if(inventory == -2) {
								System.out.println("메뉴로 돌아갑니다");
								return;
							}
							if (0 <= inventory) {
								System.out.println("추가할 메뉴의 재고량은 " + inventory + "개입니다");
								break;
							} else {
								System.out.println("추가할 메뉴의 재고량은 0과 같거나 큰 값을 입력해야 합니다");
								continue;
							}
						}catch(NumberFormatException e) {
							System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
						}
					}
					if(inventory == -1) {
						continue;
					}
					if(0 <= inventory) {
						break;
					}
				}
				if(price == -1) {
					continue;
				}
				if(0 <= price) {
					break;
				}
			}
			if(name.equals("back")) {
				continue;
			}
			break;
		}
		
		String updateSql = """
				UPDATE bakery set cake_name = ?, cake_price = ?, cake_inventory = ?
				WHERE menuNo = ?""";
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			pstmt.setInt(4, menuNo);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("메뉴 추가에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		
	}
	
	public void updateOneDMenu() {
		int menuNo = 0;
		String name = null;
		int price = 0;
		int inventory = 0;
		Connection conn = BakeryManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		while(true) {
			try {
				System.out.println("추가할 기존 메뉴의 번호를 입력해주십시오(메뉴로 돌아가기: -1)");
				menuNo = Integer.parseInt(scanner.nextLine());
				if(menuNo == -1) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				String countSql = "SELECT COUNT(*) FROM bakery WHERE menuNo =? ";
				
				pstmt = conn.prepareStatement(countSql);
				pstmt.setInt(1, menuNo);
				rs = pstmt.executeQuery(); 
				if (rs.next()) {
					resultRow = rs.getInt(1);
				}		
				if (resultRow == 0) {
					System.out.println("추가할 기존 메뉴의 번호가 없습니다. 번호는 1번부터 시작합니다");
					continue;
				}									
				} catch(NumberFormatException se) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					continue;
				} catch(SQLException se) {
					System.out.println("error" + se.getMessage());
				}	
				System.out.println("추가할 기존 메뉴의 번호는 " + menuNo + "번입니다");
			while(true) {
				System.out.println("추가할 메뉴의 이름을 입력해주십시오(뒤로가기: back(메뉴로 돌아가기: exit)");
				name = scanner.nextLine();
				if(name.equals("back")) {
					System.out.println("뒤로가기에 성공하였습니다");
					break;
				}
				if(name.equals("exit")) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				System.out.println("추가할 메뉴의 이름은 " + name + "입니다");
				while(true) {
					try{System.out.println("추가할 메뉴의 가격을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
						price = Integer.parseInt(scanner.nextLine());
						if(price == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(price == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return;
						}
						if(0 < price) {
							System.out.println("추가할 메뉴의 가격은 " + price + "원입니다");
						} else {
							System.out.println("추가할 메뉴의 가격은 0보다 큰 값이어야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
					while(true) {
						try{
							System.out.println("추가할 메뉴의 재고를 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
							inventory = Integer.parseInt(scanner.nextLine());
							if(inventory == -1) {
								System.out.println("뒤로가기에 성공하였습니다");
								break;
							}
							if(inventory == -2) {
								System.out.println("메뉴로 돌아갑니다");
								return;
							}
							if (0 <= inventory) {
								System.out.println("추가할 메뉴의 재고량은 " + inventory + "개입니다");
								break;
							} else {
								System.out.println("추가할 메뉴의 재고량은 0과 같거나 큰 값을 입력해야 합니다");
								continue;
							}
						}catch(NumberFormatException e) {
							System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
						}
					}
					if(inventory == -1) {
						continue;
					}
					if(0 <= inventory) {
						break;
					}
				}
				if(price == -1) {
					continue;
				}
				if(0 <= price) {
					break;
				}
			}
			if(name.equals("back")) {
				continue;
			}
			break;
		}
		
		String updateSql = """
				UPDATE bakery set drink_name = ?, drink_price = ?, drink_inventory = ? 
				WHERE menuNo = ?""";
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			pstmt.setInt(4, menuNo);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("메뉴 추가에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 추가에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		
	}
	
	public void deleteAllMenu() {
		int menuNo = 0;
		Connection conn = BakeryManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		while(true) {
			try {
				System.out.println("삭제할 메뉴의 번호를 입력해주십시오(메뉴로 돌아가기: -1)");
				menuNo = Integer.parseInt(scanner.nextLine());
				if(menuNo == -1) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				String countSql = "SELECT COUNT(*) FROM bakery WHERE menuNo =? ";
				
				pstmt = conn.prepareStatement(countSql);
				pstmt.setInt(1, menuNo);
				rs = pstmt.executeQuery(); 
				if (rs.next()) {
					resultRow = rs.getInt(1);
				}		
				if (resultRow == 0) {
					System.out.println("삭제할 메뉴의 번호가 없습니다. 번호는 1번부터 시작합니다");
					continue;
				}									
				} catch(NumberFormatException se) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					continue;
				} catch(SQLException se) {
					System.out.println("error" + se.getMessage());
				}	
				System.out.println("삭제할 메뉴의 번호는 " + menuNo + "번입니다");
				break;
		}
		
		String deleteSql = """
				UPDATE bakery set bread_name = null, bread_price = null, bread_inventory = null
				, cake_name = null, cake_price = null, cake_inventory = null, drink_name = null
				, drink_price = null, drink_inventory = null
				WHERE menuNo = ?
				""";
		
		System.out.println("해당 메뉴를 정말로 삭제하시겠습니까? Y/N");
		String a = scanner.nextLine();
		if (!a.equals("Y")) {
			System.out.println("메뉴 삭제를 취소합니다.");
			return;
		}
		
		
		try {
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setInt(1, menuNo);
			
			resultRow = pstmt.executeUpdate();
			
			System.out.println("메뉴 삭제에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 삭제에 실패하였습니다");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
	}
	
	public void deleteBreadMenu() {
		String name;
		
		Connection conn = BakeryManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		while(true) {
		System.out.println("삭제할 빵의 이름을 입력해주십시오(메뉴로 돌아가기: exit");
		name = scanner.nextLine();
		if(name.equals("exit")) {
			System.out.println("메뉴로 돌아갑니다");
			return;
		}
		try {
			String delete_bread_nameSql = "SELECT COUNT(*) FROM bakery WHERE bread_name = ?";
			pstmt = conn.prepareStatement(delete_bread_nameSql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultRow = rs.getInt(1);
				if(resultRow == 0) {
					System.out.println("삭제할 빵이 없습니다");
					continue;
				}
			}
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
		System.out.println("삭제할 빵의 이름은 " + name + "입니다");
		break;
		}
		String updateSql = """
				UPDATE bakery set bread_name = null, bread_price = null, bread_inventory = null 
				WHERE bread_name = ?""";
		
		System.out.println("해당 메뉴" + "(" + name + ")" + "을(를) 정말로 삭제하시겠습니까? Y/N");
		String a = scanner.nextLine();
		if (!a.equals("Y")) {
			System.out.println("메뉴 삭제를 취소합니다.");
			return;
		}
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("빵 메뉴 삭제에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("빵 메뉴 삭제에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		
	}
	
	public void deleteCakeMenu() {
		System.out.println("삭제할 케이크의 이름을 입력해주십시오(메뉴로돌아가기: exit)");
		String name = scanner.nextLine();
		System.out.println("삭제할 케이크의 이름은 " + name + "입니다");
		
		if(name.equals("exit")) {
			System.out.println("메뉴로 돌아갑니다");
			return;
		}
		
		Connection conn = BakeryManager.getDBConnection();
		
		String updateSql = """
				UPDATE bakery set cake_name = null, cake_price = null, cake_inventory = null 
				WHERE cake_name = ?""";
		
		PreparedStatement pstmt = null;
		int resultRow = 0;
		
		System.out.println("해당 메뉴" + "(" + name + ")" + "을(를) 정말로 삭제하시겠습니까? Y/N");
		String a = scanner.nextLine();
		if (!a.equals("Y")) {
			System.out.println("메뉴 삭제를 취소합니다.");
			return;
		}
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("케이크 메뉴 삭제에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("케이크 메뉴 삭제에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		
	}
	
	public void deleteDrinkMenu() {
		System.out.println("삭제할 음료의 이름을 입력해주십시오(메뉴로 돌아가기: exit)");
		String name = scanner.nextLine();
		System.out.println("삭제할 음료의 이름은 " + name + "입니다");
		
		if(name.equals("exit")) {
			System.out.println("메뉴로 돌아갑니다");
			return;
		}
		
		Connection conn = BakeryManager.getDBConnection();
		
		String updateSql = """
				UPDATE bakery set drink_name = null, drink_price = null, drink_inventory = null 
				WHERE drink_name = ?""";
		
		PreparedStatement pstmt = null;
		int resultRow = 0;
		
		System.out.println("해당 메뉴" + "(" + name + ")" + "을(를) 정말로 삭제하시겠습니까? Y/N");
		String a = scanner.nextLine();
		if (!a.equals("Y")) {
			System.out.println("메뉴 삭제를 취소합니다.");
			return;
		}
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("음료 메뉴 삭제에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("음료 메뉴 삭제에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
	}
	
	public void correctionBreadMenu() {
		int menuNo = 0;
		String name = null;
		int price = 0;
		int inventory = 0;
		Connection conn = BakeryManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		while(true) {
			try {
				System.out.println("수정할 메뉴의 번호를 입력해주십시오(메뉴로 돌아가기: -1)");
				menuNo = Integer.parseInt(scanner.nextLine());
				if(menuNo == -1) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				String countSql = "SELECT COUNT(*) FROM bakery WHERE menuNo =? ";
				
				pstmt = conn.prepareStatement(countSql);
				pstmt.setInt(1, menuNo);
				rs = pstmt.executeQuery(); 
				if (rs.next()) {
					resultRow = rs.getInt(1);
				}		
				if (resultRow == 0) {
					System.out.println("수정할 메뉴의 번호가 없습니다. 번호는 1번부터 시작합니다");
					continue;
				}									
				} catch(NumberFormatException se) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					continue;
				} catch(SQLException se) {
					System.out.println("error" + se.getMessage());
				}	
				System.out.println("수정할 메뉴의 번호는 " + menuNo + "번입니다");
			while(true) {
				System.out.println("수정할 빵의 이름을 입력해주십시오(뒤로가기: back(메뉴로 돌아가기: exit");
				name = scanner.nextLine();
				if(name.equals("back")) {
					System.out.println("뒤로가기에 성공하였습니다");
					break;
				}
				if(name.equals("exit")) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				System.out.println("수정할 빵의 이름은 " + name + "입니다");
				while(true) {
					System.out.println("수정할 빵의 가격을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
					try{
						price = Integer.parseInt(scanner.nextLine());
						if(price == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(price == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return;
						}
						if(0 < price) {
							System.out.println("수정할 빵의 가격은 " + price + "원입니다");
						} else {
							System.out.println("수정할 빵의 가격의 값은 0보다 큰 값을 입력해야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
					while(true) {
						System.out.println("수정할 빵의 재고량을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
						try {
							inventory = Integer.parseInt(scanner.nextLine());
							if(inventory == -1) {
								System.out.println("뒤로가기에 성공하였습니다");
								break;
							}
							if(inventory == -2) {
								System.out.println("메뉴로 돌아갑니다");
								return;
							}
							if(0 <= inventory) {
								System.out.println("수정할 빵의 재고량은 " + inventory + "개입니다");
								break;
							}else {
								System.out.println("수정할 빵의 재고량은 0과 같거나 커야합니다");
								continue;
							}
						}catch(NumberFormatException e) {
							System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
						}
					}
					if(inventory == -1) {
						continue;
					}break;
				}
				if(price == -1) {
					continue;
				}break;
			}
			if(name.equals("back")) {
				continue;
			}break;
		}
		
		
		
		String updateSql = """
				UPDATE bakery set bread_name = ?, bread_price = ?, bread_inventory = ? 
				WHERE menuNo = ?""";
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			pstmt.setInt(4, menuNo);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("메뉴 수정에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 수정에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		
	}	
	
	public void correctionCakeMenu() {
		int menuNo = 0;
		String name = null;
		int price = 0;
		int inventory = 0;
		Connection conn = BakeryManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		while(true) {
			try {
				System.out.println("수정할 메뉴의 번호를 입력해주십시오(메뉴로 돌아가기: -1)");
				menuNo = Integer.parseInt(scanner.nextLine());
				if(menuNo == -1) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				String countSql = "SELECT COUNT(*) FROM bakery WHERE menuNo =? ";
				
				pstmt = conn.prepareStatement(countSql);
				pstmt.setInt(1, menuNo);
				rs = pstmt.executeQuery(); 
				if (rs.next()) {
					resultRow = rs.getInt(1);
				}		
				if (resultRow == 0) {
					System.out.println("수정할 메뉴의 번호가 없습니다. 번호는 1번부터 시작합니다");
					continue;
				}									
				} catch(NumberFormatException se) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					continue;
				} catch(SQLException se) {
					System.out.println("error" + se.getMessage());
				}	
				System.out.println("수정할 메뉴의 번호는 " + menuNo + "번입니다");
			while(true) {
				System.out.println("수정할 케이크의 이름을 입력해주십시오(뒤로가기: back(메뉴로 돌아가기: exit");
				name = scanner.nextLine();
				if(name.equals("back")) {
					System.out.println("뒤로가기에 성공하였습니다");
					break;
				}
				if(name.equals("exit")) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				System.out.println("수정할 케이크의 이름은 " + name + "입니다");
				while(true) {
					System.out.println("수정할 케이크의 가격을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
					try{
						price = Integer.parseInt(scanner.nextLine());
						if(price == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(price == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return;
						}
						if(0 < price) {
							System.out.println("수정할 케이크의 가격은 " + price + "원입니다");
						} else {
							System.out.println("수정할 케이크의 가격의 값은 0보다 큰 값을 입력해야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
					while(true) {
						System.out.println("수정할 케이크의 재고량을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
						try {
							inventory = Integer.parseInt(scanner.nextLine());
							if(inventory == -1) {
								System.out.println("뒤로가기에 성공하였습니다");
								break;
							}
							if(inventory == -2) {
								System.out.println("메뉴로 돌아갑니다");
								return;
							}
							if(0 <= inventory) {
								System.out.println("수정할 케이크의 재고량은 " + inventory + "개입니다");
								break;
							}else {
								System.out.println("수정할 케이크의 재고량은 0과 같거나 커야합니다");
								continue;
							}
						}catch(NumberFormatException e) {
							System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
						}
					}
					if(inventory == -1) {
						continue;
					}break;
				}
				if(price == -1) {
					continue;
				}break;
			}
			if(name.equals("back")) {
				continue;
			}break;
		}
		
		String updateSql = """
				UPDATE bakery set cake_name = ?, cake_price = ?, cake_inventory = ? 
				WHERE menuNo = ?""";
		
		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			pstmt.setInt(4, menuNo);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("메뉴 수정에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 수정에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
		
	}	
	
	public void correctionDrinkMenu() {
		int menuNo = 0;
		String name = null;
		int price = 0;
		int inventory = 0;
		Connection conn = BakeryManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		while(true) {
			try {
				System.out.println("수정할 메뉴의 번호를 입력해주십시오(메뉴로 돌아가기: -1)");
				menuNo = Integer.parseInt(scanner.nextLine());
				if(menuNo == -1) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				String countSql = "SELECT COUNT(*) FROM bakery WHERE menuNo =? ";
				
				pstmt = conn.prepareStatement(countSql);
				pstmt.setInt(1, menuNo);
				rs = pstmt.executeQuery(); 
				if (rs.next()) {
					resultRow = rs.getInt(1);
				}		
				if (resultRow == 0) {
					System.out.println("수정할 메뉴의 번호가 없습니다. 번호는 1번부터 시작합니다");
					continue;
				}									
				} catch(NumberFormatException se) {
					System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					continue;
				} catch(SQLException se) {
					System.out.println("error" + se.getMessage());
				}	
				System.out.println("수정할 메뉴의 번호는 " + menuNo + "번입니다");
			while(true) {
				System.out.println("수정할 음료의 이름을 입력해주십시오(뒤로가기: back(메뉴로 돌아가기: exit");
				name = scanner.nextLine();
				if(name.equals("back")) {
					System.out.println("뒤로가기에 성공하였습니다");
					break;
				}
				if(name.equals("exit")) {
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
				System.out.println("수정할 음료의 이름은 " + name + "입니다");
				while(true) {
					System.out.println("수정할 음료의 가격을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
					try{
						price = Integer.parseInt(scanner.nextLine());
						if(price == -1) {
							System.out.println("뒤로가기에 성공하였습니다");
							break;
						}
						if(price == -2) {
							System.out.println("메뉴로 돌아갑니다");
							return;
						}
						if(0 < price) {
							System.out.println("수정할 음료의 가격은 " + price + "원입니다");
						} else {
							System.out.println("수정할 음료의 가격의 값은 0보다 큰 값을 입력해야합니다");
							continue;
						}
					}catch(NumberFormatException e) {
						System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
					}
					while(true) {
						System.out.println("수정할 음료의 재고량을 입력해주십시오(뒤로가기: -1(메뉴로 돌아가기: -2)");
						try {
							inventory = Integer.parseInt(scanner.nextLine());
							if(inventory == -1) {
								System.out.println("뒤로가기에 성공하였습니다");
								break;
							}
							if(inventory == -2) {
								System.out.println("메뉴로 돌아갑니다");
								return;
							}
							if(0 <= inventory) {
								System.out.println("수정할 음료의 재고량은 " + inventory + "개입니다");
								break;
							}else {
								System.out.println("수정할 음료의 재고량은 0과 같거나 커야합니다");
								continue;
							}
						}catch(NumberFormatException e) {
							System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
						}
					}
					if(inventory == -1) {
						continue;
					}break;
				}
				if(price == -1) {
					continue;
				}break;
			}
			if(name.equals("back")) {
				continue;
			}break;
		}
		
		String updateSql = """
				UPDATE bakery set drink_name = ?, drink_price = ?, drink_inventory = ? 
				WHERE menuNo = ?""";

		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setInt(3, inventory);
			pstmt.setInt(4, menuNo);
			
			resultRow = pstmt.executeUpdate();
			System.out.println("메뉴 수정에 성공하였습니다");
		} catch(SQLException se) {
			System.out.println("메뉴 수정에 실패하였습니다.");
		} finally {
			BakeryManager.dbclose(conn, pstmt, null);
		}
	}
}
