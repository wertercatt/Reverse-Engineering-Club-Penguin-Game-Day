// �V�[���̏���������

// �V�[���ǂݍ���
LoadScene("scene/town.scene");
// ���f�����\�[�X�o�^
AddResourceModel("hub/hub_town_00.cmpres");
// �o�C�i�����\�[�X�o�^
AddResourceBin("hub/hub_town_bin_00.cmparc");


// �ŏ��ɍ����X���b�h
function main()
{
	// �v���[���[�쐬
	CreatePlayer();
	// �V�[���J�n
	StartScene();
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
	ChangeScene(HUB_VILLAGE);
}
