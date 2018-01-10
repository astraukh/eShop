<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script><![endif]-->
    <title>EShop</title>
    <style>
        <%@include file="/css/div-style.css"%>
    </style>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

<body>

<div class="wrapper">

    <header class="header">
        <strong>Header:</strong>
    </header><!-- .header-->

    <div class="middle">

        <div class="container">
            <main class="content">
                <br/>
                <br/>

                <h1>List of users</h1>
                <br>
                <br>

                <c:if test="${!empty listUsers}">
                    <table class="tg">
                        <tr>
                            <th width="80">ID</th>
                            <th width="120">Name</th>
                            <th width="120">Surname</th>
                            <th width="120">Address</th>
                            <th width="120">Phone</th>
                            <th width="120">Email</th>
                            <th width="120">Login</th>
                            <th width="120">Role</th>
                            <th width="120">Status</th>
                            <th width="60">Edit</th>
                        </tr>
                        <c:forEach items="${listUsers}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.name}</td>
                                <td>${user.surname}</td>
                                <td>${user.address}</td>
                                <td>${user.phoneNumber}</td>
                                <td>${user.credential.email}</td>
                                <td>${user.credential.login}</td>
                                <td>${user.credential.role.toString()}</td>
                                <td>${user.credential.inBlackList ? "In black list" : "Not in black list"}</td>
                                <td><a href="<c:url value='/editUser/${user.id}'/>">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
                <br>
                <h1>Edit user</h1>
                <br>
                <br>

                <c:url var="addAction" value="/users/update"/>

                <form:form action="${addAction}" modelAttribute="user">
                    <c:if test="${!empty user.name}">
                        <table>
                            <tr>
                                <td>
                                    <form:label path="id">
                                        <spring:message text="ID"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                                    <form:hidden path="id"/>
                                </td>
                                <td>
                                    <form:hidden path="credential.id"/>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <form:label path="name">
                                        <spring:message text="Name"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="name"/>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <form:label path="surname">
                                        <spring:message text="Surname"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="surname"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="address">
                                        <spring:message text="Address"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="address"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="phoneNumber">
                                        <spring:message text="Phone"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="phoneNumber"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="credential.email">
                                        <spring:message text="Email"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="credential.email" readonly="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="credential.login">
                                        <spring:message text="Login"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="credential.login" readonly="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="credential.password">
                                        <spring:message text="Password"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="credential.password" readonly="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="credential.role">
                                        <spring:message text="Role"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="credential.role">
                                        <form:option value="CUSTOMER" label="CUSTOMER"/>
                                        <form:option value="ADMIN" label="ADMIN"/>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="credential.inBlackList">
                                        <spring:message text="Status"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="credential.inBlackList">
                                        <form:option value="false" label="Not in BL"/>
                                        <form:option value="true" label="In BL"/>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit"
                                           value="<spring:message text="Edit user"/>"/>
                                </td>
                            </tr>
                        </table>
                    </c:if>
                </form:form>
            </main><!-- .content -->
        </div><!-- .container-->

        <aside class="left-sidebar">
            <ul class="main-menu">
                <li><a href="<c:url value="/catalog"/>">Catalog</a></li>

                <li class="active"><a href="<c:url value="/users"/>">Users</a></li>

            </ul>
        </aside><!-- .left-sidebar -->

    </div><!-- .middle-->

</div><!-- .wrapper -->

<footer class="footer">
    <br>
    <b>Project for EPAM java training</b>
</footer><!-- .footer -->

</body>
</html>