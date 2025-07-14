/// Configuration options for cache operations
class CacheOptions {
  /// The cache group this entry belongs to
  /// Groups can be used to organize and batch operate on related cache entries
  /// Defaults to 'default' if not specified
  final String? group;

  /// if group is specified, whether to use collection for this group
  final bool useCollection;

  /// List of sensitive key patterns
  /// Keys matching these patterns will be handled with extra security measures
  final List<String>? sensitive;

  /// Dependency key that this cache entry depends on
  /// If the dependency is invalidated, this entry will also be invalidated
  final String? depends;

  /// Lifetime of the cache entry in milliseconds
  /// After this time expires, the entry will be considered stale
  final int? lifetime;

  /// Enable LRU/LFU cache eviction behavior
  /// When true, enables cache size management with eviction
  /// Mutually exclusive with lifetime
  final bool? lru;

  /// Cache size limit for eviction and determines eviction strategy
  /// When set: LFU (Least Frequently Used) - evicts based on access frequency
  /// When null: LRU (Least Recently Used) - evicts based on access time
  /// Only used when lru is true
  final int? lruInCount;

  /// Whether the cache entry should be encrypted
  final bool encrypted;

  /// Creates cache options with optional configuration parameters
  ///
  /// Rules:
  /// 1. Group is optional, defaults to 'default' for lifetime or 'default_lru' for lru
  /// 2. If sensitive is not null, depends must not be null
  /// 3. LRU and lifetime are mutually exclusive
  /// 4. lruInCount only used when lru is true
  const CacheOptions({
    this.group,
    this.useCollection = true,
    this.sensitive,
    this.depends,
    this.lifetime,
    this.lru,
    this.lruInCount,
    this.encrypted = false,
  }) : assert(
         !encrypted || (sensitive == null && depends == null),
         'Encrypted data cannot have sensitive patterns or dependencies',
       ),
       assert(
         sensitive == null || depends != null,
         'When sensitive patterns are specified, depends must also be provided',
       ),
       assert(
         lru != true || lifetime == null,
         'LRU and lifetime are mutually exclusive',
       ),
       assert(
         lru == true || lruInCount == null,
         'lruInCount can only be used when lru is true',
       );
}
