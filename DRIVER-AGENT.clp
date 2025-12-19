; --- Regula initiala (Corect)
(defrule AGENT::initCycle-lane-change
    (declare (salience 100))
    (timp (valoare ?)) 
=>
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed)))
)

; --- REGULI ORAS

; --- Viteza prea mare (> 50 km/h)
(defrule AGENT::restrictie_oras_viteza
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname road_category) (bel_pval city))

    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname isa) (bel_pval vehicle))
    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname velocity) (bel_pval ?v))
    (test (> ?v 50))
    
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [ORAS] Schimbare banda interzisa. Viteza (" ?v " km/h) depaseste limita de 50 km/h." crlf)
)

; --- Distanta prea mica fata de masina din spate (< 5m / 500cm)
(defrule AGENT::restrictie_oras_distanta
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))

    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname road_category) (bel_pval city))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname isa) (bel_pval vehicle))
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname rel_pos) (bel_pval back|left_back))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname rel_dist) (bel_pval ?d))
    (test (< ?d 500))
    
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [ORAS] Schimbare banda interzisa. Vehicul in spate la doar " ?d " cm (Minim admis: 500 cm)." crlf)
)


; --- DRUMURI NATIONALE


; --- Viteza prea mare pentru DN (> 90 km/h)
(defrule AGENT::restrictie_exterior_viteza
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname road_category) (bel_pval exterior))
    
    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname isa) (bel_pval vehicle))
    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname velocity) (bel_pval ?v))
    (test (> ?v 90))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [DN] Schimbare banda interzisa. Viteza (" ?v " km/h) peste limita de 90 km/h." crlf)
)

; --- Distanta prea mica fata de masina din spate (< 15m)
(defrule AGENT::restrictie_exterior_distanta
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))

    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname road_category) (bel_pval exterior))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname isa) (bel_pval vehicle))
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname rel_pos) (bel_pval back|left_back))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname rel_dist) (bel_pval ?d))
    (test (< ?d 1500))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [DN] Pericol! Vehicul in spate la doar " ?d " cm (Minim necesar pe DN: 1500cm)." crlf)
)



; --- AUTOSTRADA

; --- Viteza prea mare pentru Autostrada (>130 km/h)
(defrule AGENT::restrictie_autostrada_viteza
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname road_category) (bel_pval highway))
    
    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname isa) (bel_pval vehicle))
    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname velocity) (bel_pval ?v))
    (test (> ?v 130))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [HWY] Schimbare banda interzisa. Viteza (" ?v " km/h) este ilegala." crlf)
)

; --- Distanta prea mica fata de masina din spate (< 35m)
(defrule AGENT::restrictie_autostrada_distanta
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))

    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname road_category) (bel_pval highway))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname isa) (bel_pval vehicle))
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname rel_pos) (bel_pval back|left_back))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname rel_dist) (bel_pval ?d))
    (test (< ?d 3500))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [HWY] Manevra riscanta la viteza mare! Vehicul la " ?d " cm (Minim necesar: 3500 cm)." crlf)
)




; --- REGULI GENERALE

; --- Semnalizare oprita, verificata la inceput deoarece altfel nu este permisa miscarea
(defrule AGENT::lipsa_semnalizare
    (declare (salience 90))
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname isa) (bel_pval vehicle))
    
    (ag_bel (bel_type moment) (bel_pobj ?ego) (bel_pname blink) (bel_pval none))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: Manevra interzisa. Semnalizarea este oprita." crlf)
)

; --- Infrastructura interzisa
(defrule AGENT::restrictii_infrastructura_si_carosabil
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname isa) (bel_pval road_attribute))
    
    (ag_bel (bel_type moment) (bel_pobj ?road) (bel_pname has_type) (bel_pval ?type&continuous_strip|bumpy|slippery))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: Manevra interzisa din cauza starii drumului/marcajului: " ?type crlf)
)

; --- Trecere de pietoni, distanta minima admisa 25m
(defrule AGENT::apropiere_trecere_pietoni
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname isa) (bel_pval road_elem))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname has_type) (bel_pval ?type&crosswalk))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname rel_dist) (bel_pval ?d))
    (test (< ?d 2500))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: Interzis! Apropiere de " ?type " (Distanta: " ?d " cm)." crlf)
)

; --- Trecere la nivel de cale ferata, intersectii, giratoriu, distanta minima admisa 50m
(defrule AGENT::apropiere_intersectii_si_cale_ferata
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname isa) (bel_pval road_elem))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname has_type) (bel_pval ?type&railway_level_crossing|intersection|roundabout))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname rel_dist) (bel_pval ?d))
    (test (< ?d 5000))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: Interzis! Apropiere de " ?type " (Distanta: " ?d " cm)." crlf)
)

; --- Masina aflata intr-un sens giratoriu
(defrule AGENT::in_giratoriu
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname isa) (bel_pval road_elem))
    
    (ag_bel (bel_type moment) (bel_pobj ?elem) (bel_pname has_type) (bel_pval inside_roundabout))

=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: Interzis! Masina se afla intr-un giratoriu" crlf)
)

