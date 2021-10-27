<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="assets/images/subs/head02.jpg">
</section>
<div class="main">
	 <section class="module home-full-weight bg-light">
          <div class="container">
            <div class="row mb-40">
            </div>
     
              <div class="col-xs-6">
                <div role="tabpanel">
                  <ul class="nav nav-tabs font-alt" role="tablist">
                    <li class="active"><a href="#support" data-toggle="tab"><span class="icon-tools-2">
                    </span>FAQ</a></li>
                    <li><a href="#sales" data-toggle="tab"><span class="icon-tools-2">
                    </span>SUPPORT</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="support">
                      <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#support1" aria-expanded="true" class="">Support Question 1</a></h4>
                          </div>
                          <div class="panel-collapse collapse in" id="support1" aria-expanded="true" style="">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
  a bird on it squid single-origin coffee nulla assumenda shoreditch e                                                     </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#support2" aria-expanded="false">Support Question 2</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="support2" aria-expanded="false" style="height: 0px;">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="sales">
                      <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#sales1">Sales Question 1</a></h4>
                          </div>
                          <div class="panel-collapse collapse in" id="sales1">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title font-alt"><a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#sales2">Sales Question 2</a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="sales2">
                            <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
    <div class="col-xs-6">
                <h4 class="font-alt">ASK ANYTHING</h4>
                <hr class="divider-w mb-10"><br/>
                <form id="contactForm" role="form" method="post" action="php/contact.php">
                  <div class="form-group">
                    <label class="sr-only" for="name">Name</label>
                    <input class="form-control" type="text" id="name" name="name" placeholder="Your Name*" required="required" data-validation-required-message="Please enter your name.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <label class="sr-only" for="email">Email(ID)</label>
                    <input class="form-control" type="email" id="email" name="email" placeholder="Your Email*" required="required" data-validation-required-message="Please enter your email address.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <textarea class="form-control" rows="7" id="message" name="message" 
                    placeholder="1대1 메일문의*" required="required" data-validation-required-message="Please enter your message."></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="text-center">
                    <button class="btn btn-block btn-round btn-d btn-lg" id="cfsubmit" type="submit">Submit</button>
                  </div>
                </form>
                <div class="ajax-response font-alt" id="contactFormResponse"></div>
              </div>
            </div>
        </section>

</div>
<%@ include file="layout/footer.jsp" %>