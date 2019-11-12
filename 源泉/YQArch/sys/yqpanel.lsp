;;;=========================================================================
;;;         Դ Ȫ �� ��    [����������]���LSP��������
;;;-------------------------------------------------------------------------
;;; �ļ��� sys\
;;;=========================================================================
;;; ע���������зֺ�";"������ע�ͣ����׼ӷֺ�����ʱȡ�����С�

;;; �����д: Walter Lam   QQ: 575825448
;;; ���ƴ������ļ��뱣��������Ϣ


;;;======================
;;; һЩ�Զ������������
;;;======================

(defun c:yq_mi (/ ss p1 p2)
    (yq_cbegin)
    (princ "\n****����")
    (if (and (setq ss (ssget ":l"))
             (yq_ssredraw ss 3)
             (setq p1 (getpoint "\nָ�������ߵĵ�һ��:"))
             (setq p2 (getpoint p1 "\nָ�������ߵĵڶ���:"))
        )
        (if (getpoint "\n������ɾ��ԭͼԪ: <�ո���ԭͼԪ> ")
            (yq_mirror ss p1 p2 t)
            (yq_mirror ss p1 p2 nil)
        )
    )
    (yq_cend)
)


(defun c:yq_ccb(/ pt)
    (princ "\n****���������")
    (and (setq pt (getpoint "\n����: "))
         (ssget)
         (command "copybase" "non" pt "p" "" "erase" "p" "")
    )
    (princ)
)


(defun c:yq_rz(/ pt1 pt2)
    (princ "\n****��ת��0��")
    (and (ssget)
         (setq pt1 (getpoint "\n����: "))
         (setq pt2 (getpoint pt1 "\n��ȡ�Ƕ�,�˽ǶȽ���Ϊ0��: "))
         (command "rotate" "p" "" "non" pt1 "r" "non" pt1 "non" pt2 "0")
    )
    (princ)
)


(defun c:yq_rg()
    (princ "\n****�ֲ�����")
    (if (ssget) (command "._erase" "p" "" "._oops"))
    (princ)
)


(defun c:yq_zd()
    (princ "\n****��ͼ��С0.5��")
    (command "._zoom" "0.5x")
    (princ)
)


(defun c:yq_ze()
    (princ "\n****��ͼ���ŵ���Χ")
    (command "._zoom" "e")
    (princ)
)


(defun c:yq_zz()
    (princ "\n****���ŵ���һ����ͼ")
    (command "._zoom" "p")
    (princ)
)


