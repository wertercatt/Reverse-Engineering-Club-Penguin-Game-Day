// シーンの初期化周り

// シーン読み込み
LoadScene("scene/town.scene");
// モデルリソース登録
AddResourceModel("hub/hub_town_00.cmpres");
// バイナリリソース登録
AddResourceBin("hub/hub_town_bin_00.cmparc");


// 最初に作られるスレッド
function main()
{
	// プレーヤー作成
	CreatePlayer();
	// シーン開始
	StartScene();
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
	ChangeScene(HUB_VILLAGE);
}
