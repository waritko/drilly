{extends file='layout.tpl'}
{block name=content}
    <div id="chart_div" style="width: 960px; height: 500px;"></div>
    <div style="height: 3em;"></div>
    {*<ul>*}
        {*{foreach $drills as $drill}*}
        {*<li><span style="text-weight: bold;">{$drill.date}</span> - {$drill.time} :: <a href="./index.php?action=show-drill&amp;event={$drill.id}">Detail</a></li>*}
        {*{/foreach}*}
    {*</ul>*}
    <table width="90%" border="1" id="drillist">
        <tr>
            <th>Datum</th>
            <th>Závod</th>
            <th>Celkový čas</th>
            <th>Čas provedení</th>
            <th>Penalizace</th>
        </tr>
        {foreach $drills as $drill}
            <tr>
                <td><a href="./index.php?action=show-drill&amp;event={$drill.id}"><span style="text-weight: bold;">{$drill.date}</span></a></td>
                <td>{('T'==$drill.isMatch)?'ANO':'NE'}</td>
                <td data-order="{sprintf("%09d", $drill.time * 100)}">{$drill.time}</td>
                <td data-order="{sprintf("%09d", $drill.baseTime * 100)}">{$drill.baseTime}</td>
                <td data-order="{sprintf("%09d", $drill.penaltyTime)}">{$drill.penaltyTime}</td>
		<td>{$drill.memo}</td>
            </tr>
        {/foreach}
    </table>
    <a href="./index.php?{$queryString}&amp;userId={$userId}">Odkaz pro sdílení</a>
{/block}
{block name=head}
<link rel="stylesheet" href="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/start/jquery-ui.css">
<link rel="stylesheet" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
{if count($drills) > 0}
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load("visualization", "1", { packages:["corechart"] } );
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable(
                {$graphData}
        );

        var options = {
            title: 'Celkový čas',
            pointSize: 5,
            //curveType: 'function',
            legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

        chart.draw(data, options);
    }
</script>
{/if}
{/block}
{block name=foot}
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript"
        src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var dtopts = {
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": true,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": true,
            "pageLength": 10,
            "oLanguage": {
                "sLengthMenu": "Zobraz _MENU_ záznamů na stránku",
                "sZeroRecords": "Omlouváme se, ale nic nebylo nalezeno",
                "sInfo": "Zobrazuji _START_ až _END_ z _TOTAL_ záznamů",
                "sInfoEmpty": "Zobrazuji 0 až 0 z 0 záznamů",
                "sInfoFiltered": "(Filtrováno z _MAX_ celkových záznamů)"
            },
            "aaSorting": [[ 2, "desc" ]]
        };
        $('#drillist').dataTable(dtopts);
    });
</script>
{/block}
