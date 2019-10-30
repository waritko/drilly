<?php
$drillNames = array();
$dns = array();
$res = dibi::query("select [name], [id] from [drills] where [drillSet]=%i order by [drillOrder]", $drillSet);
$i = 0;
foreach($res as $dn)
{
	$drillNames[] = $dn->name;
	$dns[$dn->id] = $dn->name;
	$i++;
}
$smarty->assign('sortIndex', $i*2 + 2);
$res = dibi::query("select ([baseTime] + [charlie] + [delta] * 2 + [miss] * 5 + [proc] * 3) [time], [situation], [event], (select [memo] from [events] where [id]=[event]) [memo], (select [date] from [events] where [id]=[event]) [date] from [situations] where [event] in (select [id] from [events] where [userSet]=%s AND [drillSet]=%i)", $userSet, $drillSet);

$drills = array();
foreach($res as $d)
{
	if(!isset($drills[$d->event]))
		$drills[$d->event] = array();
	$drills[$d->event]['memo'] = $d->memo;
	if(!isset($drills[$d->event]['time']))
	{
		$drills[$d->event]['time'] = array();
		$drills[$d->event]['percent'] = array();
	}
	$drills[$d->event]['time'][$dns[$d->situation]] = $d->time;
	$drills[$d->event]['percent'][$dns[$d->situation]] = 0;
	$drills[$d->event]['date'] = $d->date->format('Y-m-d');
	$drills[$d->event]['id'] = $d->event;
}

$maxPerc = 0;
foreach($drills as $drillId => $drill)
{
	$percent = 0;
	$ttime = 0;
	foreach($dns as $dk => $dn)
	{
		$best = dibi::query("SELECT min([time]) from (select ([baseTime] + [charlie] + [delta] * 2 + [miss] * 5 + [proc] * 3) [time] from [situations] where [event] in (select [id] from [events] where [userSet]=%s AND [drillSet]=%i) AND [situation]=%i) [tmpEventTimes]", $userSet, $drillSet, $dk)->fetchSingle();
		$drills[$drillId]['percent'][$dn] = sprintf("%0.2f", ((double)$best / $drills[$drillId]['time'][$dn]) * 100);
		$percent += $drills[$drillId]['percent'][$dn];
		$ttime += $drills[$drillId]['time'][$dn];
	}
	if($maxPerc < $percent) $maxPerc = $percent;
	$drills[$drillId]['totalPercent'] = $percent;
	$drills[$drillId]['totalTime'] = $ttime;
}
foreach($drills as $drillId => $drill)
{
	$drills[$drillId]['totalPercent'] = sprintf("%0.2f", ($drills[$drillId]['totalPercent'] / $maxPerc) * 100);
}



$smarty->assign('drillNames', $drillNames);
$smarty->assign('drills', $drills);

