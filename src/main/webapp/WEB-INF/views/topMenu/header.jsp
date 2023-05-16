<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="tagList" value="${tagList}"/>

        <link rel="stylesheet" href="/resources/css/topMenu/header.css">
        <div id="nndrContainer">

            <div class="nndr-home-logo">
                <a href="/mainFeed"><img src="/resources/images/topMenu/topLogo-01.png"></a>
            </div>

            <div class="nndr-search-area">
                <form action="#" method="GET">
                    <fieldset id="nndrSearchBox">
                        <div>
                            <input type="search" class="nndr-input" name="query" id="nndrQuery" autocomplete="off"
                                placeholder="N-NDR 검색">
                            <button type="submit" id="nndrSearchBtn"></button>

                            <!-- 검색어 저장 영역 -->
                        </div>
                        <div class="nndr-suggestions nndr-suggestions_pannel">
                        </div>
                    </fieldset>
                </form>
            </div>

            <div class="nndr-top-menu">
                <ul class="nndr-menu">
                    <!-- 버튼 영역  -->
                    <!-- 홈 버튼 -->
                    <li id="nndrHomeBtn">
                        <a href="/mainFeed" class="nndrMainFeedBtn"> 
                            <img src="/resources/images/topMenu/topHome.png" id="nndrImage1">
                        </a>
                    </li>
                    <!-- 친구 버튼  -->
                    <li id="nndrFriendBtn">
                        <a href="/friend" class="nndrMainFeedBtn" >
                            <img src="/resources/images/topMenu/topFriend.png" id="nndrImage2">
                        </a>
                    </li>
                </ul>

                <div id="nndrDropdownBox">
                    <!-- 알림 버튼 -->
                    <div id="nndrDropdown1">
                        <div onclick="bell()" id="nndrDropBtn1"><img src="/resources/images/topMenu/topAlarm.png"
                                id="nndrImage3"></div>

                        <!-- <div> 
                        <div class="porfileRac">
                            <a href="#" class="Boardprofile"></a>
                        </div>
                        <div>
                            <a href="#">김핑퐁</a>
                            <p>게시글 정보 입니다. (회원 소개글 들어가도 됨)</p>
                        </div>
                    </div> -->

                        <!-- 알림 버튼 클릭 시 하위 메뉴 -->
                        <div id="nndrBellDropdown" class="nndr-dropdown-content1">
                            <div id="nndrAlarm">
                                <div>알림</div>
                                <div><img src="/resources/images/topMenu/optionAlarm.png" id="nndrOptionAlarm">
                                    <div id="nndrOptionAlarmContent">
                                        <a href="#">모두 읽은 상태로 표시</a>
                                        <a href="/setting/alarm">알림설정</a>
                                    </div>
                                </div>
                            </div>
                            <div class="nndrAlarmRead">
                                <div class="nndrAllAlarm">모든 알림</div>
                                <div class="nndrAlarmNotRead">읽지 않은 알림</div>
                            </div>

                        <div id="nndrAddContainer">
                            <!-- <div class="nndrAddAlarm">
                                <a href="/댓글,좋아요,게시물 업로드 등 해당 회원 프로필 이동 페이지" class="nndrAddAlarmProfile">
                                    <img src="/resources/images/topMenu/topMyProfile.png" class="topMyProfile">
                                </a>
                                <a href="/알람내용으로 이동할 페이지" class="nndrAddAlarmContent">
                                    <p class="nndrAlarmContent">알림 내용</p>
                                </a>
                                <div class="nndr-top-alarm-delete">&times;</div>
                            </div> -->
                        </div>

                            <button id="thumsUp">좋아여</button>

                        </div>
                    </div>

                    <div id="nndrDropdown2">
                        <!-- 내정보 버튼 -->
                        <div onclick="my()" id="nndrDropBtn2"><img src="/resources/images/topMenu/topMyInfo.png"
                                id="nndrImage4"></div>

                        <!-- 내정보 버튼 클릭 시 하위 메뉴 -->
                        <div id="nndrMyDropdown" class="nndr-dropdown-content2">
                            <a href="/setting">설정</a>
                            <a href="/setting/feedback">의견 보내기</a>
                            <a href="/logout">로그아웃</a>
                        </div>
                    </div>
                </div>
                
                <!-- 관리자 아이콘 -->
                <div name="nndrAdminSetting">
                <c:if test="${loginMember.memberCode == 'A'}" >
                    <a href="/admin" name="nndrAdminLink">
                        <img src="/resources/images/topMenu/topSetting.png" id="nndrAdminImg">
                    </a>
                </c:if>
                    
                </div>
                
            </div>
        </div>

        <script>
            var tagArr = new Array("${tagList}");
            

            
            
        
        </script>

        <script src="/resources/js/topMenu/header.js"></script>