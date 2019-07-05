IncludeScript("test/script/test2.nut");

// シーンの初期化周り

// シーン読み込み
LoadScene("scene/village.scene");
// モデルリソース登録
AddResourceModel("hub/hub_village_00.cmpres");
// バイナリリソース登録
AddResourceBin("hub/hub_village_bin_00.cmparc");

// 最初に作られるスレッド
function main()
{
	// フェードイン
	FadeIn(1.0);
	
	// シーン開始
	StartScene();
	
	// フェード待ち
	WaitFade();
	
	local vec1 = Vector(1.2,2.2,3.2);
	local vec2 = Vector(2.7,5.5,6.4);
	
	print("vec1.x : "+vec1.x+"\n");
	print("vec1.y : "+vec1.y+"\n");
	print("vec1.z : "+vec1.z+"\n");
	print("vec2.x : "+vec2.x+"\n");
	print("vec2.y : "+vec2.y+"\n");
	print("vec2.z : "+vec2.z+"\n");
	
	vec1 = vec1 + vec2;
	
	print("(vec1+vec2).x : "+vec1.x+"\n");
	print("(vec1+vec2).y : "+vec1.y+"\n");
	print("(vec1+vec2).z : "+vec1.z+"\n");
	
	print("math.PI : "+math.PI+"\n");
	
	CreateThread(TestThread1);
	
	local id = CreateThread(TestThread3);
	while(ExistThread(id))
	{
		Wait();
	}
	
	// フェードアウト
	FadeOut(1.0);
	// フェード待ち
	WaitFade();
	
	print("End\n");
}

function TestThread1()
{
	CreateThread(TestThread2);
	
	print("test1\n");
}

function TestThread2()
{
	print("test2\n");
}

