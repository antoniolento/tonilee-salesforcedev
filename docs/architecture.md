# Architettura del Progetto

## Panoramica

Questo documento descrive l'architettura del repository Salesforce DX `tonilee-salesforcedev`.

## Organizzazione dei Metadati

I metadati sono organizzati in `force-app/main/default/` seguendo la struttura source format:

| Directory | Tipo Metadato |
|---|---|
| `classes/` | Apex Classes |
| `triggers/` | Apex Triggers |
| `lwc/` | Lightning Web Components |
| `aura/` | Aura Components |
| `objects/` | Custom Objects e Custom Fields |
| `layouts/` | Page Layouts |
| `permissionsets/` | Permission Sets |
| `profiles/` | Profiles (gestiti manualmente) |
| `flows/` | Flows e Process Builder |
| `staticresources/` | Static Resources |
| `tabs/` | Custom Tabs |
| `customMetadata/` | Custom Metadata Types |

## Decisioni Architetturali

- **Profili esclusi dal deploy automatico**: i profili vengono gestiti manualmente in produzione tramite `.forceignore` per evitare sovrascritture accidentali.
- **API Version**: fissata a `62.0` per garantire compatibilità con le pipeline CI/CD.
- **Test Level**: `RunLocalTests` obbligatorio su tutti i deploy verso produzione.
- **Copertura minima**: 75% come da `config/codeCoverage.json`.
