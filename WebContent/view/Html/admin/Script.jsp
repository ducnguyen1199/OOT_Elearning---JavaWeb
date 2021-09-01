<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/assets/admin/js" var="url"></c:url>

<script src="${url}/jquery.min.js"></script>

<script src="${url}/popper.min.js"></script>

<script src="${url}/bootstrap.min.js"></script>

<!-- Appear JavaScript -->
<script src="${url}/jquery.appear.js"></script>

<script src="${url}/countdown.min.js"></script>

<script src="${url}/waypoints.min.js"></script>

<script src="${url}/jquery.counterup.min.js"></script>

<script src="${url}/wow.min.js"></script>

<script src="${url}/apexcharts.js"></script>

<script src="${url}/slick.min.js"></script>

<script src="${url}/select2.min.js"></script>

<script src="${url}/owl.carousel.min.js"></script>

<script src="${url}/jquery.magnific-popup.min.js"></script>

<script src="${url}/smooth-scrollbar.js"></script>

<script src="${url}/lottie.js"></script>

<script src="${url}/core.js"></script>

<script src="${url}/charts.js"></script>

<script src="${url}/animated.js"></script>

<script src="${url}/kelly.js"></script>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script src="${url}/chart-custom.js"></script>

<script src="${url}/custom.js"></script>

<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>

<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>