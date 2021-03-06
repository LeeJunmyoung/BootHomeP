<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JunMyoung is me</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="css/agency.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->
<style>
    .fa-java{
        background-image: url(img/make/java.png);
       
        background-size:100%;
        height:100%;
    }
    .fa-web{
        background-image: url(img/make/web.png);
       
        background-size:100%;
        height:100%;
    }
    
    .fa-design{
        background-image: url(img/make/photoshop.png);
       
        background-size:100%;
        height:100%;
    }
</style>
<script type="text/javascript">
function checkForm(){
	var name = $('#name').val();
	if(name.length==0){
		alert("이름을 입력하세요");
		return false;
	}
	var email = $('#email').val();
	if(email.length==0){
		alert("이메일을 입력하세요");
		return false;
	}
	var phone = $("#phone").val();
	if(phone.length==0){
		alert("전화번호를 입력하세요");
		return false;
	}
	var message = $('#message').val();
	if(message.length==0){
		alert("내용을 입력하세요");
		return false;
	}
	message = message.replace(/\n/g, "<br>");
	
	
	$.ajax({
		type : "POST",
		data : {
			    name:name,
			    email:email,
			    phone:phone,
			    message:message
			   },
		url : '/message',
		success : function(args) {
			alert('글을 남겼습니다.');
			$("#name").val("");
			$("#email").val("");
			$("#phone").val("");
			$("#message").val("");
			
		},
		error : function(e) {
			alert(e);
			alert('메시지 전송을 실패했어요. 다음에 시도해 주세요');
		}
	}); 
	
}

