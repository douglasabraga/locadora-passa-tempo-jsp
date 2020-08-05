<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script>
    $('#modalExcluir').on('show.bs.modal', function (e) {
        var id = $(e.relatedTarget).data('id');
        var nome = $(e.relatedTarget).data('nome');
        var route = $(e.relatedTarget).data('route') + id;
        var modal = $(this);

        modal.find('#texto-normal').text('Deseja deletar esse(a) ' + nome + '?');
        modal.find('.modal-footer .btn-danger').attr("onclick", "location.href='${pageContext.request.contextPath}"+route+"'");
    });
</script>