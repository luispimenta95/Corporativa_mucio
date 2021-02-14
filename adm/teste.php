<html>
<form action="#" class="form-inline">
    <script language="javascript">
        function habilitacao() {
            if (document.getElementById('radio4').checked == true) {
                document.getElementById('dataInicial').disabled = false;
                document.getElementById('dataFinal').disabled = false;
            }
            if (document.getElementById('radio4').checked == false) {
                document.getElementById('dataInicial').disabled = true;
                document.getElementById('dataFinal').disabled = true;
            }
        }
    </script>
    <label class="radio-inline">
        <input type="radio" onClick="habilitacao()" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1">Último semestre
    </label>
    <label class="radio-inline">
        <input type="radio" onClick="habilitacao()" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">Último mês
    </label>
    <label class="radio-inline">
        <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3" onClick="habilitacao()" checked>Última semana
    </label>
    <label for="radio4" class="radio-inline">
        <input type="radio" name="optionsRadiosInline" id="radio4" onClick="habilitacao()" value="option4">Entre
    </label>
    <div class="form-group">
        <input type="date" class="form-control" id="dataInicial" placeholder="Data inicial" disabled>
    </div>

    <div class="form-group">
        <input type="date" class="form-control" id="dataFinal" placeholder="Data final" disabled>
    </div>

    <button type="submit" class="btn btn-primary">Pesquisar</button>
</form>

</html>