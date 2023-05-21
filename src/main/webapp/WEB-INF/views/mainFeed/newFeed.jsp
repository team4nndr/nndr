<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>
                            <form action="mainFeed" method="post" id="boardWriteFrm" enctype="multipart/form-data">
                 
                                <%-- 모달 --%>
                                <div id="myContent"></div> 
                                <div id="myContent-modal">
                                
                                <section id="modalTop">
                                <span class="title">게시물 만들기</span>

                                
                                <button type="button" class="close cancelBtn" id="cancelBtn"></button>
                                

                                </section>


                                <div>
                                <section id="modal-my1">
                                    <a href="/personalFeed/${loginMember.memberNo}">
                                    <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                                    </a>
                                </section>



                                <section id="modal-my2"> 

                                <section>
                                <span><a href="/personalFeed/${loginMember.memberNo}" class="change">${loginMember.memberName}</a></span>
                                </section>


                                <section>
                                <li><!-- 없애야해 -->
                                    <a href="#" class="change">현재 시간</a>
                                </li> 
                                </section>


                                </section>
                                </div>




                                <section id="modalContent">
                                <textarea placeholder="${loginMember.memberName}님은 무슨 생각을 하고 계신가요?"
                                name="boardText"></textarea>
                                </section>
                                
                                <section id="modalImg">
                                <h3>사진</h3>
                                <div class="img-box" id="imgBox1">
                                    <div class="boardImg" id="num">
                                        <label for="img1">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img1" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img2">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img2" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img3">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img3" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img4">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img4" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img5">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img5" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>
                                <%-- <button id=plusBtn><img src="/resources/images/mainFeed/plusLogo.png" id="plusLogo" ></button> --%>

                                

                                



                                
                                
                            </section>
                            
                            <section class="modalBot">
                                <button type="submit" id="submitBtn">게시</button>

                            </section>




                                
                                    
                                
    
                            <!-- <%-- </fieldset> --%> -->
                                <%-- 기존 이미지가 있다가 삭제된 이미지의 순서 기록 --%>
                                <input type="hidden" name="deleteList" value="">
    
                        </form>
    
    </section>