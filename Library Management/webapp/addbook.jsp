<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("page", 2);
%>
<jsp:include flush="true" page="header.jsp"/>

<div class="row">
    <div class="col-sm-12">
        <h4 class="text-center mb-2 border-bottom pb-2">Add New Book</h4>
        <form method="post" action="addbook">
            <div class="form-row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Book Name</label>   
                        <input type="text" name="bname" class="form-control" placeholder="Book Name">
                    </div>
                </div>
            	<div class="col-sm-4">
                    <div class="form-group">
                        <label>Book Author</label>   
                        <input type="text" name="author" class="form-control" placeholder="Author Name">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Book Publisher</label>   
                        <input type="text" name="publisher" class="form-control" placeholder="Publisher">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Book ISBN</label>   
                        <input type="text" placeholder="13digit number" maxlength="13" name="isbn" class="form-control">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Book Price</label>   
                        <input type="text" name="price" class="form-control" placeholder="Product Price">
                    </div>
                </div>
                <div class="col-sm-4">
	                <div class="form-group">
		                <label>Description</label>
		                <textarea placeholder="Description" rows="4" class="form-control" style="resize: none" name="descr"></textarea>
	            	</div>
            	</div>
            </div>
                        
            

            <input type="submit" value="Save Product" class="btn btn-primary float-right">
        </form>
    </div>
</div>
<jsp:include flush="true" page="footer.jsp"/>

