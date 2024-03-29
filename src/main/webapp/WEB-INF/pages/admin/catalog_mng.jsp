<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catalog management</title>
    <style>
        <%@include file="/css/eShop_stylesheet.css"%>
    </style>
<body>

<div class="wrapper">

    <header class="header">
        <p class="text" align="left">You are logged in as <sec:authentication property="principal.username"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value="/logout"/>">Logout</a>
        </p>
    </header>



    <div class="middle">

        <div class="container">
            <main class="content">
                <p class="text">This page manages the catalog of goods: adding new products and editing existing</p>
                <c:if test="${!empty listProducts}">
                    <br/>
                    <br/>

                    <h1>Product List</h1>
                    <br>
                    <br>
                    <table class="tg">
                        <thead>
                        <tr>
                            <th width="10%">ID</th>
                            <th width="18%">Name</th>
                            <th width="18%">Category</th>
                            <th width="18%">Quantity</th>
                            <th width="18%">Price</th>
                            <th width="9%">Edit</th>
                            <th width="9%">Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProducts}" var="product">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.name}</td>
                                <td>${product.category}</td>
                                <td>${product.quantity}</td>
                                <td>${product.price/100}</td>
                                <td><a href="<c:url value='/admin/editProduct/${product.id}'/>">Edit</a></td>
                                <td><a href="<c:url value='/admin/deleteProduct/${product.id}'/>">Delete</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <br>
                <h1>Add product</h1>
                <br>
                <br>

                <c:url var="addAction" value="/admin/catalog/add"/>

                <form:form action="${addAction}" modelAttribute="product">
                    <table>
                        <c:if test="${product.id != 0}">
                            <tr>
                                <td>
                                    <form:label path="id" cssClass="small-cell">
                                        <spring:message text="ID"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="id" readonly="true" size="8" disabled="true" cssClass="small-cell"/>
                                    <form:hidden path="id"/>
                                </td>

                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <form:label path="name" cssClass="small-cell">
                                    <spring:message text="Name"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="name" cssClass="small-cell"/>
                            </td>
                            <td>
                                <form:errors path="name" cssClass="error"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="category" cssClass="small-cell">
                                    <spring:message text="Category"/>
                                </form:label>
                            </td>
                            <td>
                                <form:select path="category" cssClass="small-cell">
                                    <form:option value="FIRST" label="First"/>
                                    <form:option value="SECOND" label="Second"/>
                                </form:select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="quantity" cssClass="small-cell">
                                    <spring:message text="Quantity"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="quantity" cssClass="small-cell"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="price" cssClass="small-cell">
                                    <spring:message text="Price"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="price" cssClass="small-cell"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <c:if test="${!empty product.name}">
                                    <button class="button-min" type="submit">Edit product</button>
                                </c:if>
                                <c:if test="${empty product.name}">
                                    <button class="button-min" type="submit">Add product</button>
                                </c:if>

                            </td>
                        </tr>
                    </table>
                </form:form>
            </main><!-- .content -->
        </div><!-- .container-->

        <aside class="left-sidebar">
            <ul class="main-menu">
                <li class="active"><a href="<c:url value="/admin/catalog"/>">Catalog</a></li>

                <li><a href="<c:url value="/admin/users"/>">Users</a></li>

                <li><a href="<c:url value="/admin/orders"/>">Orders</a></li>

            </ul>
        </aside><!-- .left-sidebar -->

    </div><!-- .middle-->

</div><!-- .wrapper -->

</body>
</html>