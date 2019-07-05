// 共通処理
//IncludeScript("test/script/common.nut");

// シーン読み込み
Grp.LoadScene("scene/village.scene");
// モデルリソース登録
Grp.AddResourceModel("hub/hub_village_00.cmpres");
// バイナリリソース登録
Grp.AddResourceBin("hub/hub_village_bin_00.cmparc");

// 最初に作られるスレッド
function main()
{
	// シーン開始
	Grp.StartScene();
	
	// セットデータ読み込み
	Hub.LoadSetData("test/script/village.set");
	// アクティビティ作成
	Hub.CreateActivity(2,"village_ukiwa_act.rmdl",Hub.ACTIVITY_POINT_PRESS,false);
	// プレーヤー作成
	Hub.CreatePlayer();
	
	// フェードイン
	Grp.FadeIn(1.0);
	// フェード待ち
	Grp.WaitFade();
	
	while(!Input.Press(0,Input.B))
	{
		Wait();
	}
	
	// フェードアウト
	Grp.FadeOut(1.0);
	// フェード待ち
	Grp.WaitFade();
	// シーン終了
	Hub.ChangeScene(Hub.TOWN);
}

