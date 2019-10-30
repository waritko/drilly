<?php
$result = dibi::query("SELECT [e].[date], [baseTime], [head], [alpha], [charlie], [delta], [miss], [proc], ([baseTime] + [charlie] + [delta] * 2 + [miss] * 5 + [proc] * 3) [time] FROM [situations] [s] JOIN [events] [e] ON [e].[id]=[s].[event] WHERE [e].[user]=%i AND [s].[situation]=%i ORDER BY [e].[date] DESC, [e].[eventOrder]", $userId, $drillId);
$name = dibi::query("SELECT [name] FROM [drills] WHERE [id]=%i", $drillId)->fetchSingle();

$drills = array();
$graph = array();
foreach ($result as $res)
{
    $drills[] = array(
        "date" => $res->date->format('Y-m-d'),
        "time" => $res->time,
        "baseTime" => $res->baseTime,
        "head" => $res->head,
        "alpha" => $res->alpha,
        "charlie" => $res->charlie,
        "delta" => $res->delta,
        "miss" => $res->miss,
        "proc" => $res->proc
    );
    $graph[] = array($res->date->format('Y-m-d'), $res->baseTime, $res->time, $res->baseTime - $res->time);
}
$graph[] = array("Datum", "Čas", "Celkový čas", "Penalizace");
$smarty->assign('drills', $drills);
$smarty->assign('name', $name);
$smarty->assign('graphData', json_encode(array_reverse($graph), JSON_PRETTY_PRINT));
