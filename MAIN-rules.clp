;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Modulul MAIN - reguli
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule MAIN::succesiunePM "change current module in sequence"
  ?lista <- (secventa ?urm $?rest)
  (test (eq ?urm PERCEPT-MANAGER))
 =>
  (retract ?lista)
  (assert (secventa $?rest ?urm))
  (assert (tic)) ; folosit in PERCEPT-MANAGER ca sa incrementeze timpul
  (if (eq ?*ag-tic-in-debug* TRUE) then (printout t "    <D> MAIN: adaugare tic (succesiunePM)" crlf))
  (if (eq ?*main-in-debug* TRUE) then (printout t "    <D> MAIN: switch to " ?urm  crlf))
  ;(facts ?urm) 
  (focus ?urm)
)

(defrule MAIN::succesiuneNonPM "change current module in sequence"
  ?lista <- (secventa ?urm $?rest)
  (test (neq ?urm PERCEPT-MANAGER))
 =>
  (retract ?lista)
  (assert (secventa $?rest ?urm))
  (if (eq ?*ag-tic-in-debug* TRUE) then (printout t "    <D> MAIN: adaugare tic (succesiuneNonPM)" crlf))
  (if (eq ?*main-in-debug* TRUE) then (printout t "    <D> MAIN: switch to " ?urm  crlf))
  ;(facts ?urm) 
  (focus ?urm)
)
