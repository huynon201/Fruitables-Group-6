<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 06/06/2024
  Time: 10:24 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<div class="py-5">
    <div class="container py-5">
        <div class="align-items-center">
            <section class="h-100 gradient-custom py-5">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-lg-10 col-xl-8">
                            <div class="card" style="border-radius: 10px;">
                                <div class="card-header px-4 py-5">
                                    <h5 class="text-muted mb-0">Cảm ơn bạn đã đặt hàng, <span
                                            class="text-primary">${cusName}</span></h5>
                                </div>
                                <%--                                ${cusName}--%>
                                <div class="card-body p-4">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <p class="lead fw-normal mb-0 text-primary">Hóa đơn</p>
                                        <p class="small text-muted mb-0 fw-bold text-dark">Mã hóa đơn: <span>1KAU9-84UIL</span>
                                        </p>
                                    </div>
                                    <div class="card shadow-0 border mb-4">
                                        <div class="card-body">
                                            <c:forEach var="item" items="${listProductOrder}">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <img src="<c:url value="/resource/user/img/products/${item.productImg}"/>"
                                                             class="img-fluid me-5 rounded-circle"
                                                             style="width: 80px; height: 80px;" alt="Sản phẩm">
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0">${item.productName}</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0 small">${item.productPrice}</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0 small">Số lượng: ${item.quantityProduct}</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0 small">
                                                            Giá: ${item.productPrice * item.quantityProduct}</p>
                                                    </div>
                                                </div>
                                                <br>
                                            </c:forEach>
                                            <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                            <div class="row d-flex align-items-center">
                                                <div class="col-md-2">
                                                    <p class="text-muted mb-0 small">Theo dõi đơn hàng</p>
                                                </div>

                                                <c:if test="${orders.status != 'Rejected'}">
                                                    <div class="col-md-10">

                                                        <div class="progress" style="height: 6px; border-radius: 16px;">

                                                            <div class="progress-bar bg-primary" role="progressbar"
                                                                    <c:if test="${orders.status == 'Preparing'}">
                                                                        style="width: 20%; border-radius: 16px;"
                                                                    </c:if>
                                                                    <c:if test="${orders.status == 'Delivering'}">
                                                                        style="width: 50%; border-radius: 16px;"
                                                                    </c:if>
                                                                    <c:if test="${orders.status == 'Fulfilled'}">
                                                                        style="width: 100%; border-radius: 16px;"
                                                                    </c:if>
                                                                 aria-valuenow="65" aria-valuemin="0"
                                                                 aria-valuemax="100">
                                                            </div>


                                                        </div>
                                                        <div class="d-flex justify-content-around mb-1">
                                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Đang chuẩn bị</p>
                                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Đang giao hàng</p>
                                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Đã giao</p>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${orders.status == 'Rejected'}">
                                                    <div class="col-md-10">
                                                        <div class="progress" style="height: 6px; border-radius: 16px;">
                                                            <div class="progress-bar bg-danger" role="progressbar"
                                                                 style="width: 100%; border-radius: 16px;"
                                                                 aria-valuenow="65" aria-valuemin="0"
                                                                 aria-valuemax="100">
                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-around mb-1">
                                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Đã hủy</p>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between pt-2">
                                        <p class="fw-bold mb-0">Chi tiết đơn hàng</p>
                                        <p class="text-muted mb-0"><span class="fw-bold me-4">Tổng cộng</span> ${totalPrice}
                                        </p>
                                    </div>

                                    <div class="d-flex justify-content-between pt-2">
                                        <p class="text-muted mb-0">Số hóa đơn: ${orders.checkoutid}</p>

                                        </p>
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <p class="text-muted mb-0">Ngày đặt hàng: ${orders.createDay}</p>


                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="text-muted mb-0">Số điện thoại: ${orders.phone}</p>

                                    </div>
                                    <div class="d-flex justify-content-between mb-5">
                                        <p class="text-muted mb-0">Địa chỉ: ${orders.address}</p>
                                        <p class="text-muted mb-0"><span class="fw-bold me-4">Phí giao hàng</span> Miễn phí</p>
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <p class="text-muted mb-0">Ghi chú đơn hàng: ${orders.desc_order}</p>

                                    </div>

                                </div>
                                <div class="card-footer border-0 px-4 py-5 bg-primary">
                                    <h5
                                            class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">
                                        Tổng tiền:
                                        <span class="h2 mb-0 ms-2">${totalPrice} VND</span></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
