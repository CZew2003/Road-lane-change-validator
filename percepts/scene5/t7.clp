; --- EVENIMENT ---
(ag_percept (percept_pobj ev) (percept_pname isa) (percept_pval eveniment))

; --- DRUM: Exterior (DN), Drum denivelat, linie continua ---
(ag_percept (percept_pobj elem1) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem1) (percept_pname isa) (percept_pval road_attribute))
(ag_percept (percept_pobj elem1) (percept_pname road_category) (percept_pval exterior))
(ag_percept (percept_pobj elem1) (percept_pname has_type) (percept_pval continuous_strip))
(ag_percept (percept_pobj elem1) (percept_pname has_type) (percept_pval bumpy))

; --- EGO: Semnalizare oprita, viteza 67km/h ---
(ag_percept (percept_pobj elem2) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem2) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem2) (percept_pname blink) (percept_pval none))
(ag_percept (percept_pobj elem2) (percept_pname velocity) (percept_pval 67))

; --- MASINA SPATE: Distanta 45m ---
(ag_percept (percept_pobj elem3) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem3) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem3) (percept_pname rel_pos) (percept_pval back))
(ag_percept (percept_pobj elem3) (percept_pname rel_dist) (percept_pval 4500))