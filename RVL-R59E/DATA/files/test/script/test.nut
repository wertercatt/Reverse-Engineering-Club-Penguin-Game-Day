IncludeScript("test/script/test2.nut");

// �V�[���̏���������

// �V�[���ǂݍ���
LoadScene("scene/village.scene");
// ���f�����\�[�X�o�^
AddResourceModel("hub/hub_village_00.cmpres");
// �o�C�i�����\�[�X�o�^
AddResourceBin("hub/hub_village_bin_00.cmparc");

// �ŏ��ɍ����X���b�h
function main()
{
	// �t�F�[�h�C��
	FadeIn(1.0);
	
	// �V�[���J�n
	StartScene();
	
	// �t�F�[�h�҂�
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
	
	// �t�F�[�h�A�E�g
	FadeOut(1.0);
	// �t�F�[�h�҂�
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

