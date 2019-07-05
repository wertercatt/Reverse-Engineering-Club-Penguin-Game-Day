// ���ʏ���
//IncludeScript("test/script/common.nut");

// �V�[���ǂݍ���
Grp.LoadScene("scene/village.scene");
// ���f�����\�[�X�o�^
Grp.AddResourceModel("hub/hub_village_00.cmpres");
// �o�C�i�����\�[�X�o�^
Grp.AddResourceBin("hub/hub_village_bin_00.cmparc");

// �ŏ��ɍ����X���b�h
function main()
{
	// �V�[���J�n
	Grp.StartScene();
	
	// �Z�b�g�f�[�^�ǂݍ���
	Hub.LoadSetData("test/script/village.set");
	// �A�N�e�B�r�e�B�쐬
	Hub.CreateActivity(2,"village_ukiwa_act.rmdl",Hub.ACTIVITY_POINT_PRESS,false);
	// �v���[���[�쐬
	Hub.CreatePlayer();
	
	// �t�F�[�h�C��
	Grp.FadeIn(1.0);
	// �t�F�[�h�҂�
	Grp.WaitFade();
	
	while(!Input.Press(0,Input.B))
	{
		Wait();
	}
	
	// �t�F�[�h�A�E�g
	Grp.FadeOut(1.0);
	// �t�F�[�h�҂�
	Grp.WaitFade();
	// �V�[���I��
	Hub.ChangeScene(Hub.TOWN);
}