; --- Coloana oficiala
(defrule AGENT::vehicule_regim_special
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname isa) (bel_pval vehicle))
    
    (ag_bel (bel_type moment) (bel_pobj ?car) (bel_pname has_type) (bel_pval ?type&emergency|column))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: Prioritate vehicul special detectat: " ?type crlf)
)

; --- Vizibilitate scazuta, prag diferit in functie de tipul drumului
(defrule AGENT::vizibilitate_scazuta
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    (ag_bel (bel_type moment) (bel_pobj ?nat) (bel_pname isa) (bel_pval road_nature))
    (ag_bel (bel_type moment) (bel_pobj ?nat) (bel_pname road_type) (bel_pval ?type))
    (ag_bel (bel_type moment) (bel_pobj ?nat) (bel_pname has_visibility) (bel_pval ?vis))
    (test (< ?vis
        (if (eq ?type city) then 1000
        else (if (eq ?type dn) then 2000
        else (if (eq ?type highway) then 5000
        else 0)))))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: Vizibilitate critica pe " ?type " (" ?vis " cm). Manevra anulata." crlf)
)

; --- Curba in spate pe DN: distanta insuficienta pentru schimbarea benzii
(defrule AGENT::curba_spate_dn
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))

    (ag_percept (percept_pobj ?r) (percept_pname isa) (percept_pval road_attribute))
    (ag_percept (percept_pobj ?r) (percept_pname road_category) (percept_pval exterior))

    (ag_percept (percept_pobj ?c) (percept_pname isa) (percept_pval road_elem))
    (ag_percept (percept_pobj ?c) (percept_pname has_type) (percept_pval curve))
    (ag_percept (percept_pobj ?c) (percept_pname rel_dist) (percept_pval ?d))

    (test (<= ?d 2000))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t
        "AGENT: Curba in spate pe DN la "
        ?d " cm. Distanta insuficienta pentru schimbarea benzii."
        crlf)
)

; --- Biciclist in fata in oras: distanta insuficienta pentru schimbarea benzii
(defrule AGENT::biciclist_fata_oras
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))

    (ag_percept (percept_pobj ?r) (percept_pname isa) (percept_pval road_attribute))
    (ag_percept (percept_pobj ?r) (percept_pname road_category) (percept_pval city))

    (ag_percept (percept_pobj ?b) (percept_pname isa) (percept_pval bicycle))
    (ag_percept (percept_pobj ?b) (percept_pname rel_pos) (percept_pval front))
    (ag_percept (percept_pobj ?b) (percept_pname rel_dist) (percept_pval ?d))

    (test (< ?d 3000))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t
        "AGENT: Biciclist in fata in oras la "
        ?d " cm. Distanta sub 30m, manevra anulata."
        crlf)
)

; --- Tramvai in statie fara refugiu
(defrule AGENT::tramvai_in_statie_fara_refugiu
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?tram) (bel_pname isa) (bel_pval vehicle))
    (ag_bel (bel_type moment) (bel_pobj ?tram) (bel_pname has_type) (bel_pval tram))
    (ag_bel (bel_type moment) (bel_pobj ?tram) (bel_pname rel_pos) (bel_pval front))
    (ag_bel (bel_type moment) (bel_pobj ?tram) (bel_pname rel_dist) (bel_pval ?dist))

    (ag_bel (bel_type moment) (bel_pobj ?statie) (bel_pname isa) (bel_pval road_elem))
    (ag_bel (bel_type moment) (bel_pobj ?statie) (bel_pname has_type) (bel_pval tram_station_without_shelter))
    (ag_bel (bel_type moment) (bel_pobj ?statie) (bel_pname rel_dist) (bel_pval ?dist))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [TRAMVAI] Oprire obligatorie! Tramvai in statie fara refugiu." crlf)
)

; --- Lucrari pe drum
(defrule AGENT::apropiere_lucrari
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
    
    (ag_bel (bel_type moment) (bel_pobj ?obj) (bel_pname isa) (bel_pval road_elem))
    (ag_bel (bel_type moment) (bel_pobj ?obj) (bel_pname has_type) (bel_pval road_works))
    (ag_bel (bel_type moment) (bel_pobj ?obj) (bel_pname rel_dist) (bel_pval ?dist))
    
    (test (< ?dist 5000))
=>
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval prohibited)))
    (printout t "AGENT: [LUCRARI] Zona de santier in " ?dist " cm. Pastrati banda!" crlf)
)


(defrule AGENT::este_voie
    (declare (salience -10)) 
    (timp (valoare ?t))
    
    ?f <- (ag_bel (bel_type moment) (bel_pname lane-change-maneuver) (bel_pval allowed))
=>
    (printout t "AGENT: [OK] Manevra de schimbare de banda este permisa!" crlf)
)

(defrule AGENT::STOP_SIMULARE
    (declare (salience -10000))
    (timp (valoare ?t))
    (test (>= ?t 35))
=>
    (printout t "==========================================" crlf)
    (printout t " SCENARIU FINALIZAT. STOP SIMULARE." crlf)
    (printout t "==========================================" crlf)
    (halt) ; Opreste executia imediat
)