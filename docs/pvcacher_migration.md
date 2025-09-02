
# pvcacher Migration Notice

## Package Replacement

We are migrating from **pvcache** to a new, more maintainable package called **pvcacher**.

## Why the change

**pvcacher** is designed for better long-term maintainability. It adopts a mixins-based composite adapter system that makes customization and extension simpler and safer compared to the current `pvcache` implementation.

This architecture allows small, focused adapters to be composed together with mixins, reducing duplication and improving testability.

Please migrate to **pvcacher** for continued support and easier customization.
