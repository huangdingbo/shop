<?php
namespace app\controllers;
use app\controllers\CommonController;
use app\models\User;
use Yii;
use yii\db\Query;

class MemberController extends CommonController
{

    protected $except = ['auth', 'logout', 'reg', 'qqreg', 'qqlogin', 'qqcallback'];

    public function actionAuth()
    {

        $this->layout = 'layout2';
        if (Yii::$app->request->isGet) {
            $url = Yii::$app->request->referrer;
            if (empty($url)) {
                $url = "/";
            }
            Yii::$app->session->setFlash('referrer', $url);
        }
        $model = new User;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->login($post)) {
//                var_dump(Yii::$app->session);exit;
//                $url = Yii::$app->session->getFlash('referrer');
//                var_dump($url);exit;
                return $this->redirect(['index/index']);
            }
        }
        return $this->render("auth", ['model' => $model]);
    }

    public function actionLogout()
    {   
        /*Yii::$app->session->remove('loginname');
        Yii::$app->session->remove('isLogin');
        if (!isset(Yii::$app->session['isLogin'])) {
            return $this->goBack(Yii::$app->request->referrer);
        }*/
        Yii::$app->user->logout(false);
        return $this->goBack(Yii::$app->request->referrer);
    }

    public function actionReg()
    {
        $model = new User;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->regByMail($post)) {
                Yii::$app->session->setFlash('info', '电子邮件发送成功');
            }
        }
        $this->layout = 'layout2';
        return $this->render('auth', ['model' => $model]);
    }

    public function actionQqlogin()
    {
        require_once("../vendor/qqlogin/qqConnectAPI.php");
        $qc = new \QC();
        $qc->qq_login();
    }

    public function actionQqcallback()
    {
        require_once("../vendor/qqlogin/qqConnectAPI.php");
        $auth = new \OAuth();
        $accessToken = $auth->qq_callback();
        $openid = $auth->get_openid();
        $qc = new \QC($accessToken, $openid);
        $userinfo = $qc->get_user_info();
        $session = Yii::$app->session;
        $session['userinfo'] = $userinfo;
        $session['openid'] = $openid;
        if ($model = User::find()->where('openid = :openid', [':openid' => $openid])->one()) {
            $session['loginname'] = $model->username;
            $session['isLogin'] = 1;
            return $this->redirect(['index/index']);
        }
        return $this->redirect(['member/qqreg']);
    }

    public function actionQqreg()
    {
        $this->layout = "layout2";
        $model = new User;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            $session = Yii::$app->session;
            $post['User']['openid'] = $session['openid'];
            if ($model->reg($post, 'qqreg')) {
                $session['loginname'] = $post['User']['username'];
                $session['isLogin'] = 1;
                return $this->redirect(['index/index']);
            }
        }
        return $this->render('qqreg', ['model' => $model]);
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

        if ($res){
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
