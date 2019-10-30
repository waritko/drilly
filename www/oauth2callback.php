<?php
set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ .'/../lib/googleClient');
require_once 'vendor/autoload.php';

session_start();

$client = new Google_Client();
$client->setAuthConfigFile('/www/varak.net/drilly.varak.net/client_secret_605290507813-msavvok2pbtr1fbk2ujc9vcflri964o8.apps.googleusercontent.com.json');
$client->setRedirectUri('https://' . $_SERVER['HTTP_HOST'] . '/oauth2callback.php');
$client->addScope(Google_Service_Oauth2::USERINFO_EMAIL);

if (! isset($_GET['code'])) {
  $auth_url = $client->createAuthUrl();
  header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
} else {
  $client->authenticate($_GET['code']);
  $_SESSION['access_token'] = $client->getAccessToken();
  $redirect_uri = 'https://' . $_SERVER['HTTP_HOST'] . '/';
  header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
}
