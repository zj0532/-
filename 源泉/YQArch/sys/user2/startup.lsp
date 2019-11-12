;;;=========================================================================
;;;         Դ Ȫ �� ��    ͼ����ʼ���ļ������ڴ���һ���ʺ��Լ������л���
;;;-------------------------------------------------------------------------
;;; �ļ��� sys\�û��ļ���\
;;;
;;;     ���û��ļ��С�Ϊ�Խ��ļ��С����Ա���ռ����ġ�.lsp/.vlx/.arx������
;;; �ļ�������ļ����£����趨�ˡ��û��ļ��С�Ϊ��ǰ�û�(������yq_setuser)��
;;; ��ԴȪ��������������ʱ����Զ�������Щ����
;;;=========================================================================
;;; ע��1. ���ļ����û�ͼ����ʼ���ļ������ڴ���һ���ʺ��Լ������л�����
;;;     2. �������зֺ�";"������ע�ͣ����׼ӷֺ�����ʱȡ�����С�

;;; �����д: Walter Lam   QQ: 575825448
;;; ���ƴ������ļ��뱣��������Ϣ



;;;----------------------------------------
;;; ����docbarͼ���ĵ��л���ǩ(����еĻ�)
;;;----------------------------------------
(setq tmp_ver (substr (getvar "ACADVER") 1 4)
      tmp_str (cond ((= tmp_ver "15.0") "docbar_2002.arx")
                    ((= tmp_ver "16.0") "docbar_2004.arx")
                    ((= tmp_ver "16.1") "docbar_2005.arx")
                    ((= tmp_ver "16.2") "docbar_2006.arx")
                    ((= tmp_ver "17.0") "docbar_2007.arx")
                    ((= tmp_ver "17.1") "docbar_2008.arx")
                    ((= tmp_ver "17.2") "docbar_2009.arx")
                    ((= tmp_ver "18.0") "docbar_2010.arx")
                    ((= tmp_ver "18.1") "docbar_2011.arx")
                    ((= tmp_ver "18.2") "docbar_2012.arx")
                    (T nil)
              )
)
(if (and tmp_str (not (member tmp_str (arx)))(findfile tmp_str))(vl-catch-all-apply 'arxload (list tmp_str)))


;;;-----------------------------------------
;;; ����iDwgTabͼ���ĵ��л���ǩ(����еĻ�)
;;;-----------------------------------------
(cond 
    ((= (getenv "PROCESSOR_ARCHITECTURE") "x86")
        (setq tmp_str (cond ((= (substr tmp_ver 1 2) "15") "iDwgTab2000.arx")
                            ((= (substr tmp_ver 1 2) "16") "iDwgTab2004.arx")
                            ((= (substr tmp_ver 1 2) "17") "iDwgTab2007.arx")
                            ((= (substr tmp_ver 1 2) "18") "iDwgTab2010.arx")
                            ((= (substr tmp_ver 1 4) "19.0") "iDwgTab2013.arx")
                            (T nil)
                      )
        )
    )
    (t  (setq tmp_str (cond ((= tmp_ver "17.0") "iDwgTab2007x.arx")
                            ((= (substr tmp_ver 1 2) "17") "iDwgTab2008x.arx")
                            ((= (substr tmp_ver 1 2) "18") "iDwgTab2010x.arx")
                            ((= (substr tmp_ver 1 4) "19.0") "iDwgTab2013x.arx")
                            (T nil)
                      )
        )
    )
)
(if (and tmp_str (not (member tmp_str (arx)))(findfile tmp_str))(vl-catch-all-apply 'arxload (list tmp_str)))


;;;-------------------------------------------
;;; ����cl-DwgManͼ���ĵ��л���ǩ(����еĻ�)
;;;-------------------------------------------
(cond 
    ((= (getenv "PROCESSOR_ARCHITECTURE") "x86")
        (setq tmp_str (cond ((= (substr tmp_ver 1 2) "16") "cl-DwgMan_2006-x86.arx")
                            ((= tmp_ver "17.0") "cl-DwgMan_2007-x86.arx")
                            ((= tmp_ver "17.1") "cl-DwgMan_2008-x86.arx")
                            ((= tmp_ver "17.2") "cl-DwgMan_2009-x86.arx")
                            ((= tmp_ver "18.0") "cl-DwgMan_2010-x86.arx")
                            ((= tmp_ver "18.1") "cl-DwgMan_2011-x86.arx")
                            ((= tmp_ver "18.2") "cl-DwgMan_2012-x86.arx")
                            ((= tmp_ver "19.0") "cl-DwgMan_2013-x86.arx")
                            (T nil)
                      )
        )
    )
    (t  (setq tmp_str (cond ((= tmp_ver "17.1") "cl-DwgMan_2008-x64.arx")
                            ((= tmp_ver "17.2") "cl-DwgMan_2009-x64.arx")
                            ((= tmp_ver "18.0") "cl-DwgMan_2010-x64.arx")
                            ((= tmp_ver "18.1") "cl-DwgMan_2011-x64.arx")
                            ((= tmp_ver "18.2") "cl-DwgMan_2012-x64.arx")
                            ((= tmp_ver "19.0") "cl-DwgMan_2013-x64.arx")
                            (T nil)
                      )
        )
    )
)
(if (and tmp_str (not (member tmp_str (arx)))(findfile tmp_str))(vl-catch-all-apply 'arxload (list tmp_str)))


;;;------------------------------
;;; �����ҵ�ȥ������(����еĻ�)
;;;------------------------------
(setq tmp_str (substr (getvar "ACADVER") 1 2)
      tmp_str (strcat "BladeR" tmp_str (if (= (getenv "PROCESSOR_ARCHITECTURE") "x86") "" "_X64") ".arx")
)
(if (and (not (member tmp_str (arx)))(findfile tmp_str))(vl-catch-all-apply 'arxload (list tmp_str)))


;;;------------------------------
;;; ����UnEduȥ������(����еĻ�)
;;;------------------------------
(setq tmp_str (substr (getvar "ACADVER") 1 2)
      tmp_str (strcat "UnEdu_R" tmp_str (if (= (getenv "PROCESSOR_ARCHITECTURE") "x86") "" "_X64") ".arx")
)
(if (and (not (member tmp_str (arx)))(findfile tmp_str))(vl-catch-all-apply 'arxload (list tmp_str)))
(setq tmp_str nil tmp_ver nil)



;;;----------------------------------------------------
;;;  ����һ���ʺ��Լ������л��� (ǰ�÷ֺŵ���ȡ������)
;;;----------------------------------------------------
;(setvar "MIRRTEXT" 0)             ; ��������:��
;(setvar "SORTENTS" 127)          ; ͼԪ����˳��
;(setvar "CHAMFERA" 0)             ; ���ǵĳ���1
;(setvar "CHAMFERB" 0)             ; ���ǵĳ���2
;(setvar "AUNITS"   0)             ; �Ƕȵ�λ:ʮ���ƶ���
;(setvar "AUPREC"   4)            ; �ǶȾ���
;(setvar "LUNITS"   2)             ; ���Ե�λ
;(setvar "LUPREC"   4)            ; ���Ծ���
;(setvar "FILEDIA"  1)             ; ��ʾ�ļ���λ�Ի���:��
;(setvar "CMDDIA"   1)             ; ��ʾ�ⲿ���plot�Ի���:��
;(setvar "BLIPMODE" 0)            ; ���Ƶ���(Сʮ��)�Ƿ�ɼ�:��
;(setvar "GRIDMODE" 0)             ; ��ʾ��դ��:��
;(setvar "SNAPMODE" 0)             ; ��׽���:��
;(setvar "LISPINIT" 1)             ; AutoLISP �����ͱ���ֻ�ڵ�ǰ��ͼ��������Ч
;(setvar "UCSICON"  1)            ; ʹUCS��겻�ƶ�
;(setvar "CURSORSIZE" 100)        ; ʮ�ֹ�����
;(setvar "PSLTSCALE" 0)           ; 1:�ӿڱ����������ͱ���
;(setvar "DIMZIN"   8)            ; �����Ƿ������λֵ�����㴦��, 8:����������
(if (> (getvar "SAVETIME") 60)    ; ��ָ����ʱ�����Զ�����ͼ�Σ�
    (setvar "SAVETIME" 10)        ; ������1Сʱ���Ϊ10���ӣ�ȱʡ������ϵͳ����ʱ�ļ���
)

;(if (getvar "DIMASSOC") (setvar "DIMASSOC" 1))          ; 1:ʹ�÷ǹ�����ע,2:ʹ�ù�����ע����
;(if (getvar "QAFLAGS") (setvar "QAFLAGS" 0))
;(if (getvar "PICKSTYLE") (setvar "PICKSTYLE" 1))        ; 1:ʹ�ñ���ѡ��,3:ʹ�ñ���ѡ��͹������ѡ��
;(if (getvar "DBLCLKEDIT") (setvar "DBLCLKEDIT" 1))      ; ���ƻ�ͼ�����е�˫���༭����
;(if (getvar "OSOPTIONS") (setvar "OSOPTIONS" 2))        ; 1:����׽����ͼ��������
;(if (getvar "AUTOSNAP") (setvar "AUTOSNAP" 63))         ; �����Զ���׽��ǡ���������ʾ�ʹ�������ʾ��
;(if (getvar "MEASUREMENT") (setvar "MEASUREMENT" 1))    ; ���Ƶ�ǰͼ����ʹ��Ӣ�ƻ��ǹ������ͼ���������ļ� 0:Ӣ�� 1:����
;(if (getvar "STARTMODE") (setvar "STARTMODE" 0))        ; ���ơ���ʼ��ѡ�����ʾ ��ʼֵ1


;;----- ��ѡһЩȱʡ�趨 -----
;(setq YQ_NOWALLSEAL nil)                   ; ww ��ǽ�����޷����
;(setq YQ_PIERIGNOREINTERS nil)             ; ���Ŵ�����ʱǽ��������������н���
;(setq YQ_VAR_DOOR '(900 200 nil nil))      ; ����ȱʡ�ſ�ǽ�塢�Ƿ��ǽ�С�����������Ϊ׼
;(setq YQ_VAR_WIN '(1500 200 T))            ; ����ȱʡ����ǽ�塢�Ƿ��ǽ��
;(setq YQ_VAR_AZHFACTOR 0.2)                ; �Զ��������:����x�����߳��ȵ����߲������
;(setq YQ_VAR_LTFACTOR 0.2)                 ; ��ȫ�����α���"LTSCALE"=1ʱ���Զ������������ͱ���ϵ��=������*ͼֽ����
;(setq YQ_VAR_HIDDEN '("HIDDEN" 15 0.5))    ; �����趨: ��������,ģ�Ϳռ��е����ͱ���,ͼֽ�ռ��е����ͱ���

;;(setq YQ_VAR_INDEXERFILLET 4)             ; ���ο���������Բ�ǰ뾶 (�ѷ�ֹ)

;(setq YQ_NOLAYERSTACK nil)                 ; �ر�/����/�����ͼ�������ʹ�û�ԭ�ö�ջ
;(setq YQ_NOAUTOFITEXCEL nil)               ; ʵʱ���Excel���ʱ�����Զ����ڵ�Ԫ����
;(setq YQ_ISUPDATEDIMLAYER nil)             ; sd ���ű�עʱ���Ƿ�ͬʱ�޸�Ϊ��ǰ��עͼ��
;(setq YQ_VAR_WINDOW '(45 30 25 50))        ; ����������: ������Ⱥ�,�ص����ְ��,�벣����,�뿴��ǽ��
;(setq YQ_DIM_NOTAUTOADJUST nil)            ; ��ע����ʱ�����Զ���������
;(setq YQ_DIM_NOTAUTOLINK t)                ; ��ע����ʱ������ʽѡȡ

;(setq YQ_HASCMDSTAT t)                     ; �ɿ���cmdstats.txt�ļ�ͳ��ԴȪ�������ʹ��Ƶ��

;;----- �µ����ɷ������� -----








(princ) ;Ϊ���һ��
