<%-- 
    Document   : dialogConfirm
    Created on : Mar 21, 2021, 9:41:02 PM
    Author     : sonng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    document.querySelector('#formAction').addEventListener('submit', function (e) {
        var form = this;
        e.preventDefault();
        swal({
            title: "THÔNG BÁO",
            text: "Bạn có chắc thực hiện hành động này?",
            icon: "warning",
            buttons: [
                'Không, hãy hủy bỏ',
                'Có, tôi đồng ý'
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                swal({
                    title: 'ĐANG XỬ LÝ',
                    text: 'Đã gửi hành động đến hệ thống.',
                    icon: 'success'
                }).then(function () {
                    form.submit();
                });
            } else {
                swal("HỦY BỎ", "Bạn đã hủy bỏ hành động này", "error");
            }
        });
    });
</script>