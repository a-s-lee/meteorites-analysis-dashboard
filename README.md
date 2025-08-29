# ☄️ Meteorite Landings Analysis & Clustering Dashboard  

This repository contains a full **data pipeline and dashboard project** analyzing NASA’s Meteorite Landings dataset. The workflow includes **SQL-based cleaning**, **Python clustering analysis**, and a **Power BI dashboard** for visualization.  

<img width="2767" height="1600" alt="Meteorite_Analysis-1" src="https://github.com/user-attachments/assets/e183694e-bcc9-4ecc-b0db-755c95ada5b9" />

## Project Workflow  

### 1. Data Cleaning & Feature Engineering (SQL)  
- Raw dataset: [`Meteorite_Landings.csv`](./Meteorite_Landings.csv).  
- SQL script: [`cleaning_and_features.sql`](./cleaning_and_features.sql).  
- Steps:  
  - Removed invalid/missing values (`mass (g)`, `year`, and coordinates).  
  - Created a **Master Cleaned Table** of meteorite landings.  
  - Engineered new features:  
    - `log_mass` (log-transformed mass for normalization).  
    - `age` (calculated as `2025 - year`).  
    - `hemisphere` (categorization based on latitude).  
  - Outlier treatment applied to cap extreme values.  
- Output: [`Cluster_Ready_Meteorites.csv`](./Cluster_Ready_Meteorites.csv). :contentReference[oaicite:0]{index=0}

### 2. Clustering Analysis (Python)  
- Script: [`cluster.py`](./cluster.py).  
- Steps:  
  - Scaled features (`log_mass`, `reclat`, `reclong`, `age`).  
  - Applied **K-Means clustering** with the **Elbow Method** to determine optimal clusters.
    <img width="640" height="480" alt="Elbow_Figure" src="https://github.com/user-attachments/assets/dd405d7e-f61c-4bcc-bcff-4dd061bfe9d6" />
  - Final clustering performed with `k=4`.  
  - Exported clustered dataset as [`Clustered_Meteorites.csv`](./Clustered_Meteorites.csv).  
  - Visualized clusters on a world map (longitude vs latitude).
     <img width="640" height="480" alt="Cluster_map" src="https://github.com/user-attachments/assets/09689e7a-e835-4f7a-b4ba-44cdc227ce45" />
- Libraries used:  
  - `pandas`, `scikit-learn`, `matplotlib`. 

### 3. Visualization & Dashboard (Power BI)  
- Dashboard file: [`Meteorite_Analysis.pbix`](./Meteorite_Analysis.pbix).  
- Features:  
  - Interactive exploration of meteorite landings by cluster, year, hemisphere, and mass.  
  - KPIs summarizing average, max, and min meteorite masses.  
  - Cluster maps and trend analysis.  

## Files in this Repository  
- `Meteorite_Landings.csv` → Original dataset.  
- `cleaning_and_features.sql` → SQL script for cleaning and feature engineering.  
- `Cluster_Ready_Meteorites.csv` → Intermediate cleaned dataset for clustering.  
- `cluster.py` → Python script for clustering analysis.  
- `Clustered_Meteorites.csv` → Final dataset with cluster assignments.  
- `Meteorite_Analysis.pbix` → Power BI dashboard.  
- `README.md` → Project documentation.  

## Summary  
This project demonstrates an **end-to-end data science workflow**:  
- Data cleaning & feature engineering (SQL)  
- Clustering analysis (Python, scikit-learn)  
- Business intelligence dashboard (Power BI)  
