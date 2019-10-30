{extends file='layout.tpl'}
{block name=content}
    <table width="90%" border="1" id="drillist" style="font-size: 80%; margin-left: -150px;">
	<thead>
        <tr>
            <th>Datum</th>
            <th>Memo</th>
	    {foreach $drillNames as $drillName}
	    <th>{$drillName} cas</th>
	    <th>{$drillName} %</th>
	    {/foreach}
            <th>Vysledne %</th>
	    <th>Vysledny cas</th>
        </tr>
	</thead>
	<tbody>
        {foreach $drills as $drill}
            <tr>
                <td><a href="./index.php?action=show-drill&amp;event={$drill.id}"><span style="text-weight: bold;">{$drill.date}</span></a></td>
                <td>{$drill.memo}</td>
                {foreach $drillNames as $drillName}
	        <td data-order="{sprintf("%09d", $drill.time.$drillName * 100)}">{$drill.time.$drillName} s</td>
	        <td data-order="{sprintf("%09d", $drill.percent.$drillName * 100)}">{$drill.percent.$drillName}%</td>
	        {/foreach}
		<td data-order="{sprintf("%05d", $drill.totalPercent * 100)}">{$drill.totalPercent}</td>
		<td data-order="{sprintf("%09d", $drill.totalTime * 100)}">{$drill.totalTime}</td>
            </tr>
        {/foreach}
	</tbody>
    </table>
    <a href="./index.php?{$queryString}&amp;userId={$userId}">Odkaz pro sdílení</a>
{/block}
{block name=head}
<link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/start/jquery-ui.css" integrity="sha384-0HaZzSYgpH6mBPdo4vRSOtnDXtzptq1OppqpQRGJFsL445uu2d33FMSlgBOW5u1Q" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" integrity="sha384-0+oHgv887Bf6R5zNNUEA1S3uGi50ThGLGlBPj2b45pM+4waOZ+tTOV5EgvHS9cv4" crossorigin="anonymous">
{/block}
{block name=foot}
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js" integrity="sha384-IBmKH0G7FU3Csl2bjH/4Xb58TMugBhvgy35wKdJWXlOf/HWqMgzuAr+b/YCiuC15" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" integrity="sha384-89aj/hOsfOyfD0Ll+7f2dobA15hDyiNb8m1dJ+rJuqgrGR+PVqNU8pybx4pbF3Cc" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var dtopts = {
            "bPaginate": false,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": true,
            "pageLength": 1000,
            "oLanguage": {
                "sLengthMenu": "Zobraz _MENU_ záznamů na stránku",
                "sZeroRecords": "Omlouváme se, ale nic nebylo nalezeno",
                "sInfo": "Zobrazuji _START_ až _END_ z _TOTAL_ záznamů",
                "sInfoEmpty": "Zobrazuji 0 až 0 z 0 záznamů",
                "sInfoFiltered": "(Filtrováno z _MAX_ celkových záznamů)"
            },
            "aaSorting": [[ {$sortIndex}, "desc" ]]
        };
        $('#drillist').dataTable(dtopts);
    });
</script>
{/block}

