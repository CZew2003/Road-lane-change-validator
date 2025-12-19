; --- EVENIMENT ---
(ag_percept (percept_pobj ev) (percept_pname isa) (percept_pval eveniment))

; --- DRUM: Oras, Linie Discontinua ---
(ag_percept (percept_pobj elem1) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem1) (percept_pname isa) (percept_pval road_attribute))
(ag_percept (percept_pobj elem1) (percept_pname road_category) (percept_pval city))
(ag_percept (percept_pobj elem1) (percept_pname has_type) (percept_pval discontinuous_strip))

; --- EGO: Semnalizare PORNITA, viteza 48km/h ---
(ag_percept (percept_pobj elem2) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem2) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem2) (percept_pname blink) (percept_pval left))
(ag_percept (percept_pobj elem2) (percept_pname velocity) (percept_pval 48))

; --- POLITIE, distanta 12m ---
(ag_percept (percept_pobj elem4) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem4) (percept_pname type) (percept_pval emergency))
(ag_percept (percept_pobj elem4) (percept_pname rel_pos) (percept_pval back))
(ag_percept (percept_pobj elem4) (percept_pname rel_dist) (percept_pval 1200))