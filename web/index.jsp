<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Bem Vindo</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form action="#" method="get">
                    <div class="grupo-entrada">
                        <div class="row">
                            <!-- <label for="nome">Nome</label> -->
                            <div class="col-sm-3">
                                <input type="text" name="nome" id="nome" class="campo" placeholder="Nome">
                            </div>
                            <div class="col-sm-3">
                                <input type="text" name="categoria" id="categoria" class="campo" placeholder="Categoria">
                            </div>
                            <div class="col-sm-3">
                                <input type="text" name="ator" id="ator" class="campo" placeholder="Ator">
                            </div>
                            <div class="col-sm-3">
                                <button class="botao botao--pesquisar">Pesquisar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <div class="container">
            <img class="capa img-fluid" width="290" height="430" src="https://adorocinematorrent.com/capas/frozen-2-download-torrent-2020-dublado-dual-audio-bluray-1080p-720p-4k-hd.jpg" alt="Frozen 2" title="Frozen 2">
            <img class="capa img-fluid" width="290" height="430" src="https://adorocinematorrent.com/capas/star-trek-picard-legendada-download-torrent-2020-dublado-dual-audio-bluray-1080p-720p-4k-hd.jpg" alt="Star Trek - Picard - 1ª Temporada" title="Star Trek - Picard - 1ª Temporada">
            <img class="capa img-fluid" width="290" height="430" src="https://adorocinematorrent.com/capas/the-beach-bum-levando-a-vida-numa-boa-download-torrent-2020-dublado-dual-audio-bluray-1080p-720p-4k-hd.jpg" alt="The Beach Bum - Levando a Vida Numa Boa" title="The Beach Bum - Levando a Vida Numa Boa">
            <img class="capa img-fluid" width="290" height="430" src="https://adorocinematorrent.com/capas/o-caso-richard-jewell-download-torrent-dublado-dual-audio-legendado-bluray-1080p-720p-4k-hd.jpg" alt="O Caso Richard Jewell" title="O Caso Richard Jewell">
            <img class="capa img-fluid" width="290" height="430" src="https://adorocinematorrent.com/capas/sonic-o-filme-legendado-hdrip-download-torrent-2020-dublado-dual-audio-bluray-1080p-720p-4k-hd.jpg" alt="Sonic - O Filme - Legendado HDRIP" title="Sonic - O Filme - Legendado HDRIP">
            <img class="capa img-fluid" width="290" height="430" src="https://adorocinematorrent.com/capas/aves-de-rapina-arlequina-e-sua-emancipacao-fantabulosa-legendado-hdrip-download-torrent-2020-dublado-dual-audio-bluray-1080p-720p-4k-hd.jpg" alt="Aves de Rapina - Arlequina e sua Emancipação Fantabulosa - Legendado HDRIP" title="Aves de Rapina - Arlequina e sua Emancipação Fantabulosa - Legendado HDRIP">
        </div>
    </body>
</html>