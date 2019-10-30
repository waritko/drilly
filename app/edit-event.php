<?php
$origUser = dibi::query("SELECT [user] FROM [events] WHERE [id]=%i", $eventId)->fetchSingle();
if($origUser != $_SESSION['userId'])
{
    header("Location: index.php?action=show-drill&event=$eventId");
    die;
}

$date = dibi::query("SELECT [date] FROM [events] WHERE [id]=%i", $eventId)->fetchSingle()->format("Y-m-d");
$isMatch = dibi::query("SELECT [isMatch] FROM [events] WHERE [id]=%i", $eventId)->fetchSingle();
$memo = dibi::query("SELECT [memo] FROM [events] WHERE [id]=%i", $eventId)->fetchSingle();
$userSet = dibi::query("SELECT [userSet] FROM [events] WHERE [id]=%i", $eventId)->fetchSingle();
$drillSet = dibi::query("SELECT [drillSet] FROM [events] WHERE [id]=%i", $eventId)->fetchSingle();
$eventOrder = dibi::query("SELECT [eventOrder] FROM [events] WHERE [id]=%i", $eventId)->fetchSingle();
$result = dibi::query("SELECT `d`.`id`, `baseTime`, `s`.`head`, `s`.`alpha`, `s`.`charlie`, `s`.`delta`, `s`.`miss`, `s`.`proc`, `name`, `s`.`id` `sid`, `d`.`head` `maxhead`, `d`.`alpha` `maxalpha`, `d`.`charlie` `maxcharlie`, `d`.`delta` `maxdelta` FROM `situations` `s` JOIN `drills` `d` ON `s`.`situation` = `d`.`id` WHERE `event`=%i ORDER BY `d`.`drillOrder`", $eventId);


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
        'maxhead' => $res->maxhead,
        'maxalpha' => $res->maxalpha,
        'maxcharlie' => $res->maxcharlie,
        'maxdelta' => $res->maxdelta,
        'miss' => $res->miss,
        'proc' => $res->proc,
        'name' => $res->name,
        'situationId' => $res->sid
    );
    //$drill['time'] = $drill['baseTime'] + $drill['charlie'] * 1 + $drill['delta'] * 2 + $drill['miss'] * 5 + $drill['proc'] * 3;
    //$time += $drill['time'];
    //$baseTime += $drill['baseTime'];
    $drills[] = $drill;
}
$smarty->assign('drills', $drills);
$smarty->assign('totalTime', $time);
$smarty->assign('baseTime', $baseTime);
$smarty->assign('penaltyTime', $time - $baseTime);
$smarty->assign('eventId', $eventId);
$smarty->assign('isMatch', $isMatch == 'T');
$smarty->assign('drillSet', $drillSet);
$smarty->assign('eventOrder', $eventOrder);
$smarty->assign('memo', $memo);
$smarty->assign('userSet', $userSet);
