<?php


namespace app\controllers;


use app\models\User;
use Yii;
use yii\db\Query;
use yii\filters\Cors;
use yii\helpers\ArrayHelper;
use yii\web\Controller;

class UserController extends  Controller
{
    public $enableCsrfValidation = false;

    public function behaviors()
    {

        return ArrayHelper::merge([
            [
                'class' => Cors::className(),
                'cors' => [
                    'Origin' => ['*'],
                    'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                    'Access-Control-Request-Headers' => ['*'],
                    'Access-Control-Allow-Credentials' => true
                ],
            ],
        ], parent::behaviors());
    }
    public function actionRegistered(){

        Yii::$app->response->format = 'json';

        $postData = Yii::$app->request->post();

        $username = $postData['username'];
        $userpass = $postData['userpass'];
        $useremaile = $postData['useremail'];
        if (User::findOne(['username' => $username])){
            return [
                'isOk' => false,
                'message' => '该用户名已注册',
            ];
        }
        if (!$username){
            return [
                'isOk' => false,
                'message' => '用户名不能为空',
            ];
        }
        if (!$userpass){
            return [
                'isOk' => false,
                'message' => '密码不能为空',
            ];
        }
        if (!$useremaile){
            return [
                'isOk' => false,
                'message' => '邮箱不能为空',
            ];
        }

        $res = (new Query())->createCommand()->insert('shop_user',[
            'username' => $username,
            'userpass' => Yii::$app->security->generatePasswordHash($userpass),
            'useremail' => $useremaile,
            'openid' => '0',
            'createtime' => time(),
        ])->execute();

        if (!$res){
            return [
                'isOk' => false,
                'message' => '系统错误',
            ];
        }

        return [
            'isOk' => true,
            'message' => '注册成功',
        ];
    }
}
