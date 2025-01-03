<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>Sửa sản phẩm</title>
<body>
<div class="col-sm-12 col-xl-12">
  <div class="bg-light rounded h-100 p-4">
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Sửa sản phẩm</h2>
              </div>
            </div>

            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                <form:form action="updateProduct" method="post" class="tm-edit-product-form" modelAttribute="product" enctype="multipart/form-data">

                  <input type="hidden" name="productId" value="${product.productId}" />

                  <div class="form-group mb-3">
                    <label for="name">Tên sản phẩm</label>
                    <form:input
                            id="name"
                            type="text"
                            class="form-control validate"
                            required="true"
                            path="productName"
                    />
                  </div>

                  <div class="form-group mb-3">
                    <label>Mô tả</label>
                    <form:input
                            class="form-control validate tm-small"
                            required="true"
                            path="productDesc"
                    />
                  </div>

                  <div class="form-group mb-3">
                    <label for="category">Danh mục</label>
                    <form:select class="custom-select tm-select-accounts" id="category" required="true" path="cateId">
                      <option>Chọn danh mục</option>
                      <c:forEach var="cate" items="${category}">
                        <option value="${cate.cateId}" <c:if test="${cate.cateId == product.cateId}">selected</c:if>>${cate.cateName}</option>
                      </c:forEach>
                    </form:select>
                  </div>

                  <div class="row">
                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                      <label for="price">Giá</label>
                      <form:input
                              id="price"
                              type="text"
                              required="true"
                              class="form-control validate"
                              path="productPrice"
                      />
                    </div>
                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                      <label for="stock">Số lượng trong kho</label>
                      <form:input
                              id="stock"
                              path="quantity"
                              type="text"
                              required="true"
                              class="form-control validate"
                      />
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                      <label for="sales">Giảm giá</label>
                      <form:input
                              id="sales"
                              path="sale"
                              type="text"
                              required="true"
                              class="form-control validate"
                      />
                    </div>
                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                      <label for="hot">Hot</label>
                      <form:select class="custom-select tm-select-accounts" id="hot" required="true" path="hot">
                        <option>Select hot</option>
                        <option value="true" <c:if test="${product.hot}">selected</c:if>>Có</option>
                        <option value="false" <c:if test="${!product.hot}">selected</c:if>>Không</option>
                      </form:select>
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                      <label for="create_date">Ngày tạo</label>
                      <form:input
                              id="create_date"
                              path="createDate"
                              type="text"
                              required="true"
                              class="form-control validate"
                      />
                    </div>
                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                      <label for="expire_date">Ngày hết hạn</label>
                      <form:input
                              id="expire_date"
                              path="expDate"
                              type="text"
                              required="true"
                              class="form-control validate"
                      />
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                      <label for="sell_quantity">Số lượng bán</label>
                      <form:input
                              id="sell_quantity"
                              path="sell_quantity"
                              type="number"
                              required="true"
                              class="form-control validate"
                      />
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                      <div class="tm-product-img-edit mx-auto text-center">
                        <img id="blah" src="<c:url value='/assets/user/img/products/${product.productImg}' />" alt="Product Image" width="200px" height="200px" />
                      </div>
                      <div class="custom-file mt-3 mb-3">
                        <form:input id="fileInput" type="text" style="display: none;"  path="productImg"/>
                        <input accept="image/*" type='file' id="imgInp" name="productImage"  class="form-control" />
                      </div>
                    </div>
                  </div>

                  <div class="col-12">
                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Cập nhật sản phẩm</button>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  imgInp.onchange = evt => {
    const [file] = imgInp.files
    if (file) {
      blah.src = URL.createObjectURL(file)
    }
  }
  document.getElementById('imgInp').addEventListener('change', function() {
    document.getElementById('fileInput').value = this.files[0].name;
  });
</script>
</body>
