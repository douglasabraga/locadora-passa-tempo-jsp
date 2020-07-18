package msg;

public class msgFront {
    public static String msgSucesso = "<script>"+
                            "$(document).ready(function() {"+
                            "$('#modalMsg').modal('show');"
                            + "var modal = $(this);"
                            + "modal.find('#texto-titulo').text('Sucesso!');"
                            + "modal.find('#txt-normal').text('Êxito na operação!');"+
                            "});\n"+
                            "</script>";
    
    public static String msgErro = "<script>"+
                            "$(document).ready(function() {"+
                            "$('#modalMsg').modal('show');"
                            + "var modal = $(this);"
                            + "modal.find('#texto-titulo').text('Erro ao deletar!');"
                            + "modal.find('#txt-normal').text('Verifique suas dependências!');"+
                            "});\n"+
                            "</script>"; 
}
