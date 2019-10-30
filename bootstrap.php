<?php
/**
 * Created by PhpStorm.
 * User: waritko
 * Date: 3.5.16
 * Time: 20:36
 */
set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ .'/lib/googleClient');
require_once "lib/dibi.phar";
require_once "lib/smarty/Smarty.class.php";

dibi::connect(array(
    'driver'   => 'mysqli',
    'host'     => 'localhost',
    'username' => 'drilly',
    'password' => 'EWa2yMrwQjbBu5sj',
    'database' => 'drilly',
    'charset'  => 'utf8',
/*    'profiler' => [
        'run' => TRUE,
        'file' => 'log-' . date('Y-m-d') . '.txt',
],*/
));

$smarty = new Smarty();
$smarty->setTemplateDir( __DIR__ . '/templates/');
$smarty->setCompileDir( __DIR__ . '/templates_c/');
$smarty->setConfigDir( __DIR__ . '/configs/');
$smarty->setCacheDir( __DIR__ . '/cache/');

$smarty->debugging = false;

$userId = false;
if(isset($_GET['userId']))
{
    $smarty->assign('externalId', true);
    $userId = $_GET['userId'];
}
else
{
    ini_set('session.gc_maxlifetime', 14*24*3600);
    session_set_cookie_params(14*24*3600);
    session_start();
    //Google API PHP Library includes
    require_once 'vendor/autoload.php';

    $client = new Google_Client();
    $client->setAuthConfigFile('/www/varak.net/drilly.varak.net/client_secret_605290507813-msavvok2pbtr1fbk2ujc9vcflri964o8.apps.googleusercontent.com.json');
    $client->addScope(Google_Service_Oauth2::USERINFO_EMAIL);

    if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
      $client->setAccessToken($_SESSION['access_token']);
      $oauth = new Google_Service_Oauth2($client);
      if(!isset($_SESSION['userId']))
      {
          //var_dump($oauth->userinfo->get());
          $gid = $oauth->userinfo->get()->id;
          $mail = $oauth->userinfo->get()->email;
	  $id = dibi::query("SELECT [id] FROM [users] WHERE [googleId]=%s", $gid)->fetchSingle();
          if(!$id)
          {
              $data = array(
                  'googleId' => $gid,
                  'mail' => $mail
              );
              dibi::query("INSERT INTO [users]", $data);
              $_SESSION['userId'] = dibi::insertId();
          }
          else
          {
              $_SESSION['userId'] = $id;
          }
      }
      $userId = $_SESSION['userId'];
    } else {
      $redirect_uri = 'https://' . $_SERVER['HTTP_HOST'] . '/oauth2callback.php';
      header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
    }

    $smarty->assign('session', $_SESSION);
    $smarty->assign('externalId', false);
}

if(!isset($_SESSION['mail']))
{
	$_SESSION['mail'] = dibi::query("SELECT [mail] FROM [users] WHERE [id]=%i", $_SESSION['userId'])->fetchSingle();
}

$smarty->assign('userId', $userId);
$smarty->assign('queryString', $_SERVER['QUERY_STRING']);
$smarty->assign('mail', $_SESSION['mail']);

//die;
