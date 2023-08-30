<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	
<div>
        <div class="login" id="login-box">
            <div class="head">
                <p>ĐẶT MUA SÁCH KẺ NHẮC TUỒNG</p>
                <a class="close" href="#"><p>X</p></a>
            </div>
            <form:form method = "GET" action = "#">
                <div class="content">
                        <div class="content-left">
                            <div class="content-img">
                                <img src="<c:url value="/assets/user/img/sach7.jpg"/>" alt="">
                                <div>
                                    <p>ĐẶT MUA SÁCH KẺ NHẮC TUỒNG</p>
                                    <h3>$00.00 <u>đ</u></h3>
                                </div>
                            </div>
                            <div class="sl">
                                <span>Số lượng: </span>
                                <input type="number" name="soluong" min="1" max="5" value="1">                    
                            </div>
                            <input type="hidden" name="tensp" value="Sach">
                            <input type="hidden" name="cost" value="00.00">
                            <input type="hidden" name="image" value="image/sach.PNG">
                            <input type="hidden" name="ma" value="NAM90E36431800">
                            <div style="margin-top: 20px;">
                                <p>Bạn vui lòng nhập đúng số điện thoại để chúng tôi sẽ gọi xác nhận đơn hàng trước khi giao hàng. Xin cảm ơn!</p>
                            </div>
                            <p style="text-align: center; margin-top: 10px;">--- Chân thành cảm ơn quý khách ---</p>
                            
                        </div>
                        <div class="content-right">
                                <h3>Thông tin người mua</h3>
                                <div style="display: flex; width: 100%; margin-top: 20px;">
                                    <input style="width: 50%; margin-right: 5px;" type="text" placeholder="Họ và tên" name="hoten">
                                    <input style="width: 50%; margin-left: 5px;" type="text" placeholder="Số điện thoại" name="dienthoai">
                                </div>
                                <input type="text" placeholder="Email" name="email" required>
                                <input type="text" placeholder="Địa chỉ (chi tiết)" name="diachi" required>
                                <input type="text" placeholder="Fax" name="fax">
                                <input style="margin-top: 12px;" type="text" placeholder="Tên công ty" name="tencty">
                                <p style="text-align: center;margin-top: 15px;">Miễn phí vận chuyển trên toàn quốc.</p>
                                <input class="sub" type="submit" name="dathang_quick" value="Đặt hàng ngay">
                        </div>
                </div>
            </form:form>
        </div>
    </div>