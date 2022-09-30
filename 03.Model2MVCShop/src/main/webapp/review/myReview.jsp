<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>���� �� ����</title>
</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container">

    <div class="page-header">
      <h1 class="text-info">���� �� ����</h1>
    </div>



    <form class="form-inline" id="detailForm">

      <div class="row">��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ search.currentPage } ������</div>



      <table class="table table-hover table-striped">


        <tbody>

          <c:forEach var="i" items="${ list }">
            <tr id="${ i.tranNo }">
              <td align="center" rowspan="3" style="width: 200px; height: 200px; text-align: center;"><c:if test="${ !empty i.prod.mainFile }">
                  <img src="/images/${ i.prod.mainFile.path }/${ i.prod.mainFile.fileName }" style="object-fit: contain; width: 100%; height: 100%;" />
                </c:if> <c:if test="${ empty i.prod.mainFile }">
                  <img src="/images/empty.GIF" style="object-fit: contain; width: 100%; height: 100%;" />
                </c:if></td>
              <td align="left"><c:if test="${ i.grade == 1 }">�ڡ١١١�</c:if> <c:if test="${ i.grade == 2 }">�ڡڡ١١�</c:if> <c:if test="${ i.grade == 3 }">�ڡڡڡ١�</c:if> <c:if test="${ i.grade == 4 }">�ڡڡڡڡ�</c:if> <c:if test="${ i.grade == 5 }">�ڡڡڡڡ�</c:if> (�ۼ��� : ${ i.reviewDate })&nbsp; <span>�������</span></td>
            </tr>
            <tr>
              <td align="left">
                <table>
                  <tr>
                    <c:forEach items="${ i.fileList }" var="files">
                      <td align="center" style="height: 100%; width: 100px;"><img src="/images/${ files.path }/${ files.fileName }" style="object-fit: contain; width: 100%; height: 100%;" /></td>
                    </c:forEach>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td align="left" colspan="1">${ i.detail }</td>
            </tr>
            <tr id="${ i.prod.prodNo }">
              <td colspan="5"><span name="check">${ i.prod.prodName }</span> - ${ i.prod.prodDetail }</td>
            </tr>

          </c:forEach>

        </tbody>

      </table>

      <c:import var="pageNavigator" url="../common/pageNavigator_new.jsp" />
      ${ pageNavigator }
    </form>
  </div>
  <script type="text/javascript">
			function fncCheck() {
				$('#detailForm').attr('method', "post").attr('action',
						"/review/myReview");
			}
			function fncUpdateReview(tranNo) {
				popWin = window
						.open(
								"/review/updateReview?tranNo=" + tranNo,
								"popWin",
								"left=300,top=200,width=800,height=500,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
			}
			$(function() {
				$('span:contains("�������")').bind('click', function() {
					fncUpdateReview($(this).parents('tr[id]').attr('id'));
				})
				$('span[name="check"]').bind(
						'click',
						function() {
							self.location = '/product/getProduct?prodNo='
									+ $(this).parents('tr[id]').attr('id');
						})
			})
		</script>
</body>
<style type="text/css">
</style>
</html>
