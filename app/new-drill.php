<?php
$result = dibi::query("SELECT [id], [head], [alpha], [charlie], [delta], [name] FROM [drills] WHERE [drillSet]=%i ORDER BY [drillOrder]", $drillSet);
$drills = array();
foreach ($result as $res)
{
    $drills[] = array(
        "head" => $res->head,
        "alpha" => $res->alpha,
        "charlie" => $res->charlie,
        "delta" => $res->delta,
        "id" => $res->id,
        "name" => $res->name
    );
}
$smarty->assign('drills', $drills);
$smarty->assign('drillSet', $drillSet);
