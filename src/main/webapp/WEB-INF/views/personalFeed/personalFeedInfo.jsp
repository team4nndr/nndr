<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/personalFeed/personalFeed.css">
    <link rel="shortcut icon" href="#" />
</head>
<body>
<div id="all"></div>

	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
	<jsp:include page="/WEB-INF/views/personalFeed/personalFeedHeader.jsp" /> 
    <style>
        .item5 > li:nth-child(2){
            border-bottom: 3px solid #56A8C5;
        }
    </style>
    
        <div class="main-container2">
            <div class="item1-1"></div>
            <div class="info">
                <div class="info-1">
                    <a class="info-li" href="#" >정보 </a>
                    <button class="info-lia" onclick="info(0)"> 개요</button>
                    <button class="info-lia" onclick="info(1)"> 경력 및 학력</button>
                    <button class="info-lia" onclick="info(2)"> 이전 거주지</button>
                    <button class="info-lia" onclick="info(3)"> 연락처 및 기본 정보</button>
                    <button class="info-lia" onclick="info(4)"> 가족 및 결혼/연애 상태</button>
                    <button class="info-lia" onclick="info(5)"> 자세한 내 소개</button>
                    <button class="info-lia" onclick="info(6)"> 중요 이벤트</button>
                
                </div>
                <div id="main-info">
                <div class="info-experience-1">
                    <h2>개요</h2>
                    <div class="infoText">
                        <div id="info-job2">${infoMember.infoJob}</div>
                        <div id="info-college2">${infoMember.infoCollege}</div>
                        <div id="info-high2">${infoMember.infoHigh}</div>
                        <div id="info_residence2">${infoMember.infoResidence}</div>
                        <div id="info_birth2">${infoMember.infoBirthplace}</div>
                        <div id="info_romantic2">${infoMember.romanticYn}</div>
                    </div>
                    <br>
                    <div id="info-input">
                        <form action="">
                            <textarea name="" id="intro-text" cols="50" rows="3"></textarea><br>
                            <div id="texta"></div>
                            <div id="public">
                                <div>&nbsp;전체 공개</div>
                                <div id="btn-set">
                                <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                <button class="in-btn" id="intro-save" type="button" >저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="infom">
                        <button class="info-2-1" type="button" data-map="INFO_JOB">(+) 직장 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_COLLEGE">(+) 대학교 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_HIGH">(+) 고등학교 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_RESIDENCE">(+) 거주지 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_BIRTHPLACE">(+) 출신지 추가</button>
                        <button class="info-2-1" type="button" data-map="ROMANTIC_YN">(+) 결혼/연애 상태 추가</button>
                    </div>
                </div>
                <div class="info-experience-2">
                    <h2>경력 및 학력</h2>
                    <div class="infoText">
                        <div id="info-job">${infoMember.infoJob}</div>
                        <div id="info-college">${infoMember.infoCollege}</div>
                        <div id="info-high">${infoMember.infoHigh}</div>
                        <div id="info-middle">${infoMember.infoMiddle}</div>
                        <div id="info-elementary">${infoMember.infoElementary}</div>
                    </div>
                    <br>
                    <div id="info-input">
                        <form action="">
                            <textarea name="" id="intro-text" cols="50" rows="3"></textarea><br>
                            <div id="texta"></div>
                            <div id="public">
                                <div>&nbsp;전체 공개</div>
                                <div id="btn-set">
                                <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                <button class="in-btn" id="intro-save" type="button" >저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="infom">
                        <button class="info-2-1" type="button" data-map="INFO_JOB">(+) 직장 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_COLLEGE">(+) 대학교 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_HIGH">(+) 고등학교 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_MIDDLE">(+) 중학교 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_ELEMENTARY">(+) 초등학교 추가</button>
                    </div>
                </div>
                <div class="info-experience-3">

                    <h2>이전 거주지</h2>
                    <div class="infoText">
                        <div id="info_residence">${infoMember.infoResidence}</div>
                        <div id="info_birth">${infoMember.infoBirthplace}</div>
                    </div>
                    <br>
                    <div id="info-input">
                        <form action="">
                            <textarea name="" id="intro-text" cols="50" rows="3"></textarea><br>
                            <div id="texta"></div>
                            <div id="public">
                                <div>&nbsp;전체 공개</div>
                                <div id="btn-set">
                                <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                <button class="in-btn" id="intro-save" type="button" >저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="infom">
                        <button class="info-2-1" type="button" data-map="INFO_RESIDENCE">(+) 거주지 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_BIRTHPLACE">(+) 출신지 추가</button>
                    </div>
                </div>
                <div class="info-experience-4">
                    <h2>연락처 및 기본 정보</h2>
                    <div class="infoText">
                        <div id="info_sns">${infoMember.infoSns}</div>
                        <div id="info_lang">${infoMember.infoLang}</div>
                        <div id="info_gender">${infoMember.infoGender}</div>
                        <div id="info_birth">${infoMember.infoBirth}</div>
                    </div>
                    <br>
                    <div id="info-input">
                        <form action="">
                            <textarea name="" id="intro-text" cols="50" rows="3"></textarea><br>
                            <div id="texta"></div>
                            <div id="public">
                                <div>&nbsp;전체 공개</div>
                                <div id="btn-set">
                                <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                <button class="in-btn" id="intro-save" type="button" >저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="infom">
                        <button class="info-2-1" type="button" data-map="INFO_SNS">(+) 소셜 링크 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_LANG">(+) 언어 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_GENDER">(+) 성별 추가</button>
                        <%-- <button class="info-2-1" type="button" data-map="INFO_BIRTH">(+) 생일 추가</button> --%>
                    </div>
                </div>
                <div class="info-experience-6">
                    <h2>자세한 내 소개</h2>
                    <div class="infoText">
                        <div id="info-intro">${infoMember.infoIntro}</div>
                        <div id="info-nick">${infoMember.infoNick}</div>
                        <div id="info-text">${infoMember.infoText} </div>
                    </div>
                    <br>
                    <div id="info-input">
                        <form action="">
                            <textarea name="" id="intro-text" cols="50" rows="3"></textarea><br>
                            <div id="texta"></div>
                            <div id="public">
                                <div>&nbsp;전체 공개</div>
                                <div id="btn-set">
                                <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                <button class="in-btn" id="intro-save" type="button" >저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="infom">
                        <button class="info-2-1" type="button" data-map="INFO_INTRO">(+) 내 소개 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_NICK">(+) 별명 추가</button>
                        <button class="info-2-1" type="button" data-map="INFO_TEXT">(+) 좋아하는 문구 추가</button>
                    </div>
                </div>
                <div class="info-experience-7">
                    <h2>이벤트</h2>
                        <div>이벤트 날짜</div><br>
                        <div>내용</div><br>
                    <br>
                    <div id="info-input">
                        <form action="">
                            <textarea name="" id="intro-text" cols="50" rows="3"></textarea><br>
                            <div id="texta"></div>
                            <div id="public">
                                <div>&nbsp;전체 공개</div>
                                <div id="btn-set">
                                <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                <button class="in-btn" id="intro-save" type="button" >저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="info-2-1">(+) 중요 이벤트 추가</div>
                </div>
            </div>
            </div>
    </div>
    <div id="info-modal">
    </div>
        <div id="info-modali">
            <%-- <form action="/personalFeedInfo/${no}" method="POST"> --%>
            <div id="what-hobby" ></div>
            <div type="text" id="whatHobby" name="whatHobby">
            <br>
            </div>
                <div id="hobby-asd">
                <input id="hobby-input" name="hobbyInput" type="text">
                </div>
                <br>
                <div id="hbtn-set">
                <button class="info-addbtn" id="info-confirm"type="button">확인</button>
                <button class="info-addbtn" id="info-cancel" type="button">취소</button>
            </div>
            <%-- </form> --%>
        </div>
    </div>
</header>
<script src="/resources/js/personalFeed/personalFeed.js"></script>
</body>
</html>


