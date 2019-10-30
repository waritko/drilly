<?php
//header("Content-type: text/plain"); print_r($_POST); die;
if(!isset($_POST['date']) || trim($_POST['date']) == "" || time($_POST['date']) < 0)
{
    echo "No event date present.";
    die;
}
$data = array(
    "user" => $_SESSION['userId'],
    "date" => $_POST['date'],
    "isMatch" => isset($_POST['ismatch']) ? 'T' : 'F',
    "drillSet" => $_POST['drillset'],
    "eventOrder" => $_POST['eventOrder'],
    "memo" => $_POST['memo'],
    "userSet" => $_POST['userSet']
);
$edit = isset($_GET['edit']) && $_GET['edit'] == 'T';
$event = $_POST['eventId'];
if(!$edit)
{
    dibi::query("INSERT INTO [events]", $data);
    $event = dibi::insertId();
}
else
{
    $origUser = dibi::query("SELECT [user] FROM [events] WHERE [id]=%i", $event)->fetchSingle();
    if($origUser != $_SESSION['userId'])
    {
        header("Location: index.php?action=show-drill&event=$event");
        die;
    }
    dibi::query("UPDATE [events] SET", $data, "WHERE [id]=%i", $event);
}

for($i = 1; $i < 50; $i++)
{
    $base = "drill$i";
    if(!isset($_POST[$base . 'type'])) break;

    $drill = array(
        'event' => $event,
        'baseTime' => $_POST[$base . 'time'],
        'head' => $_POST[$base . 'head'],
        'alpha' => $_POST[$base . 'alpha'],
        'charlie' => $_POST[$base . 'charlie'],
        'delta' => $_POST[$base . 'delta'],
        'miss' => $_POST[$base . 'miss'],
        'proc' => $_POST[$base . 'proc'],
        'situation' => $_POST[$base . 'type']
    );
    //$drill['time'] = $drill['baseTime'] + $drill['charlie'] * 1 + $drill['delta'] * 2 + $drill['miss'] * 5 + $drill['procedure'] * 3;
    if(!$edit)
    {
        dibi::query("INSERT INTO [situations]", $drill);
    }
    else
    {
        dibi::query("UPDATE [situations] SET", $drill, "WHERE [id]=%i", $_POST[$base . 'situation']);
    }
}
header("Location: index.php?action=show-drill&event=$event");
