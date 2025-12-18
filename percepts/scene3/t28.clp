; --- EVENIMENT ---
(ag_percept (percept_pobj ev) (percept_pname isa) (percept_pval eveniment))

; --- DRUM: Linie continua ---
(ag_percept (percept_pobj elem1) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem1) (percept_pname isa) (percept_pval road_attribute))
(ag_percept (percept_pobj elem1) (percept_pname road_category) (percept_pval city))
(ag_percept (percept_pobj elem1) (percept_pname has_type) (percept_pval continuous_strip))

; --- EGO:  Semnalizare pornita, viteza 35km/h ---
(ag_percept (percept_pobj elem2) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem2) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem2) (percept_pname blink) (percept_pval left))
(ag_percept (percept_pobj elem2) (percept_pname velocity) (percept_pval 35))

; --- ROAD ELEMENT: Trecere de pietoni, 12m ---
(ag_percept (percept_pobj elem4) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem4) (percept_pname isa) (percept_pval road_elem))
(ag_percept (percept_pobj elem4) (percept_pname type) (percept_pval crosswalk))
(ag_percept (percept_pobj elem3) (percept_pname rel_dist) (percept_pval 1200))