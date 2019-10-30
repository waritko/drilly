{extends file='layout.tpl'}
{block name=content}
    <div id="chart_div" style="width: 960px; height: 500px;"></div>
    <div style="height: 3em;"></div>

    <h3>Drill {$name}</h3>
    <table width="100%" border="1">
        <tr>
            <th style="padding-left: 0.5em;">Datum</th>
            <th style="padding-left: 0.5em;">Čas</th>
            <th style="padding-left: 0.5em;">H (+0)</th>
            <th style="padding-left: 0.5em;">A (+0)</th>
            <th style="padding-left: 0.5em;">C (+1)</th>
            <th style="padding-left: 0.5em;">D (+2)</th>
            <th style="padding-left: 0.5em;">M (+5)</th>
            <th style="padding-left: 0.5em;">Proc (+3)</th>
            <th style="padding-left: 0.5em;">Penalizace</th>
            <th style="padding-left: 0.5em;">Výsledný čas</th>
        </tr>
        {foreach $drills as $drill}
            <tr>
                <td style="padding-left: 0.5em;">{$drill.date}</td>
                <td style="padding-left: 0.5em;">{$drill.baseTime}</td>
                <td style="padding-left: 0.5em;">{$drill.head}</td>
                <td style="padding-left: 0.5em;">{$drill.alpha}</td>
                <td style="padding-left: 0.5em;">{$drill.charlie}</td>
                <td style="padding-left: 0.5em;">{$drill.delta}</td>
                <td style="padding-left: 0.5em;">{$drill.miss}</td>
                <td style="padding-left: 0.5em;">{$drill.proc}</td>
                <td style="padding-left: 0.5em;">{$drill.proc * 3 + $drill.miss * 5 + $drill.delta * 2 + $drill.charlie}</td>
                <td style="padding-left: 0.5em;"><b>{$drill.time}</b></td>
            </tr>
        {/foreach}
    </table>
    <div style="font-size: 120%; margin-top: 0.75em;">
        <a href="./index.php?{$queryString}&amp;userId={$userId}">Odkaz pro sdílení</a>
    </div>
{/block}
{block name=head}
<link rel="stylesheet" href="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/start/jquery-ui.css">
<link rel="stylesheet" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
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
{/block}
