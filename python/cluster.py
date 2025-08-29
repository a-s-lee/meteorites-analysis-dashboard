import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

df = pd.read_csv("Cluster_Ready_Meteorites.csv")
print(df.shape)
print(df.isna().sum())  # Should all be zero for key columns

features = df[['log_mass', 'reclat', 'reclong', 'age']]
print(features)

scaler = StandardScaler()
features_scaled = scaler.fit_transform(features)
inertia = []
K = range(2, 10)
for k in K:
    kmeans = KMeans(n_clusters=k, random_state=42, n_init=10)
    kmeans.fit(features_scaled)
    inertia.append(kmeans.inertia_)

plt.plot(K, inertia, 'bo-')
plt.xlabel('Number of clusters (k)')
plt.ylabel('Inertia')
plt.title('Elbow Method for Optimal k')
plt.show()

kmeans = KMeans(n_clusters=4, random_state=42, n_init=10)  
df['cluster'] = kmeans.fit_predict(features_scaled)

df.to_csv("Clustered_Meteorites.csv", index=False)

plt.scatter(df['reclong'], df['reclat'], c=df['cluster'], cmap='tab10', s=10)
plt.colorbar(label='Cluster')
plt.xlabel('Longitude')
plt.ylabel('Latitude')
plt.title('Clusters Map')
plt.show()