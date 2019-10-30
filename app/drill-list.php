<?php
$result = dibi::query("SELECT [id],
	[date],
	[memo],
	[userSet],
	[isMatch],
	(
		SELECT SUM([baseTime]) + SUM([charlie]) + SUM([delta]) * 2 + SUM([miss]) * 5 + SUM([proc]) * 3
		FROM [situations]
		WHERE [event] = [events].[id]
		) [time],
	(
		SELECT SUM([baseTime])
		FROM [situations]
		WHERE [event] = [events].[id]
		) [baseTime],
	(
		SELECT SUM([charlie]) + SUM([delta]) * 2 + SUM([miss]) * 5 + SUM([proc]) * 3
		FROM [situations]
		WHERE [event] = [events].[id]
		) [penaltyTime]
FROM [events]
WHERE [user] = %i
	AND [drillSet] = %i
ORDER BY [date] DESC, [eventOrder] DESC", $userId, $drillSet);

$drills = array();
$graph = array();
foreach ($result as $res)
{
    $drills[] = array(
        "id" => $res->id,
        "date" => $res->date->format('Y-m-d'),
        "isMatch" => $res->isMatch,
        "time" => $res->time,
        "baseTime" => $res->baseTime,
	"penaltyTime" => $res->penaltyTime,
	"memo" => $res->memo,
	"userSet" => $res->userSet
    );
    $graph[] = array($res->date->format('Y-m-d'), $res->baseTime, $res->time, $res->penaltyTime);
}
$graph[] = array("Datum", "Čas", "Celkový čas", "Celková penalizace");
$smarty->assign('drills', $drills);
$smarty->assign('graphData', json_encode(array_reverse($graph), JSON_PRETTY_PRINT));
