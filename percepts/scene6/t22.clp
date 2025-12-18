; --- EVENIMENT ---
(ag_percept (percept_pobj ev) (percept_pname isa) (percept_pval eveniment))

; --- DRUM: Autostrada, linie discontinua ---
(ag_percept (percept_pobj elem1) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem1) (percept_pname isa) (percept_pval road_attribute))
(ag_percept (percept_pobj elem1) (percept_pname road_category) (percept_pval highway))
(ag_percept (percept_pobj elem1) (percept_pname has_type) (percept_pval discontinuous_strip))

; --- EGO: Semnalizare pornita, viteza 110km/h ---
(ag_percept (percept_pobj elem2) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem2) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem2) (percept_pname blink) (percept_pval left))
(ag_percept (percept_pobj elem2) (percept_pname velocity) (percept_pval 110))

; --- MASINA SPATE: distanta 30m ---
(ag_percept (percept_pobj elem3) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem3) (percept_pname rel_pos) (percept_pval back))
(ag_percept (percept_pobj elem3) (percept_pname rel_dist) (percept_pval 3000))

; --- ROAD_ELEM: Ceata, vizibilitate 35m ---
(ag_percept (percept_pobj elem5) (percept_pname isa) (percept_pval road_nature))
(ag_percept (percept_pobj elem5) (percept_pname has_type) (percept_pval fog))
(ag_percept (percept_pobj elem5) (percept_pname has_visibility) (percept_pval 3500))