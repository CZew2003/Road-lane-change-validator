; --- EVENIMENT ---
(ag_percept (percept_pobj ev) (percept_pname isa) (percept_pval eveniment))

; --- DRUM: Autostrada, linie discontinua ---
(ag_percept (percept_pobj elem1) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem1) (percept_pname isa) (percept_pval road_attribute))
(ag_percept (percept_pobj elem1) (percept_pname road_category) (percept_pval highway))
(ag_percept (percept_pobj elem1) (percept_pname has_type) (percept_pval discontinuous_strip))

; --- EGO: Semnalizare oprita, viteza 109km/h ---
(ag_percept (percept_pobj elem2) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem2) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem2) (percept_pname blink) (percept_pval none))
(ag_percept (percept_pobj elem2) (percept_pname velocity) (percept_pval 109))

; --- ROAD_ELEM: Ceata, vizibilitate 46m ---
(ag_percept (percept_pobj elem5) (percept_pname isa) (percept_pval road_nature))
(ag_percept (percept_pobj elem5) (percept_pname has_type) (percept_pval fog))
(ag_percept (percept_pobj elem5) (percept_pname has_visibility) (percept_pval 4600))