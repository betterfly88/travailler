<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">
        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-lqy6{text-align:right;vertical-align:top}
            .tg .tg-yw4l{vertical-align:top}
        </style>


        <script>
            $(function(){

               $("#cafeInfoForm").on("submit", function() {
//                    var datas = $(this).serialize();
                   alert("등록되었습니다");
                   return false;
               });
            });


            //카페 지역선택
            function fn_callAreaDetail(){
                $("#caArea").empty();
                $("#caArea").append("<option value='0'>"+'상세지역을 선택해주세요'+"</option>");
                var selectArea = $("#selectArea").val();
                $.ajax({
                    type: "POST",
                    data: {
                        comCode : selectArea
                    },
                    url: "<c:url value="/select/detailArea"/>"
                }).success(function (data){
                    for(var i in data){
                        $("#caArea").append("<option value='"+data[i].comId+"'>"+data[i].comValue+"</option>");
                    }
                });

            }

            //카페 주제선택
            function fn_callSujbectDetail(){
                $("#caTopic").empty();
                $("#caTopic").append("<option value='0'>"+'상세주제를 선택해주세요'+"</option>");
                var selectSubject = $("#selectTopic").val();
                $.ajax({
                    type: "POST",
                    data: {
                        comCode : selectSubject
                    },
                    url: "<c:url value="/select/detailArea"/>"
                }).success(function (data){
                    for(var i in data){
                        $("#caTopic").append("<option value='"+data[i].comId+"'>"+data[i].comValue+"</option>");
                    }

                });
            }

            //카페 만들기
            function fn_createCafe(){
                console.log($("#caArea option:selected").val());
                console.log($("#caTopic option:selected").val());

                if($("#caTopic option:selected").val() == 0 || $("#caTopic option:selected").val()==null){
                    alert("주제를 선택해주세요.");
                    return;
                }
                if($("#caArea option:selected").val() == 0 || $("#caArea option:selected").val()==null){
                    alert("지역을 선택해주세요.");
                    return;
                }
                $("#cafeInfoForm").attr("action", "<c:url value="/create/cafe"/>");
                $("#cafeInfoForm").submit();


            }

        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">

        <button type="button" onclick="history.back()">이전</button> <br/>

        <form:form id="cafeInfoForm" modelAttribute="cafeInfoVO" method="POST">
        <table class="tg">
            <tr>
                <td class="tg-yw4l">카페 이름</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caName"/>
                </td>
            </tr>
            <tr>
                <th class="tg-lqy6">카페 URL</th>
                <th class="tg-yw4l">
                    http://shaiver.com/<form:input type="text" path="caUrl"/>
                </th>
            </tr>
            <tr>
                <td class="tg-yw4l">공개 여부</td>
                <td class="tg-yw4l">
                    <form:radiobutton path="caPublicYn" value="Y" label="공개"/>
                    <form:radiobutton path="caPublicYn" value="N" label="비공개"/>
                </td>
            </tr>

            <tr>
                <td class="tg-yw4l">주제</td>
                <td class="tg-yw4l">
                    <select id="selectTopic" onchange="fn_callSujbectDetail()">
                        <option>주제를 선택해주세요</option>
                        <c:forEach items="${subjectCodeList}" var="items">
                            <option value="${items.comId}">${items.comValue}</option>
                        </c:forEach>
                    </select>
                    <form:select path="caTopic">
                        <option value="0">상세 주제를 선택해주세요</option>
                    </form:select>
                </td>
            </tr>

            <tr>
                <td class="tg-yw4l">지역</td>
                <td class="tg-yw4l">
                    <select id="selectArea" onchange="fn_callAreaDetail()">
                        <option>지역을 선택해주세요</option>
                        <c:forEach items="${areaCodeList}" var="items">
                        <option value="${items.comId}">${items.comValue}</option>
                        </c:forEach>
                    </select>
                    <form:select path="caArea">
                        <option value="0">상세 지역을 선택해주세요</option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="tg-yw4l">태그</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caTag"/>
                </td>
            </tr>
            <tr>
                <td class="tg-yw4l">설명</td>
                <td class="tg-yw4l">
                    <form:textarea type="text" path="caDesc" cssStyle="width: 100%; height: 200px; resize: none"/>
                </td>
            </tr>
            <tr>
                <td class="tg-yw4l">이미지</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caImg"/>
                </td>
            </tr>
        </table>
        <%--<button type="submit">만들기</button>--%>
        <button type="submit" onclick="fn_createCafe()">만들기</button>
        <button type="button" onclick="history.back()">취소</button>

        </form:form>
    </tiles:putAttribute>
</tiles:insertDefinition>