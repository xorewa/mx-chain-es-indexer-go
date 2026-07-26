# Disabled workflows

`deploy-docker.yml` was removed from GitHub Actions because it published the
upstream `multiversx/elastic-indexer` Docker Hub image. Xorewa repositories
must not publish or run deployment workflows against MultiversX infrastructure.

Any future Xorewa image workflow requires a separately reviewed destination,
credentials, release policy, and explicit approval.
