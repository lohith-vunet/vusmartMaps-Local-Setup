# vuSmartMaps Local Environment Setup

A single, self-contained repository for running vuSmartMaps locally on a Kind Kubernetes cluster. Developers use this to install, operate, upgrade, reset, and test the product on their laptops.

## Prerequisites

| Tool | Install |
|------|---------|
| Docker | [Install Docker](https://docs.docker.com/engine/install/) |
| kubectl | [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) |
| Kind | [Install Kind](https://kind.sigs.k8s.io/docs/user/quick-start/) |
| Helm | [Install Helm](https://helm.sh/docs/intro/install/) |

## Quick Start

```bash
# 1. Download and extract the local build tarball
tar -xvzf vuSmartMapsLocal-2.16.tar.gz

# 2. Run the installer
./vsmaps install
```

The install command handles everything automatically:
- Creates the Kind cluster
- Loads all Docker images
- Applies namespace and RBAC configurations
- Creates persistent storage directories
- Deploys all Helm charts in the correct order with readiness checks

Once complete, access the UI at **https://localhost/vui**

**Login:** `vunetadmin` / `Qwerty@123`

## CLI Reference

```
./vsmaps <command> [options]
```

### Commands

| Command | Description |
|---------|-------------|
| `install` | Full install from scratch (sub-5 minutes) |
| `reset` | Tear down and reinstall from scratch |
| `upgrade [component]` | Upgrade all or a specific component |
| `load-data` | Load dummy data fixtures for testing |
| `clear-data` | Clear all test data |
| `status` | Show environment status |

### Flags

| Flag | Description |
|------|-------------|
| `-y`, `--yes` | Skip confirmation prompts |

### Examples

```bash
# Full install
./vsmaps install

# Check status
./vsmaps status

# Upgrade a specific service (e.g., after a new Nairobi image)
./vsmaps upgrade nairobi

# Upgrade all services
./vsmaps upgrade

# Load test data
./vsmaps load-data

# Clear test data
./vsmaps clear-data

# Reset everything (destroy + reinstall)
./vsmaps --yes reset
```

### Available Components for Selective Upgrade

| Component | Description |
|-----------|-------------|
| `keycloak` | Identity and access management |
| `denver` | Backend API service |
| `minio-operator` | MinIO operator |
| `minio-tenant` | MinIO storage tenant |
| `orchestrator` | Workflow orchestrator |
| `kafka-cluster` | Kafka + Zookeeper |
| `ch-operator` | ClickHouse operator |
| `ch-keeper` | ClickHouse Keeper |
| `ch-database` | ClickHouse database |
| `telegraf-vumsart` | Telegraf (vuSmartMaps metrics) |
| `telegraf-infra` | Telegraf (infrastructure metrics) |
| `nairobi` | Core UI service |
| `traefik` | Ingress controller |
| `redis` | Cache |
| `docs` | Documentation service |
| `vublock-store` | VuBlock store |
| `vunodes` | VuNodes monitoring |
| `post-job` | Post-install configuration jobs |

## Repository Structure

```
.
├── vsmaps                  # CLI tool (single entry point)
├── kind-config.yaml        # Kind cluster configuration
├── cluster-setup/          # Kubernetes pre-requisite manifests
│   ├── local-storage-class.yaml
│   ├── pipeline-sa.yaml
│   └── role_rolebinding.yaml
├── helm-charts/            # All service Helm charts
│   ├── keycloak/
│   ├── denver/
│   ├── postgresql/
│   ├── clickhouse/
│   ├── kafka-cluster/
│   ├── minio/
│   ├── nairobi/
│   ├── orchestrator/
│   ├── traefik/
│   ├── redis/
│   ├── telegraf/
│   ├── docs/
│   ├── vublock-store/
│   ├── vunodes/
│   └── post-job/
├── fixtures/               # Dummy data fixtures for testing
│   ├── clickhouse_seed.sql
│   └── postgresql_seed.sql
└── images/                 # Docker images (gitignored, via tarball)
```

## Test Data Fixtures

The `fixtures/` directory contains seed data files that can be loaded into the running environment:

- `postgresql_seed.sql` — Sample cache entries in vusoft_vusoftcache
- `clickhouse_seed.sql` — Sample CPU monitoring metrics in monitoring.cpu_data

Load fixtures: `./vsmaps load-data`
Clear fixtures: `./vsmaps clear-data`

## Version Management

All changes to this repository must go through Pull Requests:

1. Create a feature branch from `main`
2. Make your changes (Helm chart updates, new images, fixture changes)
3. Open a PR for review — CI validation runs automatically
4. A code owner (designated senior member) reviews and merges

**Branch protection is enforced:**
- Direct pushes to `main` are blocked
- At least 1 approving review required
- Stale reviews are dismissed on new pushes
- Force pushes and branch deletion are blocked

### Automated Component Updates

When a new version of a vuSmartMaps component is built, trigger the update workflow:

```bash
gh workflow run update-component.yaml \
  -f component=nairobi \
  -f image_name=nairobi \
  -f image_tag=2.16.0.1982
```

This automatically creates a PR with the updated image tag for review.

### CI Validation

Every PR is validated automatically:
- CLI script syntax check
- kind-config.yaml YAML validity
- All required Helm charts present
- Cluster-setup manifests valid
- Fixture SQL files non-empty
- Secret scan for accidentally committed credentials

### Historical Versions

All previous versions are preserved in git history. To run an older version:

```bash
git log --oneline                    # Find the commit/tag
git checkout <commit-hash>           # Switch to that version
./vsmaps install                     # Deploy that version
```

## Troubleshooting

```bash
# Check overall status
./vsmaps status

# Check specific pod logs
kubectl logs <pod-name> -n vsmaps

# Describe a failing pod
kubectl describe pod <pod-name> -n vsmaps

# If everything is broken, reset
./vsmaps --yes reset

# Check Kind cluster
kind get clusters
docker ps  # Should show kind-control-plane container
```

### Common Issues

| Issue | Solution |
|-------|----------|
| Port already in use | Check `ss -tlnp` and stop conflicting services |
| Images not loading | Ensure `images/` directory exists with `.tar` files |
| Pod CrashLoopBackOff | Usually dependency ordering — wait for dependencies to start |
| Reset hangs | Run `kind delete cluster` manually, then `./vsmaps install` |
