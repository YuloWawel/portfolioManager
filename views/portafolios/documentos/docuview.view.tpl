<div class="row">
  <div class="col-md-8 col-sm-12">
    <h1><span class=" icon ion-ios-briefcase "></span>&nbsp;{{documentodescripcion}} ({{flujoportafolionombre}})</h1>
  </div>
  <div class="col-md-4 col-sm-12">
    <div class="card">
        <div class="row">
          <button class="col-sm-6 " id="btnFiltro"><span class="ion-android-download">&nbsp;Descargar</span></button>
          <button class="col-sm-6 "data-docodd="{{documentoportafoliocodigo}}" id="btnSubir"><span class="ion-android-upload">&nbsp;Subir</span></button>
        </div>
    </div>
  </div>
</div>

<hr />
<div class="row">
  <div class="col-md-8 col-sm-12">
    <div class="card">
      <section class="panel">
        <header style="position:relative">
            Observaciones
        </header>
        <main>
            <table>
              <tbody>
                {{foreach documentos}}
                  <tr>
                    <td>{{documentoportafolio}}</td>
                     <td>{{documentoportafoliocodigo}}</td>
                     <td>{{documentodescripcion}}</td>
                     <td>{{categoriaportafolionombre}}</td>
                     <td><a href="" class="btn depth-1 s-margin"><span class="ion-eye"></span></a></td>
                  </tr>
                {{endfor documentos}}
              </tbody>
            </table>
        </main>
      </section>
    </div>
    <div class="col-md-12 col-sm-12">
      <div class="card">
        <section class="panel">
          <header style="position:relative">
              Comentarios
          </header>
          <main>
            <form action="index.php?page=docuview" method="post" class="col-sm-8 col-sm-offset-2 col-md-6 col-offset-3">
              <input type="hidden" name="btnComentar" value="INS"  />
              <input type="hidden" name="tocken" value=""  />
              <table>
                <div class="row s-padding">
                  <textarea style="width:100%" placeholder="Escribe tu comentario" class="col-sm-12" maxlength="500"  name="comentarioNuevo" id="comentarioNuevo"></textarea>
                  <button style="position:relative; left:82.5%;" class="" id="btnComentar">
                    <span class="ion-plus-circled">&nbsp;Comentar</span></button>

                </div>
                <tbody>
                  {{foreach comentarios}}
                    <tr>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td><a  href="" class="btn depth-1 s-margin"><span class="ion-eye"></span></a></td>
                    </tr>
                  {{endfor comentarios}}
                </tbody>
              </table>
            </form>
          </main>
        </section>
      </div>
    </div>
  </div>

  <div class="col-md-4 col-sm-12">
    <div class="card">
      <section class="panel">
        <header style="position:relative">
            Resumen
        </header>
        <div class="row">
            <div class="col-sm-3">
              <div class="center"><span class="ion-android-chat"></span>&nbsp;{{portafolio_colaboradores}}</div>
              <div class="center"><span class="icon ion-fork-repo"></span>&nbsp;{{portafolio_documentos}}</div>
            </div>
            <div class="col-sm-8">
                <div><span class="icon ion-ios-people"></span>&nbsp;{{departmanetodesc}}</div>
                <div><span class="icon ion-android-download"></span>&nbsp;{{departmanetodesc}}</div>
            </div>
        </div>
      </section>
      <section class="panel">
        <header style="position:relative">
            Colaboradores
            <span class="push-right" style="position:absolute;right:1em;top:0.5em;">
              <a href="index.php?page=colaboradoresD&portacod={{documentoportafolio}}&mode=INS" class="btn"><span class="icon ion-plus-circled"></span></a>
            </span>
        </header>
        <main>
            <table class="full-width">
              {{foreach colaboradores}}
                <tr>
                  <td>
                    {{usuarionom}}
                  </td>
                  <td class="center" style="width:70px">
                    <a href="index.php?page=colaboradoreditar&usrcod={{usuariocod}}&mode=UPDD" class="btn"><span class="icon ion-edit"></span></a>
                  </td>
                </tr>
                {{endfor colaboradores}}
            </table>
        </main>
      </section>
      <section class="panel">
        <header style="position:relative">
            Versiones
        </header>
        <main>
            <table class="full-width">
              {{foreach versiones}}
                <tr>
                  <td>
                    {{versionobservacion}}
                  </td>
                    <td class="center" style="width:70px"><a href={{versionurl}} class="btn"><span class="icon ion-android-download"></span></a>
                  </td>
                </tr>
                {{endfor versiones}}

            </table>
        </main>
      </section>
    </div>
  </div>
</div>

<script>
  $().ready(function(){
      $("#btnComentar").click(function(e){
        e.preventDefault();
        e.stopPropagation();
        document.forms[0].submit();
        });
        
       $("#btnSubir").click(
        function(e) {
          e.preventDefault();
          e.stopPropagation();
          var x = document.createElement("FORM");
          x.action = "index.php?page=docuversion";
          x.style= "display:none";
          x.method="POST";
          var y = document.createElement("INPUT");
          y.name="docodd";
          y.value=$(this).data('docodd');
          x.appendChild(y);
          document.body.append(x);
          x.submit();
        }
      );
    });
</script>
