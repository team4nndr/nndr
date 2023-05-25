<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/topMenu/header.css">

<c:set var="tagList" value="${tagList}"/>
<c:set var="friendNameList" value="${friendNameList}"/>
<c:set var="alarmList" value="${alarmList}"/>

<script>
    const loginMemberNo = "${loginMember.memberNo}";
    const loginMemberName = "${loginMember.memberName}";
    const profileImage = "${loginMember.profileImage}";
</script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> 

<div id="nndrContainer">

    <div class="nndr-home-logo">
        <a href="/mainFeed"><img src="/resources/images/topMenu/topLogo-01.png"></a>
    </div>

    <div class="nndr-search-area">
        <form action="/hashTagList" method="GET">
            <fieldset id="nndrSearchBox">
                <div>
                    <input type="search" class="nndr-input" name="query" id="nndrQuery" autocomplete="off"
                        placeholder="N-NDR 검색">
                    <button type="submit" id="nndrSearchBtn"></button>

                </div>

                <!-- 검색어 추천 영역 -->
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

        <%-- <div id="nndrDropdownBox"> --%>
        <!-- 알림 버튼 -->
        <%-- <div onclick="bell()" id="nndrDropdown1"> --%>
        <div id="nndrDropdown1" class="nndr-dropdown-container">
            <div id="nndrDropBtn1" class="nndr-dropdown-button">
                <img src="/resources/images/topMenu/topAlarm.png" id="nndrImage3">
                <img src="/resources/images/topMenu/alarmMark.png" id="alarmMark">
            </div>

        
            <!-- 알림 버튼 클릭 시 하위 메뉴 -->
            <div id="nndrBellDropdown" class="nndr-dropdown-content1 nndr-dropdown-menu hidden">
                <div id="nndrAlarm">
                    <div>알림</div>
                    <div id="nndrOptionAlarm">
                        <img src="/resources/images/topMenu/optionAlarm.png">
                        <div id="nndrOptionAlarmContent" class="hidden">
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
                    <c:forEach items="${alarmList}" var="alarm">
                        <div data-alarmNo="${alarm.alarmNo}"></div>${alarm.alarmContent}
                    </c:forEach>
                </div>
            </div>
        </div>


        <!-- 내정보 버튼 -->
        <div id="nndrDropdown2" class="nndr-dropdown-container">

            <div id="nndrDropBtn2" class="nndr-dropdown-button">
            <c:if test="${empty loginMember.profileImage}">
                <img src="/resources/images/common/user-default.png" class="reply-profile-image" id="nndrImage4">
            </c:if>
            <c:if test="${not empty loginMember.profileImage}">
                <img class="reply-profile-image" src="${loginMember.profileImage}">
            </c:if>
            </div>

            <!-- 내정보 버튼 클릭 시 하위 메뉴 -->
            <div id="nndrMyDropdown" class="nndr-dropdown-content2 nndr-dropdown-menu hidden">
                <a href="/setting">설정</a>
                <a href="/setting/feedback">의견 보내기</a>
                <a href="/logout">로그아웃</a>
            </div>  
        </div>
            
        <%-- </div> --%>
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

<script src="/resources/js/alarm/alarm.js"></script>
<script src="/resources/js/topMenu/header.js"></script>