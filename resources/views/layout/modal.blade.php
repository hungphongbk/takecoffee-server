<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title">@yield('title')</h4>
</div>
@yield('content')
<script>
    (function($){
        $('.fileinput-extended').extendedFileInput('{{ route('photo.index') }}');
    })(jQuery);
</script>
</body>
</html>