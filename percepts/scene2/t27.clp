; --- EVENIMENT ---
(ag_percept (percept_pobj ev) (percept_pname isa) (percept_pval eveniment))

; --- DRUM: Oras, Linie Discontinua ---
(ag_percept (percept_pobj elem1) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem1) (percept_pname isa) (percept_pval road_attribute))
(ag_percept (percept_pobj elem1) (percept_pname road_category) (percept_pval city))
(ag_percept (percept_pobj elem1) (percept_pname has_type) (percept_pval discontinuous_strip))

; --- EGO: Semnalizare pornita, viteza 45km/h ---
(ag_percept (percept_pobj elem2) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem2) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem2) (percept_pname blink) (percept_pval left))
(ag_percept (percept_pobj elem2) (percept_pname velocity) (percept_pval 45))

; --- TRAFIC: Tramvai oprit, 48m ---
(ag_percept (percept_pobj elem3) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem3) (percept_pname isa) (percept_pval vehicle))
(ag_percept (percept_pobj elem3) (percept_pname has_type) (percept_pval tram))
(ag_percept (percept_pobj elem3) (percept_pname rel_pos) (percept_pval front))
(ag_percept (percept_pobj elem3) (percept_pname rel_dist) (percept_pval 4800))

; --- INFRASTRUCTURA: statie fara refugiu, 48m ---
(ag_percept (percept_pobj elem4) (percept_pname partof) (percept_pval ev))
(ag_percept (percept_pobj elem4) (percept_pname isa) (percept_pval road_elem))
(ag_percept (percept_pobj elem4) (percept_pname has_type) (percept_pval tram_station_without_shelter))
(ag_percept (percept_pobj elem4) (percept_pname rel_pos) (percept_pval front))
(ag_percept (percept_pobj elem4) (percept_pname rel_dist) (percept_pval 4800))
