<?php
include "../bootstrap.php";

// Get all drill sets for menu
$result = dibi::query("SELECT [id], [name] FROM [sets] ORDER BY [name]");
$sets = array();
foreach ($result as $res)
{
    $sets[] = array(
        "id" => $res->id,
        "name" => $res->name
    );
}
$smarty->assign('sets', $sets);

$action = $_GET['action'];
switch($action)
{
    case 'show-drill':
    {
        $event = $_GET['event'];
        include "../app/show-drill.php";
        $smarty->display("show_drill.tpl");
        break;
    }
    case 'add-drill':
    {
        include "../app/add-drill.php";
        break;
    }
    case 'delete-event':
    {
        include "../app/delete-event.php";
        break;
    }
    case 'new-drill':
    {
        $drillSet = $_GET['set'];
        include "../app/new-drill.php";
        $smarty->display("new_drill.tpl");
        break;
    }
    case 'drill-list':
    {
        $drillSet = $_GET['set'];
        include "../app/drill-list.php";
        $smarty->display("drill_list.tpl");
        break;
    }
    case 'drill-detail':
    {
        $drillId = $_GET['drill'];
        include "../app/drill-detail.php";
        $smarty->display("drill_detail.tpl");
        break;
    }
    case 'edit-event':
    {
        $eventId = $_GET['drill'];
        include "../app/edit-event.php";
        $smarty->display("edit_event.tpl");
        break;
    }
    case 'display-user-set':
    {
	    $userSet = $_GET['userSet'];
	    $drillSet = $_GET['drillSet'];
	    include "../app/display-user-set.php";
	    $smarty->display("display-user-set.tpl");
            break;
    }

    default:
    {
        $smarty->display("index.tpl");
        break;
    }
}
