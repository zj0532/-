;;;==========================================================================================
;;; ��ԴȪ��ơ� �������� yqstart.lsp
;;;------------------------------------------------------------------------------------------
;;; ע��1. ���ǡ�ԴȪ��ơ�����������ͨ����sys\acad.lsp�Զ����ء�����acad.lsp���������
;;;        ���������ͻ���ԴȪ��ơ�δ���Զ����أ��뽫sys\acad.lspɾ�������뽫���ļ�
;;;        yqstart.lsp ����AutoCAD�����飻
;;;     2. �������зֺ�";"������ע�ͣ����׼ӷֺ�����ʱȡ�����У�
;;;     3. �벻Ҫ�޸ı��ļ�����������ϤAutoLISP��
;;;     4. ��ԴȪ��ơ�v5.8.1���Ժ�ֻ��������AutoCAD 2000���ϰ棬����֧��AutoCAD r14���ˡ�
;;;==========================================================================================
(setq old_cmdecho (getvar "CMDECHO"))
(setvar "CMDECHO" 0)
(if (getvar "SECURELOAD") (setvar "SECURELOAD" 0))       ; AutoCAD 2014�� ����lisp������

(if (null c:yq_about)(progn
(if (or (and (getvar "GCADVER") (<= "13.0" (substr (getvar "GCADVER") 2 4)))
        (<= "15.0" (substr (getvar "ACADVER") 1 4))
    )
(progn


;;; ���ء�ԴȪ��ơ��������
(if (and (null c:yq_about)(findfile "yqarch.vlx"))(load "yqarch.vlx"))


;;; ���������ݼ�
;(defun c:yq()(c:yqarch))

;;; �� acad.lsp �ļ����ص�ÿһ��ͼ��
(if (getvar "acadlspasdoc") (setvar "acadlspasdoc" 1))


;;; ����Ļ��״̬����ʾ��ǰ����ע���� DIMSCALE������ע��ʽ DIMSTY����������ʽ STYLE��
(setvar "MODEMACRO" (strcat "DIMSCALE:<1:" "$(substr,$(getvar,DIMSCALE),1,6)"
    "> DIMSTY:<" "$(getvar,DIMSTYLE)" "> STYLE:<" "$(getvar,TEXTSTYLE)" ">"))


;;; ����ԴȪϵͳ������
(if (findfile "yqpanel.lsp") (load "yqpanel.lsp"))


;;; ����ԴȪ���ϵͳĿ¼�¡�library���ļ��еĳ����ļ�
(if (and yq_library (/= yq_library ""))
    (progn
        (princ (yq_ec (strcat "\nLoading .lsp files in folder <" yq_library "\\>...")
                      (strcat "\n���ڼ��ع����ļ��� <" yq_library "\\> �еĳ���...")))
        (yq_run yq_library "*.lsp,*.vlx,*.fas")
        (princ "\n...")
    )
)


;;; ����ԴȪ���ϵͳĿ¼�¡���ǰ�û����ļ��еĳ����ļ�
(if (and yq_user (/= yq_user ""))
    (progn
        (princ (yq_ec (strcat "\n[YQArch] Current User is <" yq_user ">.")
                      (strcat "\n[ԴȪ���]��ǰ�û��� <" yq_user ">.")))
        (princ (yq_ec (strcat "\nLoading .lsp files in folder <" yq_user "\\>...")
                      (strcat "\n���ڼ����û��ļ��� <" yq_user "\\> �еĳ���...")))
        (yq_runsc)             ; �����ݼ��趨
        (yq_yqpanel)           ; ϵͳ����趨
        (yq_runpanel)          ; �û�����趨
        (yq_runlaysc)          ; ת��ͼ���ݼ�
        (yq_run yq_user "*.lsp,*.vlx,*.fas")
        (princ "\n...")
    )
)


;;; ����ԴȪ�˵�Ϊ AutoCAD ԭ�˵������һ��
(if (not (menugroup "yqarch")) (c:yq_menu))


(princ (yq_ec "\nYQArch <yqstart.lsp> loaded! Enter 'yqarch' to launch\n\n"
              "\nԴȪ��������ļ� <yqstart.lsp> �������!\n����ԴȪ�˵������ 'yq_menu', ������������� 'yqarch'\n\n"))


)(princ (yq_ec "\nAvailable only at AutoCAD2000/GstarCAD8 or later!" "\n����AutoCAD2000/�Ƴ�CAD8���ϰ�����ԴȪ���."))
)
)
)

(if (and c:yq_about (not (menugroup "yqarch"))) (c:yq_menu))

(if old_cmdecho (progn (setvar "CMDECHO" old_cmdecho) (setq old_cmdecho nil)))
(princ)
