

;;;; Projeto Knights Game
;;;; Disciplina de IA - 2019 / 2020
;;;; Professor: Joaquim Filipe e Eng. Filipe Mariano 
;;;; Autor: Jo�o Gomes Andr� Gast�o




(defun diretoria-atual ()
  " Define o caminho para os ficheiros do projeto a partir da raiz "
  (let ((path "C:\\Users\\joao2\\OneDrive\\Ambiente de Trabalho\\EST\\IA\\Projetos\\Projecto_2019_2020_IA_P1\\Projecto\\"))
    path
   )
  )

(defun ficheiro-solucao ()
   " Define o caminho at� ao ficheiro solu��o "
  (let ((ficheiro-path  "C:\\Users\\joao2\\OneDrive\\Ambiente de Trabalho\\EST\\IA\\Projetos\\Projecto_2019_2020_IA_P1\\Projecto\\solucao.dat"))
    ficheiro-path)
  )





 #|Menus|#



(defun start ()
  "Permite iniciar o programa carregando e compilando"

  (load (compile-file(concatenate 'string (diretoria-atual) "problemas.dat" )))
  (load (compile-file(concatenate 'string (diretoria-atual) "Puzzle.lisp"   )))
  (load (compile-file(concatenate 'string (diretoria-atual) "Procura.lisp"  )))
  (menu-Load)
  )




(defun menu-Load ()
  "Menu Boas Vindas"

  (progn
    (format t "~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%"                                 )
    (loadingBar)
    (format t "~%           ______________________________________________________~%"    )
    (format t "~%                              W E L C O M E                ~%"          ) 
    (format t "~%                                    TO                           ~%~%"  )      
    (loading)
    (format t "~%                                                                 ~%"    ) 
    (format t "~%           ______________________________________________________~%"    ) 
    (loadingBar)
    (menu-principal)
    )
  )




(defun menu-principal ()
  "Menu principal com as opc�es do programa"
  (loop
    (progn
      (format t "~%~%~%~%~%~%~%~%~%")
      (format t "~%           ______________________________________________________")
      (format t "~%          �                  JOGO DO CAVALO                      �")
      (format t "~%          �                   (Knight Game)                      �")
      (format t "~%          �                                                      �")
      (format t "~%          �                                                      �")
      (format t "~%          �                                                      �")
      (format t "~%          �                 1-Solve a Game                       �")
      (format t "~%          �                 2-Game Rules                         �")
      (format t "~%          �                 3-Show Boards                        �")
      (format t "~%          �                 4-Quit                               �")
      (format t "~%          �                                                      �")
      (format t "~%          �______________________________________________________�")

      (format t "~%~%~%          Option -> ")
      )
    (cond ((not (let ((escolha (read)))
               (cond 
                ((and (numberp escolha) (< escolha 5) (> escolha 0)) (case escolha
                                                    (1 (progn (menu-tabuleiros) t))
                                                    (2 (progn (menu-regras)  t))
                                                    (3 (progn (imprime-tabuleiros) t))
                                                    (4 (progn (format t "~%~%~%          PROGRAMA TERMINADO") nil))))
                ( T (progn  (format t "~%          Invalid Choice~%~%          Option -> ")
                            (setf escolha (read))))))) 
(return)))))









(defun menu-tabuleiros ()
"1- Menu para escolher o problema a resolver"
(loop
    (progn
      (format t "~%           ______________________________________________________")
      (format t "~%          �                CHOOSE THE BOARD                      �")
      (format t "~%          �                                                      �")
      (format t "~%          �                 1-Problem A                          �")
      (format t "~%          �                 2-Problem B                          �")
      (format t "~%          �                 3-Problem C                          �")
      (format t "~%          �                 4-Problem D                          �")
      (format t "~%          �                 5-Problem E                          �")
      (format t "~%          �                 6-Problem F                          �")
      (format t "~%          �                 7-Home Menu                          �")
      (format t "~%          �                                                      �")
      (format t "~%          �______________________________________________________�")
      (format t "~%~%~%          Option -> ")
      )
    (cond ((not (let ((escolha (read)))
               (cond 
                ((and (numberp escolha) (< escolha 9) (> escolha 0)) (case escolha
                                                    (1 (progn (definir-objetivo 'A) (menu-escolha (problema-A) ) t))
                                                    (2 (progn (definir-objetivo 'B) (menu-escolha (problema-B) ) t))
                                                    (3 (progn (definir-objetivo 'C) (menu-escolha (problema-C) ) t))
                                                    (4 (progn (definir-objetivo 'D) (menu-escolha (problema-D) ) t))
                                                    (5 (progn (definir-objetivo 'E) (menu-escolha (problema-E) ) t))
                                                    (6 (progn (definir-objetivo 'F) (menu-escolha (problema-F) ) t))                                                   
                                                    (7 (progn  nil))))
                ( T (progn  (format t "~%          Invalid Choice~%~%          Option -> ")
                            (setf escolha (read)))))))
 (return)))))






(defun menu-escolha (problema)
  "1.1 Sub menu escolhe algoritmo ap�s ter escolhido o tabuleiro"
  (loop
   (progn
     (format t "~%           ______________________________________________________")
     (format t "~%          �                                                      �")
     (format t "~%          �                      GAME MODES                      �")
     (format t "~%          �                                                      �")
     (format t "~%          �                                                      �")
     (format t "~%          �                 1-GO TO ALGORITHM                    �")
     (format t "~%          �                 2-CONFIGURE BOARD                    �")
     (format t "~%          �                                                      �")
     (format t "~%          �                 0-Home Menu                          �")
     (format t "~%          �                                                      �")
     (format t "~%          �______________________________________________________�") 
     (format t "~%~%~%          Option -> ")
     )
   (cond ((not (let ((escolha (read))) 
                 (cond 
                  ((and (numberp escolha) (< escolha 3) (> escolha -1)) (case escolha
                                                                          (1 (menu-algoritmos problema))
                                                                          (2 (menu-Configurar-tabuleiro problema ))
                                                                          (0 (progn  NIL))))
                  ( T (progn  (format t "~%          Invalid Choice~%~%          Option -> ")
                        (setf escolha (read)))))))
          (return)))))










(defun menu-Configurar-tabuleiro (problema)
  "1.2- Menu para Configurar 0 Tabuleiro"
  (cond
   ((equal (posicao-cavalo problema) nil )  
    (loop
     (pprint  problema)
     (progn
       (format t "~%           ______________________________________________________")      
       (format t "~%          �                                                      �")
       (format t "~%          �                   CHOOSE HORSE POSITION              �")
       (format t "~%          �                IN THE FIRST ROW OF THE BOARD         �")            
       (format t "~%          �                                                      �")
       (format t "~%          �                                                      �")
       (format t "~%          �          choose only the position with values        �")
       (format t "~%          �            from the first row of the board           �")
       (format t "~%          �                                                      �")
       (format t "~%          �                                                      �")
       (format t "~%          �                ( OR Press  -1  TO EXIT   )           �")
       (format t "~%          � _____________________________________________________�")
       (format t "~%~%~%          Index -> ")
       )
     (cond ((not (let ((escolha (read)))
                   (cond 
                    ((and (numberp escolha) (< escolha 10) (> escolha -2)) (cond 
                                                                            ((eq ( operador-inicial-cavalo problema  escolha) Nil )  (progn nil))
                                                                            ((= escolha -1) (progn nil))
                                                                            (t              (progn (menu-algoritmos (operador-inicial-cavalo problema  escolha)) nil ))))
                    ( T (progn  (format t "~%          Invalid Choice~%~%          Index -> ")
                          (setf escolha (read)))))))
            (return)))))
   (T (menu-algoritmos  problema))))

















(defun menu-algoritmos (problema)
  "1.3 Sub menu escolhe algoritmo "
  (loop
   (progn
     (format t "~%           ______________________________________________________")
     (format t "~%          �                                                      �")
     (format t "~%          �                  CHOOSE ALGORITHM                    �")
     (format t "~%          �                (search algorithm)                    �")
     (format t "~%          �                                                      �")
     (format t "~%          �                 1-Algorithm BFS                      �")
     (format t "~%          �                 2-Algorithm DFS                      �")
     (format t "~%          �                 3-Algorithm A*                       �")
     (format t "~%          �                 4-Algorithm SMA*                     �")
     (format t "~%          �                 0-Home Menu                          �")
     (format t "~%          �                                                      �")
     (format t "~%          �______________________________________________________�") 
     (format t "~%~%~%          Option -> ")
     )
   (cond ((not (let ((escolha (read))) 
                 (cond 
                  ((and (numberp escolha) (< escolha 5) (> escolha -1)) (case escolha
                                                                         (1 (definir-heuristica 'base) (run-search  'bfs (cria-no problema   (posicao-cavalo problema) 0  0 NIL)    ))
                                                                         (2 (menu-profundidade problema))
                                                                         (3 (menu-heuristic problema  'A*))
                                                                         (4 (menu-memory problema 'SMA* ))
                                                                         (0 (progn  NIL))))
                  ( T (progn  (format t "~%          Invalid Choice~%~%          Option -> ")
                        (setf escolha (read))))))) 
          (return)))))





(defun menu-profundidade (problema )
  "1.3.1-Sub-menu imprime problemas"
  (loop
   (progn
     (format t "~%           ______________________________________________________")
     (format t "~%          �                         G                            �")
     (format t "~%          �                      (DEPTH)                         �")
     (format t "~%          �                (Preview one Board)                   �")
     (format t "~%          �                                                      �")
     (format t "~%          �                     ATTENTION                        �")
     (format t "~%          �                                                      �")
     (format t "~%          �       Only numbers greater than � are allowed        �")     
     (format t "~%          �                   0-Home Menu                        �")
     (format t "~%          �                                                      �")
     (format t "~%          �______________________________________________________�")
     (format t "~%~%~%          Depth-> ")
     )
   (cond ((not (let ((depth (read)))
                 (cond 
                  ((and (numberp depth) (> depth -1) ) (case depth
                                                         (0 (progn nil))
                                                         (t (definir-heuristica 'base) (run-search  'dfs (cria-no problema  (posicao-cavalo problema) 0  0 NIL) :profundidade depth ))))
                  ( T (progn  (format t "~%          Invalid Choice~%~%          Depth ->  ")
                        (setf depth (read))))))) 
          (return)))))









(defun menu-path (node)
  (progn 
    (format t "~% Want to see the Path? (y/n) ")
    (format t "~%        Y- YES               ")
    (format t "~%        N- NO                ~%")
    (cond 
     ((eq (read) 'y ) (pprint (first node))(menu-tabuleiros))
     (t (menu-tabuleiros)))))
  






(defun menu-memory (problema algoritmo)
"1.3.2-Sub-menu para Escolher a Heuristica"
(loop
    (progn
      (format t "~%           ______________________________________________________")
      (format t "~%          �                     MEMORY LIMIT                     �")
      (format t "~%          �                        (SMA*)                        �")
      (format t "~%          �                                                      �")
      (format t "~%          �             Choose a value of memory                 �")
      (format t "~%          �                 (Max of Nodes)                       �")    
      (format t "~%          �                 0-Home Menu                          �")
      (format t "~%          �                                                      �")
      (format t "~%          �______________________________________________________�")
      (format t "~%~%~%          Memory -> ")
      )
    (cond ((not (let ((memory (read)))
               (cond 
                ((and (numberp memory)  (> memory -1) ) (case memory
                      (0 (progn nil))
                      (t (set-max-nos memory) (menu-heuristic  problema algoritmo))))
                ( T (progn  (format t "~%          Invalid Choice~%~          Memory -> ")
                            (setf memory (read)))))))
           (return)))))





(defun menu-heuristic (problema algoritmo)
"1.3.2-Sub-menu para Escolher a Heuristica"
(loop
    (progn
      (format t "~%           ______________________________________________________")
      (format t "~%          �                          H                           �")
      (format t "~%          �                     (HEURISTIC)                      �")
      (format t "~%          �                                                      �")
      (format t "~%          �                 1-Base (h(x)=o(x)/m(x))              �")
      (format t "~%          �                 2-Developed                          �")    
      (format t "~%          �                 0-Home Menu                          �")
      (format t "~%          �                                                      �")
      (format t "~%          �______________________________________________________�")
      (format t "~%~%~%          Heuristic -> ")
      )
    (cond ((not (let ((heuristic (read)))
               (cond 
                ((and (numberp heuristic) (< heuristic 3) (> heuristic -1) ) (case heuristic
                      (0 (progn nil))
                      (1 (definir-heuristica 'base)         (run-search algoritmo (cria-no problema (posicao-cavalo problema) 0  0 (float (/ (objetivo) (m problema)))) :heuristica 'h  ))
                      (2 (definir-heuristica 'implementada) (run-search algoritmo (cria-no problema (posicao-cavalo problema) 0  0 (float (/ (objetivo) (m1 problema)))) :heuristica 'h1  ))))
                ( T (progn  (format t "~%          Invalid Choice~%~          Heuristic -> ")
                            (setf heuristic (read)))))))
           (return)))))













(defun menu-regras ()
  "2-Menu regras com as regras do jogo"
  (format t "
________________________________________   GAME RULES   ________________________________________
                                          (Knight Game)  
                                          
     1- Esta vers�o do jogo consiste num tabuleiro com 10 linhas e 10 colunas (10X10)   
     2- Em que cada casa possui uma pontua��o com valor entre 00 e 99 (Aleat�rio),
        sem repeti��o nas celulas do tabuleiro.                               
     3- O objectivo do jogo � acumular mais pontos que o advers�rio, usando um cavalo de xadrez.
        Cada jogador tem um cavalo da sua cor (branco ou preto).                        
     4- Todas as jogadas seguintes s�o efectuadas atrav�s de um movimento de cavalo
        (usando as regras tradicionais do Xadrez para o cavalo).
        Um cavalo n�o pode saltar para uma casa vazia (sem n�mero)
        e tamb�m n�o pode faz�-lo para uma casa que esteja amea�ada pelo cavalo advers�rio.                                 
     5- O jogo termina quando n�o for poss�vel movimentar qualquer um dos cavalos no tabuleiro,
        sendo o vencedor o jogador que ganhou mais pontos.           
                                                                                          
_________________________________________________________________________________________________
  ")
  )




(defun imprime-tabuleiros ()
  "3-menu imprime problemas (Tabuleiros)"
  (loop
   (progn
     (format t "~%           ______________________________________________________")
     (format t "~%          �                   LIST OF BOARDS                     �")
     (format t "~%          �                (Preview one Board)                   �")
     (format t "~%          �                                                      �")
     (format t "~%          �                   1-Problem A                        �")
     (format t "~%          �                   2-Problem B                        �")
     (format t "~%          �                   3-Problem C                        �")
     (format t "~%          �                   4-Problem D                        �")
     (format t "~%          �                   5-Problem E                        �")
     (format t "~%          �                   6-Problem F                        �")
     (format t "~%          �                   8-Home Menu                        �")
     (format t "~%          �                                                      �")
     (format t "~%          �______________________________________________________�")
     (format t "~%~%~%          Option -> ")
     )
   (cond ((not (let ((escolha (read)))
                 (cond 
                  ((and (numberp escolha) (< escolha 9) (> escolha 0) ) (case escolha
                                                                          (1 (print (pprint (problema-A))))
                                                                          (2 (print (pprint (problema-B))))
                                                                          (3 (print (pprint (problema-C))))
                                                                          (4 (print (pprint (problema-D))))
                                                                          (5 (print (pprint (problema-E))))
                                                                          (6 (print (pprint (problema-F))))
                                                                          (8 (progn nil))))
                  ( T (progn  (format t "~%          Invalid Choice          ~%~%Option -> ")(setf escolha (read))))))) 
          (return)))))






 #|Executar Algoritmos|#

(defun run-search(algoritmo no &key (profundidade 0) (heuristica 'h))
  "Dependendo do valor passado em Algoritmo, ir� realizer um jogo at� encontrar solu��o"
  
  (cond ((equal algoritmo 'dfs ) (escrever-estatisticas (time (funcall algoritmo no  profundidade )) algoritmo))
        ((equal algoritmo 'A*  ) (escrever-estatisticas (time (funcall algoritmo no  heuristica   )) algoritmo))
        ((equal algoritmo 'bfs ) (escrever-estatisticas (time (funcall algoritmo no  'no-solucaop    'sucessores (operadores)    )) algoritmo ))        
        ((equal algoritmo 'SMA* ) (escrever-estatisticas (time (funcall algoritmo no heuristica   )) algoritmo))
        (T Nil))
  )





 #|Escrever Est�tisticas|#

(defun escrever-estatisticas ( node algoritmo  )
"Escreve o Resultado no ficheiro Solu��o "
  (with-open-file (str (ficheiro-solucao) 
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)

    (cond 
     ((eq node nil) (progn (format str "~%~%~%~%                          � SOLUTION NOT FOUND � ~% ~%")))
     (t (progn 
          (format str "~% ______________STATS______________ ~%")
          (format str "~% _______ ~A _______ ~%" (date-time))
          (format str "~%~% Final State: ~%")
          (pprint  (no-estado-tabuleiro (first node)) str)
          (format str "~% ___________________________________~%")
          (format str "~%          Algorithm: ~a " algoritmo)
          (format str "~%          G (Depth): ~a " (no-profundidade (first node)))
          (format str "~%          H (Heuristic): ~a" (no-H (first node)))
          (format str "~%          Solution Length: ~a" (solution-length node)) 
          (format str "~%          Generated Nodes: ~a" (second node))
          (format str "~%          Expanded Nodes: ~a" (third node))
          (format str "~%          Penetration: ~f" (float (/ (no-profundidade (first node)) (second node))))
          (format str "~%          Points: ~d" (number-of-points node) )
          (format str "~%          Objective: ~d" (objetivo) )
          (format str "~%          Average branching factor: ~f" (branching-factor node) )
          (cond 
           ((>= (number-of-points node) (objetivo))   (format str "%~%          OBJECTIVE REACHED  ~%~%"  ))
           (T  (format str "%~%          OBJECTIVE NOT REACHED  ~%~%"  )))
          (format str "~%~%~%~%~%~%")
          ))))
  (escreve-no node)
  (menu-path node)
  )





(defun escreve-no ( no) 
  "Permite escrever no ecra um no do problema."
  (cond 
   ((eq no nil)(progn (format t "~%~%~%~%                          � SOLUTION NOT FOUND � ~% ~%")))
   (t (progn
     
        (format t "~%~%                    FINAL STATE           ~% ~%           ")    
        (pprint  (no-estado-tabuleiro (first no)))
        (format t "~%~%           G (Depth): ~a ~% ~%" (no-profundidade (first no)))
        (format t "          H (Heuristic): ~a ~% ~%" (no-H (first no)))
        (format t "          Solution Length: ~a ~% ~%" (solution-length no)) 
        (format t "          Generated Nodes: ~a ~%~%" (second no))
        (format t "          Expanded Nodes: ~a ~%~%" (third no))
        (format t "          Penetration: ~f ~%~%" (float (/ (no-profundidade (first no)) (second no))))
        (format t "          Points: ~d ~%~%" (number-of-points no) )
        (format t "          Objective: ~d ~%~%" (objetivo) )
        (format t "          Average branching factor ~f ~%~%" (branching-factor no) )
        )
      (cond 
       ((>= (number-of-points no) (objetivo))   (format t "          OBJECTIVE REACHED  ~%~%"  ))
       (T  (format t "          OBJECTIVE NOT REACHED  ~%~%"  ))))


   )
  )









 #|Fun��es Auxiliares|#

(defconstant *day-names*
  '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")
  ) 


(defun date-time()
"Retorna a Data e a hora Actual"
  (multiple-value-bind
      (second minute hour date month year day-of-week dst-p tz)
      (get-decoded-time)
    (format nil  " ~2,'0d:~2,'0d:~2,'0d of ~a, ~d/~2,'0d/~d (GMT~@d) "
            hour
            minute
            second
            (nth day-of-week *day-names*)
            month 
            date
            year
            (- tz))) 
  )





(defun loading()
  (format t "                         ")
  (loop for x in '(K N I G H T " " G A M E  )
        do (format t " ~A" x) (SLEEP 0.25) )
  )

(defun loadingBar()
  (format t "           ")
  (loop for x in '(_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  )
        do (format t "~A" x) (SLEEP 0.030) )
  )









