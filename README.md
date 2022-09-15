# RealmBinaries
Vends Realm xcframeworks via SPM to save build time

## How to

1. Launch the [workflow](https://github.com/mattalbus/RealmBinaries/actions/workflows/manual.yml) and specify the Realm release.
2. Explore logs until the step 'print checksums' and copy them
3. Edit `Package.swift` and update:
  - release number
  - checksums