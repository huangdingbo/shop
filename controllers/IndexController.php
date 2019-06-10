<?php
namespace app\controllers;

use app\controllers\CommonController;
use app\models\Product;
use Yii;
use yii\web\YiiAsset;

class IndexController extends CommonController
{
    protected $except = ['index'];

    public function actionIndex()
    {
//        var_dump(Yii::getAlias('@web'));exit;
        //Yii::$app->asyncLog->send(['this is indexcontroller']);

        //Yii::info('this is info', 'myinfo');
        //Yii::warning('this is warning');
        //Yii::info('this is trace');
        //Yii::beginProfile('mybench');D:\myphp_www\PHPTutorial\WWW\shop\web\images\banners\banner-gamer.jpg

        $this->layout = "layout1";
        $data['tui'] = Product::find()->where('istui = "1" and ison = "1"')->orderby('createtime desc')->limit(4)->all();
        $data['new'] = Product::find()->where('ison = "1"')->orderby('createtime desc')->limit(4)->all();
        $data['hot'] = Product::find()->where('ison = "1" and ishot = "1"')->orderby('createtime desc')->limit(4)->all();
        $data['all'] = Product::find()->where('ison = "1"')->orderby('createtime desc')->limit(7)->all();
        //Yii::endProfile('mybench');
//        var_dump($data['tui']);exit;
        return $this->render("index", ['data' => $data]);
    }

    public function actionError()
    {
        echo "404";exit;
    }


}
