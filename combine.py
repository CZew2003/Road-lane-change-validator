import pandas as pd
import os

# Configurarea fisierelor
# Ne asteptam sa avem masuratoare1.csv pana la masuratoare6.csv
file_names = [f'masuratoare{i}.csv' for i in range(1, 7)]
output_file = 'rezultate_finale.csv'
data = []

print("--- Inceperea procesului de combinare ---")

for i, file in enumerate(file_names):
    if os.path.exists(file):
        try:
            # Citim fisierul
            # sep='\t' specifica faptul ca valorile sunt separate prin tab (cum sunt generate de scriptul bash)
            # header=None pentru ca fisierele brute nu au cap de tabel
            df = pd.read_csv(file, sep='\t', header=None)
            
            # Curatam datele: eliminam coloanele goale (care pot aparea daca linia se termina cu un tab)
            df = df.dropna(axis=1, how='all')
            
            # Luam valorile de pe prima linie
            row_values = df.iloc[0].tolist()
            
            # Adaugam numele scenariului la inceputul listei
            row_values.insert(0, f"Scenariul {i+1}")
            
            data.append(row_values)
            print(f"Procesat: {file}")
        except Exception as e:
            print(f"Eroare la citirea fisierului {file}: {e}")
    else:
        print(f"ATENTIE: Fisierul {file} nu a fost gasit.")

if data:
    # Determinam cate coloane de timp avem (bazat pe cel mai lung rand)
    # Scadem 1 pentru ca prima coloana e numele scenariului
    max_time_steps = max(len(row) for row in data) - 1
    
    # Cream header-ul: Scenariu, Timp_1, Timp_2, ...
    columns = ['Scenariu'] + [f'Timp_{j}' for j in range(1, max_time_steps + 1)]

    # Cream DataFrame-ul pandas
    final_df = pd.DataFrame(data, columns=columns)

    # Convertim coloanele de timp in numere (float) pentru a putea face calcule
    numeric_cols = final_df.columns[1:]
    final_df[numeric_cols] = final_df[numeric_cols].apply(pd.to_numeric, errors='coerce')

    # --- CALCULE STATISTICE ---
    # Calculam media pe orizontala (axis=1)
    final_df['Media'] = final_df[numeric_cols].mean(axis=1)
    # Calculam deviatia standard
    final_df['Deviatia_Standard'] = final_df[numeric_cols].std(axis=1)

    # Salvam rezultatul final in CSV
    final_df.to_csv(output_file, index=False)
    
    print("\n--- SUCCES! ---")
    print(f"Rezultatele au fost salvate in: {output_file}")
    print("\nPrevizualizare date:")
    print(final_df[['Scenariu', 'Media', 'Deviatia_Standard']])
else:
    print("\nNu s-au gasit date valide pentru a crea fisierul final.")