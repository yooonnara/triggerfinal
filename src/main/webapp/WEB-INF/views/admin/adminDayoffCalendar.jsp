<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<link href="${path }/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${path }/resources/css/sb-admin-2.css" rel="stylesheet">
<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
<link href="${path }/resources/css/yelin.css" rel="stylesheet">
<!--부트스트랩 아이콘-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 헤드 태그 -->
<div id="headTag">
   <!-- 풀캘린더 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
    <!-- 풀캘린더 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</div>
<body id="page-top">
   <div id="wrapper">
      <div id="sidebar">
      </div>

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
         <!-- Main Content -->
         <div id="content">
           
            <!-- 수정할 컨테이너 Begin Page Content -->
            <div class="container-fluid">
               <!-- 타이틀 Page Heading -->
               <h1 class="h3 text-dark ml-5 mt-3">전사 휴가 일정 조회</h1>
               
               <div class="workingTimeMain-container"> 
                <div class="wt-calender border border-secondary mt-4 ml-5 mb-3"  id="calendar"></div>
                 
               </div>
            </div>
         </div>
         
         
          <!-- 캘린더  -->
           <script>
             document.addEventListener('DOMContentLoaded', function() {
               var calendarEl = document.getElementById('calendar');
               var calendar = new FullCalendar.Calendar(calendarEl, {
                 initialView: 'dayGridMonth',
                 height:'640px', //calendar 높이 설정
                headerToolbar: {
                   left: '',
                   center: 'prev title next',
                   right:'',
                },
                locale: 'ko', //한국어
                events: 
                [
                   $(function(){
                	   
                      $.ajax({
                         url:"/att/dayoffCalendar",
                         
                         success:function(model){
                            //console.log(model.dayoffInfo[0].emp.name);
                            console.log(model.dayoffInfo[0].emp.name);
                            //console.log(model.dayoffInfo[0].startDate);
                            //console.log(model.attInfo[1].attDate.replace(".","-")); //2023.07.29
                              for(i=0; i<model.dayoffInfo.length;i++){
                                  calendar.addEvent({
                                 title: "[" + model.dayoffInfo[i].emp.name + "] " + model.dayoffInfo[i].detailType , 
                                 start: model.dayoffInfo[i].startDate,
                                 end: model.dayoffInfo[i].endDate,
                                 color:'rgb(41, 128, 185)',
                                 textColor:'rgb(255, 255, 255)'
                                })
                              } 
                      }, //success 닫기
                         error:function(){
                           console.log("근태캘린더 ajax통신 실패");
                        }
                      })
                   })
                ]
               });
               calendar.render();
             });
           </script>

		<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
      </div>
      <!-- End of Content Wrapper -->
   </div>
   <!-- End of Page Wrapper -->
<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
</body>
</html>