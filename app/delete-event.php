<?php
$eventId = $_GET['event'];
if(trim($eventId) == "") die;
dibi::query("DELETE FROM [situations] WHERE [event]=%i", $eventId);
dibi::query("DELETE FROM [events] WHERE [id]=%i", $eventId);

header("Location: index.php");