(defun c:yq_edb(/ ss la)
    (princ "\n****ը���鵽�����ڲ�")
    (if (setq ss (ssget '((0 . "INSERT"))))
        (foreach e (yq_ss2lst ss)
            (yq_mark)
            (setq la (cdr (assoc 8 (entget e))))
            (command "._explode" e) (yq_cmdenter)
            (command "._chprop" (yq_newss) "" "la" la "")
        )
    )
    (princ)
)


(defun c:yq_edc(/ ss)
    (princ "\n****ը���鵽��ǰ��")
    (if (setq ss (ssget '((0 . "INSERT"))))
        (foreach e (yq_ss2lst ss)
            (yq_mark)
            (command "._explode" e) (yq_cmdenter)
            (command "._chprop" (yq_newss) "" "la" (getvar "CLAYER") "")
        )
    )
    (princ)
)


(defun c:yq_vxx(/ pt1 pt2 ss)
    (princ "\n****����ק�ƶ�")
    (and (setq ss (ssget))
         (yq_ssredraw ss 3)
         (setq pt1 (getpoint "\n����: "))
         (setq pt2 (getpoint pt1 "\nĿ���: "))
         (command "._move" ss "" "non" pt1 "non" pt2)
    )
    (if ss (yq_ssredraw ss 4))
    (princ)
)


(defun c:yq_cxx(/ pt1 pt2 ss)
    (princ "\n****����ק����")
    (if (and (setq ss (ssget))
             (yq_ssredraw ss 3)
             (setq pt1 (getpoint "\n����: "))
        )
        (while (setq pt2 (getpoint pt1 "\nĿ���: "))
             (command "._copy" ss "" "non" pt1 "non" pt2)
        )
    )
    (if ss (yq_ssredraw ss 4))
    (princ)
)


(defun c:yq_date ( / pt str )
    (princ "\n****��������ʱ���ִ�\n")
    (if (setq pt (getpoint))
        (progn
            (setq str (rtos (getvar "CDATE") 2 6)
                  str (strcat (substr str 1 4) "-" (substr str 5 2) "-" (substr str 7 2)
                              " " (substr str 10 2) ":" (substr str 12 2))
            )
            (yq_text pt (* 3 (getvar "DIMSCALE")) str)
        )
    )
    (princ)
)


(defun c:yq_m2()
    (princ "\n****�����������ƽ����(��д,С�����ƶ�6λ)")
    (yq_Decimalpointshift -6)
    (princ)
)


(defun c:yq_m1()
    (princ "\n****�������������(��д,С�����ƶ�3λ)")
    (yq_Decimalpointshift -3)
    (princ)
)


(defun c:yq_cm(/ ss pt1 pt2 n d a ss0)
    (yq_cbegin)
    (princ "\n****����������")
    (if (and (setq ss (ssget))
             (setq pt1 (getpoint "\n����: "))
             (setq pt2 (getpoint pt1 "\n�ڶ���: "))
        )
        (progn
            (setq ss0 (yq_copy2pt ss pt1 pt2))
            (initget 2)
            (setq yq_cm (if yq_cm yq_cm 1)
                  n (getint (strcat "\n���ƴ���(�����ڵȷ�): <" (itoa yq_cm) "> "))
                  yq_cm (if n n yq_cm)
                  d (distance pt1 pt2)
                  a (angle pt1 pt2)
            )
            (if (minusp yq_cm) 
                (setq d (/ d (abs yq_cm)))
                (setq pt1 pt2 ss ss0)
            )
            (setq pt2 (polar pt1 a d))
            (repeat (1- (abs yq_cm))
                (yq_copy2pt ss  pt1 pt2)
                (setq pt2 (polar pt2 a d))
            )
        )
    )
    (yq_cend)
)


;;;==============
;;; SOLID��HATCH
;;;==============
;;; 2012.7.17 д
(defun c:yq_s2h(/ ss e)
    (princ "\n****SOLID��HATCH")
    (if (setq ss (ssget '((0 . "SOLID,TRACE"))))
        (foreach x (yq_ss2lst ss)
            (setq e (yq_pline (yq_getvertexes x nil) 1))
            (command "_bhatch" "p" "s" "s" e "" "")
            (command "_matchprop" x (entlast) "")
            (entdel x)(entdel e)
        )
    )
    (princ)
)


;;;========
;;; ����Բ
;;;========
;;; 2012.12.20 д
(defun c:yq_a2c(/ ss en)
    (princ "\n****����Բ")
    (if (setq ss (ssget '((0 . "ARC"))))
        (foreach x (yq_ss2lst ss)
            (setq en (cddr (entget x))
                  en (vl-remove-if '(lambda (x) (member (car x) '(50 51))) en)
            )
            (entmake (cons '(0 . "CIRCLE") en))
            (entdel x)
        )
    )
    (princ)
)



;;;============
;;; Բ������
;;;============
;;; 2012.6.30 д
(defun c:yq_c2x(/ ss)
    (princ "\n****Բ������")
    (if (setq ss (ssget '((0 . "CIRCLE"))))
        (foreach x (yq_ss2lst ss)
            (yq_cirle2donut x)
        )
    )
    (princ)
)



(defun c:yq_expattblk(/ ss)
    (yq_cbegin)
    (princ "\n****ը�����Կ�,���ֲ���")
    (if (setq ss (ssget (list (cons 0 "INSERT"))))
    (foreach e (yq_ss2lst ss)
        (yq_explodeattblk e)
    )
    )
    (yq_cend)
)



(defun c:yq_oos()
    (if yqoos
        (progn (princ "\n****��ԭ��׽״̬") 
               (setvar "OSMODE" yqoos) 
               (setq yqoos nil)
        )
        (progn (princ "\n****���沶׽״̬")
               (setq yqoos (getvar "OSMODE"))
        )
    )
    (princ)
)



(defun c:yq_fxx(/ ss)
    (yq_cbegin)
    (princ "\n****����Բ�Ƕ����")
    (setq yq_fxx (if yq_fxx yq_fxx 0))
    (setq yq_fxx (yq_getdist "\nԲ�ǰ뾶: " yq_fxx))
    (and (setq ss (ssget '((0 . "LWPOLYLINE"))))
         (foreach e (yq_ss2lst ss)
             (yq_filletpline e yq_fxx)
         )
    )
    (yq_cend)
)



(defun c:yq_cfxx(/ ss)
    (yq_cbegin)
    (princ "\n****�������Ƕ����")
    (setq yq_cfxx (if yq_cfxx yq_cfxx 0))
    (setq yq_cfxx (yq_getdist "\n���Ǿ���: " yq_cfxx))
    (and (setq ss (ssget '((0 . "LWPOLYLINE"))))
         (foreach e (yq_ss2lst ss)
             (yq_chamferpline e yq_cfxx)
         )
    )
    (yq_cend)
)



(defun c:yq_delendspaces(/ ss)
    (yq_cbegin)
    (princ "\n****ȥ������ǰ��ո�")
    (and (setq ss (ssget (list (cons 0 "*TEXT"))))
         (foreach x (yq_ss2lst ss)
             (yq_updent x (list (cons 1 (yq_allTrim (yq_dxf x 1))))) 
         )
    )
    (yq_cend)
)



;;;==================
;;; �����и���ȡͼ��
;;;==================
(defun c:yq_qgtx(/ e1 e2 e3 e4)
    (yq_cbegin)
    (princ "\n****�����и���ȡͼ��")
    (if (and (setq e1 (car (yq_entsel "\nѡȡҪ���е�ͼ��: " (list (cons 0 "IMAGE")))))
             (setq e2 (car (yq_entsel "\nѡȡ����߽߱�: " (list (cons 0 "*POLYLINE,CIRCLE,ELLIPSE")))))
             (setq e3 (yq_clone e1))
        )
    (prgon
        (setq e4 (yq_pline (yq_curve2ptlst_d e2) 1))
        (command "_imageclip" e3 "n" "s" e4)
        (entdel e4)
        (command "_move" (entlast) "" (car (yq_getvertexes e2 0)))
    )
    )
    (yq_cend)
)



;;----- �µ����ɷ������� -----







(princ)                           ; Ϊ���һ��
