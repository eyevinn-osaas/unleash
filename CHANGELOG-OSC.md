# Eyevinn Open Source Cloud - Processing History

## Changelog

- **2026-03-28T15:47:20.596Z**: Project synchronized with upstream by OSaaS Service Builder

# OSC Processing Changelog

## 2026-03-28

- Initial OSC containerization by OSC Supply Team
- Created `Dockerfile.osc` based on upstream Dockerfile, adapted for OSC platform (port 8080, bash, OSC entrypoint)
- Created `osc-entrypoint.sh` with DATABASE_URL parsing, OSC_HOSTNAME → UNLEASH_URL mapping, PORT → HTTP_PORT handling
- Added `README-OSC.md` with Eyevinn Open Source Cloud information
