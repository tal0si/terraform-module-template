# Terraform Module for Google Cloud Storage Buckets

Ce module Terraform est conçu pour créer des buckets de stockage sur Google Cloud Storage. Il permet de créer deux types de buckets: un pour les données originales (`original-data`) et un autre pour les données calculées (`computed-data`). Les noms de ces buckets sont préfixés en fonction du pays et de l'environnement spécifiés.

## Prérequis

- Terraform 1.0 ou plus récent.
- Compte Google Cloud avec les droits nécessaires pour créer et gérer des buckets de stockage.

## Utilisation

Pour utiliser ce module dans votre configuration Terraform, suivez ces étapes :

1. **Configurer le Provider :** Assurez-vous que le provider Google Cloud est configuré dans votre configuration Terraform.

2. **Déclarer le Module :** Incluez une référence à ce module dans votre configuration avec les variables appropriées.

```
module "storage" {
  source   = "path/to/module"
  country  = "fr"
  env      = "dev"
}
```

Remplacez `path/to/module` par le chemin réel vers le répertoire de ce module.

## Variables d'Entrée

- `country` (obligatoire): Code du pays utilisé pour préfixer les noms des buckets. Exemple : `fr`, `us`.
- `env` (obligatoire): Environnement ciblé, utilisé pour le préfixage. Exemple : `dev`, `prod`.

## Ressources Créées

- **google_storage_bucket.bucket_ods** : Bucket pour stocker les données originales.
  - **Nom :** `{country}-{env}-original-data`
  - **Location :** `EU`
- **google_storage_bucket.bucket_cds** : Bucket pour stocker les données calculées.
  - **Nom :** `{country}-{env}-computed-data`
  - **Location :** `EU`

## Sorties

Le module peut être configuré pour générer des sorties qui pourraient être utilisées par d'autres configurations Terraform. Par exemple, les noms des buckets créés peuvent être utiles. Voici comment vous pourriez déclarer les sorties :

```
output "original_data_bucket_name" {
  value = google_storage_bucket.bucket_ods.name
}

output "computed_data_bucket_name" {
  value = google_storage_bucket.bucket_cds.name
}
```

Incluez ces blocs de sortie dans votre module si vous souhaitez que ces informations soient accessibles en dehors du module.

## Contribution

Pour contribuer à ce module, veuillez suivre les directives de contribution définies dans le fichier CONTRIBUTING.md (à créer si nécessaire).

## Licence

Ce module est distribué sous licence DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, comme détaillé dans le fichier LICENSE.
