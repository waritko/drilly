<?php
$origUser = dibi::query("SELECT [user] FROM [events] WHERE [id]=%i", $event)->fetchSingle();
$memo = dibi::query("SELECT [memo] FROM [events] WHERE [id]=%i", $event)->fetchSingle();
$drillSet = dibi::query("SELECT [drillSet] FROM [events] WHERE [id]=%i", $event)->fetchSingle();
$userSet = dibi::query("SELECT [userSet] FROM [events] WHERE [id]=%i", $event)->fetchSingle();
$date = dibi::query("SELECT [date] FROM [events] WHERE [id]=%i", $event)->fetchSingle();
$result = dibi::query("SELECT [drills].[id], [drills].[drillOrder], [baseTime], [s].[head], [s].[alpha], [s].[charlie], [s].[delta], [s].[miss], [s].[proc], [name] FROM [situations] [s] JOIN [drills] ON [s].[situation] = [drills].[id] WHERE [event]=%i ORDER BY [drills].[drillOrder]", $event);


$smarty->assign('date', $date);
$drills = array();
$time = 0;
$baseTime = 0;
foreach($result as $res)
{
    $drill = array(
        'id' => $res->id,
        'baseTime' => $res->baseTime,
        'head' => $res->head,
        'alpha' => $res->alpha,
        'charlie' => $res->charlie,
        'delta' => $res->delta,
        'miss' => $res->miss,
        'proc' => $res->proc,
        'name' => $res->name
    );
    $drill['time'] = $drill['baseTime'] + $drill['charlie'] * 1 + $drill['delta'] * 2 + $drill['miss'] * 5 + $drill['proc'] * 3;
    $time += $drill['time'];
    $baseTime += $drill['baseTime'];
    $drills[] = $drill;
}
$smarty->assign('drills', $drills);
$smarty->assign('totalTime', $time);
$smarty->assign('baseTime', $baseTime);
$smarty->assign('penaltyTime', $time - $baseTime);
$smarty->assign('eventId', $event);
$smarty->assign('allowEdit', $origUser == $_SESSION['userId']);
$smarty->assign('memo', $memo);
$smarty->assign('userSet', $userSet);
$smarty->assign('drillSet', $drillSet);
