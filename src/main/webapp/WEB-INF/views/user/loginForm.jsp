<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="assets/images/subs/head01.jpg">
</section>
<div class="main">

        <section class="module home-full-weight bg-light">
          <div class="container mt-30 mb-35" style="float: none; margin: 0 auto;">
            <div class="row " >
            <div class="col-sm-6">
                <h4 class="font-alt">Login</h4>
                <hr class="divider-w mb-10"><br/>
            
                <form class="form">
                  <div class="form-group">
                    <input class="form-control" id="username" type="text" name="username" 
                    placeholder="Username"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" type="password" name="password" 
                    placeholder="Password"/>
                  </div>
                  <div class="form-group">
                    <button class="btn btn-round btn-d">Login</button>
                  </div>
                  <div class="form-group float-right">
                  <a href="" style="text-decoration:none; color:#00008c">Forgot Password?</a></div>
                </form>
              </div>
              
              <div class="col-sm-6 mb-sm-40 ">
                <h4 class="font-alt">NEW</h4>
                <hr class="divider-w mb-10 ">
                <div class="align-center"><br/>
                  <h2><mark>New</mark> to our Shop?</h2>
                     <p>There are advances being made in science and technology
                        everyday, and a good example of this is the</p><br/>
                 <a href="joinForm" class="btn btn-block btn-round btn-primary">Create an Account</a>
              </div>
              </div>
              
            </div>
          </div>
        </section>
</div>
<%@ include file="../layout/footer.jsp" %>