</script>
</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Jun Myoung is me</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Intro</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Portfolio</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">HISTORY</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#team">about me</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Welcome!</div>
                <div class="intro-heading">Success IS Never Final</div>
                <a href="#services" class="page-scroll btn btn-xl">Tell Me More</a>
            </div>
        </div>
    </header>

    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Intro</h2>
                    <h3 class="section-subheading text-muted">Respect a man, he will do the more.</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-stack-1x fa-inverse fa-java"></i>
                    </span>
                    <h4 class="service-heading">JAVA</h4>
                    <p class="text-muted">다양한 언어를 사용해 보았지만,<br/> 그 중 JAVA에 대해 능숙히 다룰 수 있습니다. </p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa  fa-stack-1x fa-inverse fa-web"></i>
                    </span>
                    <h4 class="service-heading">WEB</h4>
                    <p class="text-muted">WEB 개발에서 SPRING FRAMEWORK를 사용하고,<br/> 이를 활용한 전자정부프레임워크도 사용합니다.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa  fa-stack-1x fa-inverse fa-design"></i>
                    </span>
                    <h4 class="service-heading">DESIGN</h4>
                    <p class="text-muted">포토샵을 이용한 디자인 부터 HTML,CSS,JQUERY를<br/> 이용해 다양한 화면을 구현할 수 있습니다.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Portfolio</h2>
                    <h3 class="section-subheading text-muted">“Talk is cheap. Show me the code.”<br>Linus Benedict Torvalds</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/chonbukmarble1.gif" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>전대마블</h4>
                        <p class="text-muted">2011. 11</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/honeycomb.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>HoneyComb</h4>
                        <p class="text-muted">2016. 10</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/tow.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>TOW BOOK</h4>
                        <p class="text-muted">2016. 12</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal4" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/pms.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>PMS</h4>
                        <p class="text-muted">2017. 02</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal5" class="portfolio-link" data-toggle="modal" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/rentcar.png" class="img-responsive" alt="" >
                    </a>
                    <div class="portfolio-caption">
                        <h4>RentCar</h4>
                        <p class="text-muted">2017.06</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal6" class="portfolio-link" data-toggle="modal" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/kt.png" class="img-responsive" alt="" >
                    </a>
                    <div class="portfolio-caption">
                        <h4>KT연구센터 연구개발 참여</h4>
                        <p class="text-muted">~ing</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">HISTORY</h2>
                    <h3 class="section-subheading text-muted">1990 . 09 . 28 ~ ING</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/1.png" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2009 - 2013</h4>
                                    <h4 class="subheading">전북대학교 졸업</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">2009 전북대학교 응용시스템(정보공학) 입학<br>
                                                          2011 학과 학생회 총무 역임, 학군단 입단<br>
                                                          2012 학과 4학년 대표<br>
                                    2013 전북대학교 응용시스템(정보공학) 졸업</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/2.png" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2013 ~ 2015</h4>
                                    <h4 class="subheading">대한민국 육군 장교</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">2013. 03 대한민국 육군 장교 임관
                                    <br>2013. 06 육군정보통신한교 초군반 수료
                                    <br>2013. 07 101정보통신단 1921부대 2중대 1소대장
                                    <br>2015. 06 육군 중위 만기 전역</p>
                                    
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/3.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2016</h4>
                                    <h4 class="subheading">개발자 준비</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">2016. 04 ~ 10 KH정보교육원 JAVA개발자 과정 수료<br>
                                    2016. 12 KCC정보통신 입사 </p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/4.png" style="background-color:white;" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2017 ~ </h4>
                                    <h4 class="subheading">KCC정보통신</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">2016. 12 ~ ING 사업지원그룹 SI사업 5팀 사원</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/5.png" alt="">
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">About me</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="team-member">
                        
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/team/me.png" class="img-responsive img-circle" alt="">
                        <h4>LEE JUN MYOUNG</h4>
                        <p class="text-muted">JAVA DEVELOPER</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#team" onclick="window.open('https://github.com/LeeJunmyoung', '', '');"><i class="fa fa-github"></i></a>
                            </li>
                            <li><a href="#team" onclick=" window.open('https://www.facebook.com/Leejunmyoung', '', '');"><i class="fa fa-facebook"  onclick=""></i></a>
                            </li>
                            
                            
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted"></p>
                </div>
            </div>
        </div>
    </section>

    <!-- Clients Aside -->
    <!--<aside class="clients">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/envato.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/designmodo.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/themeforest.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/creative-market.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
            </div>
        </div>
    </aside>-->

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h3 class="section-subheading text-muted" style="color:#fff;">연락주세요.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form  action="/message" method="post" onsubmit="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" name="name">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" name="email">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" placeholder="Your Phone *" id="phone"  name="phone">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="message" name="message"></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <input type="button" class="btn btn-xl"value="Send Message" onclick="return checkForm();">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    


    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <span class="copyright">Copyright &copy; MY WEBSITE 2017</span>
                </div>
                <!--<div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>-->
            </div>
        </div>
    </footer>


    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->

    <!-- Portfolio Modal 1 -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>전대 마블</h2>
                                <p class="item-intro text-muted"></p>
                                <img class="img-responsive img-centered" src="img/portfolio/chonbuk-detail1.png" alt="">
                                <p>2011. 11 졸업전 마지막 프로그래밍 수업 중 과제로 만든 프로젝트</p>
                                <p>
                                    <strong>JAVA개발자가 되겠다고 마음 먹게 된 프로젝트</strong><br>지금 와서 생각해보면 객체지향의 의미도 헷갈리던 시절인데 가장 기억에 남고 현재 개발자의 길로 걷게된 프로젝트입니다. 
                                            군입대로 함께 하지 못했지만 학과 SE-DAY에서도 발표를 했다는 얘기를 전해들었습니다.</p>
                                <ul class="list-inline">
                                    <li>Date  :   November 2011</li><br>
                                    <li>Skill : JAVA</li><br>
                                    <li>Responsibilities  :   Project Leader, Graphic Design, Coding</li>
                                </ul>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 2 -->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>Honey Comb</h2>
                                <p class="item-intro text-muted"></p>
                                <img class="img-responsive img-centered" src="img/portfolio/honeycomb-detail.png" alt="">
                                <p>2016. 10 WEB개발자 과정을 들으며 만든 프로젝트</p>
                                <p>
                                    <strong>Spring FrameWork를 적용한 첫 프로젝트</strong><br>
                                    스타트업 회사를 위한 그룹웨어를 만들자는 취지에서 시작한 HoneyComb프로젝트 입니다. <br>스터디룸도 빌리면서 다같이 하고 늦게 까지 남아서 개발하고 해서
                                    이 순간을 기점으로 개발자로서 많이 성장하게 된 프로젝트입니다. <a href="https://github.com/LimSunhwa/final" onclick="window.open(this.href, '', ''); return false;">GIT HUB</a>.
                                </p>
                                <ul class="list-inline">
                                    <li>Date  :   October 2016</li><br>
                                    <li>Skill : Spring, JAVA, HTML, CSS, JQuery, Oracle DB, WAS, WS </li><br>
                                    <li>Responsibilities  :   Project Leader, Graphic Design, Coding</li>
                                </ul>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 3 -->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>TOW BOOK</h2>
                                <p class="item-intro text-muted">2016. 12 KCC정보통신 입사 후 친구 부탁으로 만든 개인 사이트 </p>
                                <img class="img-responsive img-centered" src="img/portfolio/tow_detail.png" alt="">
                                <p><strong>친구 한테 재능 기부</strong> <!-- <a href="http://hamadrus.dothome.co.kr/index.html" onclick="window.open(this.href, '', ''); return false;">TOW BOOK</a> -->. 첫 회사 입사 후 친구 아버지가 개인 사이트가 필요하다고 해서
                                만들어 본 사이트입니다.</p>
                                <ul class="list-inline">
                                    <li>Date  :   DECEMBER 2016</li><br>
                                    <li>Skill :   Node.js, HTML, CSS, Ubuntu</li>
                                </ul>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 4 -->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>PMS</h2>
                                <p class="item-intro text-muted">2017. 02 입사 후 첫 개발</p>
                                <img class="img-responsive img-centered" src="img/portfolio/pms_detail.png" alt="">
                                <p><strong>회사 입사 후 첫 개발</strong> 연차관리시스템과 공공데이터를 활용한 조달 조회 기능을 구현했는데 같이 팀을 이룬 동기들이 뛰어나서 쉽게 쉽게 할 수 있었습니다. </p>
                                <ul class="list-inline">
                                    <li>Date  :   February 2017</li><br>
                                    <li>Skill :   Egovframework, JAVA, HTML, CSS, Oracle DB, Jenkins</li>
                                </ul>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <!--
    <!-- Portfolio Modal 5 -->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>RentCar4U</h2>
                                <p class="item-intro text-muted">2017. 06 렌트카 솔루션</p>
                                <img class="img-responsive img-centered" src="img/portfolio/rent_detail.png" alt="">
                                <p> 회사 솔루션 개발 참여 </p>
                                <ul class="list-inline">
                                    <li>Date  :   February 2017</li><br>
                                    <li>Skill :   Egovframework, JAVA, HTML, CSS, Oracle DB, CentOS</li>
                                </ul>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 6 -->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>KT연구센터 연구개발 참여</h2>
                                <p class="item-intro text-muted">~ing</p>
                                <img class="img-responsive img-centered" src="img/portfolio/kt.png" alt="">
                                <p> 오픈스택기반 플랫폼 서비스 연구개발에 참여하여 각종 오픈소스 및 중앙자원관리시스템에 관한 분석/설계/개발/운영 중임. </p>
                                <ul class="list-inline">
                                    <li>Date  :   February 2017</li><br>
                                    <li>Skill :   Spring boot, JAVA, MariaDB, Jenkins, Docker, CentOS, iPxe, OpenStack, Network</li>
                                </ul>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/agency.min.js"></script>

</body>

</html>
