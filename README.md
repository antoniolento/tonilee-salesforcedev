# tonilee-salesforcedev

Repository ufficiale per la gestione dei metadati Salesforce in **source format (SFDX)**.

---

## Struttura del Progetto

| Cartella | Descrizione |
|---|---|
| `force-app/` | Metadati Salesforce in source format |
| `config/` | Configurazioni scratch org e progetto |
| `manifests/` | Package.xml per deploy selettivi |
| `scripts/` | Script Apex e SOQL di utilità |
| `.github/workflows/` | Pipeline CI/CD (GitHub Actions) |
| `docs/` | Documentazione architetturale |

---

## Branch Strategy

| Branch | Scopo | Deploy Target | Protezioni |
|---|---|---|---|
| `master` | Codice in produzione | Production Org | PR obbligatoria, 1 approvazione, status checks |
| `svil` | Sviluppo evolutive | Sandbox / Staging | PR consigliata |
| `bfx` | Bugfix critici su produzione | Production Org | PR obbligatoria, fast-track |

### Flusso di Lavoro

```
feature/* ──→ svil ──→ master (via PR)
                             ↑
hotfix/*  ──→ bfx   ─────────┘ (poi merge anche su svil)
```

---

## Setup Locale

### Prerequisiti

- [SF CLI v2](https://developer.salesforce.com/tools/salesforcecli) (`@salesforce/cli >= 2.x`)
- [Git](https://git-scm.com/) >= 2.x
- [Node.js](https://nodejs.org/) >= 18.x
- [VS Code](https://code.visualstudio.com/) con [Salesforce Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode)

### Installazione

```bash
git clone https://github.com/<GITHUB_USERNAME>/tonilee-salesforcedev.git
cd tonilee-salesforcedev
npm install
```

### Autenticazione Org

```bash
# Produzione
sf org login web --alias prod-org

# Sandbox
sf org login web --alias sandbox-org --instance-url https://test.salesforce.com
```

---

## CI/CD

| Workflow | Trigger | Azione |
|---|---|---|
| `validate-pr.yml` | PR verso `master`, `svil`, `bfx` | Deploy check-only + RunLocalTests |
| `deploy-master.yml` | Push su `master` | Deploy in produzione + RunLocalTests |

### Secret GitHub richiesto

| Nome Secret | Descrizione |
|---|---|
| `SFDX_AUTH_URL` | URL di autenticazione SFDX dell'org target (ottenibile con `sf org display --verbose --target-org <alias>`) |

---

## Comandi Utili

```bash
# Deploy check-only verso sandbox
sf project deploy validate --manifest manifests/package.xml --target-org sandbox-org --test-level RunLocalTests

# Deploy effettivo verso sandbox
sf project deploy start --manifest manifests/package.xml --target-org sandbox-org --test-level RunLocalTests

# Recupera metadati da un'org
sf project retrieve start --manifest manifests/package.xml --target-org prod-org

# Esegui test Apex
sf apex run test --target-org sandbox-org --test-level RunLocalTests --result-format human

# Crea scratch org
sf org create scratch --definition-file config/project-scratch-def.json --alias scratch-dev --duration-days 7
```

---

## Risorse

- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [SF CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
- [Salesforce Extensions for VS Code](https://developer.salesforce.com/tools/vscode/)
- [Metadata API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_intro.htm)
